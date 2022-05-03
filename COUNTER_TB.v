`timescale  1 ns / 10 ps
`define period 200
module COUNTER_TB();
    reg CLOCK, RESET, ENABLE, LOAD; // inputs
    reg [7:0]DATA;                 // input
    wire [7:0]COUNT;               // outputs
    TOPLEVEL UUT (ENABLE, LOAD, CLOCK, DATA, COUNT, RESET);     
              always #(`period* 0.5) CLOCK=~CLOCK; // CLK period, 20ns
    initial begin
     $vcdpluson;
     $monitor("%d ns  Data=%d  Enable=%b  Load =%b  Reset=%b   Count=%d",$time,DATA,ENABLE,LOAD,RESET,COUNT);
     CLOCK=0; // setting the clock
    end
    initial begin
	ENABLE=0; RESET=1; LOAD=0; DATA=6'b010101; // starting vector

	#(`period* 1.25) RESET=0; // testing async reset
	#(`period* 2.75) RESET=1; // reset assert 
	#`period ENABLE=1; 
	#(`period* 9) LOAD=1; DATA=8'b11111010; // loading 60d after count reaches 7d
	#`period LOAD=0;  // load=0, counter should start incrementing
	#(`period* 11) LOAD=1; ENABLE=1; DATA=8'b10101010; 
	#`period RESET=0; // part f, reset overides load
	#`period RESET=1; LOAD=0; // does enable work properly?
	#(`period* 10) RESET=0; // testing if reset overrides increment
     	#(`period) RESET=1; ENABLE=0; LOAD=1; DATA=6'd36; // does load work properly when ENABLE is low?
                #(`period* 4) $finish;
    end
endmodule

