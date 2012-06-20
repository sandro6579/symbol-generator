------------------------------------------------------------------------------------------------
-- Model Name 	:	mux2
-- File Name	:	mux2.vhd
-- Generated	:	11.6.2012
-- Author		:	Olga Liberman and Yoav Shvartz
-- Project		:	Symbol Generator Project
------------------------------------------------------------------------------------------------
-- Description:
--
--
------------------------------------------------------------------------------------------------
-- Revision:
--			Number		 Date		          Name								  Description			
--			1.00		   12.6.2012	     Olga Liberman and Yoav Shvartz		  Creation
--			2.00		   13.6.2012	     Olga Liberman and Yoav Shvartz		  added the inputs: fifo_a_rd_en and fifo_b_rd_en
--
------------------------------------------------------------------------------------------------
--	Todo:
--	(1) maybe need to delay in 1-2 clocks the mux_dout (sample the fifo_x_rd_en signal), because of the fifo delay.
--	(2) 
--	(3)
------------------------------------------------------------------------------------------------


library ieee;
use IEEE.std_logic_1164.all;

entity mux2 is

  port (
	clk 		    : 		in std_logic;                       -- the main clock to which all the internal logic of the Symbol Generator block is synchronized.
	reset_n 	  	: 		in std_logic;                       -- asynchronous reset
	mux_din_a 		: 		in std_logic_vector(7 downto 0);    -- data from fifo_a
	mux_din_b 		: 		in std_logic_vector(7 downto 0);    -- data from fifo_b
	--mux_sel 	  	: 		in std_logic;                       -- selection of enteries: mux_sel='0' -> mux_din_a , mux_sel='1' -> mux_din_b
	fifo_a_rd_en 	: 		in std_logic; 						-- read enable to fifo a
	fifo_b_rd_en 	: 		in std_logic; 						-- read enable to fifo b
	mux_dout	  	: 		out std_logic_vector(7 downto 0)    -- data out to DC FIFO
  );
  
end entity mux2;

architecture mux2_rtl of mux2 is

	--signal mux_din_a_i : std_logic_vector(7 downto 0);
	--signal mux_din_b_i : std_logic_vector(7 downto 0);

begin
  --mux_din_a_i <= mux_din_a;
  --mux_din_b_i <= mux_din_b;
  
	mux_proc: process(clk, reset_n)
    begin
		if (reset_n='0') then
			--mux_din_a_i <= (others=>'0');
			--mux_din_b_i <= (others=>'0');
			mux_dout <= (others=>'0');
		elsif rising_edge(clk) then
			
			-- if (mux_sel = '0') then
				-- mux_dout <= mux_din_a_i;
			-- elsif (mux_sel = '1') then
				-- mux_dout <= mux_din_b_i;
			-- end if;
			
			if ( fifo_a_rd_en = '1' ) then
				mux_dout <= mux_din_a;
			elsif ( fifo_b_rd_en = '1' ) then
				mux_dout <= mux_din_b;
			else
				mux_dout <= (others=>'0');
			end if;
			
		end if;
		
	end process mux_proc;  
  
end architecture mux2_rtl;
  