------------------------------------------------------------------------------------------------
-- Model Name 	:	Symbol_Generator_Top_TB
-- File Name	:	opcode_unite_tb.vhd
-- Generated	:	04.05.2012
-- Author		:	Olga Liberman and Yoav Shvartz
-- Project		:	Symbol Generator Project
------------------------------------------------------------------------------------------------
-- Description: opcode unite TB
------------------------------------------------------------------------------------------------
-- Revision:
--			Number		 Date		        Name								Description			
--			1.00		   04.05.2012	   Olga Liberman and Yoav Shvartz		Creation
--
------------------------------------------------------------------------------------------------
--	Todo:
--	(1) add description of the performed tests
--	(2)
------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; 
use ieee.numeric_std.all ;

entity Symbol_Generator_Top_TB is
end entity Symbol_Generator_Top_TB;

architecture sim_Symbol_Generator_Top_TB of Symbol_Generator_Top_TB is

--#############################	Components	##############################################--

component opcode_unite
	port (
			clk			       	: 	in 		std_logic; -- the main clock to which all the internal logic of the Symbol Generator block is synchronized.
			reset_n		    	: 	in 		std_logic; -- asynchronous reset
			opu_data_in			    : 	in 		std_logic_vector(7 downto 0); -- data from wbs
			opu_data_in_valid	: 	in 		std_logic; -- valid signal for data from wbs
			--opu_data_in_cnt	 	: 	in 		std_logic_vector(9 downto 0); -- number of changes in bytes - 1, each change is 3 bytes
			opu_wr_en			      : 	out 	std_logic; -- This signal is an enable signal to write opcodes to the Opcode Store block. It is active when a new opcode was united and is ready to be stored in the FIFO.
			opu_data_out		    : 	out 	std_logic_vector(23 downto 0) -- The data signal is the united Opcode to be stored in the Opcode store block.
			--counter				:	out 	std_logic_vector(9 downto 0) := (others => '0');  -- counter signal to count the message packs from wbs
		);
end component opcode_unite;


component opcode_store
	port (
			clk            		: in    std_logic;	 					-- clock in domain 133Mhz.
      reset_n        			: in    std_logic; 						-- asynchronous reset. 
			op_cnt             	: in    std_logic_vector(9 downto 0);   	-- number of total changes X 3: 1 change (24 bits) = add/remove 1 symbol ( 24 bits are being sent in 3 packs of 8 bits)
			op_str_valid       	: in    std_logic; 						-- connected from opcode_unite block, opu_wr_en signal
			op_str_data_in     	: in    std_logic_vector(23 downto 0); 	-- connected from opcode_unite block, opu_data_out signal
			op_str_rd_start    	: in    std_logic; 						-- connected from VESA controller, vsync signal
			ram_addr_wr        	: out   std_logic_vector(8 downto 0);  	-- ram's address to be written into. 
			ram_wr_en          	: out   std_logic;					 	-- ram write enable
			ram_data           	: out   std_logic_vector(12 downto 0);	-- data sent to ram
			mng_en          	: out   std_logic;						-- activating Read_Manager 
			op_str_empty       	: out   std_logic;						-- FIFO is empty (debug)
			op_str_full        	: out   std_logic;						-- FIFO is full (debug)
			op_str_used        	: out   std_logic_vector(9 downto 0)		-- current number of elements in FIFO (debug)	
		);
end component opcode_store;

component RAM_300 
  port (
    clk              	: in std_logic;	 						
    reset_n          	: in std_logic; 						
    ram_wr_en           : in  std_logic;
    ram_addr_wr         : in  std_logic_vector(8 downto 0);
    ram_addr_rd         : in  std_logic_vector(8 downto 0);
    ram_rd_en           : in  std_logic;
    ram_data_in         : in  std_logic_vector(12 downto 0);
    ram_data_out        : out std_logic_vector(12 downto 0)
  );
end component RAM_300;

