`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:33:10 11/27/2018
// Design Name:   alu
// Module Name:   C:/Computer/P4/P4/alu_tb.v
// Project Name:  P4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_tb;

	// Inputs
	reg clk;
	reg [5:0] op;
	reg [5:0] func;
	reg [1:0] aluop;
	reg [31:0] in1;
	reg [31:0] in2;

	// Outputs
	wire [31:0] aluresult;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.clk(clk), 
		.op(op), 
		.func(func), 
		.aluop(aluop), 
		.in1(in1), 
		.in2(in2), 
		.aluresult(aluresult), 
		.zero(zero)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		op = 6'b001111;
		func = 0;
		aluop = 0;
		in1 = 0;
		in2 = 1;
		#10
		clk = 1;
		// Add stimulus here

	end
      
endmodule

