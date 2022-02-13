rtl:
	rm -rf bin/
	mkdir bin
	iverilog -o bin/simple_ntt.vvp test/tb_simple_ntt.v src/simple_ntt.v
	vvp bin/simple_ntt.vvp
	gtkwave tb_simple_ntt.vcd

synth:
	yosys -p "read_verilog src/simple_ntt.v; read_liberty -lib ~/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; synth -top simple_ntt; write_verilog bin/first_level_synthesize_simple_ntt.v; abc -liberty ~/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; opt_clean simple_ntt; write_verilog bin/second_level_synthesize_simple_ntt.v; opt_clean simple_ntt; show -colors 2 -width -signed;"

clean:
	rm -rf bin/
	rm -rf *.vcd
	rm -rf *.xml
	rm -rf __pycache__

.PHONY: clean

	
