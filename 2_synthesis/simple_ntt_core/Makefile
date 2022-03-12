rtl:
	rm -rf bin/
	mkdir bin
	iverilog -o bin/simple_ntt_core.vvp test/tb_simple_ntt_core.v src/simple_ntt_core.v
	vvp bin/simple_ntt_core.vvp
	gtkwave tb_simple_ntt_core.vcd

synth:
	yosys -p "read_verilog src/simple_ntt_core.v; read_liberty -lib ~/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; synth -top simple_ntt_core; write_verilog bin/first_level_synthesize_simple_ntt_core.v; abc -liberty ~/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; opt_clean simple_ntt_core; write_verilog bin/second_level_synthesize_simple_ntt_core.v; opt_clean simple_ntt_core; show -colors 2 -width -signed;"

clean:
	rm -rf bin/
	rm -rf *.vcd
	rm -rf *.xml
	rm -rf __pycache__

.PHONY: clean

	
