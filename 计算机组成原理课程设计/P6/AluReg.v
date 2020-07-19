`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:06:29 12/05/2018 
// Design Name: 
// Module Name:    AluReg 
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
module EMReg(
	 //��������
	 input Clk,
	 input Reset,
    input [31:0] AluResult_In,
    input [31:0] WriteData_In,
    input [4:0] WriteReg_In,
	 //�������
    output reg [31:0] AluResult_Out,
    output reg [31:0] WriteData_Out,
    output reg [4:0] WriteReg_Out,
	 //�����ź�
    input RegWrite_In,
    input MemtoReg_In,
    input MemWrite_In,
	 input Jal_In,
	 //����ź�
    output reg RegWrite_Out,
    output reg MemtoReg_Out,
    output reg MemWrite_Out,
	 output reg Jal_Out,
	 //pc ����
	 input [31:0] Pc_In,
	 //pc ���
	 output reg [31:0] Pc_Out,
	 //Tuse,Tnew����
	 input [1:0] Tuse_Rs_In,
	 input [1:0] Tuse_Rt_In,
	 input [1:0] Tnew_In,
	 //Tuse,Tnew���
	 output reg [1:0] Tuse_Rs_Out,
	 output reg [1:0] Tuse_Rt_Out,
	 output reg [1:0] Tnew_Out,
	 //op
	 input [5:0] Op_In,
	 output reg [5:0] Op_Out
    );
	/*initial begin
		//����
			AluResult_Out = 0;
			WriteData_Out = 0;
			WriteReg_Out = 0;
			//�����ź�
			RegWrite_Out = 0;
			MemtoReg_Out = 0;
			MemWrite_Out = 0;
			Jal_Out = 0;
			//pc
			Pc_Out = 0;
			//Tuse,Tnew
			Tuse_Rs_Out = 0;
			Tuse_Rt_Out = 0;
			Tnew_Out = 0;
		end
		*/
	always @(negedge Clk) begin
		if(Reset) begin
			//����
			AluResult_Out = 0;
			WriteData_Out = 0;
			WriteReg_Out = 0;
			//�����ź�
			RegWrite_Out = 0;
			MemtoReg_Out = 0;
			MemWrite_Out = 0;
			Jal_Out = 0;
			//pc
			Pc_Out = 0;
			//Tuse,Tnew
			Tuse_Rs_Out = 0;
			Tuse_Rt_Out = 0;
			Tnew_Out = 0;
			//Op
			Op_Out = 0;
		end
		else begin
			//����
			AluResult_Out = AluResult_In;
			WriteData_Out = WriteData_In;
			WriteReg_Out = WriteReg_In;
			//�����ź�
			RegWrite_Out = RegWrite_In;
			MemtoReg_Out = MemtoReg_In;
			MemWrite_Out = MemWrite_In;
			Jal_Out = Jal_In;
			//pc
			Pc_Out = Pc_In;
			//Tuse,Tnew
			Tuse_Rs_Out = Tuse_Rs_In;
			Tuse_Rt_Out = Tuse_Rt_In;
			if(Tnew_In!=0)
				Tnew_Out = Tnew_In - 1;
			else
				Tnew_Out = Tnew_In;
			//Op
			Op_Out = Op_In;
		end
	end
endmodule
