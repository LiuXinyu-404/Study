`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:46:53 11/24/2018 
// Design Name: 
// Module Name:    pc 
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
module Pc(
    input Pc_Src_In,
    input Jump_In,
    input Clk,
    input Reset,
	 input Pause,
    input [31:0] Bpc_In,//B跳转
    input [31:0] Jpc_In,//J跳转
	 input [31:0] Pc_Add1_In,
    output reg [31:0] Pc_Out
    );
	initial begin
	Pc_Out = 8'h0;
	end
	
	reg [31:0] Sign_Imme;
	
	always @(posedge Clk) begin
		if(Reset == 1) begin //pc重置
			Pc_Out <= 8'h0;
		end
		else if(Jump_In == 1) begin
			Pc_Out <= (Jpc_In - 12288) >> 2;	//pc跳转j指令
		end
		else if(Pc_Src_In == 1) begin
			Pc_Out <= Bpc_In;	//pc跳转b指令
		end
		else if(Pause)
			Pc_Out <= Pc_Out;
		else begin//更新pc
			Pc_Out <= Pc_Add1_In;
		end
	end
	
endmodule
