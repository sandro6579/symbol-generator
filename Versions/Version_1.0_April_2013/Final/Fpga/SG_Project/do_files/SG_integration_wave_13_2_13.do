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
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sdram_rd_en
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sdram_data
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sdram_data_valid
add wave -noupdate -color Salmon -itemcolor Salmon /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/manager_inst/mng_en
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/manager_inst/current_sm
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/manager_inst/req_in_trg_dev
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/manager_inst/row_count
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/manager_inst/ram_data_out
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/manager_inst/inside_row
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/fifo_a_full
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/fifo_a_empty
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/fifo_a_rd_en
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/fifo_a_wr_en
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/fifo_a_data_in
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/fifo_a_dout
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/fifo_a_dout_valid
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/fifo_b_full
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/fifo_b_empty
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/fifo_b_rd_en
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/fifo_b_wr_en
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/fifo_b_data_in
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/fifo_b_dout
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/fifo_b_dout_valid
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/mux_dout
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/mux_dout_valid
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/mux_flush
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
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/manager_inst/req_cnt
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/vesa_req_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {19689198 ns} 0}
configure wave -namecolwidth 536
configure wave -valuecolwidth 209
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
WaveRestoreZoom {19616057 ns} {19777383 ns}
