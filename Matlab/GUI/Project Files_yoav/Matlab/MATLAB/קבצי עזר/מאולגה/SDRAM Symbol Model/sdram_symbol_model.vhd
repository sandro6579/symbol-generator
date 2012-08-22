------------------------------------------------------------------------------------------------
-- Model Name 	:	sdram symbol model
-- File Name	:	sdram_symbol_model.vhd
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
-- from the rd_en rising edge, a counter counts 20 clocks, and only then starts to send the data
-- length of 32 pixels
--
-- This model reads data from a text file which is a model to the memory
-- The structure of the text file:
--
-- address=00<2 bits for the bank><12 bits for the row><8 bits for the column>
-- <pixel 1: 8 bits>
-- <pixel 2: 8 bits>
		-- ...
		-- ...
		-- ...
-- <pixel 32: 8 bits>
-- address=00<2 bits for the bank><12 bits for the row><8 bits for the column>
-- <pixel 1: 8 bits>
-- <pixel 2: 8 bits>
		-- ...
		-- ...
		-- ...
-- <pixel 32: 8 bits>
-- (and follows...)
--
-- the columns of the addresses are incresed by 16 words.
--
-- Example for a text file is the memory.txt, supplied with this file.

------------------------------------------------------------------------------------------------
-- Revision:
--			Number		Date		  Name				Description			
--			1.00		03.06.2012	  Olga Liberman 	Creation
--			2.00		13.06.2012	  Olga Liberman		The model name changed to "SDRAM symbol model"
--														check of the address is on the row bits: address(21 downto 8) (instead of the the whole address)
--			3.00		15.06.2012	  Olga Liberman		New version of the sdram symbol model
------------------------------------------------------------------------------------------------
--	Todo:
--	(1) 
--  (2) 
------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

use std.textio.all;
use work.txt_util.all;


entity sdram_symbol_model is
    generic(
        memory_file	: 	string :="memory.txt"
    );
    port(
        clk        			: 	in  std_logic;
        reset_n      		: 	in  std_logic;
        rd_addr    			: 	in  std_logic_vector (23 downto 0);
        rd_en      			: 	in  std_logic;
        data_out   			: 	out std_logic_vector(7 downto 0);
        valid      			: 	out std_logic
    );
end entity sdram_symbol_model;

architecture sim_sdram_symbol_model of sdram_symbol_model is

    -- signal clk            : std_logic := '0';
    -- signal reset_n        : std_logic := '0';
    -- signal rd_addr    :   std_logic_vector (23 downto 0);
    -- signal rd_en      :   std_logic;
    signal address    :   std_logic_vector (23 downto 0);
            
begin

read_mem_proc: process
    file file_pointer 			: text;
    variable line_content_8 		: string(1 to 8);
	variable line_content_24 	: string(1 to 24);
	variable line_num 			: line;
    variable j 					: integer := 0;
	variable w 					: integer := 0;
	--variable address 			: std_logic_vector (23 downto 0) := (others=>'0');
	
begin
	--if rising_edge(rd_en) then
	valid <= '0';
	data_out  <= (others=>'0');
	wait until rising_edge(rd_en);
		
		-- sample the address
		address <= rd_addr;
		
		-- wait for 20 clocks
		for w in 1 to 20 loop
			wait for 10 ns;
		end loop;  
		
		file_open(file_pointer,memory_file,READ_MODE);   
		-- print("file open");
		while not endfile(file_pointer) loop --till the end of file is reached continue.
			readline (file_pointer,line_num);  --Read the whole line from the file
			READ (line_num,line_content_8);
			if (line_content_8="address=") then
				READ (line_num,line_content_24);
				if ( line_content_24=str(address) ) then
					-- print("address was found "& line_content_24);
					-- read 32 pixels
					for j in 1 to 32 loop       
						readline (file_pointer,line_num);  --Read the whole line from the file
						READ (line_num,line_content_8);
						data_out <= to_std_logic_vector(line_content_8);
						valid <= '1';
						wait for 10 ns;
					end loop;
					valid <= '0';
					data_out  <= (others=>'0');
				end if;
			end if;
		end loop;
		
		file_close(file_pointer);  --after reading all the lines close the file. 
		
	--end if;
end process read_mem_proc;


-- clk_proc:
-- clk	<=	not clk after 5 ns;

-- rst_proc:
-- reset_n	<=	'0', '1' after 20 ns;

-- -- the tests
-- assign_proc: process
-- begin
  
  -- rd_en	<=	'0';
  -- rd_addr <=  "000000000000000000000000";
  -- wait for 40 ns;
  -- rd_en	<=	'1';
  -- wait for 10 ns;
  -- rd_en	<=	'0';
  -- rd_addr <=  "000000000000000000000000";
  -- wait for 550 ns;
  -- rd_addr <=  "000000000000001001110000";
  -- rd_en	<=	'1';
  -- wait for 10 ns;
  -- rd_addr <=  "000000000000000000000000";
  -- rd_en	<=	'0';
  -- -- wait for 550 ns;
  -- -- rd_addr <=  "000000000000001100100000";
  -- -- rd_en	<=	'1';
  -- -- wait for 10 ns;
  -- -- rd_addr <=  "000000000000000000000000";
  -- -- rd_en	<=	'0';
  -- -- wait for 550 ns;

  -- wait;
  
