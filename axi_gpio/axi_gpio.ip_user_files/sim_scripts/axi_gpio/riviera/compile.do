vlib work
vlib riviera

vlib riviera/xilinx_vip
vlib riviera/xpm
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_vip_v1_1_8
vlib riviera/processing_system7_vip_v1_0_10
vlib riviera/xil_defaultlib
vlib riviera/axi_lite_ipif_v3_0_4
vlib riviera/lib_cdc_v1_0_2
vlib riviera/interrupt_control_v3_1_4
vlib riviera/axi_gpio_v2_0_24
vlib riviera/generic_baseblocks_v2_1_0
vlib riviera/fifo_generator_v13_2_5
vlib riviera/axi_data_fifo_v2_1_21
vlib riviera/axi_register_slice_v2_1_22
vlib riviera/axi_protocol_converter_v2_1_22
vlib riviera/proc_sys_reset_v5_0_13

vmap xilinx_vip riviera/xilinx_vip
vmap xpm riviera/xpm
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_8 riviera/axi_vip_v1_1_8
vmap processing_system7_vip_v1_0_10 riviera/processing_system7_vip_v1_0_10
vmap xil_defaultlib riviera/xil_defaultlib
vmap axi_lite_ipif_v3_0_4 riviera/axi_lite_ipif_v3_0_4
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap interrupt_control_v3_1_4 riviera/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_24 riviera/axi_gpio_v2_0_24
vmap generic_baseblocks_v2_1_0 riviera/generic_baseblocks_v2_1_0
vmap fifo_generator_v13_2_5 riviera/fifo_generator_v13_2_5
vmap axi_data_fifo_v2_1_21 riviera/axi_data_fifo_v2_1_21
vmap axi_register_slice_v2_1_22 riviera/axi_register_slice_v2_1_22
vmap axi_protocol_converter_v2_1_22 riviera/axi_protocol_converter_v2_1_22
vmap proc_sys_reset_v5_0_13 riviera/proc_sys_reset_v5_0_13

vlog -work xilinx_vip  -sv2k12 "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/ec67/hdl" "+incdir+../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/ec67/hdl" "+incdir+../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_8  -sv2k12 "+incdir+../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/ec67/hdl" "+incdir+../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/94c3/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_10  -sv2k12 "+incdir+../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/ec67/hdl" "+incdir+../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/34f8/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/ec67/hdl" "+incdir+../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ip/axi_gpio_processing_system7_0_0/sim/axi_gpio_processing_system7_0_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -93 \
"../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work interrupt_control_v3_1_4 -93 \
"../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_24 -93 \
"../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/4318/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ip/axi_gpio_axi_gpio_0_0/sim/axi_gpio_axi_gpio_0_0.vhd" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/ec67/hdl" "+incdir+../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/ec67/hdl" "+incdir+../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -93 \
"../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/ec67/hdl" "+incdir+../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_21  -v2k5 "+incdir+../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/ec67/hdl" "+incdir+../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/54c0/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_22  -v2k5 "+incdir+../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/ec67/hdl" "+incdir+../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/af2c/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_22  -v2k5 "+incdir+../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/ec67/hdl" "+incdir+../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/5cee/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/ec67/hdl" "+incdir+../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ip/axi_gpio_auto_pc_0/sim/axi_gpio_auto_pc_0.v" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ip/axi_gpio_rst_ps7_0_50M_0/sim/axi_gpio_rst_ps7_0_50M_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/ec67/hdl" "+incdir+../../../../axi_gpio.gen/sources_1/bd/axi_gpio/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_gpio.gen/sources_1/bd/axi_gpio/sim/axi_gpio.v" \

vlog -work xil_defaultlib \
"glbl.v"

