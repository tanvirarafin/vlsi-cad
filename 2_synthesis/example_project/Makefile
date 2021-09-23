-e rtl:
	rm -rf bin/
	mkdir bin
	iverilog -o bin/example_project.vvp test/tb_example_project.v src/example_project.v
	vvp bin/example_project.vvp
	gtkwave tb_example_project.vcd

synth:
	yosys -p "read_verilog src/example_project.v; read_liberty -lib ~/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; synth -top example_project; write_verilog bin/first_level_synthesize_example_project.v; abc -liberty ~/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; opt_clean example_project; write_verilog bin/second_level_synthesize_example_project.v; opt_clean example_project; show -colors 2 -width -signed;"

clean:
	rm -rf bin/
	rm -rf *.vcd
	rm -rf *.xml
	rm -rf __pycache__

.PHONY: clean

	
