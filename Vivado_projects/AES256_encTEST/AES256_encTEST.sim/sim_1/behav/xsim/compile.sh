#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2021.1 (64-bit)
#
# Filename    : compile.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for compiling the simulation design source files
#
# Generated by Vivado on Thu Dec 23 14:48:19 CET 2021
# SW Build 3247384 on Thu Jun 10 19:36:07 MDT 2021
#
# IP Build 3246043 on Fri Jun 11 00:30:35 MDT 2021
#
# usage: compile.sh
#
# ****************************************************************************
set -Eeuo pipefail
# compile Verilog/System Verilog design sources
echo "xvlog --incr --relax -L uvm -prj tb_AES256_enc_vlog.prj"
xvlog --incr --relax -L uvm -prj tb_AES256_enc_vlog.prj 2>&1 | tee compile.log

echo "Waiting for jobs to finish..."
echo "No pending jobs, compilation finished."
