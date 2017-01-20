`timescale 1 ns/1 ns //time scale for the test bench

module testbench();



	reg clock_sig;
	reg [31:0] divisor;
	reg reset;
	
    wire clock_out;
	wire outclk;
	wire [9:0]led_out;

	Our_Clk_Divider_32 clkdivider(clock_sig,outclk,,divisor,reset);
	LED_sequence seq(.clock(outclk),.led_out(led_out),.reset(reset));
	 integer i; 
    initial begin
		
		reset = 1'b1;
		divisor = 32'b10;
		//#50
		//reset = 1'b0;

        for(i=0; i<5; i=i+1)
        begin
            clock_sig <=1;
            #10;
            clock_sig <=0;
            #10;
        end
		
		divisor = 32'b01;
        for(i=0; i<5; i=i+1)
        begin
            clock_sig <=1;
            #10;
            clock_sig <=0;
            #10;
        end
    end


	
endmodule

