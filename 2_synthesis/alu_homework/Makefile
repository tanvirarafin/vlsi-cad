rtl:
	rm -rf bin/
	mkdir bin
	iverilog -o bin/alu_homework.vvp test/tb_alu_homework.v src/alu_homework.v
	vvp bin/alu_homework.vvp
	gtkwave tb_alu_homework.vcd

synth:
	yosys -p "read_verilog src/alu_homework.v; read_liberty -lib ~/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; synth -top alu_homework; write_verilog bin/first_level_synthesize_alu_homework.v; abc -liberty ~/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; opt_clean alu_homework; write_verilog bin/second_level_synthesize_alu_homework.v; opt_clean alu_homework; show -colors 2 -width -signed;"

clean:
	rm -rf bin/
	rm -rf *.vcd
	rm -rf *.xml
	rm -rf __pycache__

.PHONY: clean

	
