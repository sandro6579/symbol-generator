onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider rx_path
add wave -noupdate /mds_top_tb/mds_top_inst/rx_path_inst/wbm_dat_i
add wave -noupdate /mds_top_tb/mds_top_inst/rx_path_inst/wbm_adr_o
add wave -noupdate /mds_top_tb/mds_top_inst/rx_path_inst/wbm_cyc_o
add wave -noupdate /mds_top_tb/mds_top_inst/rx_path_inst/wbm_tgc_o
add wave -noupdate /mds_top_tb/mds_top_inst/rx_path_inst/wbm_dat_o
add wave -noupdate /mds_top_tb/mds_top_inst/rx_path_inst/wbm_we_o
add wave -noupdate -divider Memory_wr
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wr_wbs_adr_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wr_wbs_dat_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wr_wbs_cyc_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wr_wbs_we_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wr_wbs_tgc_i
add wave -noupdate -divider mem_ctrl_wr
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/clk_sdram
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/clk_sys
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/rst_sdram
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/rst_sys
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_adr_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_tga_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_dat_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_cyc_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_stb_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_stall_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_ack_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbs_err_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_adr_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_dat_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_we_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_tga_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_cyc_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_stb_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_stall_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_err_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_ack_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/arbiter_gnt
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/arbiter_req
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/bank_val
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/bank_switch
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/type_reg
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wr_addr_reg
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wr_cnt_val
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wr_cnt_en
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/dbg_wr_bank
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/ram_addr_in
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/ram_data_in
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/ram_din_valid
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/ram_addr_out
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/ram_data_out
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/ram_data_out_swap
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/ram_rst
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_busy
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_busy_d1
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_busy_d2
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/ram_ready
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/ram_ready_d1
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/ram_ready_d2
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/ram_ready_d3
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/ram_ready_d4
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/ram_ready_flt
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/ram_num_words
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/ram_num_words_d1
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/ram_num_words_d2
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/type_reg_wbm
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/type_reg_wbm_d1
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/type_reg_wbm_d2
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wr_addr_reg_wbm
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wr_addr_reg_wbm_d1
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wr_addr_reg_wbm_d2
add wave -noupdate -divider sdram
add wave -noupdate /mds_top_tb/sdram_model_inst/dq
add wave -noupdate /mds_top_tb/sdram_model_inst/addr
add wave -noupdate /mds_top_tb/sdram_model_inst/we
add wave -noupdate /mds_top_tb/sdram_model_inst/bank_index
add wave -noupdate /mds_top_tb/sdram_model_inst/row_index
add wave -noupdate /mds_top_tb/sdram_model_inst/col_index
add wave -noupdate /mds_top_tb/sdram_model_inst/current_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1961650 ns} 0}
configure wave -namecolwidth 444
configure wave -valuecolwidth 167
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
WaveRestoreZoom {1958766 ns} {1963794 ns}
