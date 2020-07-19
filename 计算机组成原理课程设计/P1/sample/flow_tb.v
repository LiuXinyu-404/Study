`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:57:14 10/11/2018
// Design Name:   flow
// Module Name:   E:/Verliog/sample/flow_tb.v
// Project Name:  sample
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: flow
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module flow_tb;

	// Inputs
	reg [31:0] A1;
	reg [31:0] B1;
	reg [31:0] A2;
	reg [31:0] B2;
	reg clk;

	// Outputs
	wire [31:0] C;

	// Instantiate the Unit Under Test (UUT)
	flow uut (
		.A1(A1), 
		.B1(B1), 
		.A2(A2), 
		.B2(B2), 
		.clk(clk), 
		.C(C)
	);

	initial begin
		// Initialize Inputs
		A1 = 0;
		B1 = 0;
		A2 = 0;
		B2 = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		A1 = 0;
		B1 = 1;
		A2 = 2;
		B2 = 3;
		#10;
		A1 = 1;
		B1 = 2;
		A2 = 1;
		B2 = 0;
		#10;
		A1 = 5;
		B1 = 5;
		A2 = 5;
		B2 = 5;
	end
      always #5 clk = ~clk;
endmodule

