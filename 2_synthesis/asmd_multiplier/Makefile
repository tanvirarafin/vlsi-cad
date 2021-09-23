rtl:
	rm -rf bin/
	mkdir bin
	iverilog -o bin/asmd_multiplier.vvp test/tb_asmd_multiplier.v src/asmd_multiplier.v
	vvp bin/asmd_multiplier.vvp
	gtkwave tb_asmd_multiplier.vcd

synth:
	yosys -p "read_verilog src/asmd_multiplier.v; read_liberty -lib ~/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; synth -top asmd_multiplier; write_verilog bin/first_level_synthesize_asmd_multiplier.v; abc -liberty ~/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; opt_clean asmd_multiplier; write_verilog bin/second_level_synthesize_asmd_multiplier.v; opt_clean asmd_multiplier; show -colors 2 -width -signed;"

clean:
	rm -rf bin/
	rm -rf *.vcd
	rm -rf *.xml
	rm -rf __pycache__

.PHONY: clean

	
