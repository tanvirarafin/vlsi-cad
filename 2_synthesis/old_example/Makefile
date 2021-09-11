rtl:
	iverilog -o example_design.vvp tb_example_design.v example_design.v
	vvp example_design.vvp
synth:
	yosys -p "read_verilog example_design.v; read_liberty -lib ~/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; synth -top example_design; write_verilog first_level_synthesize_example_design.v; abc -liberty ~/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; opt_clean example_design; write_verilog second_level_synthesize_example_design.v; show -colors 2 -width -signed;"
