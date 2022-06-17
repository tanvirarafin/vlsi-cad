rtl:
	rm -rf bin/
	mkdir bin
	iverilog -o bin/RISC_SPM.vvp test/tb_RISC_SPM.v src/RISC_SPM.v
	vvp bin/RISC_SPM.vvp
	gtkwave tb_RISC_SPM.vcd

synth:
	yosys -p "read_verilog src/RISC_SPM.v; read_liberty -lib ~/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; synth -top RISC_SPM; write_verilog bin/first_level_synthesize_RISC_SPM.v; abc -liberty ~/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; opt_clean RISC_SPM; write_verilog bin/second_level_synthesize_RISC_SPM.v; opt_clean RISC_SPM; show -colors 2 -width -signed;"

clean:
	rm -rf bin/
	rm -rf *.vcd
	rm -rf *.xml
	rm -rf __pycache__

.PHONY: clean

	
