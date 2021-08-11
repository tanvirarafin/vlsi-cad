#!/bin/bash
# This file autogenerates directory structure for RTL codes

if [ $# -eq 0 ] 
then
	echo "Please provide the project name"
else
	mkdir $1 $1/src $1/utils $1/test
	echo "# COCOTB variables
export COCOTB_REDUCED_LOG_FMT=1
export PYTHONPATH := test:\$(PYTHONPATH)

$1:
\trm -rf bin/
\tmkdir bin
\tiverilog -o bin/$1.vvp -s $1 -s dump -g2012 src/$1.v utils/dump_$1.v
\tPYTHONOPTIMIZE=\${NOASSERT} MODULE=test_$1 vvp -M \$\$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus  bin/$1.vvp
\t! grep failure results.xml

show_graph:
\tgtkwave $1.vcd

synth:
\tyosys -p \"read_verilog src/$1.v; proc; opt; show -colors 2 -width -signed\"

clean:
\trm -rf bin/
\trm -rf *.vcd
\trm -rf *.xml
\trm -rf __pycache__

.PHONY: clean

	">> $1/Makefile
	echo "\`timescale 1ns/1ps
module $1;
endmodule
	" >> $1/src/$1.v

	echo "import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles
import random
	" >> $1/test/test_$1.py

	echo "module dump();
	initial begin
	    \$dumpfile (\"$1.vcd\");
	    \$dumpvars (0, $1);
	    #1;
	end
endmodule
	" >> $1/utils/dump_$1.v
fi
