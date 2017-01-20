module Our_Clk_Divider_32(inclk,outclk,outclk_not,div_clk_count,Reset);
     input inclk;
	 input Reset;
	 output outclk;
	 output outclk_Not;
	 input[31:0] div_clk_count;
	 
	 reg [31:0] counter;
	 wire [31:0] next_value;
	 reg reg_clk;
	 
	 always @(posedge inclk or posedge Reset)
		begin
	 
		if(Reset)
			begin
				counter <= 0;
				reg_clk <= 1'b0;
			end
		else if (next_value == div_clk_count) // counter reached
			begin
				counter <= 0;
				reg_clk <= ~reg_clk;
			end
		else
			begin
				counter <= next_value;
			end
	 
		end
		
	 assign next_value = counter+1;
	 
	 
	 assign outclk = reg_clk;	
	 assign outclk_Not = ~outclk;
	 
endmodule

