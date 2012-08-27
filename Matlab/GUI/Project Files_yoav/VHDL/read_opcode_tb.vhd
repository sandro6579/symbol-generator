------------------------------------------------------------------------------------------------
-- Model Name 	:	read_opcode_tb
-- File Name	:	read_opcode_tb.vhd
-- Generated	:	24.06.2012
-- Author		:	Olga Liberman and Yoav Shvartz
-- Project		:	Symbol Generator Project
------------------------------------------------------------------------------------------------
-- Description: read_opcode_tb
-- This block tests the read_opcode operation

------------------------------------------------------------------------------------------------
-- Revision:
--			Number		Date		  Name				Description			
--			1.00		03.06.2012	  Olga Liberman 	Creation
------------------------------------------------------------------------------------------------
--	Todo:
--	(1) 
------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

use std.textio.all;  --??
use work.txt_util.all; --??

entity read_opcode_tb is
end entity read_opcode_tb;

architecture read_opcode_sim of read_opcode_tb is

component read_opcode 
	generic (
           opcode_file_g	: 	string :="opcode";
		   num_of_frames_g	:	integer := 1
          );
	port(
       --clk        			: 	in  std_logic;
        reset_n      		: 	in  std_logic;
        rd_en      			: 	in  std_logic;  
		--frame_num			:	in	std_logic_vector(7 downto 0); --user can enter up to 256 frames in one test
        data_out   			: 	out std_logic_vector(23 downto 0);
        valid      			: 	out std_logic
      );
end component read_opcode;

signal reset_n:  	std_logic;
signal rd_en:  		std_logic := '0';
--signal frame_num: 	std_logic_vector(7 downto 0);
signal data_out:    std_logic_vector(23 downto 0);
signal valid:    	std_logic;

begin


read_opcode_inst:  read_opcode  port map
		(  
            reset_n        	=> reset_n,     
			rd_en       	=> rd_en,          
			--frame_num    	=> frame_num,     
			data_out     	=> data_out,    
			valid    		=> valid
		);

reset_n	<=	'0', '1' after 20 ns;

read_opcode_proc: process 
begin
	--frame_num	<=	"00000010";
	rd_en <=  '0';
	wait for 40 ns;
	rd_en	<=	'1';
	wait for 10 ns;
	rd_en	<=	'0';
	wait for 20 ns;
  rd_en	<=	'1';
	wait for 10 ns;
	rd_en	<=	'0';
	wait for 100 ns;
	--rd_en	<=	'1';
	--wait for 10 ns;
	--rd_en	<=	'0';
	--wait for 100 ns;

	wait;
end process read_opcode_proc;


end read_opcode_sim;