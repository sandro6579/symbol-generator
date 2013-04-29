onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider uart_tx_gen_model
add wave -noupdate /mds_top_tb/uart_gen_inst/system_clk
add wave -noupdate /mds_top_tb/uart_gen_inst/uart_out
add wave -noupdate -radix hexadecimal /mds_top_tb/uart_gen_inst/value
add wave -noupdate /mds_top_tb/uart_gen_inst/valid
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
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/reg_addr
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/reg_din
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/reg_wr_en
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/reg_rd_en
add wave -noupdate -divider <NULL>
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/type_reg_din_ack
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/type_reg_rd_en
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/type_reg_dout
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/type_reg_dout_valid
add wave -noupdate -divider <NULL>
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/upper_frame_reg_din_ack
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/upper_frame_reg_rd_en
add wave -noupdate -radix binary /mds_top_tb/mds_top_inst/disp_ctrl_inst/upper_frame_rg
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/upper_frame_reg_dout_valid
add wave -noupdate -divider <NULL>
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/lower_frame_reg_din_ack
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/lower_frame_reg_rd_en
add wave -noupdate -radix binary /mds_top_tb/mds_top_inst/disp_ctrl_inst/lower_frame_rg
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/lower_frame_reg_dout_valid
add wave -noupdate -divider <NULL>
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/opcode_unite_reg_rd_en
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/opcode_unite_rg
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/gen_reg_opcode_unite_inst/dout
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/gen_reg_opcode_unite_inst/din
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/gen_reg_opcode_unite_inst/reg_data
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/gen_reg_opcode_unite_inst/addr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3265 ns} 0}
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
WaveRestoreZoom {0 ns} {51142 ns}
