------------------------------------------------------------------------------------------------
-- Model Name 	:	read_opcode
-- File Name	:	read_opcode.vhd
-- Generated	:	24.08.2012
-- Author		:	Olga Liberman and Yoav Shvartz
-- Project		:	Symbol Generator Project
------------------------------------------------------------------------------------------------
-- Description: read_opcode
-- This block reads texts row afer row and sending them through data_out port.
-- Each text contains the opcodes of one frame. The opcodes (changes of symbols from the previousl frame) are organized row after row.
-- The texts' names are: "opcode_1" , "opcode_2" ,... when opcode_1 represent frame 1 , opcode_2 represent frame 2, ...
-- The read_opcode  block reads frames one after the other, when the number of frames is given from the user by the generic "num_of_frames_g".
-- The block reads a text only on the rising edge of rd_en. If there are several texts to be read, the rd_en port must be changed from '0' to '1' for each text.
-- The valid port signifies when data is valid.
-- The block has a reset port for restarting. The restarting is not enabled during reading from a text / between two sequential text, but ONLY at the beginning of read_opcode operation 
-- The texts are supplied by the Matlab GUI.

------------------------------------------------------------------------------------------------
-- Revision:
--			Number		Date		  Name				Description			
--			1.00		24.08.2012	  Yoav Shvartz 	Creation

------------------------------------------------------------------------------------------------
--	Todo:
--	(1) asking moshe if the block needs a clk?
--  (2) asking moshe if there are other features / ports that should be added?
------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

use std.textio.all;
use work.txt_util.all;


entity read_opcode is
    generic(
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
end entity read_opcode;

architecture read_opcode_rtl of read_opcode is
     
	 constant clk_period_c	: time := 10 ns; 
	 
begin

read_opcode_proc: process
    file file_pointer 			: text;
    variable line_content 		: string(1 to 24);
	variable line_num 			: line;
    variable i 					: integer := 1;
	variable cnt 				: integer := 0;
	
begin

	valid <= '0';
	data_out  <= (others=>'1');
	-- wait for Reset to complete
	wait until reset_n='0';
	wait until reset_n='1';
	i := conv_integer(num_of_frames_g);
	print(str(i)); --
	for cnt in 1 to i loop			
		wait until rising_edge(rd_en); --wait until rising_edge(rd_en);		
		file_open(file_pointer,opcode_file_g&"_"&str(cnt)&".txt",READ_MODE);
		print(opcode_file_g&"_"&str(cnt)&".txt"); --
		print("file "&str(cnt)&" is open");
		while not endfile(file_pointer) loop 	--till the end of file number "cnt" is reached continue.
			readline (file_pointer,line_num);  	--Read the whole line from the file
			READ (line_num,line_content);
			data_out <= to_std_logic_vector(line_content);
			valid <= '1';
			wait for clk_period_c;
		end loop;
		print("file "&str(cnt)&" is close");
		file_close(file_pointer);  --after reading all the lines close the file. 
		valid <= '0';
		data_out  <= (others=>'1');
	end loop;			
end process read_opcode_proc;

end architecture read_opcode_rtl;