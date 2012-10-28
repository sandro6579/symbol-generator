file delete SIM/ARBITER/TEST_FILES/batch.log
set fp_batch [open "SIM/ARBITER/TEST_FILES/batch.log" w]

# handling test-list
##########################

set fp_test_list [open "SIM/ARBITER/TEST_FILES/batch_test_list.do" r]
set test_list [read $fp_test_list]
close $fp_test_list

set test_num [expr (0)]
set test_pass [expr (0)]
set test_fail [expr (0)]


foreach test_line $test_list {
        
	set line_list [split $test_line .]
	
	set test_name [lindex $line_list 0]
	set test_fdepth [lindex $line_list 1]
	
	set rand_seed [expr { int(100000 * rand()) }]
	puts $fp_batch "Summary of $test_name, seed $rand_seed :"
	
	# Running test
	set test_cmd SIM/ARBITER/TEST_FILES/${test_name}/${test_name}_batch.do
	do $test_cmd
	
	incr test_num 1

	# handling logfile
	set fp [open "SIM/ARBITER/TEST_FILES/${test_name}/logfile.log" r]
     	set file_data [read $fp]
     	close $fp

	set data [split $file_data "\n"]
     	foreach line $data {
          	if {[string match "*\-\-*" $line]} {puts $fp_batch $line;}
		if {[string match "*PASSED*" $line]} {incr test_pass 1;}
		if {[string match "*FAILED*" $line]} {incr test_fail 1;}
		}

	puts $fp_batch "\n";

	}

echo "test-list completed"

puts $fp_batch "Test-List summary:"
puts $fp_batch "------------------------------"
puts $fp_batch "Total tests:        ${test_num}"
puts $fp_batch "Total tests passed: ${test_pass}"
puts $fp_batch "Total tests failed: ${test_fail}"
puts $fp_batch "------------------------------"

close $fp_batch