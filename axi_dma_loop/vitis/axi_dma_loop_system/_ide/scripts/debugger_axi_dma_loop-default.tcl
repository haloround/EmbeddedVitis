# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: D:\lkx\EmbeddedVitis\axi_dma_loop\vitis\axi_dma_loop_system\_ide\scripts\debugger_axi_dma_loop-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source D:\lkx\EmbeddedVitis\axi_dma_loop\vitis\axi_dma_loop_system\_ide\scripts\debugger_axi_dma_loop-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent JTAG-SMT2 210251A08870" && level==0 && jtag_device_ctx=="jsn-JTAG-SMT2-210251A08870-13722093-0"}
fpga -file D:/lkx/EmbeddedVitis/axi_dma_loop/vitis/axi_dma_loop/_ide/bitstream/axi_dma_loop_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw D:/lkx/EmbeddedVitis/axi_dma_loop/vitis/axi_dma_loop_wrapper/export/axi_dma_loop_wrapper/hw/axi_dma_loop_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source D:/lkx/EmbeddedVitis/axi_dma_loop/vitis/axi_dma_loop/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow D:/lkx/EmbeddedVitis/axi_dma_loop/vitis/axi_dma_loop/Debug/axi_dma_loop.elf
configparams force-mem-access 0
bpadd -addr &main
