# COCOTB variables
export COCOTB_REDUCED_LOG_FMT=1
export PYTHONPATH := test:$(PYTHONPATH)

example_4_simple_mips:
	rm -rf bin/
	mkdir bin
	iverilog -o bin/example_4_simple_mips.vvp -s example_4_simple_mips -s dump -g2012 src/example_4_simple_mips.v utils/dump_example_4_simple_mips.v
	PYTHONOPTIMIZE=${NOASSERT} MODULE=test_example_4_simple_mips vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus  bin/example_4_simple_mips.vvp
	! grep failure results.xml

mux4:
	rm -rf bin/
	mkdir bin
	iverilog -o bin/mux4.vvp -s mux4 -s dump -g2012 src/mux4.v utils/dump_mux4.v
	PYTHONOPTIMIZE=${NOASSERT} MODULE=test_mux4 vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus  bin/mux4.vvp
	! grep failure results.xml

show_graph:
	gtkwave example_4_simple_mips.vcd

synth:
	yosys -p "read_verilog src/example_4_simple_mips.v; proc; opt; show -colors 2 -width -signed"

clean:
	rm -rf bin/
	rm -rf *.vcd
	rm -rf *.xml
	rm -rf __pycache__

.PHONY: clean

	
