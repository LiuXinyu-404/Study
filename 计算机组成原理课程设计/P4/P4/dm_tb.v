`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:29:28 11/26/2018
// Design Name:   dm
// Module Name:   C:/Computer/P4/P4/dm_tb.v
// Project Name:  P4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dm_tb;

	// Inputs
	reg clk;
	reg reset;
	reg MemWrite;
	reg [31:0] pc;
	reg [9:0] addr;
	reg [31:0] din;

	// Outputs
	wire [31:0] dout;

	// Instantiate the Unit Under Test (UUT)
	dm uut (
		.clk(clk), 
		.reset(reset), 
		.MemWrite(MemWrite), 
		.pc(pc), 
		.addr(addr), 
		.din(din), 
		.dout(dout)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		MemWrite = 0;
		pc = 0;
		addr = 0;
		din = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

