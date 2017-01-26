module Our_Clk_Divider_32(inclk,outclk,outclk_Not,div_clk_count,Reset);
     input inclk;
	 input Reset;
	 output outclk;
	 output outclk_Not;
	 input[31:0] div_clk_count;
	 
	 reg [31:0] counter = 0;
	 wire [31:0] next_value;
	 reg reg_clk = 0;
	 
	 always @(posedge inclk)
		begin
	 
		if(~Reset)
			begin
				counter <= 0;
				reg_clk <= 1'b0;
			end
		else if (next_value >= div_clk_count) 
			// Counter reached, reverse clock sig
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


