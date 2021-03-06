/* Generated by Yosys 0.9+4239 (open-tool-forge build) (git sha1 10bcc4e1, gcc 9.3.0-17ubuntu1~20.04 -Os) */

(* dynports =  1  *)
(* top =  1  *)
(* src = "example_design.v:1.1-12.10" *)
module example_design(y, d0, d1, s, reset, clk);
  (* src = "example_design.v:9.13-9.20" *)
  wire _00_;
  (* src = "example_design.v:9.13-9.20" *)
  wire _01_;
  (* src = "example_design.v:9.13-9.20" *)
  wire _02_;
  (* src = "example_design.v:9.13-9.20" *)
  wire _03_;
  (* src = "example_design.v:4.21-4.24" *)
  input clk;
  (* src = "example_design.v:3.34-3.36" *)
  input [3:0] d0;
  (* src = "example_design.v:3.38-3.40" *)
  input [3:0] d1;
  (* src = "example_design.v:4.14-4.19" *)
  input reset;
  (* src = "example_design.v:4.11-4.12" *)
  input s;
  (* src = "example_design.v:2.39-2.40" *)
  output [3:0] y;
  reg [3:0] y;
  sky130_fd_sc_hd__mux2_1 _04_ (
    .A0(d0[0]),
    .A1(d1[0]),
    .S(s),
    .X(_00_)
  );
  sky130_fd_sc_hd__mux2_1 _05_ (
    .A0(d0[1]),
    .A1(d1[1]),
    .S(s),
    .X(_01_)
  );
  sky130_fd_sc_hd__mux2_1 _06_ (
    .A0(d0[2]),
    .A1(d1[2]),
    .S(s),
    .X(_02_)
  );
  sky130_fd_sc_hd__mux2_1 _07_ (
    .A0(d0[3]),
    .A1(d1[3]),
    .S(s),
    .X(_03_)
  );
  (* src = "example_design.v:6.2-10.5" *)
  always @(posedge clk)
    if (reset) y[0] <= 1'h0;
    else y[0] <= _00_;
  (* src = "example_design.v:6.2-10.5" *)
  always @(posedge clk)
    if (reset) y[1] <= 1'h0;
    else y[1] <= _01_;
  (* src = "example_design.v:6.2-10.5" *)
  always @(posedge clk)
    if (reset) y[2] <= 1'h0;
    else y[2] <= _02_;
  (* src = "example_design.v:6.2-10.5" *)
  always @(posedge clk)
    if (reset) y[3] <= 1'h0;
    else y[3] <= _03_;
endmodule
