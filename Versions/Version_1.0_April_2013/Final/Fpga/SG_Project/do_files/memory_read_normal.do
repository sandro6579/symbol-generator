onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider pixel_mng
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/gen_reg_type_inst/reg_data
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/wbm_cyc_o
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/wbm_stb_o
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/wbm_tgc_o
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/wbm_tga_o
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/wbm_adr_o
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/wbm_stall_i
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/wbm_ack_i
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/wbm_dat_i
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/wbm_err_i
add wave -noupdate -radix unsigned /mds_top_tb/mds_top_inst/disp_ctrl_inst/pixel_mng_inst/pixels_req
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/pixel_mng_inst/req_ln_trig
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/pixel_mng_inst/vsync
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/pixel_mng_inst/cur_st
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/pixel_mng_inst/pix_cnt
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/pixel_mng_inst/tot_req_pix
add wave -noupdate -radix unsigned /mds_top_tb/mds_top_inst/disp_ctrl_inst/pixel_mng_inst/pix_req_add
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/pixel_mng_inst/rd_adr
add wave -noupdate -divider mem_mng_read
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wr_cnt_val
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wr_cnt_en
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/rd_wbs_cyc_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/rd_wbs_stb_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/rd_wbs_tgc_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/rd_wbs_tga_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/rd_wbs_adr_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/rd_wbs_stall_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/rd_wbs_ack_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/rd_wbs_dat_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/rd_wbs_err_o
add wave -noupdate -divider mem_ctrl_rd_wbs
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbs_inst/wbs_cyc_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbs_inst/wbs_stb_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbs_inst/wbs_cur_st
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbs_inst/wbs_adr_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbs_inst/ram_expect_adr
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbs_inst/wbs_err_o
add wave -noupdate -divider sdram_arbiter
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/arbiter_inst/wr_wbm_cyc_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/arbiter_inst/rd_wbm_cyc_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/arbiter_inst/rd_wbm_stb_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/arbiter_inst/rd_wbm_tga_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/arbiter_inst/rd_wbm_adr_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/arbiter_inst/rd_wbm_we_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/arbiter_inst/rd_wbm_stall_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/arbiter_inst/rd_wbm_ack_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/arbiter_inst/rd_wbm_dat_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/arbiter_inst/rd_wbm_err_i
add wave -noupdate -divider mem_mng_to_sdram
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_cyc_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_stb_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_tga_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_we_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_adr_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_dat_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_stall_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_ack_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_dat_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_err_i
add wave -noupdate -divider sdram
add wave -noupdate /mds_top_tb/sdram_model_inst/addr
add wave -noupdate /mds_top_tb/sdram_model_inst/bank_index
add wave -noupdate /mds_top_tb/sdram_model_inst/row_index
add wave -noupdate /mds_top_tb/sdram_model_inst/col_index
add wave -noupdate /mds_top_tb/sdram_model_inst/current_data
add wave -noupdate /mds_top_tb/sdram_model_inst/dq
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5318955 ns} 0}
configure wave -namecolwidth 469
configure wave -valuecolwidth 132
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
WaveRestoreZoom {0 ns} {14680315 ns}
