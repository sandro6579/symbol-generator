------------------------------------------------------------------------------------------------
-- Model Name 	:	???
-- File Name	:	opcode_store.vhd
-- Generated	:	18.3.2012
-- Author		:	Olga Liberman and Yoav Shvartz
-- Project		:	Symbol Generator Project
------------------------------------------------------------------------------------------------
-- Description:
-- The main purpose of the Opcode Store is to store commands from the Opcode Unite block.
-- The reason we want store the commands before transferring them to the Main RAM is because
-- we don't want to override the current state of the display in the RAM, in case it is the middle of the frame.
-- We write to the RAM only at start of the frame – when VSYNC of the VESA is active.
------------------------------------------------------------------------------------------------
-- Revision:
--			Number		Date		Name								Description			
--			1.00		12.4.2012	Yoav Shvartz		            	Repairs 
------------------------------------------------------------------------------------------------
--	Todo:
--			(1) mult by 20 or 4*5 ? (line 191)
--			(2)	vsync_active_proc: SYNCHRONIZER ? (mail from moshe)
--			(3) did I wrote compilativly open ?(lins 110,121)
------------------------------------------------------------------------------------------------

library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.std_logic_arith.all; 

entity opcode_store is
  port (
    clk_133 : in std_logic;	 							-- clock in domain 133Mhz.
    reset_133_n : in std_logic; 						-- asynchronous reset. 
    op_cnt : in std_logic_vector(9 downto 0);   		-- number of total changes X 3: 1 change (24 bits) = add/remove 1 symbol ( 24 bits are being sent in 3 packs of 8 bits)
    op_str_valid : in std_logic; 						-- connected from opcode_unite block, opu_wr_en signal
    op_str_data_in : in std_logic_vector(23 downto 0); 	-- connected from opcode_unite block, opu_data_out signal
    op_str_rd_start : in std_logic; 					-- connected from VESA controller, vsync signal
    ram_adr_wr : out std_logic_vector(8 downto 0);  	-- ram's address to be writen into. 
    ram_wr_en : out std_logic;							-- ram write enable
    ram_data : out std_logic_vector(12 downto 0);		-- data sent to ram
    rd_mng_en : out std_logic;							-- activating Read_Manager 
    op_str_ready : out std_logic; 						-- ????????????????? same as ram_wr_en ?????????????
    op_str_empty : out std_logic;						-- FIFO is empty (debug)
    op_str_full : out std_logic;						-- FIFO is full (debug)
    op_str_used : out std_logic_vector(8 downto 0)		-- current number of elements in FIFO (debug)
  );
end opcode_store;

architecture opcode_store_rtl of opcode_store is
  
  component general_fifo
	generic(	 
		reset_polarity_g	: std_logic	:= '0';	-- Reset Polarity
		width_g				: positive	:= 24; 	-- Width of data
		depth_g 			: positive	:= 300;	-- Maximum elements in FIFO
		log_depth_g			: natural	:= 9;	-- Logarithm of depth_g (Number of bits to represent depth_g. 2^9=512 > 300)
		almost_full_g		: positive	:= 8; 	-- Rise almost full flag at this number of elements in FIFO  , question - do we nedd this?
		almost_empty_g		: positive	:= 1 	-- Rise almost empty flag at this number of elements in FIFO , question - do we nedd this?
		);
	port(
		 clk 		: in 	std_logic;									-- Clock
		 rst_n 		: in 	std_logic;                                  -- Reset
		 din 		: in 	std_logic_vector (width_g-1 downto 0);      -- Input Data
		 wr_en 		: in 	std_logic;                                  -- Write Enable
		 rd_en 		: in 	std_logic;                                  -- Read Enable (request for data)
		 flush		: in	std_logic;									-- Flush data
		 dout 		: out 	std_logic_vector (width_g-1 downto 0);	    -- Output Data
		 dout_valid	: out 	std_logic;                                  -- Output data is valid
		 afull  	: out 	std_logic;                                  -- FIFO is almost full
		 full 		: out 	std_logic;	                                -- FIFO is full
		 aempty 	: out 	std_logic;                                  -- FIFO is almost empty
		 empty 		: out 	std_logic;                                  -- FIFO is empty
		 used 		: out 	std_logic_vector (log_depth_g  downto 0) 	-- Current number of elements is FIFO. Note the range. In case depth_g is 2^x, then the extra bit will be used
	     );
	end component general_fifo;
  
  
  signal counter : std_logic_vector (9 downto 0);			-- counts number of changes 
  signal start_trigger : std_logic; 						-- The derivative of op_str_rd_start which connected to vsync (we check when it changes from 0 to 1) 
  signal flush_fifo : std_logic; 							-- ???
  signal din_fifo : std_logic_vector (width_g-1 downto 0);	-- data to FIFO sent from opcode_unite
  signal wr_en_fifo : std_logic;   							-- write enable FIFO	
  signal rd_en_fifo : std_logic;							-- read  enable FIFO
  signal dout_fifo : std_logic_vector(23 downto 0);			-- data sent to ram	
  signal dout_valid_fifo : std_logic;       				-- data valid
  signal full_fifo : std_logic;   							
  signal empty_fifo : std_logic;
  
  constant three_c = "0000000011" ;
  
