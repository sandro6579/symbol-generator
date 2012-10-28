set cond TRUE

file delete SIM/ARBITER/TEST_FILES/TEST_36/logfile.log
transcript file SIM/ARBITER/TEST_FILES/TEST_36/logfile.log

vsim -t ps -gRANDOM_SEED_G=$rand_seed -gfilter_depth_g=$test_fdepth -gREG_INPUT_PATH_G="SIM/ARBITER/TEST_FILES/TEST_36/" work.arbiter_module_tb

run 1 ms

when {end_of_file_sig == TRUE} {set cond FALSE;}

while {$cond} {run 1 ms;}

transcript file ""