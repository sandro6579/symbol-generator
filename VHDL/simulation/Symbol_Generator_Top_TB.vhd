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
--			Number		Date		Name								Description			
--			1.00		04.05.2012	Olga Liberman						Creation
------------------------------------------------------------------------------------------------
--	Todo:
--			(1)
------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Symbol_Generator_Top_TB is
end entity Symbol_Generator_Top_TB;

architecture sim_Symbol_Generator_Top_TB of Symbol_Generator_Top_TB is

--#############################	Components	##############################################--

component opcode_unite
	port (
			clk_133				: 	in 		std_logic; -- the main clock to which all the internal logic of the Symbol Generator block is synchronized.
			reset_133_n			: 	in 		std_logic; -- asynchronous reset
			opu_data_in			: 	in 		std_logic_vector(7 downto 0); -- data from wbs
			opu_data_in_valid	: 	in 		std_logic; -- valid signal for data from wbs
			opu_data_in_cnt		: 	in 		std_logic_vector(9 downto 0); -- number of changes in bytes - 1, each change is 3 bytes
			opu_wr_en			: 	out 	std_logic; -- This signal is an enable signal to write opcodes to the Opcode Store block. It is active when a new opcode was united and is ready to be stored in the FIFO.
			opu_data_out		: 	out 	std_logic_vector(23 downto 0); -- The data signal is the united Opcode to be stored in the Opcode store block.
			counter				:	out 	std_logic_vector(9 downto 0) := (others => '0');  -- counter signal to count the message packs from wbs
      test :out std_logic := '0'		
		);
end component opcode_unite;


component opcode_store
	port (
			clk_133            : in    std_logic;	 					-- clock in domain 133Mhz.
            reset_133_n        : in    std_logic; 						-- asynchronous reset. 
			op_cnt             : in    std_logic_vector(9 downto 0);   	-- number of total changes X 3: 1 change (24 bits) = add/remove 1 symbol ( 24 bits are being sent in 3 packs of 8 bits)
			op_str_valid       : in    std_logic; 						-- connected from opcode_unite block, opu_wr_en signal
			op_str_data_in     : in    std_logic_vector(23 downto 0); 	-- connected from opcode_unite block, opu_data_out signal
			op_str_rd_start    : in    std_logic; 						-- connected from VESA controller, vsync signal
			ram_adr_wr         : out   std_logic_vector(8 downto 0);  	-- ram's address to be written into. 
			ram_wr_en          : out   std_logic;					 	-- ram write enable
			ram_data           : out   std_logic_vector(12 downto 0);	-- data sent to ram
			rd_mng_en          : out   std_logic;						-- activating Read_Manager 
			op_str_ready       : out   std_logic; 						-- ????????????????? same as ram_wr_en ?????????????
			op_str_empty       : out   std_logic;						-- FIFO is empty (debug)
			op_str_full        : out   std_logic;						-- FIFO is full (debug)
			op_str_used        : out   std_logic_vector(9 downto 0)		-- current number of elements in FIFO (debug)	
		);
end component opcode_store;

--#############################	Signals ##############################################--

--Clock and Reset
signal clk_133				:	std_logic := '0';
signal reset_133_n			:	std_logic := '1';
-- data in
signal opu_data_in			:	std_logic_vector(7 downto 0); -- data from wbs
signal opu_data_in_valid	:	std_logic;
signal opu_data_in_cnt		: 	std_logic_vector(9 downto 0); -- number of changes in bytes - 1, each change is 3 bytes
-- signals from unite to store
signal opu_wr_en			: 	std_logic; -- This signal is an enable signal to write opcodes to the Opcode Store block. It is active when a new opcode was united and is ready to be stored in the FIFO.
signal opu_data_out			: 	std_logic_vector(23 downto 0); -- The data signal is the united Opcode to be stored in the Opcode store block.
signal counter				:	std_logic_vector(9 downto 0) := (others => '0');  -- counter signal to count the message packs from wbs
-- to store
signal op_str_rd_start      :   std_logic; 	
-- data out
signal ram_adr_wr           :   std_logic_vector(8 downto 0);  		-- ram's address to be written into. 
signal ram_wr_en            :   std_logic;							-- ram write enable
signal ram_data             :   std_logic_vector(12 downto 0);		-- data sent to ram
signal rd_mng_en            :   std_logic;							-- activating Read_Manager 
signal op_str_ready         :   std_logic; 							-- ????????????????? same as ram_wr_en ?????????????
signal op_str_empty         :   std_logic;							-- FIFO is empty (debug)
signal op_str_full          :   std_logic;							-- FIFO is full (debug)
signal op_str_used          :   std_logic_vector(9 downto 0);		-- current number of elements in FIFO (debug)	


