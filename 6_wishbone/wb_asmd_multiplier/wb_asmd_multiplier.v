`default_nettype none
`timescale 1ns/1ns

module wb_asmd_multiplier #(
    parameter   [31:0]  BASE_ADDRESS     = 32'h3000_0000,        // base address
    parameter   [31:0]  INPUT_ADDRESS     = BASE_ADDRESS,
    parameter   [31:0]  OUTPUT_ADDRESS    = BASE_ADDRESS + 4
    )(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif
    input wire          clk,
    input wire          reset,
    // wb interface
    input wire          i_wb_cyc,       // wishbone transaction
    input wire          i_wb_stb,       // strobe - data valid and accepted as long as !o_wb_stall
    input wire          i_wb_we,        // write enable
    input wire  [31:0]  i_wb_addr,      // address
    input wire  [31:0]  i_wb_data,      // incoming data
    output reg          o_wb_ack,       // request is completed
    output wire         o_wb_stall,     // cannot accept req
    output reg  [31:0]  o_wb_data      // output data
);

    reg [7:0] product;
    reg [3:0]a;
    reg [3:0]b;
    reg busy;
    assign o_wb_stall = busy;
    wire ready, start;
    asmd_multiplier asmd_multiplier_0(
                                      .product(product),
                                      .ready(ready),
                                      .word0(a),
                                      .word1(b),
                                      .start(start),
                                      .clk(clk),
                                      .reset(reset));



    // taking input
    always @(posedge clk) begin
        if(reset) begin
            a <= 4'b0;
            b <= 4'b0;
            busy <= 0;
        end
        else if(i_wb_stb && i_wb_cyc && i_wb_we && !o_wb_stall && i_wb_addr == INPUT_ADDRESS) begin
            a <= i_wb_data[3:0];
            b <= i_wb_data[7:4];
        end
    end
        // putting output
        always @(posedge clk) begin
            if(reset)
                o_wb_data <= 0;
            else if(i_wb_stb && i_wb_cyc && !i_wb_we && !o_wb_stall)
                case(i_wb_addr)
                    INPUT_ADDRESS:
                        o_wb_data <= {b,a};
                    OUTPUT_ADDRESS:
                        o_wb_data <= product;
                    default:
                        o_wb_data <= 32'b0;
                endcase
        end

    // acks
    always @(posedge clk) begin
        if(reset)
            o_wb_ack <= 0;
        else
            begin
                o_wb_ack <= (i_wb_stb && !o_wb_stall && (i_wb_addr == OUTPUT_ADDRESS || i_wb_addr == INPUT_ADDRESS));
            end
    end

    reg state;
    parameter s_idle = 0, s_running = 1;
    always @(posedge ready) begin

	            case(state)
	                s_running: begin
	                    busy <= 1;
		                if (ready)
			                state <= s_idle;
			            else
			                state <= s_running;
		            end
	                s_idle: begin
	                    busy <= 0;
	                    if (ready)
		                    state <= s_running;
		                else
		                    state <= s_idle;
		            end
		            default: begin
		                state <= s_running;
		                busy <= 1;
		            end
	            endcase

    end
endmodule

module asmd_multiplier #(parameter word_length = 4)(
    output  [2*word_length-1:0] product,
    output                      ready,
    input   [word_length-1:0]   word0, word1,
    input                       start, clk, reset
);

wire            flush, shift, add_shift, load_words, empty, m_is_1, m0;
control_unit    control_module0  (.flush(flush), .shift(shift), .addshift(add_shift), .load_words(load_words),
                    .ready(ready), .start(start),
                    .empty(empty), .m_is_1(m_is_1), .m0(m0),
                    .clk(clk), .reset(reset));
datapath_unit   datapath_module0  (.product(product), .empty(empty), .m_is_1(m_is_1),
                     .m0(m0), .word0(word0), .word1(word1),
                     .flush(flush), .shift(shift), .addshift(add_shift), .load_words(load_words),
                     .clk(clk), .reset(reset));
endmodule

module control_unit(output reg flush, shift, addshift, load_words, ready,
                    input empty, m_is_1, m0, start,
                    input clk, reset);
       reg state, next_state;
       parameter s_idle = 0, s_running = 1;

       always@(posedge clk, posedge reset)
        if(reset == 1'b1)
            state <= s_idle;
        else
            state <= next_state;

       always @(state, start, empty, m_is_1, m0) begin
       //default condition
        next_state = s_idle;
        flush = 0;
        shift = 0;
        addshift = 0;
        load_words = 0;
        ready = 0;
        case(state)
            s_idle: begin
                if (reset == 1'b1) next_state = s_idle;
                else begin
                    ready = 1;
                    if (start == 1'b1) begin
                        if (empty == 1'b1) begin
                            flush = 1;
                            next_state = s_idle;
                            end
                        else begin
                            load_words = 1;
                            next_state = s_running;
                        end
                    end
                    else next_state = s_idle;
                end
            end
            s_running: begin
                if (m_is_1 == 1'b1) begin
                    addshift = 1;
                    next_state =s_idle;
                end
                else begin
                    if (m0 == 1'b1) begin
                        addshift = 1;
                        next_state = s_running;
                    end
                    else begin
                        shift = 1;
                        next_state = s_running;
                    end
                end
            end
           default: next_state = s_idle;
        endcase
       end
endmodule

module datapath_unit    #(parameter word_length=4)(
                        output reg [2*word_length-1:0]  product,
                        output empty, m_is_1, m0,
                        input flush, shift, addshift, load_words,
                        input [word_length-1:0] word0, word1,
                        input clk, reset
);

    reg [2*word_length-1:0] multiplicand;
    reg [word_length-1:0]   multiplier;

    assign m0 =  multiplier[0];
    assign m_is_1 = (multiplier == 1);
    assign empty = ((word0 == 0) || (word1 == 0));

    always@(posedge clk, posedge reset)
        if (reset == 1'b1) begin
            product <= 0;
            multiplier <= 0;
            multiplicand <= 0;
        end
        else begin
            if (flush == 1) product <= 0;
            else if(load_words == 1) begin
                multiplicand <= word0;
                multiplier <= word1;
            end
            else if (addshift) begin
                product <= product+multiplicand;
                multiplicand <= multiplicand << 1;
                multiplier <= multiplier >> 1;
            end
            else if (shift) begin
                multiplicand <= multiplicand << 1;
                multiplier <= multiplier >> 1;
            end
        end
endmodule