`timescale 1 ns / 1 ns
`define PRIMARY_OUT 2  //ns (primary outputs)
`define FAN_OUT_1 0.4 //ns (one output fanout)
`define FAN_OUT_2 0.7 //ns (two output fanout)
`define FAN_OUT_3 1.0 //ns (two output fanout)
`define TIME_DELAY_1 2 //ns (one input gates)
`define TIME_DELAY_2 3 //ns (two input gates)
`define TIME_DELAY_3 4 //ns (three input gates)

module ASSERT(RESET, CLK, AASD_RESET);

output AASD_RESET;
input RESET, CLK;
wire D_OUT;


dff dff_1(.data(RESET), .clock(CLK), .clear(RESET), .q(D_OUT));
dff dff_2(.data(D_OUT), .clock(CLK), .clear(RESET), .q(AASD_RESET));

endmodule
