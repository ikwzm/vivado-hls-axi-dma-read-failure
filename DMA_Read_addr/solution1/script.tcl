############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
############################################################
open_project DMA_Read_addr
set_top DMA_Read_addr
add_files DMA_Read.h
add_files DMA_Read_addr.cpp
add_files DMA_Read.h
add_files DMA_Read_addr.cpp
add_files -tb DMA_Read_addr_tb.cpp
add_files -tb DMA_Read_addr_tb.cpp
open_solution "solution1"
set_part {xc7z020clg400-1} -tool vivado
create_clock -period 10 -name default
#source "./DMA_Read_addr/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
