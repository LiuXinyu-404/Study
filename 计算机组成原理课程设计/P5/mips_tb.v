`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:23:14 12/13/2018
// Design Name:   Mips
// Module Name:   C:/Computer/P5/mips_tb.v
// Project Name:  P5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mips
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mips_tb;

	// Inputs
	reg Clk;
	reg Reset;

	// Instantiate the Unit Under Test (UUT)
	mips uut (
		.clk(Clk), 
		.reset(Reset)
	);

	initial begin
		// Initialize Inputs
		Clk = 0;
		Reset = 0;

	end
	always 
	#1 Clk = ~Clk;
      
endmodule

