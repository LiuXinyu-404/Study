`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:02:18 10/11/2018
// Design Name:   buffer
// Module Name:   E:/Verliog/sample/buffer_tb.v
// Project Name:  sample
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: buffer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module buffer_tb;

	// Inputs
	reg clk;
	reg in;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	buffer uut (
		.clk(clk), 
		.in(in), 
		.out(out)
	);

	initial begin
		clk = 1;
		in = 0;
		#10;
		in <= 1;
		#10
		in <= 0;
		#10
		in <= 1;
	end
	always #5 clk = ~clk;
	 
endmodule

