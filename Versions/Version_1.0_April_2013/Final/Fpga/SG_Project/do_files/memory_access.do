onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider mem_mng_wr
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_adr_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_tga_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_dat_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_cyc_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_stb_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_stall_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_ack_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_err_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wr_cnt_val
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wr_cnt_en
add wave -noupdate -divider mem_mng_rd
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbs_adr_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbs_tga_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbs_cyc_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbs_tgc_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbs_stb_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbs_dat_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbs_stall_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbs_ack_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbs_err_o
add wave -noupdate -divider mem_mng
add wave -noupdate -color Salmon -itemcolor Salmon /mds_top_tb/mds_top_inst/mem_mng_inst/type_reg_dout
add wave -noupdate -color Salmon -itemcolor Salmon /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_dout
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wr_wbs_reg_cyc
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/rd_wbs_reg_cyc
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wbs_reg_cyc
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wr_wbs_reg_stb
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/rd_wbs_reg_stb
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wbs_reg_stb
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wbs_adr
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/rd_wbs_we_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wbs_we
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/rd_wbs_dat_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wbs_dat_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/rd_wbs_cmp_dat_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wbs_dat_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/rd_wbs_cmp_stall_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wbs_reg_stall_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/rd_wbs_cmp_ack_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wbs_reg_ack_o
add wave -noupdate -divider sdram
add wave -noupdate /mds_top_tb/sdram_model_inst/dq
add wave -noupdate /mds_top_tb/sdram_model_inst/addr
add wave -noupdate /mds_top_tb/sdram_model_inst/we
add wave -noupdate /mds_top_tb/sdram_model_inst/bank_index
add wave -noupdate /mds_top_tb/sdram_model_inst/row_index
add wave -noupdate /mds_top_tb/sdram_model_inst/col_index
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {29113465 ns} 0}
configure wave -namecolwidth 404
configure wave -valuecolwidth 118
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
WaveRestoreZoom {0 ns} {54600 us}
