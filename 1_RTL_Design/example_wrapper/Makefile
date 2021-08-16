# COCOTB variables
export COCOTB_REDUCED_LOG_FMT=1
export PYTHONPATH := test:$(PYTHONPATH)

example_wrapper:
	rm -rf bin/
	mkdir bin
	iverilog -o bin/example_wrapper.vvp -s example_wrapper -s dump -g2012 src/example_wrapper.sv utils/dump_example_wrapper.sv
	PYTHONOPTIMIZE=${NOASSERT} MODULE=test_example_wrapper vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus  bin/example_wrapper.vvp
	! grep failure results.xml

show_graph:
	gtkwave example_wrapper.vcd

synth:
	yosys -p "read_verilog src/example_wrapper.v; proc; opt; show -colors 2 -width -signed"

clean:
	rm -rf bin/
	rm -rf *.vcd
	rm -rf *.xml
	rm -rf __pycache__

.PHONY: clean

	
