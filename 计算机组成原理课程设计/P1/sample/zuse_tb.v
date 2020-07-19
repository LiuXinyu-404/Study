`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:21:21 10/09/2018
// Design Name:   zuse
// Module Name:   E:/Verliog/sample/zuse_tb.v
// Project Name:  sample
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: zuse
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module zuse_tb;

	// Outputs
	wire a,b,c;

	// Instantiate the Unit Under Test (UUT)
	zuse uut (
		.a(a),
		.b(b),
		.c(c)
	);

	initial begin
		// Initialize Inputs

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

