module Divide5(
	input clk_in,
	output clk_out
);
	wire w1,w2,w3,w4;
	
	FlipFlop flipflop0(.j(1), .k(1), .clk(clk_in), .Q(w1));
	FlipFlop flipflop1(.j(1), .k(1), .clk(w1), .Q(w2));
	FlipFlop flipflop2(.j(1), .k(1), .clk(w2), .Q(w3));
	FlipFlop flipflop3(.j(1), .k(1), .clk(w3), .Q(w4));
	FlipFlop flipflop4(.j(1), .k(1), .clk(w4), .Q(clk_out));
endmodule
