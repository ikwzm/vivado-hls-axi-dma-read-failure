Project where DMA Read made with Vivado-HLS failed in post-synthesis simulation.
================================================================================

## Requirements

* Vivado 2016.4
* Vivado-HLS 2016.4

## Install

```
shell$ git clone https://github.com/ikwzm/vivado-hls-axi-dma-read-failure.git
shell$ cd vivado-hls-axi-dma-read-failure
shell$ git submodule init
shell$ git submodule update
```

## Behavioral simulation _OK Case_

### Create project

```
Vivado > Run Tcl script... > project_behav_sim/create_project.tcl
```

### Run Simulation

```
Vivado > Flow Navigator > Simulation > Run Simulation > Run Behavioral Simulation
```

```
# run 100000ns
        35 ns| MARCHAL < TEST 1
      1065 ns| MARCHAL < TEST.1.0
  ***  
  ***  ERROR REPORT test
  ***  [ S00 ]
  ***    Error    : 0
  ***    Mismatch : 0
  ***    Warning  : 0
  ***  
  ***  [ M00 ]
  ***    Error    : 0
  ***    Mismatch : 0
  ***    Warning  : 0
  ***  
  ***  [ OUT ]
  ***    Error    : 0
  ***    Mismatch : 0
  ***    Warning  : 0
  ***
```

## Post Synthesis Simulation _OK Case_

### Create project

```
Vivado > Run Tcl script... > project_post_synth_sim_ok/create_project.tcl
```

### Run Synthesis

```
Vivado > Flow Navigator > Run Synthesis
```

### Run Simulation

```
Vivado > Flow Navigator > Run Simulation > Run Post-Synthesis Functional Simulation
```

```
# run 10000000ns
        35 ns| MARCHAL < TEST 1
      1065 ns| MARCHAL < TEST.1.0
  ***  
  ***  ERROR REPORT test
  ***  [ S00 ]
  ***    Error    : 0
  ***    Mismatch : 0
  ***    Warning  : 0
  ***  
  ***  [ M00 ]
  ***    Error    : 0
  ***    Mismatch : 0
  ***    Warning  : 0
  ***  
  ***  [ OUT ]
  ***    Error    : 0
  ***    Mismatch : 0
  ***    Warning  : 0
  ***
```

## Post Synthesis Simulation _NG Case_

### Create project

```
Vivado > Run Tcl script... > project_post_synth_sim_ng/create_project.tcl
```

### Run Synthesis

```
Vivado > Flow Navigator > Run Synthesis
```

### Run Simulation

```
Vivado > Flow Navigator > Run Simulation > Run Post-Synthesis Functional Simulation
```

```
# run 10000000ns
        35 ns| MARCHAL < TEST 1
      1065 ns| MARCHAL < TEST.1.0
##### Failure :     100065 ns (M00.AR) EXECUTE_TRANSACTION_SLAVE_READ_ADDR WAIT AR Time Out!
   name       : M00
   stream_name: ../../../../../src/test/scenarios/test_1.snr(23,53,53)
   curr_state : STATE_FLOW_MAP_END(12,MAPKEY_NULL)
   prev_state : STATE_BLOCK_MAP_IMPLICIT_END(5,MAPKEY_NULL)
   prev_state : STATE_BLOCK_SEQ_END(3,MAPKEY_NULL)
   prev_state : STATE_BLOCK_MAP_IMPLICIT_END(3,MAPKEY_NULL)
   prev_state : STATE_BLOCK_SEQ_END(1,MAPKEY_NULL)
   prev_state : STATE_DOCUMENT(0,MAPKEY_NULL)
   text_line  : 		   0x00000000, 0x00000000, 0x00000000, 0x00000000]}
               |                                                    ^|
Failure: EXECUTE_TRANSACTION_SLAVE_READ_ADDR WAIT AR Time Out!

```

## Difference between OK Case and NG Case

```
shell$ diff project_post_synth_sim_ok/create_project.tcl project_post_synth_sim_ng/create_project.tcl 
20c20
< set_property "target_language"    "VHDL"           [get_projects $project_name]
---
> set_property "target_language"    "Verilog"        [get_projects $project_name]
```

