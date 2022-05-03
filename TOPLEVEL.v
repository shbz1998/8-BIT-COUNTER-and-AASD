`timescale 1 ns / 1 ns
`define PRIMARY_OUT 2  //ns (primary outputs)
`define FAN_OUT_1 0.4 //ns (one output fanout)
`define FAN_OUT_2 0.7 //ns (two output fanout)
`define FAN_OUT_3 1.0 //ns (two output fanout)
`define TIME_DELAY_1 2 //ns (one input gates)
`define TIME_DELAY_2 3 //ns (two input gates)
`define TIME_DELAY_3 4 //ns (three input gates)

module TOPLEVEL (ENABLE, LOAD, CLOCK, DATA, COUNT, RESET);
output [7:0] COUNT;
input [7:0] DATA;
input CLOCK, RESET, LOAD, ENABLE;
wire RST;

//(RESET, CLK, AASD_RESET);
ASSERT assert_1(RESET, CLOCK, AASD_RESET);

//(COUNT, CLK, RST, ENL, LOAD, DATA);
COUNTER count_1(COUNT, CLOCK, AASD_RESET, ENABLE, LOAD, DATA);

endmodule
