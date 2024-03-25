# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct D:\EmbeddedVitis\axi_dma_loop\vitis\axi_dma_loop_wrapper\platform.tcl
# 
# OR launch xsct and run below command.
# source D:\EmbeddedVitis\axi_dma_loop\vitis\axi_dma_loop_wrapper\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {axi_dma_loop_wrapper}\
-hw {D:\EmbeddedVitis\axi_dma_loop\vitis\axi_dma_loop_wrapper.xsa}\
-fsbl-target {psu_cortexa53_0} -out {D:/EmbeddedVitis/axi_dma_loop/vitis}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {empty_application}
platform generate -domains 
platform active {axi_dma_loop_wrapper}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick