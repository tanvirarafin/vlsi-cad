# COCOTB variables
export COCOTB_REDUCED_LOG_FMT=1
export PYTHONPATH := test:$(PYTHONPATH)

example_mux2:
	rm -rf bin/
	mkdir bin
	iverilog -o bin/example_mux2.vvp -s example_mux2 -s dump -g2012 src/example_mux2.sv utils/dump_example_mux2.sv
	PYTHONOPTIMIZE=${NOASSERT} MODULE=test_example_mux2 vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus  bin/example_mux2.vvp
	! grep failure results.xml

show_graph:
	gtkwave example_mux2.vcd

synth:
	yosys -p "read_verilog -sv src/example_mux2.sv; proc; opt; show -colors 2 -width -signed"

clean:
	rm -rf bin/
	rm -rf *.vcd
	rm -rf *.xml
	rm -rf __pycache__

.PHONY: clean

	
