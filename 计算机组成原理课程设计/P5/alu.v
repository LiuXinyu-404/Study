`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:24:09 11/25/2018 
// Design Name: 
// Module Name:    alu 
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
module Alu(
	 input [5:0] Op_In,
    input [5:0] Func_In,
    input [31:0] SrcA_In,
    input [31:0] SrcB_In,
    output reg [31:0] Aluresult_Out
    );
	 
	 initial begin
		Aluresult_Out = 0;
	 end
	 
	 always @(*) begin
		if(Op_In == 6'b000000) begin//R–Õ÷∏¡Ó
			if(Func_In == 6'b100001) begin//addu
				Aluresult_Out = SrcA_In + SrcB_In;
			end
			else if(Func_In == 6'b100011) begin
				Aluresult_Out = SrcA_In - SrcB_In;//subu
			end
		end
		else if(Op_In == 6'b001101) begin
				Aluresult_Out = SrcA_In | SrcB_In;//ori
			end
		else if(Op_In == 6'b001111) begin
				Aluresult_Out[31:16] = SrcB_In[15:0];
				Aluresult_Out[15:0] = 0;//lui
			end
		else if(Op_In == 6'b100011) begin
				Aluresult_Out = SrcA_In + SrcB_In;//lw
			end
		else if(Op_In == 6'b101011) begin
				Aluresult_Out = SrcA_In + SrcB_In;//sw
			end
	 end
endmodule