component manager is
	generic(
		row_count_g		: 		positive	:= 480; -- Total row count for the frame
		sym_row_g		: 		positive	:= 15; 	-- Total symbol row count for the frame
		sym_col_g		: 		positive	:= 20; 	-- Total symol column count for the frame
		inside_row_g	: 		positive	:= 32; 	-- Total row count inside the symbol
		sdram_burst_g	: 		positive	:= 16 	-- The length of the burst from SDRAM (in words = 16 bits)
	);
	port (
		clk 				: 		in std_logic; -- The main clock to which all the internal logic of the Symbol Generator block is synchronized.
		reset_n 			: 		in std_logic; -- Asynchronous reset 
		ram_data_out 		: 		in std_logic_vector(12 downto 0); -- This signal is sent from the RAM . It represents the data readed from the RAM (represent the first row in which the symbol is saved in SDRAM). 
		req_in_trg 			: 		in std_logic; -- This is a signal from the VESA Generator block. It indicates when to start preparing valid data in the Dual Clk FIFO for a req_lines_g lines in advance. (In our case it is 1 line in advance).
		mng_en 				: 		in std_logic; --
		sdram_data 			: 		in std_logic_vector (7 downto 0); --this signal gets the data from sdram 
		sdram_data_valid	:		in std_logic; -- indicates when the data from the sdram is valid and we can store it in one of the fifos (a or b)
		--fifo_a_used			:		in std_logic_vector(10 downto 0); -- fifo a used signal
		--fifo_a_full			:		in std_logic; -- fifo a full indication
		fifo_a_empty		:		in std_logic; -- fifo a empty indication
		--fifo_b_used			:		in std_logic_vector(10 downto 0); -- fifo b used signal
		--fifo_b_full			:		in std_logic; -- fifo b full indication
		fifo_b_empty		:		in std_logic; -- fifo b empty indication
		ram_rd_en_out 		: 		out std_logic; -- This signal is sent to the RAM. It is an enable signal for reading from the RAM.
		ram_addr_rd 		: 		out std_logic_vector(8 downto 0); -- This signal is sent to the RAM. It indicates the row in the RAM from which we want to read.  
		fifo_a_rd_en 		: 		out std_logic; -- read enable to fifo a
		fifo_a_wr_en 		: 		out std_logic; -- write enable to fifo a
		fifo_a_data_in 		: 		out std_logic_vector(7 downto 0); -- data in to fifo a
		fifo_b_rd_en 		: 		out std_logic; -- read enable to fifo b
		fifo_b_wr_en 		: 		out std_logic; -- write enable to fifo b
		fifo_b_data_in 		: 		out std_logic_vector(7 downto 0); -- data in to fifo b
		sdram_addr_rd 		: 		out std_logic_vector (23 downto 0); --this signal is the full address in SDRAM: "00--bank(2)--row(12)--col(8)"
		sdram_rd_en_out		:		out std_logic -- this signal is a valid signal for the sdram_addr_rd signal (for usage of WBS)
		--mux_sel         	: 		out std_logic
	);
end component manager;

component sdram_symbol_model is
  generic(
    memory_file	: 	string :="memory.txt"
         );
  port(
	clk        : in  std_logic;
	reset_n    : in  std_logic;
	rd_addr    : in  std_logic_vector (23 downto 0);
	rd_en      : in  std_logic;
	data_out   : out std_logic_vector(7 downto 0);
	valid      : out std_logic
  );
end component sdram_symbol_model;

