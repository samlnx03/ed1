`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:42:20 11/25/2014
// Design Name:   decod01
// Module Name:   /home/sperez/fpga1414/decod01/decod01tb.v
// Project Name:  decod01
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: decod01
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module decod01tb;

	// Inputs
	reg s0;
	reg s1;
	reg s2;

	// Outputs
	wire y0;
	wire y1;
	wire y2;
	wire y3;
	wire y4;
	wire y5;
	wire y6;
	wire y7;
	
	reg [2:0] x;

	// Instantiate the Unit Under Test (UUT)
	decod01 uut (
		.s0(s0), 
		.s1(s1), 
		.s2(s2), 
		.y0(y0), 
		.y1(y1), 
		.y2(y2), 
		.y3(y3), 
		.y4(y4), 
		.y5(y5), 
		.y6(y6), 
		.y7(y7)
	);

	initial begin
		// Initialize Inputs
		s0 = 0;
		s1 = 0;
		s2 = 0;

		// Wait 100 ns for global reset to finish
		#50;
        
		// Add stimulus here
		for(x=0; x<=7; x=x+1) begin
			{s2,s1,s0}=x;
			#50;
		end
		
		

	end
      
endmodule

