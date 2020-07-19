`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:41:02 10/04/2018 
// Design Name: 
// Module Name:    Adder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module adder(
    input [3:0] A,
	 input [3:0] B,
	 input Clk,
	 input En,
	 output reg [3:0] Sum,
	 output reg Overflow
    );
	 
	 initial begin
	 Sum = 0;
	 Overflow = 0;
	 end
	 
	always @(posedge Clk) begin
		if(En) begin
			{Overflow,Sum} <=  A + B;
		end
	end

endmodule
