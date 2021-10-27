###############################################################################
# Created by write_sdc
# Wed Oct 27 00:25:25 2021
###############################################################################
current_design asmd_multiplier
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 100.0000 [get_ports {clk}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_input_delay 20.0000 -clock [get_clocks {clk}] -add_delay [get_ports {reset}]
set_input_delay 20.0000 -clock [get_clocks {clk}] -add_delay [get_ports {start}]
set_input_delay 20.0000 -clock [get_clocks {clk}] -add_delay [get_ports {word0[0]}]
set_input_delay 20.0000 -clock [get_clocks {clk}] -add_delay [get_ports {word0[1]}]
set_input_delay 20.0000 -clock [get_clocks {clk}] -add_delay [get_ports {word0[2]}]
set_input_delay 20.0000 -clock [get_clocks {clk}] -add_delay [get_ports {word0[3]}]
set_input_delay 20.0000 -clock [get_clocks {clk}] -add_delay [get_ports {word1[0]}]
set_input_delay 20.0000 -clock [get_clocks {clk}] -add_delay [get_ports {word1[1]}]
set_input_delay 20.0000 -clock [get_clocks {clk}] -add_delay [get_ports {word1[2]}]
set_input_delay 20.0000 -clock [get_clocks {clk}] -add_delay [get_ports {word1[3]}]
set_output_delay 20.0000 -clock [get_clocks {clk}] -add_delay [get_ports {product[0]}]
set_output_delay 20.0000 -clock [get_clocks {clk}] -add_delay [get_ports {product[1]}]
set_output_delay 20.0000 -clock [get_clocks {clk}] -add_delay [get_ports {product[2]}]
set_output_delay 20.0000 -clock [get_clocks {clk}] -add_delay [get_ports {product[3]}]
set_output_delay 20.0000 -clock [get_clocks {clk}] -add_delay [get_ports {product[4]}]
set_output_delay 20.0000 -clock [get_clocks {clk}] -add_delay [get_ports {product[5]}]
set_output_delay 20.0000 -clock [get_clocks {clk}] -add_delay [get_ports {product[6]}]
set_output_delay 20.0000 -clock [get_clocks {clk}] -add_delay [get_ports {product[7]}]
set_output_delay 20.0000 -clock [get_clocks {clk}] -add_delay [get_ports {ready}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0334 [get_ports {ready}]
set_load -pin_load 0.0334 [get_ports {product[7]}]
set_load -pin_load 0.0334 [get_ports {product[6]}]
set_load -pin_load 0.0334 [get_ports {product[5]}]
set_load -pin_load 0.0334 [get_ports {product[4]}]
set_load -pin_load 0.0334 [get_ports {product[3]}]
set_load -pin_load 0.0334 [get_ports {product[2]}]
set_load -pin_load 0.0334 [get_ports {product[1]}]
set_load -pin_load 0.0334 [get_ports {product[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_1 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clk}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_1 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {reset}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_1 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {start}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_1 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {word0[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_1 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {word0[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_1 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {word0[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_1 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {word0[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_1 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {word1[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_1 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {word1[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_1 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {word1[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_1 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {word1[0]}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_fanout 5.0000 [current_design]
