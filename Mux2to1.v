module Mux2to1 #(parameter width = 1) (input1,input0, sel,out);
	input logic [width-1:0] input1,input0;
	input logic sel;
	output logic [width-1:0] out;
	assign out = sel? input1:input0;
endmodule	