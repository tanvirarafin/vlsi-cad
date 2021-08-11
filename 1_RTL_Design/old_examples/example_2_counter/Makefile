# COCOTB variables
export COCOTB_REDUCED_LOG_FMT=1
export PYTHONPATH := test:$(PYTHONPATH)

counter:
	rm -rf bin/
	mkdir bin
	iverilog -o bin/counter.vvp -s counter -s dump -g2012 src/counter.v utils/dump_counter.v
	PYTHONOPTIMIZE=${NOASSERT} MODULE=test_counter vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus  bin/counter.vvp
	! grep failure results.xml

show_graph:
	gtkwave counter.vcd

synth_counter:
	yosys -p "read_verilog src/counter.v; proc; opt; show -colors 2 -width -signed"

clean:
	rm -rf bin/
	rm -rf *.vcd
	rm -rf *.xml
	rm -rf __pycache__

.PHONY: clean
