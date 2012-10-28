set cond TRUE

file delete SIM/ARBITER/TEST_FILES/TEST_36/logfile.log
transcript file SIM/ARBITER/TEST_FILES/TEST_36/logfile.log

vsim -t ps -gfilter_depth_g=15 -gREG_INPUT_PATH_G="SIM/ARBITER/TEST_FILES/TEST_36/" work.arbiter_module_tb

log -r *
view wave
do SIM/ARBITER/TEST_FILES/TEST_36/arbiter_wave.do

run 1 ms

when {end_of_file_sig == TRUE} {set cond FALSE;}

while {$cond} {run 1 ms;}

transcript file ""