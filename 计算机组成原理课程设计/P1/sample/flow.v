`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:46:51 10/11/2018 
// Design Name: 
// Module Name:    flow 
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
module pipeline(
    input [31:0] A1,
    input [31:0] B1,
    input [31:0] A2,
    input [31:0] B2,
    input clk,
    output reg [31:0] C = 0
    );
	 
	 reg [31:0] step1 = 0;

	always@(posedge clk) begin
	step1 <= A1*B1+A2*B2;
	C = step1;
	end

endmodule
