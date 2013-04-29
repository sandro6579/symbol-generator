onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider UART
add wave -noupdate -radix unsigned -subitemconfig {/mds_top_tb/mds_top_inst/rx_path_inst/mp_dec1/addr_reg(15) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/rx_path_inst/mp_dec1/addr_reg(14) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/rx_path_inst/mp_dec1/addr_reg(13) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/rx_path_inst/mp_dec1/addr_reg(12) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/rx_path_inst/mp_dec1/addr_reg(11) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/rx_path_inst/mp_dec1/addr_reg(10) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/rx_path_inst/mp_dec1/addr_reg(9) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/rx_path_inst/mp_dec1/addr_reg(8) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/rx_path_inst/mp_dec1/addr_reg(7) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/rx_path_inst/mp_dec1/addr_reg(6) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/rx_path_inst/mp_dec1/addr_reg(5) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/rx_path_inst/mp_dec1/addr_reg(4) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/rx_path_inst/mp_dec1/addr_reg(3) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/rx_path_inst/mp_dec1/addr_reg(2) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/rx_path_inst/mp_dec1/addr_reg(1) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/rx_path_inst/mp_dec1/addr_reg(0) {-height 15 -radix hexadecimal}} /mds_top_tb/mds_top_inst/rx_path_inst/mp_dec1/addr_reg
add wave -noupdate /mds_top_tb/mds_top_inst/rx_path_inst/len_reg
add wave -noupdate /mds_top_tb/mds_top_inst/rx_path_inst/data_rx2dec
add wave -noupdate /mds_top_tb/mds_top_inst/rx_path_inst/valid
add wave -noupdate /mds_top_tb/mds_top_inst/rx_path_inst/mp_done
add wave -noupdate -divider RX_WBM
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
add wave -noupdate -divider WBS_REG
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/clk_100
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/rst_100
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
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/wbs_reg_cyc
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/wbs_reg_din_ack
add wave -noupdate -radix hexadecimal /mds_top_tb/mds_top_inst/disp_ctrl_inst/wbs_reg_dout
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/wbs_reg_dout_valid
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/reg_addr
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/reg_din
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/reg_wr_en
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/reg_rd_en
add wave -noupdate -divider TYPE_REG
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/gen_reg_type_inst/clk
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/gen_reg_type_inst/reset
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/gen_reg_type_inst/addr
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/gen_reg_type_inst/din
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/gen_reg_type_inst/wr_en
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/gen_reg_type_inst/clear
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/gen_reg_type_inst/din_ack
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/gen_reg_type_inst/rd_en
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/gen_reg_type_inst/dout
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/gen_reg_type_inst/dout_valid
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/gen_reg_type_inst/reg_data
add wave -noupdate -divider OPCODE_UNITE_REG
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/gen_reg_opcode_unite_inst/reset
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/gen_reg_opcode_unite_inst/clk
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/gen_reg_opcode_unite_inst/din
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/gen_reg_opcode_unite_inst/dout
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/gen_reg_opcode_unite_inst/dout_valid
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/gen_reg_opcode_unite_inst/rd_en
add wave -noupdate -color Salmon -itemcolor Salmon -radix decimal /mds_top_tb/mds_top_inst/disp_ctrl_inst/gen_reg_opcode_unite_inst/reg_data
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/gen_reg_opcode_unite_inst/clear
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/gen_reg_opcode_unite_inst/din_ack
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/gen_reg_opcode_unite_inst/wr_en
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/gen_reg_opcode_unite_inst/addr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {19745 ns} 0}
configure wave -namecolwidth 459
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
WaveRestoreZoom {19575 ns} {19851 ns}
