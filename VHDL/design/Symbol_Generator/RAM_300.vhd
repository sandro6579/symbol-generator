------------------------------------------------------------------------------------------------
-- Model Name 	:	RAM 300x13
-- File Name	:	opcode_store.vhd
-- Generated	:	04.05.2012
-- Author		:	Olga Liberman and Yoav Shvartz
-- Project		:	Symbol Generator Project
------------------------------------------------------------------------------------------------
-- Description:
--
-- RAM size: 300 x 13 (rows x bits)
--
-- The RAM stores the current display
-- Each row matches respectively to a symbol on the display:
-- row 0 to symbol (0,0)
-- row 1 to symbol (0,1)
-- ...
-- row 299 to symbol (14,19)
-- Each row stores the address of the wanted symbol in the SDRAM
--
-- Note: no "read enable" is needed
-- If the read address is valid, then the data will be on the dataout signal 
--
------------------------------------------------------------------------------------------------
-- Revision:
--			Number		 Date		        Name								      Description			
--			1.00		   04.05.2012	   Olga Liberman		   Creation
-- 
------------------------------------------------------------------------------------------------
--	Todo:
--			(1) 
--
------------------------------------------------------------------------------------------------

library ieee;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all; 
use ieee.numeric_std.all ;

entity RAM_300 is
  port (
    clk         : in std_logic;	 							-- clock
--  reset_n     : in std_logic; 						-- asynchronous reset
    we          : in  std_logic;
    write_addr  : in  std_logic_vector(8 downto 0);
--  re          : in  std_logic;
    read_addr   : in  std_logic_vector(8 downto 0);
    datain      : in  std_logic_vector(12 downto 0);
    dataout     : out std_logic_vector(12 downto 0) 

  );
end entity RAM_300;

architecture RAM_300_rtl of RAM_300 is
  
  type ram_type is array (0 to 299) of std_logic_vector(12 downto 0);
  signal mem : ram_type; 
  
begin
    
    ram_proc: process(clk) is
    begin
      if rising_edge(clk) then
        
        if ( (we = '1') and ( write_addr < 300 ) ) then
            mem(to_integer(unsigned(write_addr))) <= datain;
        end if;
        
--      if ( (re = '1') and ( read_addr < 300 ) ) then
        if ( read_addr < 300 ) then
            dataout <= mem(to_integer(unsigned(read_addr)));
        end if;

      end if;
    end process ram_proc;
  
end RAM_300_rtl;  
    