begin

--#############################	Instantiaion ##############################################--
opcode_unite_inst :  opcode_unite port map
		(
			clk_133 => clk_133,
			reset_133_n => reset_133_n,
			opu_data_in => opu_data_in,
			opu_data_in_valid => opu_data_in_valid,
			opu_data_in_cnt => opu_data_in_cnt,
			opu_wr_en => opu_wr_en,
			opu_data_out => opu_data_out,
			counter => counter
		);

opcode_store_inst :  opcode_store port map
		(
			clk_133            => clk_133,       
      reset_133_n        => reset_133_n,     
			op_cnt             => opu_data_in_cnt,          
			op_str_valid       => opu_wr_en,     
			op_str_data_in     => opu_data_out,    
			op_str_rd_start    => op_str_rd_start,   
			ram_adr_wr         => ram_adr_wr,     
			ram_wr_en          => ram_wr_en,      
			ram_data           => ram_data,       
			rd_mng_en          => rd_mng_en,       
			op_str_ready       => op_str_ready,     
			op_str_empty       => op_str_empty,
			op_str_full        => op_str_full,
			op_str_used        => op_str_used
		);

		
clk_proc:
clk_133	<=	not clk_133 after 5 ns;

rst_proc:
reset_133_n	<=	'0', '1' after 20 ns;

			
unite_proc: process 
begin
	op_str_rd_start  <= '0';
	wait for 30 ns;
	
	opu_data_in_cnt <= "0000001001"; -- 9
	
	-- add , addr = 7 , x = 3 , y = 2  
	opu_data_in <= "01000000"; --MSB
	opu_data_in_valid <= '1';
	wait for 10 ns;
	opu_data_in_valid <= '0';
	wait for 10 ns;
	opu_data_in <= "00001110";
	opu_data_in_valid <= '1';
	wait for 10 ns;
	opu_data_in_valid <= '0';
	wait for 10 ns;
	opu_data_in <= "01100010"; --LSB
	opu_data_in_valid <= '1';
	wait for 10 ns;
	opu_data_in_valid <= '0';
	wait for 10 ns;
	
	-- add , addr = 3 , x = 5 , y = 1
	opu_data_in <= "01000000"; 
	opu_data_in_valid <= '1';
	wait for 10 ns;
	opu_data_in_valid <= '0';
	wait for 10 ns;
	opu_data_in <= "00000110";
	opu_data_in_valid <= '1';
	wait for 10 ns;
	opu_data_in_valid <= '0';
	wait for 10 ns;
	opu_data_in <= "10100001";
	opu_data_in_valid <= '1';
	wait for 10 ns;
	opu_data_in_valid <= '0';
	wait for 10 ns;
	
	reset_133_n	<=	'0';
	
	-- remove , addr = 3 , x = 5 , y = 1 
	opu_data_in <= "00000000";
	opu_data_in_valid <= '1';
	wait for 10 ns;
	opu_data_in_valid <= '0';
	wait for 10 ns;
	opu_data_in <= "00000110";
	opu_data_in_valid <= '1';
	wait for 10 ns;
	opu_data_in_valid <= '0';
	wait for 10 ns;
	opu_data_in <= "10100001";
	opu_data_in_valid <= '1';
	wait for 10 ns;
	opu_data_in_valid <= '0';
	wait for 10 ns;
	
	wait for 50 ns;
	op_str_rd_start  <= '1';
	wait for 10 ns;
	op_str_rd_start  <= '0';
	
	wait for 50 ns;
	op_str_rd_start  <= '1';
	wait for 20 ns;
	op_str_rd_start  <= '0';
	

	
	wait;
	
end process unite_proc;

end architecture sim_Symbol_Generator_Top_TB;

