onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic -label sys_clk -radix hexadecimal /arbiter_module_tb/sys_clk
add wave -noupdate -format Logic -label sys_rst_n -radix hexadecimal /arbiter_module_tb/sys_rst_n
add wave -noupdate -expand -group {Golden Model}
add wave -noupdate -group {Golden Model} -format Logic -label arbiter_en /arbiter_module_tb/u_golden_model/arbiter_en
add wave -noupdate -group {Golden Model} -format Literal -label requests /arbiter_module_tb/requests
add wave -noupdate -group {Golden Model} -format Literal -label grants_dut -radix hexadecimal /arbiter_module_tb/grants
add wave -noupdate -group {Golden Model} -format Literal -label grants_model -radix hexadecimal /arbiter_module_tb/u_golden_model/grants_model
add wave -noupdate -group Arbiter
add wave -noupdate -group Arbiter -format Logic -label arbiter_en /arbiter_module_tb/u_arbiter_module/u_arbiter_component/arbiter_en
add wave -noupdate -group Arbiter -format Literal -label requests -radix binary /arbiter_module_tb/u_arbiter_module/u_arbiter_component/requests
add wave -noupdate -group Arbiter -format Literal -label grants -radix binary /arbiter_module_tb/u_arbiter_module/u_arbiter_component/grants
add wave -noupdate -group Arbiter -format Literal -label weights -radix hexadecimal /arbiter_module_tb/u_arbiter_module/u_arbiter_component/weights
add wave -noupdate -group Arbiter -format Logic -label keep_client /arbiter_module_tb/u_arbiter_module/u_arbiter_component/keep_client
add wave -noupdate -group Arbiter -format Logic -label arbiter_tick /arbiter_module_tb/u_arbiter_module/u_arbiter_component/arbiter_tick
add wave -noupdate -group Arbiter -format Literal -label grant_counter -radix hexadecimal /arbiter_module_tb/u_arbiter_module/u_arbiter_component/grant_counter
add wave -noupdate -group Arbiter -format Literal -label arbiter_state /arbiter_module_tb/u_arbiter_module/u_arbiter_component/arbiter_state
add wave -noupdate -group TickGenerator
add wave -noupdate -group TickGenerator -format Literal -label arb_tick_value -radix hexadecimal /arbiter_module_tb/u_arbiter_module/u_tick_generator/arb_tick_value_vec
add wave -noupdate -group TickGenerator -format Literal -label arb_tick_counter -radix hexadecimal /arbiter_module_tb/u_arbiter_module/u_tick_generator/arb_tick_counter
add wave -noupdate -group TickGenerator -format Logic -label arbiter_tick /arbiter_module_tb/u_arbiter_module/u_tick_generator/arbiter_tick
add wave -noupdate -group TickGenerator -format Logic -label grant_switch /arbiter_module_tb/u_arbiter_module/u_tick_generator/grant_switch
add wave -noupdate -group TickGenerator -format Logic -label arbiter_en /arbiter_module_tb/arbiter_en
add wave -noupdate -group Register-Bus
add wave -noupdate -group Register-Bus -format Logic -label reg_cs /arbiter_module_tb/u_input_parser/reg_cs
add wave -noupdate -group Register-Bus -format Literal -label reg_addr -radix hexadecimal /arbiter_module_tb/u_input_parser/reg_addr
add wave -noupdate -group Register-Bus -format Literal -label reg_wr_data -radix hexadecimal /arbiter_module_tb/u_input_parser/reg_wr_data
add wave -noupdate -group Register-Bus -format Logic -label reg_wr_en /arbiter_module_tb/u_input_parser/reg_wr_en
add wave -noupdate -group Register-Bus -format Logic -label reg_rd_en /arbiter_module_tb/u_input_parser/reg_rd_en
add wave -noupdate -group Register-Bus -format Literal -label reg_rd_data -radix hexadecimal /arbiter_module_tb/u_input_parser/reg_rd_data
add wave -noupdate -group Register-Bus -format Logic -label reg_rd_valid /arbiter_module_tb/u_input_parser/reg_rd_valid
add wave -noupdate -format Logic -label arbiter_en /arbiter_module_tb/arbiter_en
add wave -noupdate -format Logic -label tick_rd_req -radix hexadecimal /arbiter_module_tb/tick_rd_req
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0} {{Cursor 2} {2036025170 ps} 0}
configure wave -namecolwidth 164
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
update
WaveRestoreZoom {0 ps} {2292259323 ps}
