//mux4to1

module Mux4to1 #(parameter width = 1) (input0,input1,input2,input3,sel,out);
	input logic [width-1:0] input0,input1,input2, input3;
	input logic [1:0] sel;
	output logic [width-1:0] out;
	
	always @(*)
	begin
		case(sel)
		0 : out = input0;
		1 : out = input1;
		2 : out = input2;
		3 : out = input3;
		endcase
	end
endmodule