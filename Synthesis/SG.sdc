# Synopsys, Inc. constraint file
# H:/Project/SG_synthesis_proj/SG.sdc
# Written on Mon Apr 15 10:49:29 2013
# by Synplify Pro, D-2010.03-SP1 Scope Editor

#
# Collections
#

#
# Clocks
#
define_clock   {fpga_clk} -name {fpga_clk}  -freq 50 -clockgroup default_clkgroup_0
define_clock -disable   {clk_133} -name {sdram_clk_shift}  -freq 133 -clockgroup default_clkgroup_2
define_clock   {system_clk} -name {clk_100}  -freq 100 -clockgroup default_clkgroup_3
define_clock -disable   {clk_40} -name {clk_40}  -freq 40 -clockgroup default_clkgroup_4
define_clock   {clk_sdram_out} -name {clk_133}  -freq 133 -clockgroup default_clkgroup_1
define_clock   {clk_vesa_out} -name {clk_40}  -freq 40 -clockgroup default_clkgroup_5

#
# Clock to Clock
#

#
# Inputs/Outputs
#

#
# Registers
#

#
# Delay Paths
#

#
# Attributes
#

#
# I/O Standards
#

#
# Compile Points
#

#
# Other
#
