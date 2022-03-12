rtl:
	rm -rf bin/
	mkdir bin
	iverilog -o bin/adder_homework.vvp test/tb_adder_homework.v src/adder_homework.v
	vvp bin/adder_homework.vvp
	gtkwave tb_adder_homework.vcd

synth:
	yosys -p "read_verilog src/adder_homework.v; read_liberty -lib ~/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; synth -top adder_homework; write_verilog bin/first_level_synthesize_adder_homework.v; abc -liberty ~/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; opt_clean adder_homework; write_verilog bin/second_level_synthesize_adder_homework.v; opt_clean adder_homework; show -colors 2 -width -signed;"

clean:
	rm -rf bin/
	rm -rf *.vcd
	rm -rf *.xml
	rm -rf __pycache__

.PHONY: clean

	
