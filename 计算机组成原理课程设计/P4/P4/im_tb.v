`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:03:39 11/24/2018
// Design Name:   im
// Module Name:   C:/Computer/P4/P4/im_tb.v
// Project Name:  P4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: im
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module im_tb;

	// Inputs
	reg [31:0] pc;

	// Outputs
	wire [31:0] instr;
	wire [25:0] addr;
	wire [15:0] imme;
	wire [31:26] op;
	wire [25:21] rs;
	wire [20:16] rt;
	wire [15:11] rd;
	wire [10:6] shamt;
	wire [5:0] func;

	// Instantiate the Unit Under Test (UUT)
	im uut (
		.pc(pc), 
		.instr(instr), 
		.addr(addr), 
		.imme(imme), 
		.op(op), 
		.rs(rs), 
		.rt(rt), 
		.rd(rd), 
		.shamt(shamt), 
		.func(func)
	);

	initial begin
		// Initialize Inputs
		pc = 0;
		#10;
		pc = 1;
		#10;
		pc = 2;
		#10;
		pc = 3;
		#10;
		pc = 4;
        
		// Add stimulus here

	end
      
endmodule

