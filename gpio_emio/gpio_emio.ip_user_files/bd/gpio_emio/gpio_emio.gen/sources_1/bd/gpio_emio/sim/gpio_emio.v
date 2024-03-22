//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Fri Mar 15 16:18:18 2024
//Host        : DESKTOP-SO1BPCJ running 64-bit major release  (build 9200)
//Command     : generate_target gpio_emio.bd
//Design      : gpio_emio
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "gpio_emio,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=gpio_emio,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "gpio_emio.hwdef" *) 
module gpio_emio
   (GPIO_EMIO_KEY_tri_i,
    GPIO_EMIO_KEY_tri_o,
    GPIO_EMIO_KEY_tri_t);
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_EMIO_KEY " *) input [0:0]GPIO_EMIO_KEY_tri_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_EMIO_KEY " *) output [0:0]GPIO_EMIO_KEY_tri_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_EMIO_KEY " *) output [0:0]GPIO_EMIO_KEY_tri_t;

  wire [0:0]processing_system7_0_GPIO_0_TRI_I;
  wire [0:0]processing_system7_0_GPIO_0_TRI_O;
  wire [0:0]processing_system7_0_GPIO_0_TRI_T;

  assign GPIO_EMIO_KEY_tri_o[0] = processing_system7_0_GPIO_0_TRI_O;
  assign GPIO_EMIO_KEY_tri_t[0] = processing_system7_0_GPIO_0_TRI_T;
  assign processing_system7_0_GPIO_0_TRI_I = GPIO_EMIO_KEY_tri_i[0];
  gpio_emio_processing_system7_0_1 processing_system7_0
       (.GPIO_I(processing_system7_0_GPIO_0_TRI_I),
        .GPIO_O(processing_system7_0_GPIO_0_TRI_O),
        .GPIO_T(processing_system7_0_GPIO_0_TRI_T));
endmodule