-- end process assign_proc;


end architecture sim_sdram_symbol_model;

------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-------------------- initial version of the sdram symbol model ---------------------------
------------------------------------------------------------------------------------------
-- the symbols are saved in the files: symbol_black.txt and symbol_1.txt
-- each symbol cannot appear more than once on the display
------------------------------------------------------------------------------------------

-- entity sdram_symbol_model is
    -- generic(
        -- black_symbol_file	: 	string :="symbol_black.txt";
        -- symbol_file_1		: 	string :="symbol_1.txt"
    -- );
    -- port(
        -- clk        			: 	in  std_logic;
        -- reset_n      		: 	in  std_logic;
        -- rd_addr    			: 	in  std_logic_vector (23 downto 0);
        -- rd_en      			: 	in  std_logic;
        -- data_out   			: 	out std_logic_vector(7 downto 0);
        -- valid      			: 	out std_logic
    -- );
-- end entity sdram_symbol_model;

-- architecture sim_sdram_symbol_model of sdram_symbol_model is
    
    -- file stimulus_black   : TEXT open read_mode is black_symbol_file;
    -- file stimulus_1       : TEXT open read_mode is symbol_file_1;
	
    -- signal count_en       : std_logic := '0';
    -- signal counter        : integer := 0;
    -- signal read_data      : std_logic;
    -- signal address        : std_logic_vector (23 downto 0);
    -- signal pixel_counter  : integer := 0; -- when reading from file, read only 32 pixels at once

            
-- begin

-- -- implementing the read from the text files  
-- receive_data_proc: process(clk, reset_n)

    -- variable l: line;
    -- --variable s: string(y'range);
    -- variable s: string(1 to 8);

-- begin

    -- if (reset_n='0') then
      -- data_out  <= (others=>'0');
      -- valid     <= '0';
      -- count_en  <= '0';
      -- counter   <= 0;
      -- read_data <= '0';
      -- address   <= (others=>'0');
      -- pixel_counter <= 0;
    -- elsif rising_edge(clk) then
  
		-- --wait for reset_n to complete 
		-- --wait until reset_n='1';

		-- valid <= '0';
		  
		-- if ( (rd_en='1') and (count_en='0') and (read_data='0') ) then
			-- count_en <= '1';
			-- address <= rd_addr;
		-- end if;
		  
		-- if (counter=19) then
			-- count_en <= '0';
			-- counter <= 0;
			-- read_data <= '1';
		-- elsif (count_en='1') then
			-- counter <= counter + 1;
		-- end if;
       
		-- if (read_data='1') then
         
			-- if ( conv_integer(address(21 downto 8)) = 0 or conv_integer(address(21 downto 8)) = 1 ) then
			   
				-- --if ( (not endfile(stimulus_black)) and (pixel_counter < 32) )  then
				-- if (pixel_counter < 32) then
					  -- --readline(stimulus_black, l);
					  -- --read(l, s);
					  -- --data_out <= to_std_logic_vector(s);
					  -- data_out  <= (others=>'0');
					  -- valid <= '1';
					  -- pixel_counter <= pixel_counter + 1;
				-- else
					  -- valid <= '0';
					  -- data_out  <= (others=>'0');
					  -- read_data <= '0'; -- finished reading
					  -- address   <= (others=>'0');
					  -- --print("I@FILE_READ: reached end of "& black_symbol_file);
					  -- pixel_counter <= 0;
				-- end if;
				
			-- elsif ( conv_integer(address(21 downto 8)) = 2 or conv_integer(address(21 downto 8)) = 3 ) then
			   
				-- if ( (not endfile(stimulus_1)) and (pixel_counter < 32) ) then
					  -- readline(stimulus_1, l);
					  -- read(l, s);
					  -- data_out <= to_std_logic_vector(s);
					  -- valid <= '1';
					  -- pixel_counter <= pixel_counter + 1;
				-- else
					  -- valid <= '0';
					  -- data_out  <= (others=>'0');
					  -- read_data <= '0'; -- finished reading
					  -- address   <= (others=>'0');
					  -- --print("I@FILE_READ: reached end of "& symbol_file_1);
					  -- pixel_counter <= 0;
				-- end if;
			
			-- else
				  -- valid <= '0';
				  -- data_out  <= (others=>'0');
				  -- read_data <= '0'; -- finished reading
				  -- address   <= (others=>'0');
				  -- pixel_counter <= 0;
				  -- print("no text file for this address");
			-- end if;
      
		-- else
			-- valid <= '0';
			-- data_out  <= (others=>'0');
			-- --read_data <= '0'; -- finished reading
			-- --address   <= (others=>'0');
			-- --print("I@FILE_READ: reached end of "& black_symbol_file);
			-- --pixel_counter <= 0;
		
		-- end if;
    
	-- end if;

-- end process receive_data_proc;

-- end architecture sim_sdram_symbol_model;
        
            

