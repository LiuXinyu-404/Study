`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:54:08 12/05/2018 
// Design Name: 
// Module Name:    GrfReg 
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
module DEReg(
	 input Clk,
	 input Reset,
	 input Pause,
	 //数据输入
    input [31:0] Rd1_In,
    input [31:0] Rd2_In,
	 input [31:0] Sign_Imme_In,
	 input [4:0] Rs_In,
    input [4:0] Rt_In,
    input [4:0] Rd_In,
	 input [4:0] Shamt_In,
	 //数据输出
    output reg [31:0] Rd1_Out,
    output reg [31:0] Rd2_Out,
	 output reg [31:0] Sign_Imme_Out,
	 output reg [4:0] Rs_Out,
    output reg [4:0] Rt_Out,
	 output reg [4:0] Rd_Out,
	 output reg [4:0] Shamt_Out,
	 //输入控制信号
	 input RegWrite_In,
    input MemtoReg_In,
    input MemWrite_In,
    input Branch_In,
    input Alu_Src_In,
    input Reg_Dst_In,
	 input Jal_Reg_In,
	 input Jal_Data_In,
	 //输出控制信号
    output reg RegWrite_Out,
    output reg MemtoReg_Out,
    output reg MemWrite_Out,
    output reg Branch_Out,
    output reg Alu_Src_Out,
    output reg Reg_Dst_Out,
	 output reg Jal_Reg_Out,
	 output reg Jal_Data_Out,
	 //op func输入
	 input [5:0] Op_In,
	 input [5:0] Funct_In,
	 //op func输出
	 output reg [5:0] Op_Out,
	 output reg [5:0] Funct_Out,
	 //pc 输入
	 input [31:0] Pc_In,
	 //pc 输出
	 output reg [31:0] Pc_Out,
	 //Tuse,Tnew输入
	 input [1:0] Tuse_Rs_In,
	 input [1:0] Tuse_Rt_In,
	 input [1:0] Tnew_In,
	 //Tuse,Tnew输出
	 output reg [1:0] Tuse_Rs_Out,
	 output reg [1:0] Tuse_Rt_Out,
	 output reg [1:0] Tnew_Out
    );
	 /*
	initial begin
		//数据
			Rd1_Out = 0;
			Rd2_Out = 0;
			Sign_Imme_Out = 0;
			Rs_Out = 0;
			Rt_Out = 0;
			Rd_Out = 0;
			//控制信号
			RegWrite_Out = 0;
			MemtoReg_Out = 0;
			MemWrite_Out = 0;
			Branch_Out = 0;
			Alu_Src_Out = 0;
			Reg_Dst_Out = 0; 
			Jal_Out = 0;
			//op,func
			Op_Out = 0;
			Funct_Out = 0;
			//pc
			Pc_Out = Pc_In;
			//Tuse,Tnew
			Tuse_Rs_Out = 0;
			Tuse_Rt_Out = 0;
			Tnew_Out = 0;
		end
		*/
	always @(negedge Clk) begin
		if(Reset) begin
			//数据
			Rd1_Out = 0;
			Rd2_Out = 0;
			Sign_Imme_Out = 0;
			Rs_Out = 0;
			Rt_Out = 0;
			Rd_Out = 0;
			Shamt_Out = 0;
			//控制信号
			RegWrite_Out = 0;
			MemtoReg_Out = 0;
			MemWrite_Out = 0;
			Branch_Out = 0;
			Alu_Src_Out = 0;
			Reg_Dst_Out = 0; 
			Jal_Reg_Out = 0;
			Jal_Data_Out = 0;
			//op,func
			Op_Out = 0;
			Funct_Out = 0;
			//pc
			Pc_Out = Pc_In;
			//Tuse,Tnew
			Tuse_Rs_Out = 0;
			Tuse_Rt_Out = 0;
			Tnew_Out = 0;
		end
		else if(Pause) begin
			//数据
			Rd1_Out = 0;
			Rd2_Out = 0;
			Sign_Imme_Out = 0;
			Rs_Out = 0;
			Rt_Out = 0;
			Rd_Out = 0;
			Shamt_Out = 0;
			//控制信号
			RegWrite_Out = 0;
			MemtoReg_Out = 0;
			MemWrite_Out = 0;
			Branch_Out = 0;
			Alu_Src_Out = 0;
			Reg_Dst_Out = 0;
			Jal_Reg_Out = 0;
			Jal_Data_Out = 0;
			//op,func
			Op_Out = 0;
			Funct_Out = 0;
			//pc
			Pc_Out = Pc_In;
			//Tuse,Tnew
			Tuse_Rs_Out = 0;
			Tuse_Rt_Out = 0;
			Tnew_Out = 0;
		end
		else begin
			//数据
			Rd1_Out = Rd1_In;
			Rd2_Out = Rd2_In;
			Sign_Imme_Out = Sign_Imme_In;
			Rs_Out = Rs_In;
			Rt_Out = Rt_In;
			Rd_Out = Rd_In;
			Shamt_Out = Shamt_In;
			//控制信号
			RegWrite_Out = RegWrite_In;
			MemtoReg_Out = MemtoReg_In;
			MemWrite_Out = MemWrite_In;
			Branch_Out = Branch_In;
			Alu_Src_Out = Alu_Src_In;
			Reg_Dst_Out = Reg_Dst_In;
			Jal_Reg_Out = Jal_Reg_In;
			Jal_Data_Out = Jal_Data_In;
			//op,func
			Op_Out = Op_In;
			Funct_Out = Funct_In;
			//pc
			Pc_Out = Pc_In;
			//Tuse,Tnew
			Tuse_Rs_Out = Tuse_Rs_In;
			Tuse_Rt_Out = Tuse_Rt_In;
			if(Tnew_In!=0)
				Tnew_Out = Tnew_In - 1;
			else
				Tnew_Out = Tnew_In;
		end
	end
endmodule
