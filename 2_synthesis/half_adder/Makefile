rtl:
	rm -rf bin/
	mkdir bin
	iverilog -o bin/half_adder.vvp test/tb_half_adder.v src/half_adder.v
	vvp bin/half_adder.vvp
	gtkwave tb_half_adder.vcd

synth:
	yosys -p "read_verilog src/half_adder.v; read_liberty -lib ~/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; synth -top half_adder; write_verilog bin/first_level_synthesize_half_adder.v; abc -liberty ~/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; opt_clean half_adder; write_verilog bin/second_level_synthesize_half_adder.v; opt_clean half_adder; show -colors 2 -width -signed;"

clean:
	rm -rf bin/
	rm -rf *.vcd
	rm -rf *.xml
	rm -rf __pycache__

.PHONY: clean

	
