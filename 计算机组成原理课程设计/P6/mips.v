`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:15:42 12/03/2018 
// Design Name: 
// Module Name:    mips 
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
 module mips(
    input clk,
    input reset
    );
	 //F级流水线
	 wire [31:0] Pc_F;
	 wire [31:0] Instr_F;
	 wire [31:0] Pc_Add1_F;
	 //D级流水线
	 wire [31:0] Pc_D;
	 wire [31:0] Instr_D;
	 wire [31:0] Pc_Branch_D, Pc_Jump_D, Pc_Jump_Result;
	 wire [31:0] Sign_Imme_D;
	 wire [31:0] Rd1_D, Rd2_D;
	 //D级控制信号
	 wire Pc_Src_D, Jump_D, RegWrite_D, MemtoReg_D, MemWrite_D;
	 wire Alu_Src_D, Reg_Dst_D, Branch_D, Ext_Op_D, Equal_D;
	 wire [5:0] Op_D, Funct_D;
	 wire [4:0] Rs_D, Rt_D, Rd_M, Rd_W;
	 wire [31:0] Zero_In1;
	 wire [31:0] Zero_In2;
	 //E级流水线
	 wire [31:0] Sign_Imme_E;
	 wire [31:0] Rd1_E, Rd2_E, Result_E;
	 wire [4:0] Rs_E, Rt_E, Rd_E, RegDst_Out_E, Shamt_E;
	 wire [31:0] Src_A_E, Src_B_E, Write_Data_E, Alu_Out_E, Pc_E; 
	 wire [5:0] Op_E, Funct_E;
	 wire [4:0] WriteReg_E;
	 //E级控制信号
	 wire RegWrite_E, MemtoReg_E, MemWrite_E;
	 wire Alu_Src_E, Reg_Dst_E, Branch_E, Ext_Op_E, Equal_E;
	 //M级流水线
	 wire [31:0] Result_M, Write_Data_M,Pc_M, DM_Out_M, Write_Data_ReSult_M;
	 wire [5:0] Op_M;
	 wire [4:0] WriteReg_M;
	  //M级控制信号
	 wire RegWrite_M, MemtoReg_M, MemWrite_M;
	 //W级流水线
	 wire [31:0] DM_Out_W, Alu_Out_W, Result_W, Pc_W, Result_W;
	 wire [4:0] WriteReg_W, WriteReg_W;
	 wire RegWrite_W, MemtoReg_W;
	 //Tuse,Tnew
	 wire [1:0] Tnew_D, Tuse_Rs_D, Tuse_Rt_D;
	 wire [1:0] Tnew_E, Tuse_Rs_E, Tuse_Rt_E;
	 wire [1:0] Tnew_M, Tuse_Rs_M, Tuse_Rt_M;
	 wire [1:0] Tnew_W;
	 //暂停信号
	 wire Pause;
	 assign Clk = clk;
	 assign Reset = reset;
	 assign Pc_Jump_D = {0,Instr_D[25:0]} << 2;
	 assign Pc_Src_D = Branch_D & Equal_D;
	 assign Rs_D = Instr_D[25:21];
	 assign Rt_D = Instr_D[20:16];
	 
	 
	 
	 wire [31:0] Pc_D_Real;
	 assign Pc_D_Real = ((Pc_D << 2) - 4);
//F级流水线
//////////////////////////////////////////////////////////////////////
	Im IM(
		.Pc_In(Pc_F),
		.Instr_Out(Instr_F)
	);
	Add4 ADD4(
		.Pc_In(Pc_F),
		.Pc_Add1_Out(Pc_Add1_F)
	);
	Pc PC(
		.Pc_Src_In(Pc_Src_D),
		.Jump_In(Jump_D),
		.Clk(Clk),
		.Reset(Reset),
		.Pause(Pause),
		.Bpc_In(Pc_Branch_D),
		.Jpc_In(Pc_Jump_Result),
		.Pc_Add1_In(Pc_Add1_F),
		.Pc_Out(Pc_F)
	);
	FDReg FDREG(
		.Instr_In(Instr_F),
		.Pc_In(Pc_Add1_F),
		.Instr_Out(Instr_D),
		.Pc_Out(Pc_D),
		.Clk(Clk),
		.Reset(Reset),
		.Pause(Pause)
	);
//D级流水线
//////////////////////////////////////////////////////////////////////
	Ctrl CTRL(
		//.Clk(clk),
		 //op,func输入
		.Op_In(Instr_D[31:26]),
		.Funct_In(Instr_D[5:0]),
		//控制信号输出
		.RegWrite_Out(RegWrite_D),
		.MemtoReg_Out(MemtoReg_D),
		.MemWrite_Out(MemWrite_D),
		.Alu_Src_Out(Alu_Src_D),
		.Reg_Dst_Out(Reg_Dst_D),
		.Branch_Out(Branch_D),
		.Jump_Out(Jump_D),
		.Ext_Op_Out(Ext_Op_D),
		.Jal_Reg_Out(Jal_Reg_D),
		.Jal_Data_Out(Jal_Data_D),
		.Jr_Out(Jr_D),
		//Tuse,Tnew
		.Tuse_Rs_Out(Tuse_Rs_D),
		.Tuse_Rt_Out(Tuse_Rt_D),
		.Tnew_Out(Tnew_D),
		//op,func输出
		.Op_Out(Op_D),
		.Funct_Out(Funct_D)
	);
	Grf GRF(
		.Pc_In(Pc_W-1),
		.A1_In(Rs_D),
		.A2_In(Rt_D),
		.A3_In(WriteReg_W),
		.Wd3_In(Result_W),
		.Rd1_Out(Rd1_D),
		.Rd2_Out(Rd2_D),
		.Clk(Clk),
		.Reset(Reset),
		.We3_In(RegWrite_W)
	);
	Ext EXT(
		.Imme_In(Instr_D[15:0]),
		.Ext_Out(Sign_Imme_D),
		.Ext_Op(Ext_Op_D)
	);
	PcBranch PCBRANCH(
		.Pc_In(Pc_D),
		.Imme_In(Instr_D[15:0]),
		.Pc_Out(Pc_Branch_D)
	);
	Mux JR(
		.In32_1(Pc_Jump_D),
		.In32_2(Zero_In1),
		.Out_32(Pc_Jump_Result),
		.Sel(Jr_D)
	);
	Src Zero_1(
		//.Clk(clk),
		.Data_E(Rd1_D),
		.Data_M(Result_M),
		.Data_W(Result_W),
		.Reg_E(Rs_D),
		.Reg_M(WriteReg_M),
		.Reg_W(WriteReg_W),
		.Tnew_In_M(Tnew_M),
		.Tnew_In_W(Tnew_W),
		.RegWrite_M(RegWrite_M),
		.RegWrite_W(RegWrite_W),
		.Data_Out(Zero_In1)
	);
	Src Zero_2(
		//.Clk(clk),
		.Data_E(Rd2_D),
		.Data_M(Result_M),
		.Data_W(Result_W),
		.Reg_E(Rt_D),
		.Reg_M(WriteReg_M),
		.Reg_W(WriteReg_W),
		.Tnew_In_M(Tnew_M),
		.Tnew_In_W(Tnew_W),
		.RegWrite_M(RegWrite_M),
		.RegWrite_W(RegWrite_W),
		.Data_Out(Zero_In2)
	);
	Zero ZERO(
		.Op_In(Instr_D[31:26]),
		.Rt_In(Instr_D[20:16]),
		.In_1(Zero_In1),
		.In_2(Zero_In2),
		.Zero_Out(Equal_D)
	);
	DEReg DEREG(
		.Clk(Clk),
		.Pause(Pause),
		//数据输入
		.Rd1_In(Rd1_D),
		.Rd2_In(Rd2_D),
		.Sign_Imme_In(Sign_Imme_D),
		.Rs_In(Instr_D[25:21]),
		.Rt_In(Instr_D[20:16]),
		.Rd_In(Instr_D[15:11]),
		.Shamt_In(Instr_D[10:6]),
		//数据输出
		.Rd1_Out(Rd1_E),
		.Rd2_Out(Rd2_E),
		.Sign_Imme_Out(Sign_Imme_E),
		.Rs_Out(Rs_E),
		.Rt_Out(Rt_E),
		.Rd_Out(Rd_E),
		.Shamt_Out(Shamt_E),
		//信号输入
		.RegWrite_In(RegWrite_D),
		.MemtoReg_In(MemtoReg_D),
		.MemWrite_In(MemWrite_D),
		.Alu_Src_In(Alu_Src_D),
		.Reg_Dst_In(Reg_Dst_D),
		.Jal_Reg_In(Jal_Reg_D),
		.Jal_Data_In(Jal_Data_D),
		//信号输出
		.RegWrite_Out(RegWrite_E),
		.MemtoReg_Out(MemtoReg_E),
		.MemWrite_Out(MemWrite_E),
		.Alu_Src_Out(Alu_Src_E),
		.Reg_Dst_Out(Reg_Dst_E),
		.Jal_Reg_Out(Jal_Reg_E),
		.Jal_Data_Out(Jal_Data_E),
		//op,func输入
		.Op_In(Op_D),
		.Funct_In(Funct_D),
		//op,func输出
		.Op_Out(Op_E),
		.Funct_Out(Funct_E),
		//pc输入
		.Pc_In(Pc_D),
		//pc输出
		.Pc_Out(Pc_E),
		//Tuse,Tnew输入
		.Tuse_Rs_In(Tuse_Rs_D),
		.Tuse_Rt_In(Tuse_Rt_D),
		.Tnew_In(Tnew_D),
		//Tuse,Tnew输出
		.Tuse_Rs_Out(Tuse_Rs_E),
		.Tuse_Rt_Out(Tuse_Rt_E),
		.Tnew_Out(Tnew_E)
		);
//E级流水线
//////////////////////////////////////////////////////////////////////
	//RegDst
	Mux RegDst (
		.In5_1(Rt_E),
		.In5_2(Rd_E),
		.Out_5(RegDst_Out_E),
		.Sel(Reg_Dst_E)
	);
	//AluSrc
	Mux AluSrc (
		.In32_1(Write_Data_E),
		.In32_2(Sign_Imme_E),
		.Out_32(Src_B_E),
		.Sel(Alu_Src_E)
	);
	//Src控制信号
	Src SrcA (
		//.Clk(clk),
		.Data_E(Rd1_E),
		.Data_M(Result_M),
		.Data_W(Result_W),
		.Reg_E(Rs_E),
		.Reg_M(WriteReg_M),
		.Reg_W(WriteReg_W),
		.Tnew_In_M(Tnew_M),
		.Tnew_In_W(Tnew_W),
		.RegWrite_M(RegWrite_M),
		.RegWrite_W(RegWrite_W),
		.Data_Out(Src_A_E)
	);
	Src SrcB (
		//.Clk(clk),
		.Data_E(Rd2_E),
		.Data_M(Result_M),
		.Data_W(Result_W),
		.Reg_E(Rt_E),
		.Reg_M(WriteReg_M),
		.Reg_W(WriteReg_W),
		.Tnew_In_M(Tnew_M),
		.Tnew_In_W(Tnew_W),
		.RegWrite_M(RegWrite_M),
		.RegWrite_W(RegWrite_W),
		.Data_Out(Write_Data_E)
	);
	//Alu单元
	Alu ALU(
		.Op_In(Op_E),
		.Func_In(Funct_E),
		.Shamt_In(Shamt_E),
		.SrcA_In(Src_A_E),
		.SrcB_In(Src_B_E),
		.Aluresult_Out(Alu_Out_E)
	);
	//Jal
	Mux Jal_Reg (
		.In5_1(RegDst_Out_E),
		.In5_2(5'b11111),
		.Out_5(WriteReg_E),
		.Sel(Jal_Reg_E)
	);
	Mux Jal_Data (
		.In32_1(Alu_Out_E),
		.In32_2(12288 + (Pc_E << 2) + 4),
		.Out_32(Result_E),
		.Sel(Jal_Data_E)
	);
	//EMReg
	EMReg EMREG(
		.Clk(Clk),
		//输入数据
		.AluResult_In(Result_E),
		.WriteData_In(Write_Data_E),
		.WriteReg_In(WriteReg_E),
		//输出数据
		.AluResult_Out(Result_M),
		.WriteData_Out(Write_Data_M),
		.WriteReg_Out(WriteReg_M),
		//输入信号
		.RegWrite_In(RegWrite_E),
		.MemtoReg_In(MemtoReg_E),
		.MemWrite_In(MemWrite_E),
		//输出信号
		.RegWrite_Out(RegWrite_M),
		.MemtoReg_Out(MemtoReg_M),
		.MemWrite_Out(MemWrite_M),
		//pc输入
		.Pc_In(Pc_E),
		//pc输出
		.Pc_Out(Pc_M),
		//Tuse,Tnew输入
		.Tuse_Rs_In(Tuse_Rs_E),
		.Tuse_Rt_In(Tuse_Rt_E),
		.Tnew_In(Tnew_E),
		//Tuse,Tnew输出
		.Tuse_Rs_Out(Tuse_Rs_M),
		.Tuse_Rt_Out(Tuse_Rt_M),
		.Tnew_Out(Tnew_M),
		//Op输入
		.Op_In(Op_E),
		//Op输出
		.Op_Out(Op_M)
	);
//M级流水线
//////////////////////////////////////////////////////////////////////、
	/*Src DM_In_M(
		//.Clk(clk),
		.Data_E(Write_Data_M),
		.Data_W(Result_W),
		.Reg_E(WriteReg_M),
		.Reg_W(WriteReg_W),
		.Tnew_In_W(Tnew_W),
		.RegWrite_W(RegWrite_W),
		.Data_Out(Write_Data_ReSult_M)
	);
	*/
	DM DM(
		.Clk(Clk),
		.Reset(Reset),
		.MemWrite_In(MemWrite_M),
		.Op_In(Op_M),
		.Pc_In(Pc_M-1),
		.Addr_In(Result_M),
		.D_In(Write_Data_M),
		.D_Out(DM_Out_M)
	);
	MWReg MWREG(
		.Clk(Clk),
		//pc输入
		.Pc_In(Pc_M),
		//pc输出
		.Pc_Out(Pc_W),
		//控制信号输入
		.RegMem_In(RegWrite_M),
		.MemtoReg_In(MemtoReg_M),
		//控制信号输出
		.RegMem_Out(RegWrite_W),
		.MemtoReg_Out(MemtoReg_W),
		//数据输入
		.ReadData_In(DM_Out_M),
		.WriteReg_In(WriteReg_M),
		.AluOut_In(Result_M),
		//数据输出
		.ReadData_Out(DM_Out_W),
		.WriteReg_Out(WriteReg_W),
		.AluOut_Out(Alu_Out_W),
		//Tnew
		.Tnew_In(Tnew_E),
		.Tnew_Out(Tnew_W)
	);
	Mux MemtoReg (
		.In32_1(Alu_Out_W),
		.In32_2(DM_Out_W),
		.Out_32(Result_W),
		.Sel(MemtoReg_W)
	);
	//暂停
	Pause PAUSE(
		.Rs_In(Instr_D[25:21]),
		.Rt_In(Instr_D[20:16]),
		.Rd_E_In(WriteReg_E),
		.Rd_M_In(WriteReg_M),
		.Tuse_Rs_In(Tuse_Rs_D),
		.Tuse_Rt_In(Tuse_Rt_D),
		.Tnew_E_In(Tnew_E),
		.Tnew_M_In(Tnew_M),
		.W_E_In(RegWrite_E),
		.W_M_In(RegWrite_M),
		.Pause_Out(Pause)
	);
endmodule
