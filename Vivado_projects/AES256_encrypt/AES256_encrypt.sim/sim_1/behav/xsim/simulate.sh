#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2021.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Sun Sep 26 10:39:33 CEST 2021
# SW Build 3247384 on Thu Jun 10 19:36:07 MDT 2021
#
# IP Build 3246043 on Fri Jun 11 00:30:35 MDT 2021
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# simulate design
echo "xsim tb_AES256_enc_behav -key {Behavioral:sim_1:Functional:tb_AES256_enc} -tclbatch tb_AES256_enc.tcl -view /home/adrian/Desktop/AES256-HW-Accelerator/Vivado_projects/AES256_encrypt/tb_AES256_enc_behav.wcfg -log simulate.log"
xsim tb_AES256_enc_behav -key {Behavioral:sim_1:Functional:tb_AES256_enc} -tclbatch tb_AES256_enc.tcl -view /home/adrian/Desktop/AES256-HW-Accelerator/Vivado_projects/AES256_encrypt/tb_AES256_enc_behav.wcfg -log simulate.log

