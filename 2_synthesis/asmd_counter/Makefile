rtl:
	rm -rf bin/
	mkdir bin
	iverilog -o bin/asmd_counter.vvp test/tb_asmd_counter.v src/asmd_counter.v
	vvp bin/asmd_counter.vvp
	gtkwave tb_asmd_counter.vcd

synth:
	yosys -p "read_verilog src/asmd_counter.v; read_liberty -lib ~/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; synth -top asmd_counter; write_verilog bin/first_level_synthesize_asmd_counter.v; abc -liberty ~/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; opt_clean asmd_counter; write_verilog bin/second_level_synthesize_asmd_counter.v; opt_clean asmd_counter; show -colors 2 -width -signed;"

clean:
	rm -rf bin/
	rm -rf *.vcd
	rm -rf *.xml
	rm -rf __pycache__

.PHONY: clean

	
