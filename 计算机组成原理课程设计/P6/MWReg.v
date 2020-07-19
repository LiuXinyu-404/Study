`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:52:26 12/07/2018 
// Design Name: 
// Module Name:    MWReg 
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
module MWReg(
	 input Clk,
	 input Reset,
	 //控制信号输入
    input RegMem_In,
    input MemtoReg_In,
	 input Jal_In,
	 //控制信号输出
    output reg RegMem_Out,
    output reg MemtoReg_Out,
	 output reg Jal_Out,
	 //数据输入
    input [31:0] ReadData_In,
	 input [4:0] WriteReg_In,
	 input [31:0] AluOut_In,
	 //数据输出
    output reg [31:0] ReadData_Out,
    output reg [4:0] WriteReg_Out,
    output reg [31:0] AluOut_Out,
	 //pc 输入
	 input [31:0] Pc_In,
	 //pc 输出
	 output reg [31:0] Pc_Out,
	 //Tnew
	 input [1:0] Tnew_In,
	 output reg [1:0] Tnew_Out
    );
	 
	 /*
	 initial begin
		//数据
			ReadData_Out = 0;
			WriteReg_Out = 0;
			AluOut_Out = 0;
			//控制信号
			RegMem_Out = 0;
			MemtoReg_Out = 0;
			Pc_Out = 0;
			Tnew_Out = 0;
		end
	 */
	 always @(negedge Clk) begin
		if(Reset) begin
			//数据
			ReadData_Out = 0;
			WriteReg_Out = 0;
			AluOut_Out = 0;
			//控制信号
			RegMem_Out = 0;
			MemtoReg_Out = 0;
			Pc_Out = 0;
			Tnew_Out = 0;
		end
		else begin
			//数据
			ReadData_Out = ReadData_In;
			WriteReg_Out = WriteReg_In;
			AluOut_Out = AluOut_In;
			//控制信号
			RegMem_Out = RegMem_In;
			MemtoReg_Out = MemtoReg_In;
			Jal_Out = Jal_In;
			//pc
			Pc_Out = Pc_In;
			if(Tnew_In!=0)
				Tnew_Out = Tnew_In - 1;
			else
				Tnew_Out = Tnew_In;
		end
	end
endmodule
