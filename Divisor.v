module Divisor(
	input clk_0,
	output clk_15, clk_21, clk_26, clk_27, clk_28
);
	wire [7:0] W;
	wire n15, n21, n26, n27, n28;

	Divide5 divide5(.clk_in(clk_0), .clk_out(W[0]));
	Divide5 divide10(.clk_in(W[0]), .clk_out(W[1]));
	Divide5 divide15(.clk_in(W[1]), .clk_out(W[2]));
	Divide5 divide20(.clk_in(W[2]), .clk_out(W[3]));
	FlipFlop divide21(.j(1), .k(1), .clk(W[3]), .Q(W[4]));
	Divide5 divide26(.clk_in(W[4]), .clk_out(W[5]));
	FlipFlop divide27(.j(1), .k(1), .clk(W[5]), .Q(W[6]));
	FlipFlop divide28(.j(1), .k(1), .clk(W[6]), .Q(W[7]));
	
	not not0(n15, W[2]);
	not not1(clk_15, n15);
	not not2(n21, W[4]);
	not not3(clk_21, n21);
	not not4(n26, W[5]);
	not not5(clk_26, n26);
	not not6(n27, W[6]);
	not not7(clk_27, n27);
	not not8(n28, W[7]);
	not not9(clk_28, n28);
	
	
endmodule
