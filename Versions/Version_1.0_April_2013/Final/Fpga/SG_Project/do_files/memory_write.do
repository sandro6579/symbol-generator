onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider mem_ctrl_wr
add wave -noupdate -divider wbm
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_inst/wr_cnt_val
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_inst/wr_cnt_en
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_inst/wr_cnt
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_inst/sum_wr_cnt
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_inst/wbm_adr_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_inst/wbm_dat_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_inst/wbm_we_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_inst/wbm_cyc_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_inst/wbm_ack_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_inst/type_reg
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_inst/wbm_cyc_internal
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_inst/wbm_stb_internal
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_inst/cur_wr_addr
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_inst/wr_cnt
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_inst/wr_cnt_to_rd
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_inst/sum_wr_cnt
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_inst/inc_sum_wr_cnt
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_inst/wbm_cur_st
add wave -noupdate -divider wbs
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_inst/wbs_adr_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_inst/wbs_tga_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_inst/wbs_dat_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_inst/wbs_cyc_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_inst/wbs_stb_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_inst/wbs_stall_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_inst/wbs_ack_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_inst/wbs_err_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_inst/ram_addr_in
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_inst/ram_data_in
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_inst/ram_din_valid
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_inst/type_reg
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_inst/wr_addr_reg
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_inst/wbm_busy
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_inst/type_reg_wbm
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_inst/wr_addr_reg_wbm
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_inst/ram_ready
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_inst/ram_num_words
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_inst/ram_ready_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_inst/ram_ready_sr
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_inst/done_cnt
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_inst/ram_expect_adr
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_inst/ram_words_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_inst/wbs_cur_st
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {34648691 ns} 0}
configure wave -namecolwidth 510
configure wave -valuecolwidth 140
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
WaveRestoreZoom {546037 ns} {546323 ns}
