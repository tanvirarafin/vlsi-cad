# COCOTB variables
export COCOTB_REDUCED_LOG_FMT=1
export PYTHONPATH := test:$(PYTHONPATH)

example_01_mux:
	rm -rf bin/
	mkdir bin
	iverilog -o bin/example_01_mux.vvp -s example_01_mux -s dump -g2012 src/example_01_mux.v utils/dump_example_01_mux.v
	PYTHONOPTIMIZE=${NOASSERT} MODULE=test_example_01_mux vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus  bin/example_01_mux.vvp
	! grep failure results.xml

show_graph:
	gtkwave example_01_mux.vcd

synth:
	yosys -p "read_verilog src/example_01_mux.v; proc; opt; show -colors 2 -width -signed"

clean:
	rm -rf bin/
	rm -rf *.vcd
	rm -rf *.xml
	rm -rf __pycache__

.PHONY: clean

	
