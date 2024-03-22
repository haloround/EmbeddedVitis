vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_vip_v1_1_8
vlib modelsim_lib/msim/processing_system7_vip_v1_0_10
vlib modelsim_lib/msim/xil_defaultlib

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_8 modelsim_lib/msim/axi_vip_v1_1_8
vmap processing_system7_vip_v1_0_10 modelsim_lib/msim/processing_system7_vip_v1_0_10
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xilinx_vip  -incr -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L xilinx_vip "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work axi_infrastructure_v1_1_0  -incr "+incdir+../../../../gpio_mio_interrupt.gen/sources_1/bd/gpio_mio_interrupt/ipshared/ec67/hdl" "+incdir+../../../../gpio_mio_interrupt.gen/sources_1/bd/gpio_mio_interrupt/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../gpio_mio_interrupt.gen/sources_1/bd/gpio_mio_interrupt/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_8  -incr -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L xilinx_vip "+incdir+../../../../gpio_mio_interrupt.gen/sources_1/bd/gpio_mio_interrupt/ipshared/ec67/hdl" "+incdir+../../../../gpio_mio_interrupt.gen/sources_1/bd/gpio_mio_interrupt/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../gpio_mio_interrupt.gen/sources_1/bd/gpio_mio_interrupt/ipshared/94c3/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_10  -incr -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L xilinx_vip "+incdir+../../../../gpio_mio_interrupt.gen/sources_1/bd/gpio_mio_interrupt/ipshared/ec67/hdl" "+incdir+../../../../gpio_mio_interrupt.gen/sources_1/bd/gpio_mio_interrupt/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../gpio_mio_interrupt.gen/sources_1/bd/gpio_mio_interrupt/ipshared/34f8/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../gpio_mio_interrupt.gen/sources_1/bd/gpio_mio_interrupt/ipshared/ec67/hdl" "+incdir+../../../../gpio_mio_interrupt.gen/sources_1/bd/gpio_mio_interrupt/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../gpio_mio_interrupt.gen/sources_1/bd/gpio_mio_interrupt/ip/gpio_mio_interrupt_processing_system7_0_0/sim/gpio_mio_interrupt_processing_system7_0_0.v" \
"../../../../gpio_mio_interrupt.gen/sources_1/bd/gpio_mio_interrupt/sim/gpio_mio_interrupt.v" \

vlog -work xil_defaultlib \
"glbl.v"

