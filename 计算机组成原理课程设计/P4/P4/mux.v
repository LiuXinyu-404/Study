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
module mux(
    input [4:0] in5_1,
    input [4:0] in5_2,
    input [31:0] in32_1,
    input [31:0] in32_2,
    output reg [4:0] out_5,
    output reg [31:0] out_32,
    input select
    );

	always @(*) begin
		if(select == 0)
			out_5 = in5_1;
		else if(select == 1)
			out_5 = in5_2;
		if(select == 0)
			out_32 = in32_1;
		else if(select == 1)
			out_32 = in32_2;
	end
endmodule
