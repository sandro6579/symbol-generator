	-- -- -- implement a wait SDRAM counter, according to the sdram_wait_c constant
	-- -- sdram_wait_proc: process(clk, reset_n)
    -- -- begin
		-- -- if (reset_n='0') then
			-- -- sdram_wait_counter <= 0;
		-- -- elsif rising_edge (clk) then
			-- -- if ( (sdram_rd_en = '1') and (sdram_wait_counter = 0) ) then
				-- -- sdram_wait_counter <= sdram_wait_counter + 1;
			-- -- elsif ( (sdram_wait_counter > 0) and (sdram_wait_counter < sdram_wait_c) ) then
				-- -- sdram_wait_counter <= sdram_wait_counter + 1;
			-- -- else
				-- -- sdram_wait_counter <= 0;
			-- -- end if;
		-- -- end if;
	-- -- end process sdram_wait_proc;
	
	---------------------------------------------------------------------------------------
	-- sdram_wait_proc process
	-- Implementing counter for the valid data that arrives from the SDRAM.
	-- The sdram_ready is high for 1 clock when arrived 32 valid pixels from SDRAM
	-- and now we can continue to the next symbol on the display.
	-- When no error or stalls from the SDRAM, the read takes about 75 clock cycles.
	---------------------------------------------------------------------------------------
	sdram_wait_proc: process(clk, reset_n)
    begin
		if (reset_n='0') then
			sdram_wait_count_en <= '0';
			sdram_wait_counter <= 0;
			sdram_ready <= '0';
		elsif rising_edge (clk) then
			if (sdram_rd_en = '1') then
				sdram_wait_count_en <= '1';
				sdram_wait_counter <= 0;
				sdram_ready <= '0';
			elsif (sdram_wait_count_en = '1') then
				if (sdram_wait_counter = 32) then
					sdram_ready <= '1';
					sdram_wait_count_en <= '0';
					sdram_wait_counter <= 0;
				elsif (sdram_data_valid='1') then
					sdram_wait_counter <= sdram_wait_counter + 1;
				end if;
			elsif (sdram_ready='1') then
				sdram_ready <= '0';
			end if;
		end if;
	end process sdram_wait_proc;