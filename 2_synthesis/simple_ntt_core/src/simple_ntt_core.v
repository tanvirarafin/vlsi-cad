module simple_ntt_core #(parameter data_width = 32, max_buffer_size = 4)(
                        output [data_width-1:0] output_buffer,
                        input  [data_width-1:0] input_buffer0,
                        input [data_width-1:0] input_buffer1,
                        input [data_width-1:0] input_buffer2,
                        input [data_width-1:0] input_buffer3,
                        input index,
                        input clk, reset
);

    wire [data_width-1:0] twiddle_factor[0:max_buffer_size-1];
    wire [data_width-1:0] q, n;
    assign twiddle_factor[0] = 32'd1;
    assign twiddle_factor[1] = 32'd1479;
    assign twiddle_factor[2] = 32'd12288;
    assign twiddle_factor[3] = 32'd10810;
    assign q = 32'd12289;
    assign n = 32'd4;
    assign output_buffer = (input_buffer0*twiddle_factor[index] +
                                        input_buffer1*twiddle_factor[(index+1)%n] +
                                        input_buffer2*twiddle_factor[(index+2)%n] +
                                        input_buffer3*twiddle_factor[(index+3)%n])%q;


endmodule
	
