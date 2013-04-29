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
add wave -noupdate -divider reg_type
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/gen_reg_type_inst/addr
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/gen_reg_type_inst/din
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/gen_reg_type_inst/wr_en
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/gen_reg_type_inst/clear
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/gen_reg_type_inst/din_ack
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/gen_reg_type_inst/rd_en
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/gen_reg_type_inst/dout
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/gen_reg_type_inst/dout_valid
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/gen_reg_type_inst/reg_data
add wave -noupdate -divider dbg_reg_2
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(2)/gen_reg_dbg_inst/addr
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(2)/gen_reg_dbg_inst/din
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(2)/gen_reg_dbg_inst/wr_en
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(2)/gen_reg_dbg_inst/clear
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(2)/gen_reg_dbg_inst/din_ack
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(2)/gen_reg_dbg_inst/rd_en
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(2)/gen_reg_dbg_inst/dout
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(2)/gen_reg_dbg_inst/dout_valid
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(2)/gen_reg_dbg_inst/reg_data
add wave -noupdate -divider dbg_reg_1
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(1)/gen_reg_dbg_inst/addr
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(1)/gen_reg_dbg_inst/din
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(1)/gen_reg_dbg_inst/wr_en
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(1)/gen_reg_dbg_inst/clear
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(1)/gen_reg_dbg_inst/din_ack
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(1)/gen_reg_dbg_inst/rd_en
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(1)/gen_reg_dbg_inst/dout
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(1)/gen_reg_dbg_inst/dout_valid
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(1)/gen_reg_dbg_inst/reg_data
add wave -noupdate -divider dbg_reg_0
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(0)/gen_reg_dbg_inst/addr
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(0)/gen_reg_dbg_inst/din
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(0)/gen_reg_dbg_inst/wr_en
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(0)/gen_reg_dbg_inst/clear
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(0)/gen_reg_dbg_inst/din_ack
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(0)/gen_reg_dbg_inst/rd_en
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(0)/gen_reg_dbg_inst/dout
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(0)/gen_reg_dbg_inst/dout_valid
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_generate(0)/gen_reg_dbg_inst/reg_data
add wave -noupdate -divider sdram
add wave -noupdate /mds_top_tb/sdram_model_inst/dq
add wave -noupdate /mds_top_tb/sdram_model_inst/addr
add wave -noupdate /mds_top_tb/sdram_model_inst/we
add wave -noupdate /mds_top_tb/sdram_model_inst/bank_index
add wave -noupdate /mds_top_tb/sdram_model_inst/row_index
add wave -noupdate /mds_top_tb/sdram_model_inst/col_index
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {23960 ns} 0}
configure wave -namecolwidth 543
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
WaveRestoreZoom {23692 ns} {24280 ns}
