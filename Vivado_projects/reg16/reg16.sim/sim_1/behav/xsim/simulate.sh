#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2021.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Sat Sep 18 18:57:16 CEST 2021
# SW Build 3247384 on Thu Jun 10 19:36:07 MDT 2021
#
# IP Build 3246043 on Fri Jun 11 00:30:35 MDT 2021
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# simulate design
echo "xsim tb_mod_reg16_behav -key {Behavioral:sim_1:Functional:tb_mod_reg16} -tclbatch tb_mod_reg16.tcl -view /home/adrian/Desktop/AES256-HW-Accelerator/Vivado_projects/reg16/tb_mod_reg16_behav.wcfg -log simulate.log"
xsim tb_mod_reg16_behav -key {Behavioral:sim_1:Functional:tb_mod_reg16} -tclbatch tb_mod_reg16.tcl -view /home/adrian/Desktop/AES256-HW-Accelerator/Vivado_projects/reg16/tb_mod_reg16_behav.wcfg -log simulate.log

