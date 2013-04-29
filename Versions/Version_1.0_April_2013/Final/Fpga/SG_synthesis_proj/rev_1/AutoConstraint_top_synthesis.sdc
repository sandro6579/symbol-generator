# Synopsys, Inc. constraint file
# H:\Project\SG_synthesis_proj\rev_1\AutoConstraint_top_synthesis.sdc
# Written on Tue Apr 02 16:20:25 2013
# by Synplify Pro, D-2010.03-SP1 Scope Editor

#
# Collections
#

#
# Clocks
#
define_clock   {p:top_synthesis|fpga_clk} -name {p:top_synthesis|fpga_clk}  -freq 50 -clockgroup Autoconstr_clkgroup_0 -rise 0 -fall 4.299 -route 0
define_clock   {n:global_nets_top|clk_blk_inst.pll_inst.sdram_clk_derived_clock} -name {n:global_nets_top|clk_blk_inst.pll_inst.sdram_clk_derived_clock}  -freq 133 -clockgroup Autoconstr_clkgroup_0 -rise 0 -fall 4.299 -route 0
define_clock   {n:global_nets_top|clk_blk_inst.pll_inst.system_clk_derived_clock} -name {n:global_nets_top|clk_blk_inst.pll_inst.system_clk_derived_clock}  -freq 100 -clockgroup Autoconstr_clkgroup_0 -rise 0 -fall 4.299 -route 0
define_clock   {n:global_nets_top|clk_blk_inst.pll_inst.vesa_clk_derived_clock} -name {n:global_nets_top|clk_blk_inst.pll_inst.vesa_clk_derived_clock}  -freq 40 -clockgroup Autoconstr_clkgroup_0 -rise 0 -fall 4.299 -route 0

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
