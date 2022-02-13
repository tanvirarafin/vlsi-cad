// step 1: design a system that takes an array of 32 bit numbers when the
// start signal is 1 and the system is ready,
// during the operation the ready signal is low
// once all the data is read, it spits out the data to the output port
// once all the data is printed, the ready signal is high again
// reset makes all the data zero.

module simple_ntt #(parameter data_width = 32, max_buffer_length = 4)(
                    output [data_width-1:0] out_stream,
                    output  ready,
                    input [data_width-1:0] in_stream,
                    input start, clk, reset
);

    wire done, load, rd, wr, i_is_full, j_is_zero;
    control_unit control_module_0 (.load(load), .rd(rd), .wr(wr), .ready(ready),
                                    .done(done), .start(start),
                                     .i_is_full(i_is_full),
                                     .j_is_zero(j_is_zero),
                                     .clk(clk), .reset(reset));
    datapath_unit datapath_module_0(.out_stream(out_stream),
                                    .i_is_full(i_is_full),
                                    .j_is_zero(j_is_zero),
                                    .done(done),
                                    .rd(rd), .wr(wr), .load(load),
                                    .in_stream(in_stream),
                                    .clk(clk), .reset(reset));
endmodule

module control_unit(
    output reg  load, rd, wr, ready,
    input done, start,
    input i_is_full, j_is_zero,
    input clk, reset
);
    reg state, next_state;
    parameter s_idle = 0, s_running = 1;
    always @(posedge clk, posedge reset)
        if (reset == 1'b1)
            state <= s_idle;
        else
            state <=next_state;
    always @(state, start, done, i_is_full, j_is_zero) begin
        // default condition
        next_state = s_idle;
        load = 0;
        rd = 0;
        wr = 0;
        ready = 0;
        case(state)
            s_idle: begin
                if (reset == 1'b1) next_state = s_idle;
                else begin
                    ready = 1;
                    if (start == 1'b1) begin
                        if (done == 1'b1) begin
                            next_state = s_idle;
                            end
                        else begin
                            load = 1;
                            next_state = s_running;
                        end
                    end
                    else next_state = s_idle;
                end
            end
            s_running: begin
                if (i_is_full == 1'b1) begin
                    rd = 0;
                    if (j_is_zero == 1'b1) begin
                        wr = 0;
                        next_state = s_idle;
                    end
                    else begin
                        wr = 1;
                        next_state = s_running;
                    end
                end
                else begin
                    rd = 1;
                    next_state = s_running;
                end
            end
            default: next_state = s_idle;
        endcase
    end
endmodule
	
module datapath_unit #(parameter data_width = 32, max_buffer_length = 4)(
    output reg [data_width-1:0] out_stream,
    output done, i_is_full, j_is_zero,
    input rd, wr, load,
    input [data_width-1:0] in_stream,
    input clk, reset
);
    reg [2:0] i, j;
    reg [data_width-1:0] buffer[max_buffer_length];

    assign i_is_full = (i==4);
    assign j_is_zero = (j==0);
    assign done = (i==4) && (j==0);

    always@(posedge clk, posedge reset)
        if (reset == 1'b1) begin
            out_stream <= 0;
            i <=0;
            j <=0;
        end
        else begin
            if (load) begin
                i <=0;
                j <=4;
            end
            else if(rd) begin
                buffer[i] <= in_stream;
                i <= i+1;
            end
            else if(wr) begin
                out_stream <= buffer[max_buffer_length-j];
                j<=j-1;
            end
        end
endmodule