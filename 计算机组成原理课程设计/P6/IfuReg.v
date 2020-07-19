`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:05:38 12/05/2018 
// Design Name: 
// Module Name:    IfuReg 
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
module FDReg(
    input [31:0] Instr_In,
    input [31:0] Pc_In,
    output reg [31:0] Instr_Out,
    output reg[31:0] Pc_Out,
    input Clk,
	 input Pause,
	 input Reset
    );
	 /*
	 initial begin
			Instr_Out = 0;
			Pc_Out = 0;
		end
		*/
	always @(posedge Clk) begin
		//Êý¾Ý
		if (Reset) begin
			Instr_Out = 0;
			Pc_Out = 0;
		end
		else if (Pause) begin
			Instr_Out = Instr_Out;
			Pc_Out = Pc_Out;
		end
		else begin
			Instr_Out = Instr_In;
			Pc_Out = Pc_In;
		end
	end

endmodule
