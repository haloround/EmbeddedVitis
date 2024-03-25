vlib work
vlib riviera

vlib riviera/xilinx_vip
vlib riviera/xpm
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_vip_v1_1_8
vlib riviera/processing_system7_vip_v1_0_10
vlib riviera/xil_defaultlib
vlib riviera/lib_pkg_v1_0_2
vlib riviera/fifo_generator_v13_2_5
vlib riviera/lib_fifo_v1_0_14
vlib riviera/lib_srl_fifo_v1_0_2
vlib riviera/lib_cdc_v1_0_2
vlib riviera/axi_datamover_v5_1_24
vlib riviera/axi_sg_v4_1_13
vlib riviera/axi_dma_v7_1_23
vlib riviera/axis_infrastructure_v1_1_0
vlib riviera/axis_data_fifo_v2_0_4
vlib riviera/xlconcat_v2_1_4
vlib riviera/proc_sys_reset_v5_0_13
vlib riviera/generic_baseblocks_v2_1_0
vlib riviera/axi_data_fifo_v2_1_21
vlib riviera/axi_register_slice_v2_1_22
vlib riviera/axi_protocol_converter_v2_1_22
vlib riviera/axi_crossbar_v2_1_23
vlib riviera/axi_clock_converter_v2_1_21
vlib riviera/blk_mem_gen_v8_4_4
vlib riviera/axi_dwidth_converter_v2_1_22

vmap xilinx_vip riviera/xilinx_vip
vmap xpm riviera/xpm
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_8 riviera/axi_vip_v1_1_8
vmap processing_system7_vip_v1_0_10 riviera/processing_system7_vip_v1_0_10
vmap xil_defaultlib riviera/xil_defaultlib
vmap lib_pkg_v1_0_2 riviera/lib_pkg_v1_0_2
vmap fifo_generator_v13_2_5 riviera/fifo_generator_v13_2_5
vmap lib_fifo_v1_0_14 riviera/lib_fifo_v1_0_14
vmap lib_srl_fifo_v1_0_2 riviera/lib_srl_fifo_v1_0_2
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap axi_datamover_v5_1_24 riviera/axi_datamover_v5_1_24
vmap axi_sg_v4_1_13 riviera/axi_sg_v4_1_13
vmap axi_dma_v7_1_23 riviera/axi_dma_v7_1_23
vmap axis_infrastructure_v1_1_0 riviera/axis_infrastructure_v1_1_0
vmap axis_data_fifo_v2_0_4 riviera/axis_data_fifo_v2_0_4
vmap xlconcat_v2_1_4 riviera/xlconcat_v2_1_4
vmap proc_sys_reset_v5_0_13 riviera/proc_sys_reset_v5_0_13
vmap generic_baseblocks_v2_1_0 riviera/generic_baseblocks_v2_1_0
vmap axi_data_fifo_v2_1_21 riviera/axi_data_fifo_v2_1_21
vmap axi_register_slice_v2_1_22 riviera/axi_register_slice_v2_1_22
vmap axi_protocol_converter_v2_1_22 riviera/axi_protocol_converter_v2_1_22
vmap axi_crossbar_v2_1_23 riviera/axi_crossbar_v2_1_23
vmap axi_clock_converter_v2_1_21 riviera/axi_clock_converter_v2_1_21
vmap blk_mem_gen_v8_4_4 riviera/blk_mem_gen_v8_4_4
vmap axi_dwidth_converter_v2_1_22 riviera/axi_dwidth_converter_v2_1_22

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

vlog -work xpm  -sv2k12 "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/ec67/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/34f8/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/ec67/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/34f8/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_8  -sv2k12 "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/ec67/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/34f8/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/94c3/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_10  -sv2k12 "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/ec67/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/34f8/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/34f8/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/ec67/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/34f8/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ip/axi_dma_loop_processing_system7_0_1/sim/axi_dma_loop_processing_system7_0_1.v" \

vcom -work lib_pkg_v1_0_2 -93 \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/ec67/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/34f8/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -93 \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/ec67/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/34f8/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_14 -93 \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/a5cb/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -93 \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work axi_datamover_v5_1_24 -93 \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/4ab6/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vcom -work axi_sg_v4_1_13 -93 \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/4919/hdl/axi_sg_v4_1_rfs.vhd" \

vcom -work axi_dma_v7_1_23 -93 \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/89d8/hdl/axi_dma_v7_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ip/axi_dma_loop_axi_dma_0_1/sim/axi_dma_loop_axi_dma_0_1.vhd" \

vlog -work axis_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/ec67/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/34f8/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/8713/hdl/axis_infrastructure_v1_1_vl_rfs.v" \

vlog -work axis_data_fifo_v2_0_4  -v2k5 "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/ec67/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/34f8/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/abd4/hdl/axis_data_fifo_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/ec67/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/34f8/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ip/axi_dma_loop_axis_data_fifo_0_1/sim/axi_dma_loop_axis_data_fifo_0_1.v" \

vlog -work xlconcat_v2_1_4  -v2k5 "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/ec67/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/34f8/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/4b67/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/ec67/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/34f8/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ip/axi_dma_loop_xlconcat_0_2/sim/axi_dma_loop_xlconcat_0_2.v" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ip/axi_dma_loop_rst_ps7_0_100M_4/sim/axi_dma_loop_rst_ps7_0_100M_4.vhd" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/ec67/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/34f8/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_data_fifo_v2_1_21  -v2k5 "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/ec67/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/34f8/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/54c0/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_22  -v2k5 "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/ec67/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/34f8/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/af2c/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_22  -v2k5 "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/ec67/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/34f8/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/5cee/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/ec67/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/34f8/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ip/axi_dma_loop_auto_pc_0/sim/axi_dma_loop_auto_pc_0.v" \

vlog -work axi_crossbar_v2_1_23  -v2k5 "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/ec67/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/34f8/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/bc0a/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/ec67/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/34f8/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ip/axi_dma_loop_xbar_0/sim/axi_dma_loop_xbar_0.v" \

vlog -work axi_clock_converter_v2_1_21  -v2k5 "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/ec67/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/34f8/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/1304/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work blk_mem_gen_v8_4_4  -v2k5 "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/ec67/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/34f8/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vlog -work axi_dwidth_converter_v2_1_22  -v2k5 "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/ec67/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/34f8/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/2394/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/ec67/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/34f8/hdl" "+incdir+../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ip/axi_dma_loop_auto_us_0/sim/axi_dma_loop_auto_us_0.v" \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ip/axi_dma_loop_auto_us_1/sim/axi_dma_loop_auto_us_1.v" \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ip/axi_dma_loop_auto_pc_1/sim/axi_dma_loop_auto_pc_1.v" \
"../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/sim/axi_dma_loop.v" \

vlog -work xil_defaultlib \
"glbl.v"
