source "C:/Synopsys/fpga_D201003SP1/lib/altera/quartus_cons.tcl"
syn_create_and_open_prj SG_synthesis_proj
source $::quartus(binpath)/prj_asd_import.tcl
syn_create_and_open_csf SG_synthesis_proj
syn_handle_cons SG_synthesis_proj