component general_fifo is 
	generic(	 
		reset_polarity_g	: std_logic	:= '0';	-- Reset Polarity
		width_g				: positive	:= 8; 	-- Width of data
		depth_g 			: positive	:= 640;	-- Maximum elements in FIFO
		log_depth_g			: natural	:= 10;	-- Logarithm of depth_g (Number of bits to represent depth_g. 2^4=16 > 9)
		almost_full_g		: positive	:= 8; 	-- Rise almost full flag at this number of elements in FIFO
		almost_empty_g		: positive	:= 1 	-- Rise almost empty flag at this number of elements in FIFO
		);
	 port(
		clk 				: in 	std_logic;									-- Clock
		rst 				: in 	std_logic;                                  -- Reset
		din 				: in 	std_logic_vector (width_g-1 downto 0);      -- Input Data
		wr_en 				: in 	std_logic;                                  -- Write Enable
		rd_en 				: in 	std_logic;                                  -- Read Enable (request for data)
		flush				: in	std_logic;									-- Flush data
		dout 				: out 	std_logic_vector (width_g-1 downto 0);	    -- Output Data
		dout_valid			: out 	std_logic;                                  -- Output data is valid
		afull  				: out 	std_logic;                                  -- FIFO is almost full
		full 				: out 	std_logic;	                                -- FIFO is full
		aempty 				: out 	std_logic;                                  -- FIFO is almost empty
		empty 				: out 	std_logic;                                  -- FIFO is empty
		used 				: out 	std_logic_vector (log_depth_g  downto 0) 	-- Current number of elements is FIFO. Note the range. In case depth_g is 2^x, then the extra bit will be used
	     );
end component general_fifo;

component mux2 is
	generic (
		width_g				:		positive	:= 8 					-- Width of data
	);
	port (
		clk 		    	: in 	std_logic;                       		-- the main clock to which all the internal logic of the Symbol Generator block is synchronized.
		reset_n 	  		: in 	std_logic;                       		-- asynchronous reset
		mux_din_a 			: in 	std_logic_vector(width_g-1 downto 0);  -- data from fifo_a
		mux_din_b 			: in 	std_logic_vector(width_g-1 downto 0);  -- data from fifo_b
		--mux_sel 	  		: in 	std_logic;                       		-- selection of enteries: mux_sel='0' -> mux_din_a , mux_sel='1' -> mux_din_b
		rd_en_a 		: in	std_logic; 						-- read enable to fifo a
		rd_en_b 		: in 	std_logic; 						-- read enable to fifo b
		mux_dout	  		: out 	std_logic_vector(width_g-1 downto 0)  --data out to DC FIFO
	);
end component mux2;

--#############################	Signals ##############################################--

--Clock and Reset
signal clk		       	   	:	std_logic := '0';
signal reset_n			    :	std_logic := '1';

signal opu_data_in		    :	std_logic_vector(7 downto 0); -- data from wbs
signal opu_data_in_valid	:	std_logic;
signal opu_data_in_cnt		: 	std_logic_vector(9 downto 0); -- number of changes in bytes - 1, each change is 3 bytes
signal opu_wr_en		    : 	std_logic; -- This signal is an enable signal to write opcodes to the Opcode Store block. It is active when a new opcode was united and is ready to be stored in the FIFO.
signal opu_data_out		    : 	std_logic_vector(23 downto 0); -- The data signal is the united Opcode to be stored in the Opcode store block.
-- signals counter			:	std_logic_vector(9 downto 0) := (others => '0');  -- counter signal to count the message packs from wbs

signal op_cnt               :   std_logic_vector(9 downto 0);   	-- number of total changes X 3: 1 change (24 bits) = add/remove 1 symbol ( 24 bits are being sent in 3 packs of 8 bits)
signal op_str_rd_start      :   std_logic; 	
signal ram_addr_wr          :   std_logic_vector(8 downto 0);  		-- ram's address to be written into. 
signal ram_wr_en            :   std_logic;							-- ram write enable
signal mng_en               :   std_logic;							-- activating Read_Manager 
signal op_str_empty         :   std_logic;							-- FIFO is empty (debug)
signal op_str_full          :   std_logic;							-- FIFO is full (debug)
signal op_str_used          :   std_logic_vector(9 downto 0);		-- current number of elements in FIFO (debug)	

signal ram_addr_rd          :   std_logic_vector(8 downto 0);
signal ram_data_in          :   std_logic_vector(12 downto 0);
signal ram_data_out         :   std_logic_vector(12 downto 0);
signal ram_rd_en            :   std_logic;

