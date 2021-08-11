# COCOTB variables
export COCOTB_REDUCED_LOG_FMT=1
export PYTHONPATH := test:$(PYTHONPATH)

example_02_adder:
	rm -rf bin/
	mkdir bin
	iverilog -o bin/example_02_adder.vvp -s example_02_adder -s dump -g2012 src/example_02_adder.sv utils/dump_example_02_adder.sv
	PYTHONOPTIMIZE=${NOASSERT} MODULE=test_example_02_adder vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus  bin/example_02_adder.vvp
	! grep failure results.xml

show_graph:
	gtkwave example_02_adder.vcd

synth:
	yosys -p "read_verilog src/example_02_adder.v; proc; opt; show -colors 2 -width -signed"

clean:
	rm -rf bin/
	rm -rf *.vcd
	rm -rf *.xml
	rm -rf __pycache__

.PHONY: clean

	
