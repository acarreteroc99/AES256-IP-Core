-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Wed Mar  2 17:32:59 2022
-- Host        : pc6253 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/RMartinez/Projects/RiscV/ProyectoAdrin/vivado/prueba1/prueba1.srcs/sources_1/bd/prueba_bd/ip/prueba_bd_ila_1_0/prueba_bd_ila_1_0_stub.vhdl
-- Design      : prueba_bd_ila_1_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity prueba_bd_ila_1_0 is
  Port ( 
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe1 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    probe2 : in STD_LOGIC_VECTOR ( 127 downto 0 )
  );

end prueba_bd_ila_1_0;

architecture stub of prueba_bd_ila_1_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe0[31:0],probe1[127:0],probe2[127:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "ila,Vivado 2020.1";
begin
end;