signal req_in_trg           :   std_logic:= '0'; -- request in trigger from VESA for a new video row
signal sdram_data           :   std_logic_vector (7 downto 0):= (others=>'0'); --this signal gets the data from sdram 
signal sdram_data_valid     :   std_logic:= '0'; -- indicates when the data from the sdram is valid and we can store it in one of the fifos (a or b)
signal fifo_a_used			:		 std_logic_vector(10 downto 0):= (others=>'0'); -- fifo a used signal
signal fifo_a_full			:		 std_logic:= '0'; -- fifo a full indication
signal fifo_a_empty		    :   std_logic:= '0'; -- fifo a empty indication
signal fifo_b_used			:		 std_logic_vector(10 downto 0):= (others=>'0'); -- fifo b used signal
signal fifo_b_full			:		 std_logic:= '0'; -- fifo b full indication
signal fifo_b_empty		    :		 std_logic:= '0'; -- fifo b empty indication
signal fifo_a_rd_en 		:   std_logic:= '0'; -- read enable to fifo a
signal fifo_a_wr_en 		:   std_logic:= '0'; -- write enable to fifo a
signal fifo_a_data_in 		:   std_logic_vector(7 downto 0):= (others=>'0'); -- data in to fifo a
signal fifo_b_rd_en 		: 		std_logic:= '0'; -- read enable to fifo b
signal fifo_b_wr_en 		:   std_logic:= '0'; -- write enable to fifo b
signal fifo_b_data_in 		:   std_logic_vector(7 downto 0):= (others=>'0'); -- data in to fifo b
signal sdram_addr_rd 		: 	 std_logic_vector (23 downto 0):= (others=>'0'); --this signal is the full address in SDRAM: "00--bank(2)--row(12)--col(8)"
signal sdram_rd_en			:		 std_logic:= '0'; -- this signal is a valid signal for the sdram_addr_rd signal (for usage of WBS)
--signal mux_sel            :   std_logic;

signal fifo_a_flush         :   std_logic := '0';
signal fifo_b_flush         :   std_logic := '0';
signal fifo_a_dout			:	  std_logic_vector (7 downto 0);
signal fifo_b_dout		    :	  std_logic_vector (7 downto 0);

signal mux_dout             :   std_logic_vector(7 downto 0); 

begin

--#############################	Instantiaion ##############################################--
opcode_unite_inst :  opcode_unite 
port map(
			clk            => clk,
			reset_n        => reset_n,
			opu_data_in        => opu_data_in,
			opu_data_in_valid  => opu_data_in_valid,
			--opu_data_in_cnt    => opu_data_in_cnt,
			opu_wr_en          => opu_wr_en,
			opu_data_out       => opu_data_out
			--counter => counter
		);

opcode_store_inst :  opcode_store 
port map(
	clk            		=> clk,       
	reset_n        		=> reset_n,     
	op_cnt             	=> op_cnt,          
	op_str_valid   		=> opu_wr_en,     
	op_str_data_in     	=> opu_data_out,    
	op_str_rd_start    	=> op_str_rd_start,   
	ram_addr_wr       	=> ram_addr_wr,     
	ram_wr_en          	=> ram_wr_en,      
	ram_data           	=> ram_data_in,       
	mng_en          	=> mng_en,           
	op_str_empty       	=> op_str_empty,
	op_str_full        	=> op_str_full,
	op_str_used        	=> op_str_used
		);

RAM_300_inst :  RAM_300
port map(
    clk              	=> clk,
    reset_n          	=> reset_n,
    ram_wr_en           => ram_wr_en,
    ram_addr_wr         => ram_addr_wr,      
    ram_addr_rd         => ram_addr_rd,
    ram_data_in         => ram_data_in,
    ram_data_out        => ram_data_out,
    ram_rd_en           => ram_rd_en  
  );

