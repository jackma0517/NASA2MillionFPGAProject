//song
module Song_state_machine (CLK_50M,reset,song_output);
	
	input CLK_50M;
	input reset;
	output song_output;
	wire Clock_4Hz;
	wire Clock_160Hz;
	wire sound_signal_no_break,sound_signal_switch;
	reg [5:0] current_state = 0;
	reg [5:0] next_state = 0;
	reg [31:0] tone_divider;
	reg sound_on;
	
	parameter Do_divider = 32'hBAA2;
	parameter Re_divider = 32'hA646;
	parameter Mi_divider = 32'h9422;
	parameter Fa_divider = 32'h8BE8;
	parameter So_divider = 32'h7CB8;
	parameter La_divider = 32'h6EFA; 
	parameter Si_divider =  32'h62F2;
	parameter DoH_divider = 32'h5D5C;
	
	Generate_Arbitrary_Divided_Clk32
 	Gen_4Hz_Clk
	(
	.inclk(CLK_50M),
	.outclk(Clock_4Hz),
	.outclk_Not(),
	.div_clk_count(32'h5F5E10),
	.Reset(1'h1)
	);
	
	Generate_Arbitrary_Divided_Clk32
 	Gen_160Hz_Clk
	(
	.inclk(CLK_50M),
	.outclk(Clock_160Hz),
	.outclk_Not(),
	.div_clk_count(32'h4C4B4),
	.Reset(1'h1)
	);
	
	
	always_ff @(posedge Clock_4Hz or posedge reset)
		if (reset)
			current_state <= 0;
		else 
			current_state <= next_state;
	
	always_comb 
		case (current_state)
			0: {next_state, tone_divider, sound_on} = {6'd1,Do_divider,1'b1 };
			1: {next_state, tone_divider, sound_on} = {6'd2,Do_divider,1'b1 };
			2: {next_state, tone_divider, sound_on} = {6'd3,So_divider,1'b1};
			3: {next_state, tone_divider, sound_on} = {6'd4,So_divider,1'b1 };
			4: {next_state, tone_divider, sound_on} = {6'd5,La_divider,1'b1 };
			5: {next_state, tone_divider, sound_on} = {6'd6,La_divider,1'b1 };
			6: {next_state, tone_divider, sound_on} = {6'd7,So_divider,1'b1 };
			7: {next_state, tone_divider, sound_on} = {6'd8,Fa_divider,1'b0 };
			8: {next_state, tone_divider, sound_on} = {6'd9,Fa_divider,1'b1 };
			9: {next_state, tone_divider, sound_on} = {6'd10,Fa_divider,1'b1 };
			10: {next_state, tone_divider, sound_on} = {6'd11,Mi_divider,1'b1 };
			11: {next_state, tone_divider, sound_on} = {6'd12,Mi_divider,1'b1 };
			12: {next_state, tone_divider, sound_on} = {6'd13,Re_divider,1'b1};
			13: {next_state, tone_divider, sound_on} = {6'd14,Re_divider,1'b1};
			14: {next_state, tone_divider, sound_on} = {6'd15,Do_divider,1'b1};
			15: {next_state, tone_divider, sound_on} = {6'd16,So_divider,1'b0 };
			16: {next_state, tone_divider, sound_on} = {6'd17,So_divider,1'b1};
			17: {next_state, tone_divider, sound_on} = {6'd18,So_divider,1'b1};
			18: {next_state, tone_divider, sound_on} = {6'd19,Fa_divider,1'b1};
			19: {next_state, tone_divider, sound_on} = {6'd20,Fa_divider,1'b1};
			20: {next_state, tone_divider, sound_on} = {6'd21,Mi_divider,1'b1};
			21: {next_state, tone_divider, sound_on} = {6'd22,Mi_divider,1'b1};
			22: {next_state, tone_divider, sound_on} = {6'd23,Re_divider,1'b1};
			23: {next_state, tone_divider, sound_on} = {6'd24,So_divider,1'b0 };
			24: {next_state, tone_divider, sound_on} = {6'd25,So_divider,1'b1 };
			25: {next_state, tone_divider, sound_on} = {6'd26,So_divider,1'b1 };
			26: {next_state, tone_divider, sound_on} = {6'd27,Fa_divider,1'b1 };
			27: {next_state, tone_divider, sound_on} = {6'd28,Fa_divider,1'b1 };
			28: {next_state, tone_divider, sound_on} = {6'd29,Mi_divider,1'b1 };
			29: {next_state, tone_divider, sound_on} = {6'd30,Mi_divider,1'b1 };
			30: {next_state, tone_divider, sound_on} = {6'd31,Re_divider,1'b1};
			31: {next_state, tone_divider, sound_on} = {6'd32,Do_divider,1'b0 };
			32: {next_state, tone_divider, sound_on} = {6'd33,Do_divider,1'b1 };
			33: {next_state, tone_divider, sound_on} = {6'd34,Do_divider,1'b1 };
			34: {next_state, tone_divider, sound_on} = {6'd35,So_divider,1'b1 };
			35: {next_state, tone_divider, sound_on} = {6'd36,So_divider,1'b1 };
			36: {next_state, tone_divider, sound_on} = {6'd37,La_divider,1'b1 };
			37: {next_state, tone_divider, sound_on} = {6'd38,La_divider,1'b1 };
			38: {next_state, tone_divider, sound_on} = {6'd39,So_divider,1'b1 };
			39: {next_state, tone_divider, sound_on} = {6'd40,Fa_divider,1'b0 };
			40: {next_state, tone_divider, sound_on} = {6'd41,Fa_divider,1'b1 };
			41: {next_state, tone_divider, sound_on} = {6'd42,Fa_divider,1'b1 };
			42: {next_state, tone_divider, sound_on} = {6'd43,Mi_divider,1'b1 };
			43: {next_state, tone_divider, sound_on} = {6'd44,Mi_divider,1'b1 };
			44: {next_state, tone_divider, sound_on} = {6'd45,Re_divider,1'b1 };
			45: {next_state, tone_divider, sound_on} = {6'd46,Re_divider,1'b1 };
			46: {next_state, tone_divider, sound_on} = {6'd47,Do_divider,1'b1 };
			47: {next_state, tone_divider, sound_on} = {6'd48,Do_divider,1'b0 };
			48: {next_state, tone_divider, sound_on} = {6'd49,Do_divider,1'b0 };
			49: {next_state, tone_divider, sound_on} = {6'd50,Do_divider,1'b0 };
			50: {next_state, tone_divider, sound_on} = {6'd51,Do_divider,1'b0 };
			51: {next_state, tone_divider, sound_on} = {6'd52,Do_divider,1'b0 };
			52: {next_state, tone_divider, sound_on} = {6'd53,Do_divider,1'b0 };
			53: {next_state, tone_divider, sound_on} = {6'd0 ,Do_divider,1'b0 };
			default: {next_state, tone_divider, sound_on} = {6'b000000, Do_divider,1'b0};
		endcase
	
	Generate_Arbitrary_Divided_Clk32
	Sound_Signal_Generator
	(
	.inclk(CLK_50M),
	.outclk(sound_signal_no_break),
	.outclk_Not(),
	.div_clk_count(tone_divider), //change this if necessary to suit your module
	.Reset(1'h1)
	);
	
	Mux2to1 #(1) 
	Sound_Switch1
	(
	.input1(sound_signal_no_break),
	.input0(1'b0),
	.sel(sound_on),
	.out(sound_signal_switch)
	//.out(song_output)
	);
	
	note_breaker_40beat(
	.clk(Clock_160Hz),
	.in(sound_signal_switch),
	.out(song_output)
	);
	
endmodule

module note_breaker_40beat (clk,in,out);

	output out;
	input clk,in;
	reg switch;
	reg [5:0] counter;
	always_ff @(posedge clk)
		if(counter == 6'd37)
			begin
				counter <= counter + 1;
				switch <= 1'b0;
			end
		else  if (counter == 6'd39)
			begin
				counter <= 6'd0;
				switch <= 1'b1;
			end
		else  if (counter == 6'd1)
			begin
				counter <= counter + 1;
				switch <= 1'b1;
			end
		else
			begin
				counter <= counter + 1;
			end
	
	Mux2to1 #(1) 
	Sound_Switch1
	(
	.input1(in),
	.input0(1'b0),
	.sel(switch),
	.out(out)
	);
endmodule 
