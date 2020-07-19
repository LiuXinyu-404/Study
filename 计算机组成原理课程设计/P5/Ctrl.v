`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:35:26 12/09/2018 
// Design Name: 
// Module Name:    Ctrl 
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
module Ctrl(
	 //input Clk,
	 //op,func 输入
    input [5:0] Op_In,
    input [5:0] Funct_In,
	 //控制信号输出
    output reg RegWrite_Out,
    output reg MemtoReg_Out,
    output reg MemWrite_Out,
    output reg Alu_Src_Out,
    output reg Reg_Dst_Out,
    output reg Branch_Out,
	 output reg Jump_Out,
	 output reg Ext_Op_Out,
	 output reg Jal_Out,
	 output reg Jr_Out,
	 //Tuse,Tnew输出
	 output reg [1:0] Tuse_Rs_Out,
	 output reg [1:0] Tuse_Rt_Out,
	 output reg [1:0] Tnew_Out,
	 //op输出
    output reg [5:0] Op_Out,
    output reg [5:0] Funct_Out
    );
	 
	 always @(*) begin
		 Op_Out = Op_In;
		 Funct_Out = Funct_In;
		 if(Op_In == 6'b000000 && Funct_In != 6'b001000 && Funct_In != 6'b000000) begin//R型指令除JR,NOP
		 	 Reg_Dst_Out = 1;
			 Alu_Src_Out = 0;
			 MemtoReg_Out = 0;
			 RegWrite_Out = 1;
			 MemWrite_Out = 0;
			 Branch_Out = 0;
			 Ext_Op_Out = 0;
			 Jump_Out = 0;
			 Tuse_Rs_Out = 1;
			 Tuse_Rt_Out = 1;
			 Tnew_Out = 1;
			 Jal_Out = 0;
			 Jr_Out = 0;
		 end
		 else if(Op_In  == 6'b001101 || Op_In  == 6'b001111) begin//ori 、lui
			 Reg_Dst_Out = 0;
			 Alu_Src_Out = 1;
			 MemtoReg_Out = 0;
			 RegWrite_Out = 1;
			 MemWrite_Out = 0;
			 Branch_Out = 0;
			 Ext_Op_Out = 0;
			 Jump_Out = 0;
			 Tuse_Rs_Out = 1;
			 Tuse_Rt_Out = 1;
			 Tnew_Out = 1;
			 Jal_Out = 0;
			 Jr_Out = 0;
		 end
		 else if(Op_In == 6'b100011) begin//lw
			 Reg_Dst_Out = 0;
			 Alu_Src_Out = 1;
			 MemtoReg_Out = 1;
			 RegWrite_Out = 1;
			 MemWrite_Out = 0;
			 Branch_Out = 0;
			 Ext_Op_Out = 1;
			 Jump_Out = 0;
			 Tuse_Rs_Out = 1;
			 Tuse_Rt_Out = 0;
			 Tnew_Out = 2;
			 Jal_Out = 0;
			 Jr_Out = 0;
		 end
		  else if(Op_In == 6'b101011) begin//sw
			 Reg_Dst_Out = 0;
			 Alu_Src_Out = 1;
			 MemtoReg_Out = 0;
			 RegWrite_Out = 0;
			 MemWrite_Out = 1;
			 Branch_Out = 0;
			 Ext_Op_Out = 1;
			 Jump_Out = 0;
			 Tuse_Rs_Out = 1;
			 Tuse_Rt_Out = 2;
			 Tnew_Out = 0;
			 Jal_Out = 0;
			 Jr_Out = 0;
		 end
		 else if(Op_In == 6'b000100) begin//beq
			 Reg_Dst_Out = 0;
			 Alu_Src_Out = 0;
			 MemtoReg_Out = 0;
			 RegWrite_Out = 0;
			 MemWrite_Out = 0;
			 Branch_Out = 1;
			 Ext_Op_Out = 0;
			 Jump_Out = 0;
			 Tuse_Rs_Out = 0;
			 Tuse_Rt_Out = 0;
			 Tnew_Out = 0;
			 Jal_Out = 0;
			 Jr_Out = 0;
		 end
		 else if(Op_In == 6'b000010) begin//j
			 Reg_Dst_Out = 0;
			 Alu_Src_Out = 0;
			 MemtoReg_Out = 0;
			 RegWrite_Out = 0;
			 MemWrite_Out = 0;
			 Branch_Out = 0;
			 Ext_Op_Out = 0;
			 Jump_Out = 1;
			 Tuse_Rs_Out = 0;
			 Tuse_Rt_Out = 0;
			 Tnew_Out = 0;
			 Jal_Out = 0;
			 Jr_Out = 0;
		 end
		  else if(Op_In == 6'b000011) begin//jal
			 Reg_Dst_Out = 0;
			 Alu_Src_Out = 0;
			 MemtoReg_Out = 0;
			 RegWrite_Out = 1;
			 MemWrite_Out = 0;
			 Branch_Out = 0;
			 Ext_Op_Out = 0;
			 Jump_Out = 1;
			 Tuse_Rs_Out = 1;
			 Tuse_Rt_Out = 1;
			 Tnew_Out = 1;
			 Jal_Out = 1;
			 Jr_Out = 0;
		 end
		  else if(Op_In == 6'b000000 && Funct_In == 6'b001000) begin//JR型指令
			 Reg_Dst_Out = 0;
			 Alu_Src_Out = 0;
			 MemtoReg_Out = 0;
			 RegWrite_Out = 0;
			 MemWrite_Out = 0;
			 Branch_Out = 0;
			 Ext_Op_Out = 0;
			 Jump_Out = 1;
			 Tuse_Rs_Out = 0;
			 Tuse_Rt_Out = 0;
			 Tnew_Out = 0;
			 Jal_Out = 0;
			 Jr_Out = 1;
		 end
		 else if(Op_In == 6'b000000 && Funct_In == 6'b000000) begin//nop
			 Reg_Dst_Out = 0;
			 Alu_Src_Out = 0;
			 MemtoReg_Out = 0;
			 RegWrite_Out = 0;
			 MemWrite_Out = 0;
			 Branch_Out = 0;
			 Ext_Op_Out = 0;
			 Jump_Out = 0;
			 Tuse_Rs_Out = 0;
			 Tuse_Rt_Out = 0;
			 Tnew_Out = 0;
			 Jal_Out = 0;
			 Jr_Out = 0;
		 end
	 end
	 
endmodule