manager_inst : manager
generic map(
		row_count_g		=>	 	480, -- Total row count for the frame
		sym_row_g		=> 		15, 	-- Total symbol row count for the frame
		sym_col_g		=> 		20, 	-- Total symol column count for the frame
		inside_row_g	=> 		32, 	-- Total row count inside the symbol
		sdram_burst_g	=> 		16 	-- The length of the burst from SDRAM (in words = 16 bits)
	)
port map(
	clk					=> clk,
    reset_n          	=> reset_n,
    ram_data_out        => ram_data_out,
	req_in_trg			=> req_in_trg,
	mng_en          	=> mng_en,
	sdram_data			=> sdram_data,
	sdram_data_valid	=> sdram_data_valid,
	--fifo_a_used			=> fifo_a_used,
	--fifo_a_full			=> fifo_a_full,
	fifo_a_empty		=> fifo_a_empty,
	--fifo_b_used			=> fifo_b_used,
	--fifo_b_full			=> fifo_b_full,
	fifo_b_empty		=> fifo_b_empty,
    ram_rd_en_out		=> ram_rd_en,
    ram_addr_rd			=> ram_addr_rd,
	fifo_a_rd_en		=> fifo_a_rd_en,
	fifo_a_wr_en		=> fifo_a_wr_en,
	fifo_a_data_in		=> fifo_a_data_in,
	fifo_b_rd_en		=> fifo_b_rd_en,
	fifo_b_wr_en		=> fifo_b_wr_en,
	fifo_b_data_in		=> fifo_b_data_in,
	sdram_addr_rd		=> sdram_addr_rd,
	sdram_rd_en_out		=> sdram_rd_en
	--mux_sel => mux_sel
);

sdram_symbol_model_inst : sdram_symbol_model
port map(
  clk         => clk,   
  reset_n     => reset_n,   
  rd_addr     => sdram_addr_rd, 
  rd_en       => sdram_rd_en,  
  data_out    => sdram_data,
  valid       => sdram_data_valid
);

fifo_A : general_fifo
	generic map(	 
		reset_polarity_g	=> '0',	-- Reset Polarity
		width_g				=> 8, 	-- Width of data
		depth_g 			=> 640,	-- Maximum elements in FIFO
		log_depth_g			=> 10,		-- Logarithm of depth_g (Number of bits to represent depth_g. 2^4=16 > 9)
		almost_full_g		=> 8, 	-- Rise almost full flag at this number of elements in FIFO
		almost_empty_g		=> 1 	-- Rise almost empty flag at this number of elements in FIFO
		)
	 port map(
		 clk 			=> 		clk,					-- Clock
		 rst 			=> 		reset_n,             -- Reset
		 din 			=> 		fifo_a_data_in,      -- Input Data
		 wr_en 			=> 		fifo_a_wr_en,        -- Write Enable
		 rd_en 			=> 		fifo_a_rd_en,        -- Read Enable (request for data)
		 flush			=> 		fifo_a_flush,		-- Flush data
		 dout 			=> 		fifo_a_dout,	    	-- Output Data
		 dout_valid		=> 		open,                -- Output data is valid
		 afull  		=> 		open,                -- FIFO is almost full
		 full 			=>  	fifo_a_full,        -- FIFO is full
		 aempty 		=> 		open,                -- FIFO is almost empty
		 empty 			=> 		fifo_a_empty,        -- FIFO is empty
		 used 			=> 		fifo_a_used  		-- Current number of elements is FIFO. Note the range. In case depth_g is 2^x, then the extra bit will be used
	     );


