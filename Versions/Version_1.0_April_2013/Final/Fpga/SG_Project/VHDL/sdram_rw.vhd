------------------------------------------------------------------------------------------------
-- Model Name 	:	IS42S16400 SDRAM Read/Write test
-- File Name	:	sdram_rw.vhd
-- Generated	:	September 2010
-- Author		:	Beeri Schreiber and Alon Yavich
-- Project		:	RunLen Project
------------------------------------------------------------------------------------------------
-- Description: This model uses the IS42S16400 SDRAM Controller to perform test for the
--				SDRAM:
--				(1) Writing data to all of the addresses
--				(2) Reading data from all the above addresses, and
--					compare the expected value to the actual read value.
--
--				A green led will turn on if test had passed.
--				A red led will turn on if the test had failed.
--
-- Clock:	Use 133.333MHz clock for this model (7.5 ns period time) - Same as SDRAM Clock
--
-- Reset:	Hold Reset for at least 1 clock
------------------------------------------------------------------------------------------------
-- Changes:
--			Number		Date		Name				Description
--			(1)			09/2010		Beeri Schreiber		Creation
------------------------------------------------------------------------------------------------
--	Todo:
--			(1) Read burst addr incrementation
------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity sdram_rw is
  generic(
		reset_polarity :	std_logic := '0' --When rst = reset_polarity, system at RESET
	);
  port(
		--Clock and Reset
		clk_i		:	in std_logic;	--WISHBONE Clock
		rst			:	in std_logic;	--RESET
		
		--Signals to SDRAM controller
		wbm_adr_o	:	out std_logic_vector (21 downto 0);	--Address to read from / write to
		wbm_dat_i	:	in std_logic_vector (15 downto 0);	--Data out (to SDRAM)
		wbm_dat_o	:	out std_logic_vector (15 downto 0);	--Data in (from SDRAM)
		wbm_we_i	:	out std_logic;	--'1' - Write, '0' - Read
		wbm_tga_o	:	out std_logic_vector (7 downto 0);	--Read/write burst length-1 (0 represents 1 word, FF represents 256 words)
		wbm_cyc_o	:	out std_logic;	--Transmit command to SDRAM controller
		wbm_stb_o	:	out std_logic;	--Transmit command to SDRAM controller
		wbm_stall_i	:	in std_logic;	--When '1', write data to SDRAM
		wbm_ack_i	:	in std_logic;	--when '1', data is ready to be read from SDRAM
		
		--Debug and test signals
		green_led	:	out std_logic;	--Test passed
		red_led		:	out std_logic;	--Test fail
		writing		:	out std_logic;	--'1' when writing, '0' when reading
		mem_val_o	:	out std_logic_vector (15 downto 0); --Memory value written / compared to SDRAM
		sdram_val_o	:	out std_logic_vector (15 downto 0) --Read value from SDRAM
   );
end entity sdram_rw;

