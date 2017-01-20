module LED_sequence
#(parameter width = 8)
(
	clock, 
	reset,
	led_out);
	
parameter size_minus_1 = 2**width-1;
	
input wire clock;
input wire reset;
output wire [width-1:0]led_out;

reg [width-1:0] r_reg = 1;
wire[width-1:0] r_shift_left;
wire[width-1:0] r_shift_right;
reg shift_dir = 0;

always @(posedge clock)	
begin
	if(~reset)
		r_reg <= 1;
	else if(shift_dir == 0)
		r_reg <= r_reg << 1;
	else 
		r_reg <= r_reg >> 1;
end

always_comb
begin
	case(current_state)
	
	S0:
	S1:
	
	
end
endmodule