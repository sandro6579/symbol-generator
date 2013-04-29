-----------------------------------------------------------------------------------------------
-- Model Name 	:	LED - client
-- File Name	:	led.vhd
-- Generated	:	09.06.2011
-- Author		:	Dor Obstbaum and Kami Elbaz
-- Project		:	FPGA setting usiing FLASH project
------------------------------------------------------------------------------------------------
-- Description: 
-- The LED block is one of the system's clients.
-- It's output 'led_activate' is directed to a led.
-- The led can be turned on or off, or at flickering mode.
-- The block is implemented using two processes and a timer component.
-- The timer component generates a signal (timer_tick) every 'timer_freq_g' cycles by counting system clock signal.
-- The frequency_proc process calculates the number of ticks needed to change the led state and generates the signal reset_ticks_counter_sig when the freq input changes. 
-- The control_proc process recieves the inputs and timer_tick signal and determines the led state according to it.
-- The frequency in the input freq is actualy half the frequency in which the led is operated because every 'freq' number of ticks the led changes polarity.
------------------------------------------------------------------------------------------------
-- Revision:
--			Number 		Date	       	Name       			 	Description
--			1.0		   09.06.2011  	Dor Obstbaum	 		Creation
--    1.1		   11.06.2011  	Dor Obstbaum	 		seperating the timer unit 
------------------------------------------------------------------------------------------------
--	Todo:
--							
------------------------------------------------------------------------------------------------
library ieee ;
use ieee.std_logic_1164.all ;
use ieee.std_logic_unsigned.all;

entity led is
   generic (
     --led control generics:
     reset_activity_polarity_g  : std_logic :='1';      -- defines reset active polarity: '0' active low, '1' active high
     active_state_polarity_g    : std_logic :='1';      -- defines the active state of the led: '0' active low, '1' active high
     block_enable_polarity_g    : std_logic :='1';      -- defines the active block enable polarity: '0' active low, '1' active high
     freq_enable_polarity_g     : std_logic :='1';      -- defines freq_en input active state: '0' active low, '1' active high   
     freq_width_g               : natural   :=8;      --width of the frequency vector
     --timer generics
     timer_freq_g               : positive  :=10;    -- timer_tick will raise for 1 sys_clk period every timer_freq_g. units: [Hz]
     clk_freq_g                 : positive  :=10000; -- the clock input to the block. this is the clock used in the system containing the timer unit. units: [Hz]
     timer_en_polarity_g        : std_logic :='1'     -- defines the polarity which the timer enable (timer_en) is active on: '0' active low, '1' active high   
           );
   port
   	   (
     sys_clk       : in std_logic; --system clock
     sys_reset     : in std_logic; --system reset
     enable        : in std_logic; --determines if the led is enables
     freq_en       : in std_logic; --enables led flickering
     freq          : in std_logic_vector (freq_width_g - 1 downto 0); --led flickering frequency recieved from registers
     led_activate  : out std_logic --this signals activates the led: '1' led is turned on, '0' led is turned off 
   	   );
end entity led;

architecture arc_led of led is
------------------  	Types		-----------------

------------------ Components ---------------
component timer
   generic (
     reset_activity_polarity_g  : std_logic :='1';      -- defines reset active polarity: '0' active low, '1' active high
     timer_freq_g               : positive  :=100000;    -- timer_tick will raise for 1 sys_clk period every timer_freq_g.  
     clk_freq_g                 : positive  :=100000000; -- the clock input to the block. this is the clock used in the system containing the timer unit. units: [Hz]
     timer_en_polarity_g        : std_logic :='1'     -- defines the polarity which the timer enable (timer_en) is active on: '0' active low, '1' active high   
           );
   port
   	   (
     sys_clk       : in std_logic; --system clock
     sys_reset     : in std_logic; --system reset
     timer_en      : in std_logic; --determines if the timer is enabled
     timer_tick    : out std_logic --ticks every [tick_cycle_c] cycles    
   	   );
	end component timer;
