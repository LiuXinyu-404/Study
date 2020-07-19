`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:35:39 10/06/2018 
// Design Name: 
// Module Name:    adder1 
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
module adder1(
    input clk,
    input Cin,
    input A,
    input B,
    output sum,
    output Overflow
    );
	 
	 assign {Overflow, sum} = A + B + Cin;
	 
endmodule
