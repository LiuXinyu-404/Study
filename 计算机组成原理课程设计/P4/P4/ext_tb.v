`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:11:06 11/26/2018
// Design Name:   ext
// Module Name:   C:/Computer/P4/P4/ext_tb.v
// Project Name:  P4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ext
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ext_tb;

	// Inputs
	reg [15:0] imme;
	reg extop;

	// Outputs
	wire [31:0] ext_out;

	// Instantiate the Unit Under Test (UUT)
	ext uut (
		.imme(imme), 
		.ext_out(ext_out), 
		.extop(extop)
	);

	initial begin
		// Initialize Inputs
		imme = -1;
		extop = 0;

		// Wait 100 ns for global reset to finish
		#100;
       extop = 1;
		// Add stimulus here

	end
      
endmodule

