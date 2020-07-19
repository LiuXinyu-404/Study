`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:42:32 10/06/2018
// Design Name:   adder1
// Module Name:   E:/Verliog/sample/adder1_tb.v
// Project Name:  sample
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: adder1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module adder1_tb;

	// Inputs
	reg clk;
	reg Cin;
	reg A;
	reg B;

	// Outputs
	wire sum;
	wire Overflow;

	// Instantiate the Unit Under Test (UUT)
	adder1 uut (
		.clk(clk), 
		.Cin(Cin), 
		.A(A), 
		.B(B), 
		.sum(sum), 
		.Overflow(Overflow)
	);

	initial begin
		clk = 0;
		Cin = 0;
		A = 0;
		B = 0;
		$monitor("%04dns monitor: A=%d,B=%d,Cin=%d,sum=%d,Overflow=%d",$time,A,B,Cin,sum,Overflow);
		#1000 $finish;
	end
	
	always #50 Cin = Cin + 1;
	always #100 A = A + 1;
	always #200 B = B + 1;
	always #10 clk = ~clk;
	
      
endmodule

