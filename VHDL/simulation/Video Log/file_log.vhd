------------------------------------------------------------------------------------------------
-- Model Name 	:	sdram symbol model
-- File Name	:	sdram_symbol_model.vhd
-- Generated	:	15.06.2012
-- Author		:	Olga Liberman and Yoav Shvartz
-- Project		:	Symbol Generator Project
------------------------------------------------------------------------------------------------
-- Description:
------------------------------------------------------------------------------------------------
-- Revision:
--			Number		Date		  Name				Description			
--			1.00		15.06.2012	  Yoav Shvartz 		Creation

------------------------------------------------------------------------------------------------
--	Todo:
--	(1) add input port vsync. each new frame, the output log file name is increased by 1. each frame file as 480*640 pixels (of 8 bits).
--  (2) 
------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

use std.textio.all;
use work.txt_util.all;
 
 
entity file_log is
  generic (
           log_file:       string  := "res.log"
          );
  port(
		symbol_num		:	in	std_logic_vector(3 downto 0);		-- number of symbol
		clk              : in std_logic;
		reset_n              : in std_logic;
		fifo_a_rd_en 	: 		in std_logic; 						-- read enable to fifo a
		fifo_b_rd_en 	: 		in std_logic; 						-- read enable to fifo b
		mux_dout	  	: 		in std_logic_vector(7 downto 0)    -- data out to DC FIFO
      );
end file_log;
   
   
architecture log_to_file_rtl of file_log is
  
  
    file l_file: TEXT open write_mode is log_file;
    -- signal clk            : std_logic := '0';
    -- signal reset_n        : std_logic := '0';
    -- signal symbol_num		:		std_logic_vector(3 downto 0);		-- number of symbol
    -- signal fifo_a_rd_en 	: 		 std_logic; 						-- read enable to fifo a
    -- signal fifo_b_rd_en 	: 		 std_logic; 						-- read enable to fifo b
    -- signal mux_dout	  	: 		 std_logic_vector(7 downto 0);    -- data out to DC FIFO
begin


-----------------------------TB_start------------------------
--clk_proc:
--clk	<=	not clk after 5 ns;

-- rst_proc:
-- reset_n	<=	'0', '1' after 20 ns;

--the tests
-- assign_proc: process (clk,reset_n)
-- begin
  -- fifo_a_rd_en <='0';
  -- fifo_b_rd_en <='0';
  -- symbol_num <= "0010";
  -- wait for 40 ns;
  -- mux_dout	<= "00000000";
  -- fifo_a_rd_en <='1';
  -- wait for 10 ns;
  -- mux_dout	<= "10000001";
  -- fifo_a_rd_en <='0';
  -- fifo_b_rd_en <='1';
  -- wait for 10 ns;
  -- mux_dout	<= "00000001";
  -- fifo_a_rd_en <='0';
  -- fifo_b_rd_en <='0';
 
  -- wait;
  
--end process assign_proc;

-----------------------------TB_end------------------------




-- write data and control information to a file

receive_data_proc: process

variable l: line;
   
begin                                       

   -- print header for the logfile
   wait until reset_n='0';
   print(l_file, "symbol"&" "&str(symbol_num));
   print(l_file, "#----------");
   print(l_file, " ");


   wait until reset_n='1';
   --wait until reset_n='0';

   
   while true loop

     -- write digital data into log file
     --* write(l, str(x1)& " "& hstr(x2)& "h");
     --* writeline(l_file, l);
     print(l_file, str(mux_dout));

     wait until ( (clk = '1') and ( (fifo_a_rd_en = '1') or (fifo_b_rd_en = '1') ) );
    
   end loop;

 end process receive_data_proc;



end log_to_file_rtl;
 