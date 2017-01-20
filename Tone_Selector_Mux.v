//Tone_Selector_Mux
module Tone_Selector_Mux(SW,Clk_div_num);
	input [2:0] SW;
	output reg [31:0] Clk_div_num;
	
	//divider for sound

	parameter Do_divider = 32'hBAA2;
	parameter Re_divider = 32'hA646;
	parameter Mi_divider = 32'h9422;
	parameter Fa_divider = 32'h8BE8;
	parameter So_divider = 32'h7CB8;
	parameter La_divider = 32'h6EFA; //odd
	parameter Si_divider =  32'h62F2;//odd
	parameter DoH_divider = 32'h5D5C;

	always_comb
		case(SW)
		3'b000: Clk_div_num = Do_divider;
		3'b001: Clk_div_num = Re_divider;
		3'b010: Clk_div_num = Mi_divider;
		3'b011: Clk_div_num = Fa_divider;
		3'b100: Clk_div_num = So_divider;
		3'b101: Clk_div_num = La_divider;
		3'b110: Clk_div_num = Si_divider;
		3'b111: Clk_div_num = DoH_divider;
		default: Clk_div_num = Do_divider;
		endcase
endmodule