fifo_B : general_fifo
	generic map(	 
		reset_polarity_g	=> '0',	-- Reset Polarity
		width_g				=> 8, 	-- Width of data
		depth_g 			=> 640,	-- Maximum elements in FIFO
		log_depth_g			=> 10,		-- Logarithm of depth_g (Number of bits to represent depth_g. 2^4=16 > 9)
		almost_full_g		=> 8, 	-- Rise almost full flag at this number of elements in FIFO
		almost_empty_g		=> 1 	-- Rise almost empty flag at this number of elements in FIFO
		)
	 port map(
		 clk 			=> 		clk,					-- Clock
		 rst 			=> 		reset_n,             -- Reset
		 din 			=> 		fifo_b_data_in,      -- Input Data
		 wr_en 			=> 		fifo_b_wr_en,        -- Write Enable
		 rd_en 			=> 		fifo_b_rd_en,        -- Read Enable (request for data)
		 flush			=> 		fifo_b_flush,		-- Flush data
		 dout 			=> 		fifo_b_dout,	    	-- Output Data
		 dout_valid		=> 		open,                -- Output data is valid
		 afull  		=> 		open,                -- FIFO is almost full
		 full 			=> 		fifo_b_full,         -- FIFO is full
		 aempty 		=> 		open,                -- FIFO is almost empty
		 empty 			=> 		fifo_b_empty,        -- FIFO is empty
		 used 			=> 		fifo_b_used  		-- Current number of elements is FIFO. Note the range. In case depth_g is 2^x, then the extra bit will be used
	     );
	     
mux2_inst : mux2
	generic map(
		width_g			=>		8
	)
	port map(
		clk 		    => 		clk,          -- the main clock to which all the internal logic of the Symbol Generator block is synchronized.
		reset_n 	  	=> 		reset_n,         -- asynchronous reset
		mux_din_a 		=> 		fifo_a_dout,   -- data from fifo_a
		mux_din_b 		=> 		fifo_b_dout,   -- data from fifo_b
		--mux_sel 	  	=> 		mux_sel,     -- selection of enteries: mux_sel='0' -> mux_din_a , mux_sel='1' -> mux_din_b
		rd_en_a	=> 		fifo_a_rd_en,
		rd_en_b	=> 		fifo_b_rd_en,
		mux_dout	  	=> 		mux_dout    	  --data out to DC FIFO
	);




--###############################process#########################################
		
clk_proc:
clk	<=	not clk after 5 ns;

rst_proc:
reset_n	<=	'0', '1' after 20 ns;


unite_proc: process 
	variable col_loop : std_logic_vector(4 downto 0);
	variable row_loop : std_logic_vector(3 downto 0);
