#
# create_project.tcl  Tcl script for creating project
#
set project_directory       [file dirname [info script]]
set project_name            "project"
set device_parts            "xc7z010clg400-1"
set design_bd_tcl_file      [file join $project_directory ".." "src" "main" "tcl" "design_1_bd.tcl"]
lappend ip_repo_path_list   [file join $project_directory ".." "DMA_Read_addr" "solution1" "impl" "ip"]
#
# Create project
#
create_project -force $project_name $project_directory
cd $project_directory
#
# Set project properties
#
set_property "part"               $device_parts    [get_projects $project_name]
set_property "default_lib"        "xil_defaultlib" [get_projects $project_name]
set_property "simulator_language" "Mixed"          [get_projects $project_name]
set_property "target_language"    "Verilog"        [get_projects $project_name]
#
# Create fileset "sources_1"
#
if {[string equal [get_filesets -quiet sources_1] ""]} {
    create_fileset -srcset sources_1
}
#
# Create fileset "constrs_1"
#
if {[string equal [get_filesets -quiet constrs_1] ""]} {
    create_fileset -constrset constrs_1
}
#
# Create fileset "sim_1"
#
if {[string equal [get_filesets -quiet sim_1] ""]} {
    create_fileset -simset sim_1
}
#
# Create run "synth_1" and set property
#
if {[string equal [get_runs -quiet synth_1] ""]} {
    create_run -name synth_1 -part $device_parts -flow "Vivado Synthesis 2015" -strategy "Vivado Synthesis Defaults" -constrset constrs_1
} else {
  # set_property flow     "Vivado Synthesis 2014"     [get_runs synth_1]
    set_property strategy "Vivado Synthesis Defaults" [get_runs synth_1]
    set_property strategy "Flow_PerfOptimized_High"   [get_runs synth_1]
}
current_run -synthesis [get_runs synth_1]
#
# Create run "impl_1" and set property
#
if {[string equal [get_runs -quiet impl_1] ""]} {
    create_run -name impl_1 -part $device_parts -flow "Vivado Implementation 2015" -strategy "Vivado Implementation Defaults" -constrset constrs_1 -parent_run synth_1
} else {
  # set_property flow     "Vivado Implementation 2014"     [get_runs impl_1]
    set_property strategy "Vivado Implementation Defaults" [get_runs impl_1]
    set_property strategy "Performance_Explore"            [get_runs impl_1]
}
current_run -implementation [get_runs impl_1]
#
# Set 'sources_1' and 'sim_1' fileset object
#

proc add_vhdl_file {fileset library_name file_name} {
    set file    [file normalize $file_name]
    set fileset [get_filesets   $fileset  ] 
    add_files -norecurse -fileset $fileset $file
    set file_obj [get_files -of_objects $fileset $file]
    set_property "file_type" "VHDL"        $file_obj
    set_property "library"   $library_name $file_obj
}
source "add_sim.tcl"
#
# Set IP Repository
#
if {[info exists ip_repo_path_list] && [llength $ip_repo_path_list] > 0 } {
    set_property ip_repo_paths $ip_repo_path_list [current_fileset]
    update_ip_catalog
}
#
# Create block design
#
if {[info exists design_bd_tcl_file]} {
    # 
    # Read block design file
    #
    source $design_bd_tcl_file
    #
    # Save block design
    #
    regenerate_bd_layout
    save_bd_design
    #
    # Generate wrapper files
    #
    set design_bd_name  [get_bd_designs]
    make_wrapper -files [get_files $design_bd_name.bd] -top -import
}
#
# Import Constraint files
#
if {[info exists constrs_file_list] && [llength $constrs_file_list] > 0 } {
    add_files    -fileset constrs_1 -norecurse $constrs_file_list
}
#
# Set 'sim_1' fileset properties
#
set obj [get_filesets sim_1]
set_property "top" "TEST_BENCH"  $obj
set_property "generic" "SCENARIO_FILE=../../../../../src/test/scenarios/test_1.snr" $obj
set_property -name {xsim.simulate.runtime} -value {10000000ns} -objects $obj
