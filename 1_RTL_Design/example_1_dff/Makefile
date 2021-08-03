# COCOTB variables
export COCOTB_REDUCED_LOG_FMT=1
export PYTHONPATH := test:$(PYTHONPATH)

test_counter:
	iverilog -o counter.vvp -s counter -s dump -g2012 counter.v dump_counter.v
	PYTHONOPTIMIZE=${NOASSERT} MODULE=test_counter vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus  counter.vvp

test_dff:
	iverilog -o dff.vvp -s dff -s dump -g2012 dff.v dump_dff.v
	PYTHONOPTIMIZE=${NOASSERT} MODULE=test_dff vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus  dff.vvp