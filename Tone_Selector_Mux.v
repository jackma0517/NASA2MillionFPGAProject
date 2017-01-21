//Tone_Selector_Mux
module Tone_Selector_Mux(SW,Clk_div_num,tone_name);
	input [2:0] SW;
	output reg [31:0] Clk_div_num;
	output reg [15:0] tone_name;

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
		3'b000: {Clk_div_num, tone_name} = {Do_divider, character_D, character_lowercase_o};
		3'b001: {Clk_div_num, tone_name} = {Re_divider, character_R, character_lowercase_e};
		3'b010: {Clk_div_num, tone_name} = {Mi_divider, character_M, character_lowercase_i};
		3'b011: {Clk_div_num, tone_name} = {Fa_divider, character_F, character_lowercase_a};
		3'b100: {Clk_div_num, tone_name} = {So_divider, character_S, character_lowercase_o};
		3'b101: {Clk_div_num, tone_name} = {La_divider, character_L, character_lowercase_a};
		3'b110: {Clk_div_num, tone_name} = {Si_divider, character_S, character_lowercase_i};
		3'b111: {Clk_div_num, tone_name} = {DoH_divider, character_D, character_lowercase_o};
		default: {Clk_div_num, tone_name} = {Do_divider, character_D, character_lowercase_o};
		endcase
		
	//Uppercase Letters
	parameter character_A =8'h41;
	parameter character_B =8'h42;
	parameter character_C =8'h43;
	parameter character_D =8'h44;
	parameter character_E =8'h45;
	parameter character_F =8'h46;
	parameter character_G =8'h47;
	parameter character_H =8'h48;
	parameter character_I =8'h49;
	parameter character_J =8'h4A;
	parameter character_K =8'h4B;
	parameter character_L =8'h4C;
	parameter character_M =8'h4D;
	parameter character_N =8'h4E;
	parameter character_O =8'h4F;
	parameter character_P =8'h50;
	parameter character_Q =8'h51;
	parameter character_R =8'h52;
	parameter character_S =8'h53;
	parameter character_T =8'h54;
	parameter character_U =8'h55;
	parameter character_V =8'h56;
	parameter character_W =8'h57;
	parameter character_X =8'h58;
	parameter character_Y =8'h59;
	parameter character_Z =8'h5A;

	//Lowercase Letters
	parameter character_lowercase_a= 8'h61;
	parameter character_lowercase_b= 8'h62;
	parameter character_lowercase_c= 8'h63;
	parameter character_lowercase_d= 8'h64;
	parameter character_lowercase_e= 8'h65;
	parameter character_lowercase_f= 8'h66;
	parameter character_lowercase_g= 8'h67;
	parameter character_lowercase_h= 8'h68;
	parameter character_lowercase_i= 8'h69;
	parameter character_lowercase_j= 8'h6A;
	parameter character_lowercase_k= 8'h6B;
	parameter character_lowercase_l= 8'h6C;
	parameter character_lowercase_m= 8'h6D;
	parameter character_lowercase_n= 8'h6E;
	parameter character_lowercase_o= 8'h6F;
	parameter character_lowercase_p= 8'h70;
	parameter character_lowercase_q= 8'h71;
	parameter character_lowercase_r= 8'h72;
	parameter character_lowercase_s= 8'h73;
	parameter character_lowercase_t= 8'h74;
	parameter character_lowercase_u= 8'h75;
	parameter character_lowercase_v= 8'h76;
	parameter character_lowercase_w= 8'h77;
	parameter character_lowercase_x= 8'h78;
	parameter character_lowercase_y= 8'h79;
	parameter character_lowercase_z= 8'h7A;

endmodule


