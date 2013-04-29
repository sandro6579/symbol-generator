onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/clk_100
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/rst_100
add wave -noupdate -divider SG_Top
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/opu_data_in
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/opu_data_in_valid
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/op_cnt
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/vsync_int
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/vsync_trigger
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/req_ln_trig
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sdram_addr_rd
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sdram_data
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sdram_data_valid
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sdram_rd_en
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/mux_dout
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/mux_dout_valid
add wave -noupdate -divider DC_FIFO
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/clk_40
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/dc_fifo_aclr
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/dc_fifo_dout
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/dc_fifo_empty
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/dc_rd_req
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/wrusedw
add wave -noupdate -divider VESA
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/r_in
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/g_in
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/b_in
add wave -noupdate -color {Medium Spring Green} -itemcolor {Medium Spring Green} /mds_top_tb/mds_top_inst/disp_ctrl_inst/vsync
add wave -noupdate -color {Medium Spring Green} -itemcolor {Medium Spring Green} /mds_top_tb/mds_top_inst/disp_ctrl_inst/hsync
add wave -noupdate -color {Medium Spring Green} -itemcolor {Medium Spring Green} /mds_top_tb/mds_top_inst/disp_ctrl_inst/blank
add wave -noupdate -color {Blue Violet} -itemcolor {Blue Violet} -radix unsigned /mds_top_tb/mds_top_inst/disp_ctrl_inst/vesa_gen_ctrl_inst/r_out
add wave -noupdate -color {Blue Violet} -itemcolor {Blue Violet} -radix unsigned /mds_top_tb/mds_top_inst/disp_ctrl_inst/vesa_gen_ctrl_inst/g_out
add wave -noupdate -color {Blue Violet} -itemcolor {Blue Violet} -radix unsigned /mds_top_tb/mds_top_inst/disp_ctrl_inst/vesa_gen_ctrl_inst/b_out
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/dc_fifo_full
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/pixels_req
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/req_ln_trig
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/Symbol_Generator_Top_inst/manager_inst/req_cnt
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/vesa_req_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {32819397 ns} 0}
configure wave -namecolwidth 406
configure wave -valuecolwidth 94
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {32812105 ns} {32824545 ns}
