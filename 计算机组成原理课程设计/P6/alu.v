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
	 input [4:0] Shamt_In,
    input [31:0] SrcA_In,
    input [31:0] SrcB_In,
    output reg [31:0] Aluresult_Out
    );
	 
	 initial begin
		Aluresult_Out = 0;
	 end
	 
	 always @(*) begin
		if(Op_In == 6'b000000) begin//R型指令
		   if(Func_In == 6'b100000) begin//add
				Aluresult_Out = SrcA_In + SrcB_In;
			end
			else if(Func_In == 6'b100001) begin//addu
				Aluresult_Out = SrcA_In + SrcB_In;
			end
			else if(Func_In == 6'b100010) begin
				Aluresult_Out = SrcA_In - SrcB_In;//sub
			end
			else if(Func_In == 6'b100011) begin
				Aluresult_Out = SrcA_In - SrcB_In;//subu
			end
			else if(Func_In == 6'b100100) begin
				Aluresult_Out = SrcA_In & SrcB_In;//and
			end
			else if(Func_In == 6'b100101) begin
				Aluresult_Out = SrcA_In | SrcB_In;//or
			end
			else if(Func_In == 6'b100110) begin
				Aluresult_Out = SrcA_In ^ SrcB_In;//xor
			end
			else if(Func_In == 6'b100111) begin
				Aluresult_Out = ~(SrcA_In | SrcB_In);//nor
			end
			else if(Func_In == 6'b000000) begin
				Aluresult_Out = SrcB_In << Shamt_In;//sll
			end
			else if(Func_In == 6'b000010) begin
				Aluresult_Out = SrcB_In >> Shamt_In;//srl
			end
			else if(Func_In == 6'b000011) begin
				Aluresult_Out = $signed(SrcB_In) >>> Shamt_In;//sra
			end
			else if(Func_In == 6'b000100) begin
				Aluresult_Out = SrcB_In << SrcA_In[4:0];//sllv
			end
			else if(Func_In == 6'b000110 ) begin
				Aluresult_Out = SrcB_In >> SrcA_In[4:0];//srlv
			end
			else if(Func_In == 6'b000111) begin
				Aluresult_Out = $signed(SrcB_In) >>> SrcA_In[4:0];//srav
			end
			else if(Func_In == 6'b101010) begin
				if($signed(SrcA_In) < $signed(SrcB_In))//slt
					Aluresult_Out = 1;//小于（有符号）置1
				else
					Aluresult_Out = 0;
			end
			else if(Func_In == 6'b101011) begin
				if(SrcA_In < SrcB_In)//sltu
					Aluresult_Out = 1;//小于（无符号）置1
				else
					Aluresult_Out = 0;
			end
		end
		else if(Op_In == 6'b001101) begin
				Aluresult_Out = SrcA_In | SrcB_In;//ori
			end
		else if(Op_In == 6'b001000) begin
				Aluresult_Out = SrcA_In + SrcB_In;//addi
			end
		else if(Op_In == 6'b001001) begin
				Aluresult_Out = SrcA_In + SrcB_In;//addiu
			end
		else if(Op_In == 6'b001100) begin
				Aluresult_Out = SrcA_In & SrcB_In;//andi
			end
		else if(Op_In == 6'b001110) begin
				Aluresult_Out = SrcA_In ^ SrcB_In;//xori
			end
		else if(Op_In == 6'b001010) begin
				if($signed(SrcA_In) < $signed(SrcB_In))//slti
					Aluresult_Out = 1;//小于（有符号）置1
				else
					Aluresult_Out = 0;
			end
		else if(Op_In == 6'b001011) begin
				if({{0},SrcA_In} < {{0},SrcB_In})//sltiu
					Aluresult_Out = 1;//小于（无符号）置1“无符号”是误导
				else
					Aluresult_Out = 0;
			end
		else if(Op_In == 6'b001111) begin
				Aluresult_Out[31:16] = SrcB_In[15:0];
				Aluresult_Out[15:0] = 0;//lui
			end
		else if(Op_In == 6'b100011 || Op_In == 6'b100000 || Op_In == 6'b100100 ||  Op_In == 6'b100001 || Op_In == 6'b100101) begin
//Load型        lw、                   lb、                  lbu、                  lh、                 lhu
  				Aluresult_Out = SrcA_In + SrcB_In;
			end
		else if(Op_In == 6'b101011 || Op_In == 6'b101000 || Op_In == 6'b101001) begin
//Save型         sw、                  sb、                   sh
				Aluresult_Out = SrcA_In + SrcB_In;
			end
	 end
endmodule
