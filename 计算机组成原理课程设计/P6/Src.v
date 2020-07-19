`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:31:36 12/10/2018 
// Design Name: 
// Module Name:    Src 
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
module Src(
	 // ˝æ› ‰»Î
	 //input Clk,
    input [31:0] Data_E,
    input [31:0] Data_M,
    input [31:0] Data_W,
    input [4:0] Reg_E,
	 input [4:0] Reg_M,
	 input [4:0] Reg_W,
	 input [1:0] Tnew_In_M,
	 input [1:0] Tnew_In_W,
	 input RegWrite_M,
	 input RegWrite_W,
    output reg [31:0] Data_Out
    );
	always @(*) begin
		if ((Reg_E != 0)&&(Reg_E == Reg_M) && Tnew_In_M == 0 && RegWrite_M)
			Data_Out = Data_M;
		else if ((Reg_E != 0)&&(Reg_E == Reg_W) && Tnew_In_W == 0 && RegWrite_W)
			Data_Out = Data_W;
		else 
			Data_Out = Data_E;
	end
endmodule
