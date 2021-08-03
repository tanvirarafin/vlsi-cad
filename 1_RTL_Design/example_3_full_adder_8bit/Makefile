
# COCOTB variables
export COCOTB_REDUCED_LOG_FMT=1
export PYTHONPATH := test:$(PYTHONPATH)

example_3_full_adder_8bit:
	rm -rf bin/
	mkdir bin
	iverilog -o bin/example_3_full_adder_8bit.vvp -s example_3_full_adder_8bit -s dump -g2012 src/example_3_full_adder_8bit.v utils/dump_example_3_full_adder_8bit.v
	PYTHONOPTIMIZE=${NOASSERT} MODULE=test_example_3_full_adder_8bit vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus  bin/example_3_full_adder_8bit.vvp
	! grep failure results.xml

show_graph:
	gtkwave example_3_full_adder_8bit.vcd

synth:
	yosys -p "read_verilog src/example_3_full_adder_8bit.v ; proc ; opt ; show -colors 2 -width -signed"

clean:
	rm -rf bin/
	rm -rf *.vcd
	rm -rf *.xml
	rm -rf __pycache__

.PHONY: clean

	
