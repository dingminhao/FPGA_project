@echo off
REM ****************************************************************************
REM Vivado (TM) v2018.3 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Sun Jun 04 18:55:14 +0800 2023
REM SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
REM
REM Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
call xelab  -wto e29d772b466448f9a3ad5959f080ffff --incr --debug typical --relax --mt 2 -L blk_mem_gen_v8_4_2 -L xil_defaultlib -L fifo_generator_v13_2_3 -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot conv1_tb_behav xil_defaultlib.conv1_tb xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
