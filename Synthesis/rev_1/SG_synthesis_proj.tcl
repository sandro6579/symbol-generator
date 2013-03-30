# Run with quartus_sh -t <x_cons.tcl>

# Global assignments 
set_global_assignment -name TOP_LEVEL_ENTITY "|top_synthesis"
set_global_assignment -name ROUTING_BACK_ANNOTATION_MODE NORMAL
set_global_assignment -name FAMILY "CYCLONE II"
set_global_assignment -name DEVICE "EP2C35F672C6"
set_global_assignment -section_id top_synthesis -name EDA_DESIGN_ENTRY_SYNTHESIS_TOOL "SYNPLIFY"
set_global_assignment -section_id eda_design_synthesis -name EDA_USE_LMF synplcty.lmf
set_global_assignment -name TAO_FILE "myresults.tao"
set_global_assignment -name SOURCES_PER_DESTINATION_INCLUDE_COUNT "1000" 
set_global_assignment -name ROUTER_REGISTER_DUPLICATION ON
set_global_assignment -name REMOVE_REDUNDANT_LOGIC_CELLS "OFF"
set_global_assignment -name REMOVE_DUPLICATE_REGISTERS "OFF"
set_global_assignment -name REMOVE_DUPLICATE_LOGIC "OFF"
# set_global_assignment -name FITTER_EFFORT "STANDARD FIT"
#set_global_assignment -name EDA_RESYNTHESIS_TOOL "AMPLIFY"
set_global_assignment -name ENABLE_CLOCK_LATENCY "ON"

# Clock assignments 

create_base_clock fpga_clk_setting -fmax 160.000mhz -duty_cycle 50.00 -target fpga_clk 


# False path constraints 

# Multicycle constraints 

# Path delay constraints 
if {[file exists ___quartus_options.tcl]} {
	source ___quartus_options.tcl
}


# Incremental Compilation
    # this will synchronize any existing partitions declared in Synpilfy
    # with partitions existing in Quartus. If partitions exist,
    # incremental compilation will be enabled
    variable compile_point_list
    set compile_point_list [list]
    source "C:/Synopsys/fpga_D201003SP1/lib/altera/qic.tcl"
