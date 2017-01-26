 module LED_state_machine 
	(clock,
	reset,
	LED_8);
	
	input clock;
	input reset;
	output [7:0]LED_8;
	
	typedef enum {S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13} LED_state;
	LED_state current_state = S0;
	LED_state next_state;
	reg [7:0] state_output;
	
	
	always_ff @(posedge clock or posedge reset)
		if (reset)
			current_state <= S0;
		else 
			current_state <= next_state;
	
	always_comb
		case (current_state)
			
			S0:  {next_state,state_output} = {S1, 8'b0000_0001};
			S1:  {next_state,state_output} = {S2, 8'b0000_0010};
			S2:  {next_state,state_output} = {S3, 8'b0000_0100};
			S3:  {next_state,state_output} = {S4, 8'b0000_1000};
			S4:  {next_state,state_output} = {S5, 8'b0001_0000};
			S5:  {next_state,state_output} = {S6, 8'b0010_0000};
			S6:  {next_state,state_output} = {S7, 8'b0100_0000};
			S7:  {next_state,state_output} = {S8, 8'b1000_0000};
			S8:  {next_state,state_output} = {S9, 8'b0100_0000};
			S9:  {next_state,state_output} = {S10,8'b0010_0000};
			S10: {next_state,state_output} = {S11,8'b0001_0000};
			S11: {next_state,state_output} = {S12,8'b0000_1000};
			S12: {next_state,state_output} = {S13,8'b0000_0100};
			S13: {next_state,state_output} = {S0, 8'b0000_0010};
			
			default: {next_state, state_output} = {S0, 8'b0000_0001};
		endcase
	
	assign LED_8 = state_output;
 	
endmodule
	