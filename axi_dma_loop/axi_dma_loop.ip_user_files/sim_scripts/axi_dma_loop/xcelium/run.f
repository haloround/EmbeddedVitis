-makelib xcelium_lib/xilinx_vip -sv \
  "C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib xcelium_lib/xpm -sv \
  "C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_vip_v1_1_8 -sv \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/94c3/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/processing_system7_vip_v1_0_10 -sv \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/34f8/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ip/axi_dma_loop_processing_system7_0_1/sim/axi_dma_loop_processing_system7_0_1.v" \
-endlib
-makelib xcelium_lib/lib_pkg_v1_0_2 \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib xcelium_lib/lib_fifo_v1_0_14 \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/a5cb/hdl/lib_fifo_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_srl_fifo_v1_0_2 \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_datamover_v5_1_24 \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/4ab6/hdl/axi_datamover_v5_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_sg_v4_1_13 \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/4919/hdl/axi_sg_v4_1_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_dma_v7_1_23 \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/89d8/hdl/axi_dma_v7_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ip/axi_dma_loop_axi_dma_0_1/sim/axi_dma_loop_axi_dma_0_1.vhd" \
-endlib
-makelib xcelium_lib/axis_infrastructure_v1_1_0 \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/8713/hdl/axis_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axis_data_fifo_v2_0_4 \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/abd4/hdl/axis_data_fifo_v2_0_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ip/axi_dma_loop_axis_data_fifo_0_1/sim/axi_dma_loop_axis_data_fifo_0_1.v" \
-endlib
-makelib xcelium_lib/xlconcat_v2_1_4 \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/4b67/hdl/xlconcat_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ip/axi_dma_loop_xlconcat_0_2/sim/axi_dma_loop_xlconcat_0_2.v" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_13 \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ip/axi_dma_loop_rst_ps7_0_100M_4/sim/axi_dma_loop_rst_ps7_0_100M_4.vhd" \
-endlib
-makelib xcelium_lib/generic_baseblocks_v2_1_0 \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_data_fifo_v2_1_21 \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/54c0/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_register_slice_v2_1_22 \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/af2c/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_protocol_converter_v2_1_22 \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/5cee/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ip/axi_dma_loop_auto_pc_0/sim/axi_dma_loop_auto_pc_0.v" \
-endlib
-makelib xcelium_lib/axi_crossbar_v2_1_23 \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/bc0a/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ip/axi_dma_loop_xbar_0/sim/axi_dma_loop_xbar_0.v" \
-endlib
-makelib xcelium_lib/axi_clock_converter_v2_1_21 \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/1304/hdl/axi_clock_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_4_4 \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/axi_dwidth_converter_v2_1_22 \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ipshared/2394/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ip/axi_dma_loop_auto_us_0/sim/axi_dma_loop_auto_us_0.v" \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ip/axi_dma_loop_auto_us_1/sim/axi_dma_loop_auto_us_1.v" \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ip/axi_dma_loop_auto_pc_1/sim/axi_dma_loop_auto_pc_1.v" \
  "../../../../axi_dma_loop.gen/sources_1/bd/axi_dma_loop/sim/axi_dma_loop.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

