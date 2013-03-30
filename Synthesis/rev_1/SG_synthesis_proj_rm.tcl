set_global_assignment -name TOP_LEVEL_ENTITY "|top_synthesis" -remove 
set_global_assignment -name FAMILY -remove 
set_global_assignment -name TAO_FILE "myresults.tao" -remove
set_global_assignment -name SOURCES_PER_DESTINATION_INCLUDE_COUNT "1000" -remove 
set_global_assignment -name ROUTER_REGISTER_DUPLICATION ON -remove 
set_global_assignment -name REMOVE_DUPLICATE_LOGIC "OFF" -remove 
set_global_assignment -name REMOVE_DUPLICATE_REGISTERS "OFF" -remove 
set_global_assignment -name REMOVE_REDUNDANT_LOGIC_CELLS "OFF" -remove 
set_global_assignment -name REMOVE_DUPLICATE_REGISTERS "OFF" -remove 
set_global_assignment -name REMOVE_DUPLICATE_LOGIC "OFF" -remove 
#set_global_assignment -name EDA_RESYNTHESIS_TOOL "AMPLIFY" -remove
create_base_clock fpga_clk_setting -fmax 160.000mhz -duty_cycle 50.00 -target fpga_clk -disable
