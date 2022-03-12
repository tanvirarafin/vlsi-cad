`timescale 1ns/1ps
module tb_simple_ntt_core;
        reg reset, clk;
        parameter data_width = 32, max_buffer_size = 4;
        wire [data_width-1:0] output_buffer;
        reg [data_width-1:0] input_buffer0;
        reg [data_width-1:0] input_buffer1;
        reg [data_width-1:0] input_buffer2;
        reg [data_width-1:0] input_buffer3;
        reg index;



        simple_ntt_core module1(.output_buffer(output_buffer),
                                .input_buffer0(input_buffer0),
                                .input_buffer1(input_buffer1),
                                .input_buffer2(input_buffer2),
                                .input_buffer3(input_buffer3),
                                .index(index),
                                .clk(clk),
                                .reset(reset));
        initial begin
               $dumpfile("tb_simple_ntt_core.vcd");
               $dumpvars(0, tb_simple_ntt_core);
               #100 $finish;
        end
        initial begin
            clk = 1'b0;
            forever #5 clk=~clk;
        end

        initial fork
            #10 input_buffer0 = 32'd1;
            #10 input_buffer1 = 32'd2;
            #10 input_buffer2 = 32'd3;
            #10 input_buffer3 = 32'd4;
            #10 index = 3;
        join
endmodule
	
