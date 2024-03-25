vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_vip_v1_1_8
vlib modelsim_lib/msim/processing_system7_vip_v1_0_10
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/generic_baseblocks_v2_1_0
vlib modelsim_lib/msim/fifo_generator_v13_2_5
vlib modelsim_lib/msim/axi_data_fifo_v2_1_21
vlib modelsim_lib/msim/axi_register_slice_v2_1_22
vlib modelsim_lib/msim/axi_protocol_converter_v2_1_22
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/proc_sys_reset_v5_0_13

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xpm modelsim_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_8 modelsim_lib/msim/axi_vip_v1_1_8
vmap processing_system7_vip_v1_0_10 modelsim_lib/msim/processing_system7_vip_v1_0_10
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap generic_baseblocks_v2_1_0 modelsim_lib/msim/generic_baseblocks_v2_1_0
vmap fifo_generator_v13_2_5 modelsim_lib/msim/fifo_generator_v13_2_5
vmap axi_data_fifo_v2_1_21 modelsim_lib/msim/axi_data_fifo_v2_1_21
vmap axi_register_slice_v2_1_22 modelsim_lib/msim/axi_register_slice_v2_1_22
vmap axi_protocol_converter_v2_1_22 modelsim_lib/msim/axi_protocol_converter_v2_1_22
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 modelsim_lib/msim/proc_sys_reset_v5_0_13

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

vlog -work xpm  -incr -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L xilinx_vip "+incdir+../../../../user_led.gen/sources_1/bd/user_led/ipshared/ec67/hdl" "+incdir+../../../../user_led.gen/sources_1/bd/user_led/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93 \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -incr "+incdir+../../../../user_led.gen/sources_1/bd/user_led/ipshared/ec67/hdl" "+incdir+../../../../user_led.gen/sources_1/bd/user_led/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../user_led.gen/sources_1/bd/user_led/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_8  -incr -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L xilinx_vip "+incdir+../../../../user_led.gen/sources_1/bd/user_led/ipshared/ec67/hdl" "+incdir+../../../../user_led.gen/sources_1/bd/user_led/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../user_led.gen/sources_1/bd/user_led/ipshared/94c3/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_10  -incr -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L xilinx_vip "+incdir+../../../../user_led.gen/sources_1/bd/user_led/ipshared/ec67/hdl" "+incdir+../../../../user_led.gen/sources_1/bd/user_led/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../user_led.gen/sources_1/bd/user_led/ipshared/34f8/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../user_led.gen/sources_1/bd/user_led/ipshared/ec67/hdl" "+incdir+../../../../user_led.gen/sources_1/bd/user_led/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../user_led.gen/sources_1/bd/user_led/ip/user_led_processing_system7_0_0/sim/user_led_processing_system7_0_0.v" \
"../../../../user_led.gen/sources_1/bd/user_led/ipshared/dea9/hdl/breath_led.v" \
"../../../../user_led.gen/sources_1/bd/user_led/ipshared/dea9/hdl/breath_led_ip_v1_0_S0_AXI.v" \
"../../../../user_led.gen/sources_1/bd/user_led/ipshared/dea9/hdl/breath_led_ip_v1_0.v" \
"../../../../user_led.gen/sources_1/bd/user_led/ip/user_led_breath_led_ip_0_0/sim/user_led_breath_led_ip_0_0.v" \

vlog -work generic_baseblocks_v2_1_0  -incr "+incdir+../../../../user_led.gen/sources_1/bd/user_led/ipshared/ec67/hdl" "+incdir+../../../../user_led.gen/sources_1/bd/user_led/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../user_led.gen/sources_1/bd/user_led/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5  -incr "+incdir+../../../../user_led.gen/sources_1/bd/user_led/ipshared/ec67/hdl" "+incdir+../../../../user_led.gen/sources_1/bd/user_led/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../user_led.gen/sources_1/bd/user_led/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5  -93 \
"../../../../user_led.gen/sources_1/bd/user_led/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -incr "+incdir+../../../../user_led.gen/sources_1/bd/user_led/ipshared/ec67/hdl" "+incdir+../../../../user_led.gen/sources_1/bd/user_led/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../user_led.gen/sources_1/bd/user_led/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_21  -incr "+incdir+../../../../user_led.gen/sources_1/bd/user_led/ipshared/ec67/hdl" "+incdir+../../../../user_led.gen/sources_1/bd/user_led/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../user_led.gen/sources_1/bd/user_led/ipshared/54c0/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_22  -incr "+incdir+../../../../user_led.gen/sources_1/bd/user_led/ipshared/ec67/hdl" "+incdir+../../../../user_led.gen/sources_1/bd/user_led/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../user_led.gen/sources_1/bd/user_led/ipshared/af2c/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_22  -incr "+incdir+../../../../user_led.gen/sources_1/bd/user_led/ipshared/ec67/hdl" "+incdir+../../../../user_led.gen/sources_1/bd/user_led/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../user_led.gen/sources_1/bd/user_led/ipshared/5cee/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../user_led.gen/sources_1/bd/user_led/ipshared/ec67/hdl" "+incdir+../../../../user_led.gen/sources_1/bd/user_led/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../user_led.gen/sources_1/bd/user_led/ip/user_led_auto_pc_0/sim/user_led_auto_pc_0.v" \

vcom -work lib_cdc_v1_0_2  -93 \
"../../../../user_led.gen/sources_1/bd/user_led/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13  -93 \
"../../../../user_led.gen/sources_1/bd/user_led/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../../user_led.gen/sources_1/bd/user_led/ip/user_led_rst_ps7_0_50M_0/sim/user_led_rst_ps7_0_50M_0.vhd" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../user_led.gen/sources_1/bd/user_led/ipshared/ec67/hdl" "+incdir+../../../../user_led.gen/sources_1/bd/user_led/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../user_led.gen/sources_1/bd/user_led/sim/user_led.v" \

vlog -work xil_defaultlib \
"glbl.v"
