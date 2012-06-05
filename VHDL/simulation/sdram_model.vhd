------------------------------------------------------------------------------------------------
-- Model Name 	:	sdram model
-- File Name	:	sdram_model.vhd
-- Generated	:	03.06.2012
-- Author		:	Olga Liberman and Yoav Shvartz
-- Project		:	Symbol Generator Project
------------------------------------------------------------------------------------------------
-- Description: sdram model
-- This model recieves the read address from the manager block, and sends the required data
-- pixels from the symbol text files.
--
-- black symbol is saved in address 0x0...00 and 0x0...01
-- the other symbol is saved in adress 0x0...02 and 0x0...03
--
-- from the rd_en rising edge, a counter counts 20 clocks, and only then starts to send the data.
--
--
------------------------------------------------------------------------------------------------
-- Revision:
--			Number		Date		       Name								       Description			
--			1.00		  03.06.2012	  Olga Liberman						Creation
------------------------------------------------------------------------------------------------
--	Todo:
--			(1) right now, when rd_en='1' then the whole text file is read.
--        need to implement a counter, to read only 16 pixels for each read.
--    (2)
------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

use std.textio.all;
use work.txt_util.all;


entity sdram_model is
            generic(
                     black_symbol_file: string :="symbol_black.txt";
                     symbol_file_1: string :="symbol_1.txt"
                    );
            port(
                 --clk        : in  std_logic;
                 --reset      : in  std_logic;
                 --rd_addr    : in  std_logic_vector (23 downto 0);
                 --rd_en      : in  std_logic;
                 data_out   : out std_logic_vector(7 downto 0);
                 valid      : out std_logic
                );
end entity sdram_model;

architecture sim_sdram_model of sdram_model is
    
    file stimulus_black : TEXT open read_mode is black_symbol_file;
    file stimulus_1     : TEXT open read_mode is symbol_file_1;

    signal clk          : std_logic := '0';
    signal reset_n      : std_logic := '0';
    
    signal count_en     : std_logic := '0';
    signal counter      : integer := 0;
    signal read_data    : std_logic;
    signal address      : std_logic_vector (23 downto 0);
    
    signal rd_addr    :   std_logic_vector (23 downto 0);
    signal rd_en      :   std_logic;
            
begin

clk_proc:
clk	<=	not clk after 5 ns;

rst_proc:
reset_n	<=	'0', '1' after 20 ns;

assign: process
begin
  
  rd_en	<=	'0';
  rd_addr <=  conv_std_logic_vector(2, 24);
  wait for 40 ns;
  rd_en	<=	'1';
  wait for 10 ns;
  rd_en	<=	'0';
  rd_addr <=  conv_std_logic_vector(0, 24);
  wait for 100 ns;
  rd_addr <=  conv_std_logic_vector(3, 24);
  rd_en	<=	'1';
  wait for 10 ns;
  rd_addr <=  conv_std_logic_vector(0, 24);
  rd_en	<=	'0';
  wait for 11000 ns;
  rd_addr <=  conv_std_logic_vector(3, 24);
  rd_en	<=	'1';
  wait for 10 ns;
  rd_addr <=  conv_std_logic_vector(0, 24);
  rd_en	<=	'0';

  wait;
  
end process assign;
  
receive_data: process(clk, reset_n)

    variable l: line;
    --variable s: string(y'range);
    variable s: string(1 to 8);

begin

    if (reset_n='0') then
      data_out  <= (others=>'0');
      valid     <= '0';
      count_en  <= '0';
      counter   <= 0;
      read_data <= '0';
      address   <= (others=>'0');
    elsif rising_edge(clk) then
  
      -- wait for Reset to complete 
      --wait until reset_n='1';

      valid <= '0';
      
      if ( (rd_en='1') and (count_en='0') and (read_data='0') ) then
        count_en <= '1';
        address <= rd_addr;
      end if;
      
      if (counter=19) then
        count_en <= '0';
        counter <= 0;
        read_data <= '1';
      elsif (count_en='1') then
        counter <= counter + 1;
      end if;
       
       if (read_data='1') then
         
         if ( conv_integer(address) = 0 or conv_integer(address) = 1 ) then
           
           if not endfile(stimulus_black) then
              readline(stimulus_black, l);
              read(l, s);
              data_out <= to_std_logic_vector(s);
              valid <= '1';
            else
              valid <= '0';
              data_out  <= (others=>'0');
              read_data <= '0'; -- finished reading
              address   <= (others=>'0');
              print("I@FILE_READ: reached end of "& black_symbol_file);
            end if;
            
          elsif ( conv_integer(address) = 2 or conv_integer(address) = 3 ) then
           
           if not endfile(stimulus_1) then
              readline(stimulus_1, l);
              read(l, s);
              data_out <= to_std_logic_vector(s);
              valid <= '1';
            else
              valid <= '0';
              data_out  <= (others=>'0');
              read_data <= '0'; -- finished reading
              address   <= (others=>'0');
              print("I@FILE_READ: reached end of "& symbol_file_1);
            end if;
        
          else
              valid <= '0';
              data_out  <= (others=>'0');
              read_data <= '0'; -- finished reading
              address   <= (others=>'0');
              print("no text file for this address");
          end if;

    end if;
    
end if;

end process receive_data;

          

end architecture sim_sdram_model;
        
            