begin
  -- ram_addr_rd <= "000000000";
	op_str_rd_start  <= '0';
	wait for 30 ns;
	
	-- -- packet of 9 bytes (= 3 opcodes)
	-- op_cnt <= "0000001001"; -- 9
	
	-- -- add , addr = 7 , x = 3 , y = 2  
	-- opu_data_in <= "01000000"; --MSB
	-- opu_data_in_valid <= '1';
	-- wait for 10 ns;
	-- opu_data_in_valid <= '0';
	-- wait for 10 ns;
	-- opu_data_in <= "00001110";
	-- opu_data_in_valid <= '1';
	-- wait for 10 ns;
	-- opu_data_in_valid <= '0';
	-- wait for 10 ns;
	-- opu_data_in <= "01100010"; --LSB
	-- opu_data_in_valid <= '1';
	-- wait for 10 ns;
	-- opu_data_in_valid <= '0';
	-- wait for 10 ns;
	
	-- -- add , addr = 3 , x = 5 , y = 1
	-- opu_data_in <= "01000000"; 
	-- opu_data_in_valid <= '1';
	-- wait for 10 ns;
	-- opu_data_in_valid <= '0';
	-- wait for 10 ns;
	-- opu_data_in <= "00000110";
	-- opu_data_in_valid <= '1';
	-- wait for 10 ns;
	-- opu_data_in_valid <= '0';
	-- wait for 10 ns;
	-- opu_data_in <= "10100001";
	-- opu_data_in_valid <= '1';
	-- wait for 10 ns;
	-- opu_data_in_valid <= '0';
	-- wait for 10 ns;
	
	-- --reset_n	<=	'0';
	
	-- -- remove , addr = 3 , x = 5 , y = 1 
	-- opu_data_in <= "00000000";
	-- opu_data_in_valid <= '1';
	-- wait for 10 ns;
	-- opu_data_in_valid <= '0';
	-- wait for 10 ns;
	-- opu_data_in <= "00000110";
	-- opu_data_in_valid <= '1';
	-- wait for 10 ns;
	-- opu_data_in_valid <= '0';
	-- wait for 10 ns;
	-- opu_data_in <= "10100001";
	-- opu_data_in_valid <= '1';
	-- wait for 10 ns;
	-- opu_data_in_valid <= '0';
	-- wait for 10 ns;
	
	-----------------------------------------------------------------------
	-- initialize the screen with black symbols
	
	-- packet of 900 bytes (= 300 opcode)
	op_cnt <= "1110000100"; -- 900
	
	for row in 0 to 14 loop
		for col	in 0 to 19 loop
			row_loop := std_logic_vector(to_unsigned(row,4));
			col_loop := std_logic_vector(to_unsigned(col,5));
			-- add , addr = 0 (means row 0-1 in SDRAM)
			opu_data_in <= "01000000"; --MSB
			opu_data_in_valid <= '1';
			wait for 10 ns;
			opu_data_in_valid <= '0';
			wait for 10 ns;
			opu_data_in <= "0000000"&row_loop(3);
			opu_data_in_valid <= '1';
			wait for 10 ns;
			opu_data_in_valid <= '0';
			wait for 10 ns;
			opu_data_in <= row_loop(2 downto 0)&col_loop(4 downto 0); --LSB
			opu_data_in_valid <= '1';
			wait for 10 ns;
			opu_data_in_valid <= '0';
			wait for 10 ns;
		end loop;
	end loop;
			   
	-----------------------------------------------------------------------
	
	
	-- -- -- packet of 3 bytes (= 1 opcode)
	-- -- op_cnt <= "0000000011"; -- 3
	
	-- -- -- add , addr = 1 (means row 2-3 in SDRAM) , x = 0 , y = 0  
	-- -- opu_data_in <= "01000000"; --MSB
	-- -- opu_data_in_valid <= '1';
	-- -- wait for 10 ns;
	-- -- opu_data_in_valid <= '0';
	-- -- wait for 10 ns;
	-- -- opu_data_in <= "00000010";
	-- -- opu_data_in_valid <= '1';
	-- -- wait for 10 ns;
	-- -- opu_data_in_valid <= '0';
	-- -- wait for 10 ns;
	-- -- opu_data_in <= "00000000"; --LSB
	-- -- opu_data_in_valid <= '1';
	-- -- wait for 10 ns;
	-- -- opu_data_in_valid <= '0';
	-- -- wait for 10 ns;
	
	-- spike on the vsync, the signal is active for only one clock
	-- check that manager doesn't react
	wait for 50 ns;
	op_str_rd_start  <= '1';
	wait for 10 ns;
	op_str_rd_start  <= '0';
	
	-- vsync active for more than one clock, manager should react and start updating the RAM
	wait for 50 ns;
	op_str_rd_start  <= '1';
	wait for 20 ns;
	op_str_rd_start  <= '0';
	
	-- wait for 100 ns;
	-- ram_addr_rd <= "000111110";
	-- wait for 10 ns;
	-- ram_addr_rd <= "001100101";
	-- wait for 10 ns;
	-- ram_addr_rd <= "000010010";
	
	-- request from VESA Generator, start to request data from SDRAM
	-- wait for 14000 ns;
	-- req_in_trg <= '1';
	-- wait for 10 ns;
	-- req_in_trg <= '0';
  
  -- loop to reach a new video frame
	for i in 482 downto 0 loop
		wait for 20000 ns;
		req_in_trg <= '1';
		wait for 10 ns;
		req_in_trg <= '0';
	end loop;

	
	wait;
	
end process unite_proc;

end architecture sim_Symbol_Generator_Top_TB;