------------------  	Constants	-----------------
constant tick_cycle_c       : natural := clk_freq_g/timer_freq_g; -- in our system the cresult is 10000 
constant freq_int_max_range_c : natural := 2**freq_width_g - 1;
------------------  SIGNALS --------------------
signal timer_en_sig            : std_logic;  --enables the timer to count
signal timer_tick_sig          : std_logic;  --this signal recieves '1' every (tick_cycle_c) cycles, otherwise it is '0'
signal freq_int                : natural range 0 to freq_int_max_range_c;         -- this signal is used to calculate the flickering frequency
signal freq_int_sample         : natural range 0 to freq_int_max_range_c;         -- this signal samples freq_int
signal number_of_ticks         : natural range 1 to freq_int_max_range_c;  -- number of ticks needed to switch light's position
signal tick_counter            : natural range 0 to freq_int_max_range_c;  -- the tick is counted from 0 to number of ticks
signal led_sig                 : std_logic;   -- this signal determines the leds status
signal reset_ticks_counter_sig : std_logic; --ticks counter is reseted whenever frequency is changed 
------------------	Processes	----------------
---------------------------------------------

begin 
-------------------Instantiations--------------------  
  led_timer_inst : timer 
  generic map
    (
    reset_activity_polarity_g  => reset_activity_polarity_g,
    timer_freq_g               => timer_freq_g,
    clk_freq_g                 => clk_freq_g,     
    timer_en_polarity_g        => timer_en_polarity_g
    )
  port map 
    (
     sys_clk     => sys_clk,
     sys_reset   => sys_reset,
     timer_en    => timer_en_sig,
     timer_tick  => timer_tick_sig    
    );
----------------------------------------------------
-------------------Signal placement-----------------
freq_int      <= conv_integer(freq); 
led_activate  <= led_sig;
----------------------------------------------------
-------------------Processes------------------------

frequency_proc : process (sys_reset, sys_clk) 
  begin
    if sys_reset = reset_activity_polarity_g then
                  freq_int_sample <= 1 ;
                  reset_ticks_counter_sig <= '0' ;
                  number_of_ticks <= 1 ;   
      elsif rising_edge(sys_clk) then 
      freq_int_sample <= freq_int; --this part of the process is for reseting the ticks counter when frequency is changed. 
      if (freq_int_sample /= freq_int) then
         reset_ticks_counter_sig <= '1';
      else
        reset_ticks_counter_sig <= '0';
      end if;    
      if freq_int = 0 then
       number_of_ticks <= 1;  --this part of the process updates the number of ticks needed for a switch in the led's state, depending on the frequency input
      else
       number_of_ticks <= freq_int;
      end if;
    end if;
end process frequency_proc;

control_proc : process (sys_clk, sys_reset)
  begin
    if sys_reset = reset_activity_polarity_g then -- block reset
      led_sig <= not(active_state_polarity_g);
      timer_en_sig <= not(timer_en_polarity_g);
      tick_counter <= 0;
    elsif rising_edge(sys_clk) then   
      if enable =  not(block_enable_polarity_g) then  --led lighting is not enabled
        led_sig <= not(active_state_polarity_g);
        timer_en_sig <= not(timer_en_polarity_g); 
        tick_counter <= 0;        
      else                                            -- led lighting is enabled    
        if freq_en = not(freq_enable_polarity_g)  then   -- led should be lighted, no flickering
          timer_en_sig <= not(timer_en_polarity_g);
          led_sig <= active_state_polarity_g;
          tick_counter <= 0;
        else                                          -- led should be lighted and flickering
          timer_en_sig <= timer_en_polarity_g;  
            if reset_ticks_counter_sig = '1'  then --tick counter is restarted when frequency is changed
              tick_counter <= 0;
            elsif timer_tick_sig ='1'then
              if tick_counter = number_of_ticks then
               tick_counter <=0;
               led_sig <= not(led_sig);    --led's status is switched here
              else
               tick_counter <= tick_counter +1;  
              end if;
            else
              tick_counter <= tick_counter; 
            end if;                
        end if;
      end if;
    end if;
end process control_proc;	      
	      	
end architecture arc_led;