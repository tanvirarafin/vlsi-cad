rtl:
	rm -rf bin/
	mkdir bin
	iverilog -o bin/adder.vvp test/tb_adder.v src/adder.v
	vvp bin/adder.vvp
	gtkwave tb_adder.vcd

synth:
	yosys -p "read_verilog src/adder.v; read_liberty -lib ~/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; synth -top adder; write_verilog bin/first_level_synthesize_adder.v; abc -liberty ~/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; opt_clean adder; write_verilog bin/second_level_synthesize_adder.v; opt_clean adder; show -colors 2 -width -signed;"

clean:
	rm -rf bin/
	rm -rf *.vcd
	rm -rf *.xml
	rm -rf __pycache__

.PHONY: clean

	
