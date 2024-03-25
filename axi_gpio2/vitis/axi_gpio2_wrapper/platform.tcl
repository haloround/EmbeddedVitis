# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct D:\EmbeddedVitis\axi_gpio2\vitis\axi_gpio2_wrapper\platform.tcl
# 
# OR launch xsct and run below command.
# source D:\EmbeddedVitis\axi_gpio2\vitis\axi_gpio2_wrapper\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {axi_gpio2_wrapper}\
-hw {D:\EmbeddedVitis\axi_gpio2\vitis\axi_gpio2_wrapper.xsa}\
-fsbl-target {psu_cortexa53_0} -out {D:/EmbeddedVitis/axi_gpio2/vitis}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {empty_application}
platform generate -domains 
platform active {axi_gpio2_wrapper}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
platform generate
