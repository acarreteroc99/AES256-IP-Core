// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Tue Feb 15 18:03:05 2022
// Host        : pc6253 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/RMartinez/Projects/RiscV/ProyectoAdrin/vivado/prueba1/prueba1.srcs/sources_1/bd/prueba_bd/ip/prueba_bd_ila_0_0/prueba_bd_ila_0_0_stub.v
// Design      : prueba_bd_ila_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ila,Vivado 2020.1" *)
module prueba_bd_ila_0_0(clk, probe0, probe1, probe2, probe3, probe4, probe5, 
  probe6, probe7, probe8, probe9, probe10, probe11, probe12, probe13, probe14, probe15, probe16, probe17, 
  probe18)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[0:0],probe1[3:0],probe2[1:0],probe3[0:0],probe4[0:0],probe5[3:0],probe6[0:0],probe7[0:0],probe8[0:0],probe9[0:0],probe10[31:0],probe11[0:0],probe12[0:0],probe13[1:0],probe14[31:0],probe15[3:0],probe16[0:0],probe17[2:0],probe18[2:0]" */;
  input clk;
  input [0:0]probe0;
  input [3:0]probe1;
  input [1:0]probe2;
  input [0:0]probe3;
  input [0:0]probe4;
  input [3:0]probe5;
  input [0:0]probe6;
  input [0:0]probe7;
  input [0:0]probe8;
  input [0:0]probe9;
  input [31:0]probe10;
  input [0:0]probe11;
  input [0:0]probe12;
  input [1:0]probe13;
  input [31:0]probe14;
  input [3:0]probe15;
  input [0:0]probe16;
  input [2:0]probe17;
  input [2:0]probe18;
endmodule
