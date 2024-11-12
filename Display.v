module Display(
	input clk_0, button, rst_act, power,
	output [4:0] dig,
	output [6:0] seg,
	output [2:0] rgb
);
	wire clk_act, clk_15, clk_21, clk_26, clk_27, clk_28, nclk_15, npower, rst_all, n_rst_act, w_button;
	wire [6:0] vel, act;
	wire [2:0] cont_act;
	wire [1:0] cont_vel;

	not not0(npower, power);
	not not1(n_rst_act, rst_act);
	or or0(rst_all, n_rst_act, npower);

	Divisor clkdiv(.clk_0(clk_0), .clk_15(clk_15), .clk_21(clk_21), .clk_26(clk_26), .clk_27(clk_27), .clk_28(clk_28));
	
	Debouncer debounce(.clk(clk_21), .button(button), .S(w_button));
	
	ContVelocidade contvel(.clk(w_button), .Q0(cont_vel[0]), .Q1(cont_vel[1]), .rst(npower));
	
	Triplex triplex(.S1(cont_vel[0]), .S2(cont_vel[1]), .I1(clk_28), .I2(clk_27), .I3(clk_26), .X(clk_act));
	
	ContAction contact(.clk(clk_act), .Q0(cont_act[0]), .Q1(cont_act[1]), .Q2(cont_act[2]), .rst(rst_all));
	
	DigitoVelocidade digvel(
		.A(cont_vel[0]), .B(cont_vel[1]), .a(vel[0]),
		.b(vel[1]), .c(vel[2]), .d(vel[3]),
		.e(vel[4]), .f(vel[5]), .g(vel[6])
	);
	
	DigitoAction digact(
		.A(cont_act[0]), .B(cont_act[1]), .C(cont_act[2]),
		.a(act[0]), .b(act[1]), .c(act[2]), 
		.d(act[3]), .e(act[4]), .f(act[5]),
		.g(act[6])
	);
	
	Multiplex multi0(.X(seg[0]), .I1(vel[0]), .I2(act[0]), .S(clk_15));
	Multiplex multi1(.X(seg[1]), .I1(vel[1]), .I2(act[1]), .S(clk_15));
	Multiplex multi2(.X(seg[2]), .I1(vel[2]), .I2(act[2]), .S(clk_15));
	Multiplex multi3(.X(seg[3]), .I1(vel[3]), .I2(act[3]), .S(clk_15));
	Multiplex multi4(.X(seg[4]), .I1(vel[4]), .I2(act[4]), .S(clk_15));
	Multiplex multi5(.X(seg[5]), .I1(vel[5]), .I2(act[5]), .S(clk_15));
	Multiplex multi6(.X(seg[6]), .I1(vel[6]), .I2(act[6]), .S(clk_15));
	not not2(nclk_15, clk_15);
	or or1(dig[0], clk_15, npower);
	or or2(dig[3], nclk_15, npower);
	not not3(dig[1], 0);
	not not4(dig[2], 0);
	not not5(dig[4], 0);

	LedsRGB leds(.A(cont_act[0]), .B(cont_act[1]), .C(cont_act[2]), .red(rgb[0]), .green(rgb[1]), .blue(rgb[2]));
	
endmodule
