module asmd_counter(output [3:0]count, // note that the outputs are not regs
                    input [1:0] up_down,
                    input clk, reset);
       wire incr, decr; //use wire here
       counter_control_unit M0(.incr(incr), .decr(decr), .up_down(up_down), .clk(clk), .reset(reset));
       counter_datapath_unit M1(.count(count), .incr(incr), .decr(decr), .clk(clk), .reset(reset));
endmodule

module counter_control_unit(output reg incr,decr,
                            input [1:0] up_down,
                            input clk, reset);
    reg     state, next_state;
    parameter s_running = 0;

    always@(posedge clk, posedge reset) //state transition
        if (reset == 1'b1) state <= s_running;
        else state<=next_state;

    always@(state, up_down) begin // Combinational logic for controller
        // initialize all the variables to zero
        next_state = s_running;
        incr = 0;
        decr = 0;
        case(state)
            s_running:
                begin
                    if(up_down == 2'b01) incr = 1;
                    if(up_down == 2'b10) decr = 1;
                    next_state = s_running;
                end
        endcase
    end
endmodule

module counter_datapath_unit(output reg [3:0]count,
                             input incr, decr, clk, reset);
       always@(posedge clk, posedge reset)
            if(reset == 1'b1) count <= 4'b0000;
            else
                begin
                    if (incr == 1'b1) count<=count+1;
                    if (decr == 1'b1) count<=count-1;
                end
endmodule