architecture arc_sdram_rw of sdram_rw is

  --------------------------------  	Types 	--------------------------------------
  type states is ( START_WRITE_ST,		-- Initilize Writing
				   WRITE_ST,			-- Command SDRAM controller to write value (32bit)
				   WAIT_WRITE_ACK_ST,	-- Wait for SDRAM controller to acknowledge
				   WRITE_BURST,			-- Burst write
				   WRITE_WAIT_ST,		-- Increment written data value, and repeat write process 
				   START_READ_ST,		-- Wait for Write to Read delay
				   READ_ST,				-- Command SDRAM controller to read data
				   WAIT_READ_ACK_ST,	-- Wait for SDRAM controller to acknowledge
				   READ_BURST,			-- Burst Read, Compare between read and expected data
				   READ_WAIT_ST,		-- End burst, Compare between read and expected data, repeat reading
				   DONE_ST				-- Test done
				   );

  --------------------------------  Constants -----------------------------------------
  
  constant MAX_ADDR 			: natural := 512; --2097150; 	-- 2,097,152 (-2 = 2,097,150, since we begin from 0) is the full 8 Mbytes of memory (2097152*32Bit*4Banks=67,108,864Bits)
  constant W_TO_R_WAIT_TIME   	: natural := 10; --9999999;	-- number of clock cycles between WRITE to READ
  constant BURST_LENGTH			: natural range 1 to 256 := 128; --Maximum is 256
  constant ADDR_INC				: natural := 128;	--Increment address by this value in each burst
  constant INITIAL_MEM_VALUE  	: std_logic_vector (15 downto 0) := conv_std_logic_vector(0, 16);--Initial memory value
  --------------------------------  Signals -----------------------------------------

  --Commands, Data and Address to SDRAM Controller
  signal addr_r			: std_logic_vector (21 downto 0);
  signal dat_o_r 		: std_logic_vector (15 downto 0);
  signal we_i_r			: std_logic;
  signal cmd_r			: std_logic;
  signal cmd_r_delay	: std_logic;

  --Test Signals
  signal red_led_r		: std_logic;	--Test fail
  signal green_led_r	: std_logic;	--Test passed
  
  --Internal Signals
  signal cnt 			: integer; --Counter for Write to Read delay
  signal blen			: natural range 0 to 256; --Counter for burst length
  signal mem_value 		: std_logic_vector (15 downto 0); --Written value / expected value
  signal state 			: states;
 
  
  
  begin
  --Connect internal signals to ports
  wbm_dat_o <= dat_o_r;
  wbm_adr_o <= addr_r;
  wbm_we_i 	<= we_i_r;
  wbm_cyc_o <= cmd_r or cmd_r_delay;
  wbm_stb_o <= '1' when ((cmd_r = '1') and (we_i_r = '1')) 
					else '1' when ((cmd_r = '1') and (blen > 1) and (we_i_r = '0'))
					else '0';
  red_led_proc:
  red_led 	<= red_led_r;

  green_led_proc:
  green_led <= green_led_r;
  mem_val_o	<= mem_value;
  sdram_val_o <= dat_o_r;
  
  main_proc : process (clk_i, rst)
  begin
	if (rst = reset_polarity) then
	  state <= START_WRITE_ST;
	  red_led_r 	<= '0';
	  green_led_r 	<= '0';
	elsif rising_edge(clk_i) then
	  case state is
		when START_WRITE_ST =>	--Initilize writing
			state <= WRITE_ST;
			addr_r <= (others => '0');
			mem_value <= INITIAL_MEM_VALUE;
			writing <= '1';
			dat_o_r <= mem_value;
		
		when WRITE_ST =>	--Write value (16 bits) to SDRAM controller
			cmd_r		<= '1';
			we_i_r 		<= '1';
			state 		<= WAIT_WRITE_ACK_ST;
			blen 		<= BURST_LENGTH; 
			wbm_tga_o 	<= conv_std_logic_vector(BURST_LENGTH-1, 8);

		when WAIT_WRITE_ACK_ST =>	--Present first data
		  if (blen > 0) then		--First data
			dat_o_r <= mem_value;
			mem_value <= mem_value + '1';
			blen <= blen - 1;
		  end if;
  		  state <= WRITE_BURST;
		 
		when WRITE_BURST =>			--Burst write
		  if (wbm_stall_i = '1') then
			dat_o_r	<= dat_o_r;
		  elsif (blen > 0) then		--Keep burst
			dat_o_r <= mem_value;
			mem_value <= mem_value + '1';
			blen <= blen - 1;
		  else						--End of write burst
			state 	<= WRITE_WAIT_ST;
			cmd_r 	<= '0';
			addr_r 	<= addr_r + conv_std_logic_vector(ADDR_INC, 22); --Add 256
		  end if;
		  
		
		when WRITE_WAIT_ST =>	--Increment DATA value. Repeat write
			if (conv_integer(addr_r) < MAX_ADDR) then
				state <= WRITE_ST;
			else
				state 	<= START_READ_ST;
				writing <= '0';
			end if;

		when START_READ_ST =>	--Wait Write to Read interval
		  if (cnt = 0) then 	-- wait for W_TO_R_WAIT_TIME
			state <= READ_ST;
			addr_r <= (others => '0');
			mem_value <= INITIAL_MEM_VALUE;
		  else
			state <= START_READ_ST;
		  end if;
		
		when READ_ST =>	--Transmit read command to controller
			cmd_r <= '1';
			we_i_r <= '0';
			state <= WAIT_READ_ACK_ST;
			blen <= BURST_LENGTH;
			wbm_tga_o <= conv_std_logic_vector(BURST_LENGTH-1, 8);
		
		when WAIT_READ_ACK_ST =>	--Wait until controller has acknowledge - and read SDRAM value
			if (wbm_stall_i = '0') and (wbm_ack_i ='1') and (blen > 0) then
				if (wbm_dat_i /= mem_value) then --Compare between read value and expected value
					red_led_r <= '1';
				end if;
				mem_value	<= mem_value + '1'; --Increment expected value
				blen		<= blen - 1;
  			    addr_r 		<= addr_r + conv_std_logic_vector(ADDR_INC, 22); -- add 256
				state 		<= READ_BURST;
			else
				state 		<= WAIT_READ_ACK_ST;
			end if;

		-- when READ_BURST => --Burst read
		  -- if (blen = 0) then
			-- state <= READ_WAIT_ST;
			-- addr_r <= addr_r + conv_std_logic_vector(ADDR_INC, 22); -- add 256
			-- mem_value <= mem_value + '1'; --Increment expected value
			-- blen <= 2; --CAS Delay is 3. Two more data are available
		  -- elsif (wbm_ack_i ='1') and (blen > 0) then --Keep burst read
			-- if (wbm_dat_i /= mem_value) then --Compare between read value and expected value
				-- red_led_r <= '1';
				-- --state <= DONE_ST; --Test fail - abort Test
			-- end if;
			-- mem_value <= mem_value + '1'; --Increment expected value
			-- blen <= blen - 1;
		  -- end if;
		
		when READ_BURST => --Wait until end of valid data after burst	
			if (wbm_ack_i ='1') and (blen > 0) then --Data is  being read from SDRAM
				if (wbm_dat_i /= mem_value) then --Compare between read value and expected value
					red_led_r <= '1';
					--state <= DONE_ST; --Test fail - abort Test
				end if;
				if (blen = 1) then
					cmd_r  <= '0';
				end if;
				mem_value	<= mem_value + '1'; --Increment expected value
				blen		<= blen - 1;
			elsif (conv_integer(addr_r) < MAX_ADDR) then
			  state  	<= READ_ST;
			  cmd_r  	<= '0';
			else  
			  state <= DONE_ST;
			  cmd_r <= '0';
			end if;

		when DONE_ST =>	--Test done
			state <= DONE_ST;
			if (red_led_r = '0') then
			  green_led_r <= '1';
			end if;
		
		when others =>
		
	  end case;
	end if;
  end process main_proc;


  --Write to Read delay
  cnt_proc : process (clk_i, rst) 
  begin
    if rising_edge(clk_i) then
		if (rst = reset_polarity) then
		  cnt <= 0;
		elsif (state = WRITE_WAIT_ST) then
		  cnt <= W_TO_R_WAIT_TIME;
		else
		  cnt <= cnt - 1;
		end if;
	end if;
  end process cnt_proc;
  
  --cmd_r with delay
  cmd_r_delay_proc : process (clk_i, rst)
  begin
	if (rst = reset_polarity) then
		cmd_r_delay	<= '0';
	elsif rising_edge(clk_i) then
		cmd_r_delay	<= cmd_r;
	end if;
  end process cmd_r_delay_proc;
  
end architecture arc_sdram_rw;
