onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider SG_WBM_IF
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/clk
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/reset_n
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/sdram_rd_en
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/sdram_addr_rd
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/wbm_cyc_o
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/wbm_stb_o
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/wbm_we_o
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/wbm_tgc_o
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/wbm_tga_o
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/wbm_adr_o
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/wbm_dat_o
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/wbm_stall_i
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/wbm_ack_i
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/wbm_dat_i
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
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_rd_inst/wbs_we_i
add wave -noupdate -divider debug_0
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(0)/gen_reg_dbg_inst/addr
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(0)/gen_reg_dbg_inst/din
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(0)/gen_reg_dbg_inst/wr_en
add wave -noupdate -color Salmon -itemcolor Salmon /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(0)/gen_reg_dbg_inst/din_ack
add wave -noupdate -color Salmon -itemcolor Salmon -radix hexadecimal /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(0)/gen_reg_dbg_inst/reg_data
add wave -noupdate -divider debug_1
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(1)/gen_reg_dbg_inst/addr
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(1)/gen_reg_dbg_inst/din
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(1)/gen_reg_dbg_inst/wr_en
add wave -noupdate -color Salmon -itemcolor Salmon /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(1)/gen_reg_dbg_inst/din_ack
add wave -noupdate -color Salmon -itemcolor Salmon -radix hexadecimal /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(1)/gen_reg_dbg_inst/reg_data
add wave -noupdate -divider debug_2
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(2)/gen_reg_dbg_inst/addr
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(2)/gen_reg_dbg_inst/din
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(2)/gen_reg_dbg_inst/wr_en
add wave -noupdate -color Salmon -itemcolor Salmon /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(2)/gen_reg_dbg_inst/din_ack
add wave -noupdate -color Salmon -itemcolor Salmon -radix hexadecimal /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(2)/gen_reg_dbg_inst/reg_data
add wave -noupdate -divider type
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/gen_reg_type_inst/addr
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/gen_reg_type_inst/din
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/gen_reg_type_inst/wr_en
add wave -noupdate -color salmon -itemcolor salmon /mds_top_tb/mds_top_inst/mem_mng_inst/gen_reg_type_inst/din_ack
add wave -noupdate -color salmon -itemcolor salmon /mds_top_tb/mds_top_inst/mem_mng_inst/gen_reg_type_inst/reg_data
add wave -noupdate -divider sdram
add wave -noupdate -radix hexadecimal /mds_top_tb/sdram_model_inst/dq
add wave -noupdate -radix hexadecimal /mds_top_tb/sdram_model_inst/addr
add wave -noupdate /mds_top_tb/sdram_model_inst/we
add wave -noupdate /mds_top_tb/sdram_model_inst/bank_index
add wave -noupdate /mds_top_tb/sdram_model_inst/row_index
add wave -noupdate /mds_top_tb/sdram_model_inst/col_index
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7764688 ns} 0}
configure wave -namecolwidth 500
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
WaveRestoreZoom {0 ns} {8400 us}
