#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2021.1 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Sat Sep 18 17:35:35 CEST 2021
# SW Build 3247384 on Thu Jun 10 19:36:07 MDT 2021
#
# IP Build 3246043 on Fri Jun 11 00:30:35 MDT 2021
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# elaborate design
echo "xelab -wto 7fcbd61d3668479584eac1572c6acd9c --incr --debug typical --relax --mt 8 -L xil_defaultlib -L uvm -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_mod_reg16_16to1_behav xil_defaultlib.tb_mod_reg16_16to1 xil_defaultlib.glbl -log elaborate.log"
xelab -wto 7fcbd61d3668479584eac1572c6acd9c --incr --debug typical --relax --mt 8 -L xil_defaultlib -L uvm -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_mod_reg16_16to1_behav xil_defaultlib.tb_mod_reg16_16to1 xil_defaultlib.glbl -log elaborate.log

