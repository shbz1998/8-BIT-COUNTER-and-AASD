               
`timescale 1 ns / 1 ns
`define PRIMARY_OUT 2  //ns (primary outputs)
`define FAN_OUT_1 0.4 //ns (one output fanout)
`define FAN_OUT_2 0.7 //ns (two output fanout)
`define FAN_OUT_3 1.0 //ns (two output fanout)
`define TIME_DELAY_1 2 //ns (one input gates)
`define TIME_DELAY_2 3 //ns (two input gates)
`define TIME_DELAY_3 4 //ns (three input gates)

module COUNTER(COUNT, CLK, RST, ENL, LOAD, DATA);

output reg [7:0] COUNT;
input [7:0] DATA;
input CLK, RST, ENL, LOAD;
reg [7:0] COUNT_VAL;

//Asyncronous RESET, //Syncronous LOAD
always @(posedge CLK, posedge RST) 
  begin    
	if(!RST) 
	COUNT <= 8'b00000000;
	else if (ENL)
	begin	
	if(LOAD)
	COUNT <= DATA;
	else
	COUNT <= COUNT + 1;
	end

  end	

endmodule
