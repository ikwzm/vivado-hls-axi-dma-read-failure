
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2016.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z020clg484-1
   set_property BOARD_PART xilinx.com:zc702:part0:1.2 [current_project]
}


# CHANGE DESIGN NAME HERE
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set M00_AXI [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M00_AXI ]
  set_property -dict [ list \
CONFIG.ADDR_WIDTH {32} \
CONFIG.DATA_WIDTH {32} \
CONFIG.HAS_BURST {0} \
CONFIG.NUM_READ_OUTSTANDING {16} \
CONFIG.NUM_WRITE_OUTSTANDING {16} \
CONFIG.PROTOCOL {AXI4} \
 ] $M00_AXI
  set S00_AXI [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI ]
  set_property -dict [ list \
CONFIG.ADDR_WIDTH {16} \
CONFIG.ARUSER_WIDTH {0} \
CONFIG.AWUSER_WIDTH {0} \
CONFIG.BUSER_WIDTH {0} \
CONFIG.DATA_WIDTH {32} \
CONFIG.HAS_BRESP {1} \
CONFIG.HAS_BURST {0} \
CONFIG.HAS_CACHE {0} \
CONFIG.HAS_LOCK {0} \
CONFIG.HAS_PROT {0} \
CONFIG.HAS_QOS {0} \
CONFIG.HAS_REGION {0} \
CONFIG.HAS_RRESP {1} \
CONFIG.HAS_WSTRB {1} \
CONFIG.ID_WIDTH {0} \
CONFIG.MAX_BURST_LENGTH {1} \
CONFIG.NUM_READ_OUTSTANDING {1} \
CONFIG.NUM_READ_THREADS {1} \
CONFIG.NUM_WRITE_OUTSTANDING {1} \
CONFIG.NUM_WRITE_THREADS {1} \
CONFIG.PROTOCOL {AXI4LITE} \
CONFIG.READ_WRITE_MODE {READ_WRITE} \
CONFIG.RUSER_BITS_PER_BYTE {0} \
CONFIG.RUSER_WIDTH {0} \
CONFIG.SUPPORTS_NARROW_BURST {0} \
CONFIG.WUSER_BITS_PER_BYTE {0} \
CONFIG.WUSER_WIDTH {0} \
 ] $S00_AXI
  set outs [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 outs ]

  # Create ports
  set active_frame_V [ create_bd_port -dir I -from 1 -to 0 -type data active_frame_V ]
  set_property -dict [ list \
CONFIG.LAYERED_METADATA {xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 2} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}} \
 ] $active_frame_V
  set ap_clk [ create_bd_port -dir I -type clk ap_clk ]
  set ap_rst_n [ create_bd_port -dir I -type rst ap_rst_n ]
  set interrupt [ create_bd_port -dir O -type intr interrupt ]

  # Create instance: DMA_Read_addr_0, and set properties
  set DMA_Read_addr_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:DMA_Read_addr:1.0 DMA_Read_addr_0 ]

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [ list \
CONFIG.NUM_MI {1} \
 ] $axi_interconnect_0

  # Create instance: axi_interconnect_1, and set properties
  set axi_interconnect_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_1 ]
  set_property -dict [ list \
CONFIG.NUM_MI {1} \
 ] $axi_interconnect_1

  # Create interface connections
  connect_bd_intf_net -intf_net DMA_Read_addr_0_m_axi_in_r [get_bd_intf_pins DMA_Read_addr_0/m_axi_in_r] [get_bd_intf_pins axi_interconnect_1/S00_AXI]
  connect_bd_intf_net -intf_net DMA_Read_addr_0_outs [get_bd_intf_ports outs] [get_bd_intf_pins DMA_Read_addr_0/outs]
  connect_bd_intf_net -intf_net S00_AXI_1 [get_bd_intf_ports S00_AXI] [get_bd_intf_pins axi_interconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins DMA_Read_addr_0/s_axi_AXILiteS] [get_bd_intf_pins axi_interconnect_0/M00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_1_M00_AXI [get_bd_intf_ports M00_AXI] [get_bd_intf_pins axi_interconnect_1/M00_AXI]

  # Create port connections
  connect_bd_net -net ACLK_1 [get_bd_ports ap_clk] [get_bd_pins DMA_Read_addr_0/ap_clk] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins axi_interconnect_1/ACLK] [get_bd_pins axi_interconnect_1/M00_ACLK] [get_bd_pins axi_interconnect_1/S00_ACLK]
  connect_bd_net -net DMA_Read_addr_0_interrupt [get_bd_ports interrupt] [get_bd_pins DMA_Read_addr_0/interrupt]
  connect_bd_net -net active_frame_V_1 [get_bd_ports active_frame_V] [get_bd_pins DMA_Read_addr_0/active_frame_V]
  connect_bd_net -net ap_rst_n [get_bd_ports ap_rst_n] [get_bd_pins DMA_Read_addr_0/ap_rst_n] [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins axi_interconnect_1/ARESETN] [get_bd_pins axi_interconnect_1/M00_ARESETN] [get_bd_pins axi_interconnect_1/S00_ARESETN]

  # Create address segments
  create_bd_addr_seg -range 0x20000000 -offset 0x00000000 [get_bd_addr_spaces DMA_Read_addr_0/Data_m_axi_in_r] [get_bd_addr_segs M00_AXI/Reg] SEG_M00_AXI_Reg
  create_bd_addr_seg -range 0x00001000 -offset 0x00000000 [get_bd_addr_spaces S00_AXI] [get_bd_addr_segs DMA_Read_addr_0/s_axi_AXILiteS/Reg] SEG_DMA_Read_addr_0_Reg

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.6.5b  2016-09-06 bk=1.3687 VDI=39 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port outs -pg 1 -y 180 -defaultsOSRD
preplace port S00_AXI -pg 1 -y 90 -defaultsOSRD
preplace port ap_clk -pg 1 -y 310 -defaultsOSRD
preplace port ap_rst_n -pg 1 -y 290 -defaultsOSRD
preplace port interrupt -pg 1 -y 200 -defaultsOSRD
preplace port M00_AXI -pg 1 -y 70 -defaultsOSRD
preplace portBus active_frame_V -pg 1 -y 270 -defaultsOSRD
preplace inst axi_interconnect_0 -pg 1 -lvl 1 -y 150 -defaultsOSRD
preplace inst axi_interconnect_1 -pg 1 -lvl 3 -y 70 -defaultsOSRD
preplace inst DMA_Read_addr_0 -pg 1 -lvl 2 -y 180 -defaultsOSRD
preplace netloc DMA_Read_addr_0_outs 1 2 2 610J 190 880J
preplace netloc DMA_Read_addr_0_interrupt 1 2 2 NJ 200 NJ
preplace netloc ACLK_1 1 0 3 20 30 290 30 610
preplace netloc active_frame_V_1 1 0 2 NJ 270 300J
preplace netloc S00_AXI_1 1 0 1 NJ
preplace netloc ap_rst_n 1 0 3 30 290 290 290 620
preplace netloc axi_interconnect_0_M00_AXI 1 1 1 N
preplace netloc axi_interconnect_1_M00_AXI 1 3 1 NJ
preplace netloc DMA_Read_addr_0_m_axi_in_r 1 2 1 600
levelinfo -pg 1 0 160 450 750 910 -top -40 -bot 420
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


