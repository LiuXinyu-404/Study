`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:25:04 10/11/2018
// Design Name:   fsm_1010
// Module Name:   E:/Verliog/sample/fsm_1010_tb.v
// Project Name:  sample
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fsm_1010
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fsm_1010_tb;

	// Inputs
	reg clk;
	reg in;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	fsm_1010 uut (
		.clk(clk), 
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		in = 1;

		// Wait 100 ns for global reset to finish
		#10 in = 0;
      
		#10 in = 1;
		
		#10 in = 1;
		
		#10 in = 0;
		
		#10 in = 1;
		
		#10 in = 0;
		// Add stimulus here

	end
   
	always #5 clk=~clk;
	
endmodule

