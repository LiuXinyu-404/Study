`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:19:19 10/08/2018
// Design Name:   code
// Module Name:   E:/Verliog/sample/code_tb.v
// Project Name:  sample
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: code
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module code_tb;

	// Inputs
	reg Clk;
	reg Reset;
	reg Slt;
	reg En;

	// Outputs
	wire [63:0] Output0;
	wire [63:0] Output1;

	// Instantiate the Unit Under Test (UUT)
	code uut (
		.Clk(Clk), 
		.Reset(Reset), 
		.Slt(Slt), 
		.En(En), 
		.Output0(Output0), 
		.Output1(Output1)
	);

	initial begin
		Clk = 0;
		Reset = 0;
		Slt = 1;
		En = 0;	
	#5 En = 1;
	#5 Slt = 0;
	#30 En = 0;
	#10 Reset = 1;
	#5 En = 1;
	#10 Reset = 0;
	#100 Slt = 1;
	#100 Slt = 0;
	#100 Slt = 1;
	end
	
	always #10 Clk=~Clk;
      
endmodule

