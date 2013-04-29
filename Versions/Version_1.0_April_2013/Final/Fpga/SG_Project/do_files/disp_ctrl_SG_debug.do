onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider uart_tx_gen_model
add wave -noupdate /mds_top_tb/uart_gen_inst/uart_out
add wave -noupdate -radix hexadecimal /mds_top_tb/uart_gen_inst/value
add wave -noupdate /mds_top_tb/uart_gen_inst/valid
add wave -noupdate /mds_top_tb/mds_top_inst/rx_path_inst/wbm_ack_i
add wave -noupdate /mds_top_tb/mds_top_inst/rx_path_inst/wbm_stall_i
add wave -noupdate /mds_top_tb/mds_top_inst/rx_path_inst/wbm_err_i
add wave -noupdate /mds_top_tb/mds_top_inst/rx_path_inst/wbm_dat_i
add wave -noupdate /mds_top_tb/mds_top_inst/rx_path_inst/wbm_adr_o
add wave -noupdate /mds_top_tb/mds_top_inst/rx_path_inst/wbm_cyc_o
add wave -noupdate /mds_top_tb/mds_top_inst/rx_path_inst/wbm_stb_o
add wave -noupdate /mds_top_tb/mds_top_inst/rx_path_inst/wbm_tga_o
add wave -noupdate /mds_top_tb/mds_top_inst/rx_path_inst/wbm_tgc_o
add wave -noupdate /mds_top_tb/mds_top_inst/rx_path_inst/wbm_dat_o
add wave -noupdate /mds_top_tb/mds_top_inst/rx_path_inst/wbm_we_o
add wave -noupdate /mds_top_tb/mds_top_inst/rx_path_inst/wbm_cur_st
add wave -noupdate /mds_top_tb/mds_top_inst/rx_path_inst/datalen
add wave -noupdate /mds_top_tb/mds_top_inst/rx_path_inst/ram_bytes_left
add wave -noupdate /mds_top_tb/mds_top_inst/rx_path_inst/wbm_cyc_internal
add wave -noupdate -divider disp_ctrl_top
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/rst_100
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/clk_100
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/wbs_adr_i
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/wbs_tga_i
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/wbs_dat_i
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/wbs_cyc_i
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/wbs_stb_i
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/wbs_we_i
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/wbs_tgc_i
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/wbs_dat_o
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/wbs_stall_o
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/wbs_ack_o
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/wbs_err_o
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/wbs_reg_din_ack
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/wbs_reg_dout
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/wbs_reg_dout_valid
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/wbs_reg_cyc
add wave -noupdate -radix unsigned /mds_top_tb/mds_top_inst/disp_ctrl_inst/reg_addr
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/reg_din
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/reg_wr_en
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/reg_rd_en
add wave -noupdate -divider <NULL>
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/opcode_unite_rg
add wave -noupdate -divider <NULL>
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {17655 ns} 0}
configure wave -namecolwidth 471
configure wave -valuecolwidth 100
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
WaveRestoreZoom {17531 ns} {17791 ns}
