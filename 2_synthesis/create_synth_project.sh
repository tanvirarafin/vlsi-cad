#!/bin/bash
# This file autogenerates directory structure for RTL codes

if [ $# -eq 0 ] 
then
	echo "Please provide the project name"
else
	mkdir $1 $1/src $1/test
	echo  -e "rtl:
\trm -rf bin/
\tmkdir bin
\tiverilog -o bin/$1.vvp test/tb_$1.v src/$1.v
\tvvp bin/$1.vvp
\tgtkwave tb_$1.vcd

synth:
\tyosys -p \"read_verilog src/$1.v; read_liberty -lib ~/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; synth -top $1; write_verilog bin/first_level_synthesize_$1.v; abc -liberty ~/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; opt_clean $1; write_verilog bin/second_level_synthesize_$1.v; opt_clean $1; show -colors 2 -width -signed;\"

clean:
\trm -rf bin/
\trm -rf *.vcd
\trm -rf *.xml
\trm -rf __pycache__

.PHONY: clean

	">> $1/Makefile
	echo "module $1;
endmodule
	" >> $1/src/$1.v
	echo "\`timescale 1ns/1ps
module tb_$1;
        //reg reset, clk;
        //reg ;
        //wire ;

        //$1 module1();
        initial begin
               \$dumpfile(\"tb_$1.vcd\");
               \$dumpvars(0, tb_$1);
               #100 \$finish;
        end

endmodule
	" >> $1/test/tb_$1.v
fi
