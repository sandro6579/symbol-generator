onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider pixel_mng
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/pixel_mng_inst/vsync
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/pixel_mng_inst/req_ln_trig
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/pixel_mng_inst/rd_adr
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/pixel_mng_inst/cur_st
add wave -noupdate -divider SG_WBM_IF
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/sdram_rd_en
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/sdram_addr_rd
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/wbm_cyc_o
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/wbm_stb_o
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/wbm_tgc_o
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/wbm_tga_o
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/wbm_we_o
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/wbm_adr_o
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/wbm_dat_o
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/wbm_stall_i
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/wbm_ack_i
add wave -noupdate -radix hexadecimal /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/wbm_dat_i
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/wbm_err_i
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/sdram_data_valid
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/sdram_data
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/cur_st
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/ack_cnt
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/err_i_status
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/cyc_internal
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/stb_internal
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/we_internal
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/adr_internal
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/dbg_adr
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/dbg_cnt
add wave -noupdate -divider mem_mng_read
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wr_cnt_val
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wr_cnt_en
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/rd_wbs_cyc_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/rd_wbs_stb_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/rd_wbs_tgc_i
add wave -noupdate -radix hexadecimal /mds_top_tb/mds_top_inst/mem_mng_inst/rd_wbs_tga_i
add wave -noupdate -radix hexadecimal /mds_top_tb/mds_top_inst/mem_mng_inst/rd_wbs_adr_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/rd_wbs_stall_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/rd_wbs_ack_o
add wave -noupdate -radix hexadecimal /mds_top_tb/mds_top_inst/mem_mng_inst/rd_wbs_dat_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/rd_wbs_err_o
add wave -noupdate -color salmon -itemcolor salmon -radix hexadecimal /mds_top_tb/mds_top_inst/mem_mng_inst/type_reg_dout
add wave -noupdate -color salmon -itemcolor salmon -radix hexadecimal /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_dout
add wave -noupdate -divider mem_ctrl_rd_wbs
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbs_inst/wbs_cyc_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbs_inst/wbs_stb_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbs_inst/wbs_cur_st
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbs_inst/wbs_adr_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbs_inst/ram_expect_adr
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbs_inst/wbs_err_o
add wave -noupdate -divider mem_ctrl_rd_wbm
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/clk_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/rst
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/wbm_adr_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/wbm_we_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/wbm_tga_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/wbm_cyc_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/wbm_stb_o
add wave -noupdate -radix hexadecimal /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/wbm_dat_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/wbm_stall_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/wbm_err_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/wbm_ack_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/wbm_busy
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/rd_cnt_zero
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/ram_ready
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/init_rd
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/restart_rd
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/ram_words_in
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/ram_addr_in
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/ram_data_in
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/ram_din_valid
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/arbiter_gnt
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/arbiter_req
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/bank_val
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/type_reg
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/rd_addr_reg
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/wr_cnt_val
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/wr_cnt_en
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/dbg_rd_bank
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/ram_ready_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/ram_ready_sr
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/ack_i_cnt
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/err_i_status
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/neg_cyc_bool
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/dat_1st_bool
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/wbm_cyc_internal
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/wbm_stb_internal
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/cur_rd_addr
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/rd_cnt
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/rd_cnt_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/first_rx_bool
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/addr_pipe
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/init_rd_d1
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/init_rd_bool
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/restart_rd_d1
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/restart_rd_bool
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/release_arb_cnt
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/ram_addr_in_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/ram_words_left
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/ram_words_cnt
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/ram_delay_cnt
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbm_inst/wbm_cur_st
add wave -noupdate -divider ram
add wave -noupdate -radix hexadecimal /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/ram1_inst/data
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/ram1_inst/rdaddress
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/ram1_inst/rdclock
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/ram1_inst/wraddress
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/ram1_inst/wrclock
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/ram1_inst/wren
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/ram1_inst/q
add wave -noupdate -divider sdram_arbiter
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/arbiter_inst/wr_wbm_cyc_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/arbiter_inst/rd_wbm_cyc_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/arbiter_inst/rd_wbm_stb_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/arbiter_inst/rd_wbm_tga_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/arbiter_inst/rd_wbm_adr_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/arbiter_inst/rd_wbm_we_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/arbiter_inst/rd_wbm_stall_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/arbiter_inst/rd_wbm_ack_i
add wave -noupdate -radix hexadecimal /mds_top_tb/mds_top_inst/mem_mng_inst/arbiter_inst/rd_wbm_dat_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/arbiter_inst/rd_wbm_err_i
add wave -noupdate -divider mem_mng_to_sdram
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_cyc_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_stb_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_tga_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_we_o
add wave -noupdate -radix hexadecimal -subitemconfig {/mds_top_tb/mds_top_inst/mem_mng_inst/wbm_adr_o(21) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_adr_o(20) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_adr_o(19) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_adr_o(18) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_adr_o(17) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_adr_o(16) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_adr_o(15) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_adr_o(14) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_adr_o(13) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_adr_o(12) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_adr_o(11) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_adr_o(10) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_adr_o(9) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_adr_o(8) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_adr_o(7) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_adr_o(6) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_adr_o(5) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_adr_o(4) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_adr_o(3) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_adr_o(2) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_adr_o(1) {-height 15 -radix hexadecimal} /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_adr_o(0) {-height 15 -radix hexadecimal}} /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_adr_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_dat_o
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_stall_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_ack_i
add wave -noupdate -radix hexadecimal /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_dat_i
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/wbm_err_i
add wave -noupdate -divider sdram
add wave -noupdate /mds_top_tb/sdram_model_inst/addr
add wave -noupdate /mds_top_tb/sdram_model_inst/bank_index
add wave -noupdate /mds_top_tb/sdram_model_inst/row_index
add wave -noupdate /mds_top_tb/sdram_model_inst/col_index
add wave -noupdate /mds_top_tb/sdram_model_inst/current_data
add wave -noupdate -radix hexadecimal /mds_top_tb/sdram_model_inst/dq
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {82 ns} 0}
configure wave -namecolwidth 460
configure wave -valuecolwidth 89
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
WaveRestoreZoom {42254337 ns} {42254419 ns}
