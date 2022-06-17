`timescale 1ns/1ps
module tb_RISC_SPM#(parameter word_size=8)();
        reg rst;
	wire clk;
	reg write;
	reg [8:0] k;
        reg [word_size-1: 0] data_bus, address_bus;
        wire [word_size-1:0] memory_bus, instruction_bus;

		Clock_Unit M1(clk);
		RISC_SPM M2(.clk(clk),
		            .rst(rst),
		            .data_bus(data_bus),
		            .address_bus(address_bus),
		            .memory_bus(memory_bus),
		            .instruction_bus(instruction_bus),
		            .ext_write(write));

        initial begin
               $dumpfile("tb_RISC_SPM.vcd");
               $dumpvars(0, tb_RISC_SPM);
               #60000 $finish;
        end
        initial fork

              #500 address_bus = 8'b0000000;//nop
              #500 data_bus = 8'b0000_0000;
              #500 write = 1;
              #550 write = 0;
              #600 address_bus = 8'b1111_0000; //wmem
              #600 data_bus=8'b0000_0111;
              #600 write = 1;
              #650 write = 0;
              #800 address_bus = 8'b0000_0001;// read to r0
              #800 data_bus = 8'b0101_00_00;
              #850 write = 1;
              #900 write = 0;
              #1000 address_bus = 8'b0000_0010;//from this memory
              #1000 data_bus = 8'b1111_00_00;
              #1050 write = 1;
              #1100 write = 0;
              #1200 address_bus = 8'b1111_0001;//wmem
              #1200 data_bus = 8'b000_0011;
              #1250 write = 1;
              #1300 write = 0;
              #1400 address_bus = 8'b0000_0011;//read to r1
              #1400 data_bus = 8'b0101_00_01;
              #1450 write = 1;
              #1500 write = 0;
              #1600 address_bus = 8'b0000_0100; //from this memory
              #1600 data_bus = 8'b1111_0001;
              #1650 write = 1;
              #1700 write = 0;
              #1800 address_bus = 8'b0000_0101; //add r0,r1
              #1800 data_bus = 8'b0001_00_01;
              #1850 write = 1;
              #1900 write = 0;
              #2000 rst = 0;
              #2200 rst = 1;
        join

endmodule

		//clock unit section
module Clock_Unit (output reg clock);
	parameter delay = 0;
	parameter half_cycle = 10;
	initial begin #delay clock = 0; forever #half_cycle clock = ~clock; end
endmodule

