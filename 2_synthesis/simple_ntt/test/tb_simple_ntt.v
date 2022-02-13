`timescale 1ns/1ps
module tb_simple_ntt;

        parameter data_width = 32, max_buffer_length = 4;
         wire [data_width-1:0] out_stream;
         wire  ready;
         reg [data_width-1:0] in_stream;
         reg start, clk, reset;


        simple_ntt module1(.out_stream(out_stream),
                            .ready(ready),
                            .in_stream(in_stream),
                            .start(start),
                            .clk(clk),
                            .reset(reset));
        initial begin
               $dumpfile("tb_simple_ntt.vcd");
               $dumpvars(0, tb_simple_ntt);
               #200 $finish;
        end
        initial begin
            clk = 1'b0;
            forever #5 clk=~clk;
        end

        initial fork
            #20 reset = 1;
            #30 reset = 0;
            #40 start = 1;
            #50 in_stream = 32'hABCDEF00;
            #60 in_stream = 32'h12345678;
            #70 in_stream = 32'hAAAAAAAA;
            #80 in_stream = 32'hBBBBBBBB;

        join
endmodule
	
