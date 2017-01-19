`timescale 1 ns/1 ns //time scale for the test bench

module testbench();



	reg clock_sig;
        wire clock_out;
	wire outclk;
	reg reset;

	Our_Clk_Divider_32 clkdivider(clock_sig,outclk,,32'b10,reset);

	 integer i; 
    initial begin
		
		reset = 1'b1;
		#50
		reset = 1'b0;

        for(i=0; i<20; i=i+1)
        begin
            clock_sig <=1;
            #10;
            clock_sig <=0;
            #10;
        end
    end


	
endmodule

