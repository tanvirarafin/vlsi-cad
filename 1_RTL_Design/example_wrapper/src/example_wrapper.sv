`timescale 1ns/1ps
module example_wrapper #(parameter DATA_WIDTH = 32,
                                    ADDRESS_WIDTH = 8
                        )(input logic clk,
                       input logic reset_n,
                       input logic cs,
                       input logic we,
                       input logic [ADDRESS_WIDTH-1 : 0] address,
                       input logic [DATA_WIDTH-1 : 0] write_data,
                       output logic [DATA_WIDTH-1 : 0] read_data,
                       output logic error);
    // update all the internal registers in the module
    always@(posedge clk or negedge reset_n)
        begin

        end
    // implement
endmodule
	
