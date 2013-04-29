onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mds_top_tb/mds_top_inst/rx_path_inst/wbm_cyc_o
add wave -noupdate -radix hexadecimal /mds_top_tb/mds_top_inst/rx_path_inst/wbm_adr_o
add wave -noupdate -radix hexadecimal /mds_top_tb/mds_top_inst/rx_path_inst/wbm_dat_o
add wave -noupdate /mds_top_tb/mds_top_inst/rx_path_inst/crc_err
add wave -noupdate /mds_top_tb/mds_top_inst/rx_path_inst/eof_err
add wave -noupdate /mds_top_tb/mds_top_inst/rx_path_inst/mp_done
add wave -noupdate -divider SG_Top
add wave -noupdate -color Salmon -itemcolor Salmon /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/op_str_rd_start
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/req_in_trg
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/mux_dout_valid
add wave -noupdate -radix hexadecimal /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/mux_dout
add wave -noupdate -divider SG_RAM
add wave -noupdate -radix unsigned -subitemconfig {/mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/ram_300_inst/ram_addr_wr(8) {-radix unsigned} /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/ram_300_inst/ram_addr_wr(7) {-radix unsigned} /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/ram_300_inst/ram_addr_wr(6) {-radix unsigned} /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/ram_300_inst/ram_addr_wr(5) {-radix unsigned} /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/ram_300_inst/ram_addr_wr(4) {-radix unsigned} /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/ram_300_inst/ram_addr_wr(3) {-radix unsigned} /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/ram_300_inst/ram_addr_wr(2) {-radix unsigned} /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/ram_300_inst/ram_addr_wr(1) {-radix unsigned} /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/ram_300_inst/ram_addr_wr(0) {-radix unsigned}} /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/ram_300_inst/ram_addr_wr
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/ram_300_inst/ram_wr_en
add wave -noupdate -radix unsigned /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/ram_300_inst/ram_data_in
add wave -noupdate -divider manager
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/manager_inst/current_sm
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/manager_inst/row_count
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/manager_inst/sym_row
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/manager_inst/sym_col
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/manager_inst/inside_row
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/mng_en
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/manager_inst/req_cnt
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/manager_inst/req_cnt_small
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/manager_inst/req_cnt_small_d
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/manager_inst/mng_en_internal
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/manager_inst/sdram_wait_counter
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/manager_inst/sdram_wait_counter_tmp
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/manager_inst/sdram_wait_count_en
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/manager_inst/sdram_ready
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/manager_inst/sdram_rd_en
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/manager_inst/sdram_addr_rd
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/sdram_data_valid
add wave -noupdate -radix hexadecimal /mds_top_tb/mds_top_inst/disp_ctrl_inst/symbol_generator_top_inst/sdram_data
add wave -noupdate -divider SG_WBM_IF
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/cur_st
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/wbm_cyc_o
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/wbm_stb_o
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/wbm_we_o
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/wbm_adr_o
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/wbm_adr_o
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/wbm_stall_i
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/wbm_ack_i
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/sg_wbm_if_inst/wbm_dat_i
add wave -noupdate -divider dc_fifo
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/dc_fifo_inst/aclr
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/dc_fifo_inst/wrreq
add wave -noupdate -radix hexadecimal /mds_top_tb/mds_top_inst/disp_ctrl_inst/dc_fifo_inst/data
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/dc_fifo_inst/rdreq
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/dc_fifo_inst/q
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/dc_fifo_empty
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/dc_fifo_full
add wave -noupdate -divider VESA
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/vesa_gen_ctrl_inst/vsync
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/vesa_gen_ctrl_inst/hsync
add wave -noupdate /mds_top_tb/mds_top_inst/disp_ctrl_inst/vesa_gen_ctrl_inst/blank
add wave -noupdate -radix hexadecimal /mds_top_tb/mds_top_inst/disp_ctrl_inst/vesa_gen_ctrl_inst/r_out
add wave -noupdate -radix hexadecimal /mds_top_tb/mds_top_inst/disp_ctrl_inst/vesa_gen_ctrl_inst/g_out
add wave -noupdate -radix hexadecimal /mds_top_tb/mds_top_inst/disp_ctrl_inst/vesa_gen_ctrl_inst/b_out
add wave -noupdate -divider mem_mng
add wave -noupdate -radix hexadecimal /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_type_reg
add wave -noupdate -radix hexadecimal /mds_top_tb/mds_top_inst/mem_mng_inst/dbg_reg_dout
add wave -noupdate /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_inst/type_reg
add wave -noupdate -radix hexadecimal /mds_top_tb/mds_top_inst/mem_mng_inst/mem_ctrl_wr_inst/wbm_inst/wbm_adr_o
add wave -noupdate -divider SDRAM
add wave -noupdate /mds_top_tb/sdram_model_inst/bank_index
add wave -noupdate /mds_top_tb/sdram_model_inst/row_index
add wave -noupdate /mds_top_tb/sdram_model_inst/col_index
add wave -noupdate /mds_top_tb/sdram_model_inst/we
add wave -noupdate -radix hexadecimal /mds_top_tb/sdram_model_inst/dq
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {34647697 ns} 0}
configure wave -namecolwidth 576
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
WaveRestoreZoom {172495900 ns} {174079164 ns}
