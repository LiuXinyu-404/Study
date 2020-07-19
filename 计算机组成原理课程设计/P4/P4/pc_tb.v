`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:17:53 11/24/2018
// Design Name:   pc
// Module Name:   C:/Computer/P4/P4/pc_tb.v
// Project Name:  P4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pc_tb;

	// Inputs
	reg pcsrc;
	reg jump;
	reg clk;
	reg reset;
	reg [31:0] npc;
	reg [31:0] jpc;

	// Outputs
	wire [31:0] pc;

	// Instantiate the Unit Under Test (UUT)
	pc uut (
		.pcsrc(pcsrc), 
		.jump(jump), 
		.clk(clk), 
		.reset(reset), 
		.npc(npc), 
		.jpc(jpc), 
		.pc(pc)
	);

	initial begin
		// Initialize Inputs
		pcsrc = 0;
		jump = 0;
		clk = 0;
		reset = 0;
		npc = 0;
		jpc = 0;

		#100;
		reset = 1;

	end
	
	always begin
	#5;
	clk = ~clk;
	end
	
endmodule

