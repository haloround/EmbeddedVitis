-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Sun Mar 24 16:06:07 2024
-- Host        : DESKTOP-SO1BPCJ running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/EmbeddedVitis/custom_ip/axi_dma_loop/axi_dma_loop.gen/sources_1/bd/axi_dma_loop/ip/axi_dma_loop_rst_ps7_0_100M_4/axi_dma_loop_rst_ps7_0_100M_4_stub.vhdl
-- Design      : axi_dma_loop_rst_ps7_0_100M_4
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity axi_dma_loop_rst_ps7_0_100M_4 is
  Port ( 
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end axi_dma_loop_rst_ps7_0_100M_4;

architecture stub of axi_dma_loop_rst_ps7_0_100M_4 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "slowest_sync_clk,ext_reset_in,aux_reset_in,mb_debug_sys_rst,dcm_locked,mb_reset,bus_struct_reset[0:0],peripheral_reset[0:0],interconnect_aresetn[0:0],peripheral_aresetn[0:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "proc_sys_reset,Vivado 2020.2";
begin
end;
