`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:41:37 11/25/2018 
// Design Name: 
// Module Name:    mux 
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
module Mux(
    input [4:0] In5_1,
    input [4:0] In5_2,
    input [31:0] In32_1,
    input [31:0] In32_2,
    output reg [4:0] Out_5,
    output reg [31:0] Out_32,
    input Sel
    );

	always @(*) begin
		if(Sel == 0)
			Out_5 = In5_1;
		else if(Sel == 1)
			Out_5 = In5_2;
		if(Sel == 0)
			Out_32 = In32_1;
		else if(Sel == 1)
			Out_32 = In32_2;
	end
endmodule