begin
  
  general_fifo_inst :  general_fifo 
    generic map (
		  reset_polarity_g		=> '0',		-- Reset Polarity
		  width_g		=> 24, 				-- Width of data
		  depth_g 	=> 300,					-- Maximum elements in FIFO
		  log_depth_g		=> 9,			-- Logarithm of depth_g (Number of bits to represent depth_g. 2^9=512 > 300)
		  almost_full_g	=> 8, 				-- Rise almost full flag at this number of elements in FIFO
		  almost_empty_g	=> 1 			-- Rise almost empty flag at this number of elements in FIFO
           )
		port map
		(
		  clk 	=> clk_133	,						-- Clock
		  rst_n 	=> reset_133_n,	 				-- Reset
		  din 	=> din_fifo	,   					-- Input Data
		  wr_en 	=> wr_en_fifo,
		  rd_en 		=> rd_en_fifo, 				-- Read Enable (request for data)
		  flush		=> 	flush_fifo,					-- Flush data
		  dout 		=> 	dout_fifo, 					-- Output Data
		  dout_valid		=> 	dout_valid_fifo,  	-- Output data is valid ??need to make sure the connection is OK??
		  afull open	 							-- FIFO is almost full
		  full => op_str_full 	, 					-- FIFO is full
		  aempty  open	 							-- FIFO is almost empty
		  empty => op_str_empty	, 					-- FIFO is empty
		  used	=>  op_str_used						-- Current number of elements in FIFO. Note the range. In case depth_g is 2^x, then the extra bit will be used
		);
	
	------------------------------------------------------
	--checking when vsync is active (change from 0 to 1)--  
	------------------------------------------------------
	vsync_active_proc: process (clk_133, reset_133_n)
	begin
		if reset_133_n='0' then
		  start_trigger <=  '0';
		  start_trigger_1 <=  '0';
		  start_trigger_2 <=  '0';
		elsif rising_edge (clk_133) then
		  start_trigger_1 <= op_str_rd_start;
		  start_trigger_2 <= start_trigger_1;
		  if (start_trigger_1 = '1') and (start_trigger_2 = '0') then --need to check vsync's polarity
			start_trigger <= '1';
		  else
			start_trigger <= '0';
		  end if; 
		end if;
	end process vsync_active_proc;
  
	------------------------
	--writing data to fifo--
	------------------------
	din_fifo <= op_str_data_in;
	
	write_to_fifo_proc: process(clk_133, reset_133_n)
    begin
		if reset_133_n='0' then
			 wr_en_fifo <= '0';
		elsif rising_edge (clk_133) then
			if (op_str_valid = '1') and (full_fifo = '0') then
				wr_en_fifo <= '1';
			else
				wr_en_fifo <= '0';
			end if;
		end if;		
	end process write_to_fifo_proc;
 
	----------------------------------------------------------------------------------------------
	--reading data from fifo to ram:
	--first_n bit: indicating whether to remove ('0') or add ('1') the symbol 
	-- address = x*20 + y 
	--breaking the opcode to its different fields :  0/1 |  address of symbol in SDRAM | X | Y
    --need to use start_trigger
	-----------------------------------------------------------------------------------------------
	writing_to_ram_proc: process (clk_133, reset_133_n)
	begin
		if reset_133_n='0' then
			rd_en_fifo <= '0';
			ram_wr_en <= '0';
			ram_adr_wr <= (others => '1'); -- illegal address in RAM for debug purposes
			ram_data <= (others => '0');
			counter <= (others => '0');
			rd_mng_en <= '0';
		elsif rising_edge (clk_133) then
			if ( (start_trigger = '1') and (empty_fifo = '0') ) then
				rd_en_fifo <='1';
				counter <= unsigned(counter) + three_c;
				ram_wr_en <= '1';
				ram_adr_wr <= 20*unsigned( dout_fifo(8 downto 5) ) + unsigned( dout_fifo(4 downto 0) );
				-- bit 21 is the type bit: add or remove the symbol
				if ( dout_fifo(22)='0' ) then 
					ram_data <= (others => '0');
				else 
					ram_data <= ( dout_fifo(21 downto 9) );
				end if;
			elsif ( (counter >0) and (counter <= op_cnt ) and (empty_fifo = '0') ) then
				if (counter = op_cnt ) then
					rd_en_fifo <='0';
					counter <= (others => '0');
					rd_mng_en <= '1';
				else
					rd_en_fifo <='1';
					counter <= counter + three_c;
				end if;
				ram_wr_en <= '1';
				ram_adr_wr <= 20*unsigned( dout_fifo(8 downto 5) ) + unsigned( dout_fifo(4 downto 0) );
				-- bit 21 is the type bit: add or remove the symbol
				if ( dout_fifo(22)='0' ) then 
					ram_data <= (others => '0');
				else 
					ram_data <= ( dout_fifo(21 downto 9) );
				end if;
			else
				rd_en_fifo <= '0';
				ram_wr_en <= '0';
				ram_adr_wr <= (others => '1'); -- illegal address in RAM for debug purposes
				ram_data <= (others => '0');
				rd_mng_en <= '0';	
			end if;
		end if;
		
	end process writing_to_ram_proc;
    
  
end opcode_store_rtl;  