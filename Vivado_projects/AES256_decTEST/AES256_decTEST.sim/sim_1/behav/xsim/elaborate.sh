#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2021.1 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Sun Dec 12 20:40:23 CET 2021
# SW Build 3247384 on Thu Jun 10 19:36:07 MDT 2021
#
# IP Build 3246043 on Fri Jun 11 00:30:35 MDT 2021
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# elaborate design
echo "xelab -wto 7be048bf88ca4dc2bb19671bb4a44f1e --incr --debug typical --relax --mt 8 -L xil_defaultlib -L uvm -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_AES256_dec_behav xil_defaultlib.tb_AES256_dec xil_defaultlib.glbl -log elaborate.log"
xelab -wto 7be048bf88ca4dc2bb19671bb4a44f1e --incr --debug typical --relax --mt 8 -L xil_defaultlib -L uvm -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_AES256_dec_behav xil_defaultlib.tb_AES256_dec xil_defaultlib.glbl -log elaborate.log

