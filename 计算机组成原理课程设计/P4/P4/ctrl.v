`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:28:33 11/25/2018 
// Design Name: 
// Module Name:    ctrl 
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
module ctrl(
    input [5:0] op,//写入op指令
	 input [5:0] func,//写入func
	 input zero,
    output reg regdst,//选择目的寄存器由rt字段或rd字段控制
    output reg alusrc,//选择SrcB来自RD2或signimm
    output reg regwrite,//输出寄存器写入使能信号
	 output reg memwrite,//输出内存写入使能信号
    output reg branch,//输出是否跳转信号
    output reg extop,//选择扩展immediate
    output reg [1:0] aluop,//输出ALU选择信号
    output reg memtoreg,//内存写入寄存器使能信号
    output reg jump,//输出是否跳转信号
	 output reg jal,//jal
	 output reg jr,//jr
	 output pcsrc //判断是否跳转
    );
	 
	 assign pcsrc = branch & zero;
	 
	 always @(*) begin
		 if(op == 6'b000000 && func != 6'b001000) begin//R型指令
			 regdst = 1;
			 alusrc = 0;
			 memtoreg = 0;
			 regwrite = 1;
			 memwrite = 0;
			 branch = 0;
			 extop = 0;
			 aluop = 2'b10;
			 jump = 0;
			 jal = 0;
			 jr = 0;
		 end
		 else if(op == 6'b001101 || op == 6'b001111) begin//ori 、lui
			 regdst = 0;
			 alusrc = 1;
			 memtoreg = 0;
			 regwrite = 1;
			 memwrite = 0;
			 branch = 0;
			 extop = 0;
			 aluop = 2'b00;
			 jump = 0;
			 jal = 0;
			 jr = 0;
		 end
		 else if(op == 6'b100011) begin//lw
			 regdst = 0;
			 alusrc = 1;
			 memtoreg = 1;
			 regwrite = 1;
			 memwrite = 0;
			 branch = 0;
			 extop = 1;
			 aluop = 2'b00;
			 jump = 0;
			 jal = 0;
			 jr = 0;
		 end
		 else if(op == 6'b101011) begin//sw
			 regdst = 0;
			 alusrc = 1;
			 memtoreg = 0;
			 regwrite = 0;
			 memwrite = 1;
			 branch = 0;
			 extop = 1;
			 aluop = 2'b00;
			 jump = 0;
			 jal = 0;
			 jr = 0;
		 end
		 else if(op == 6'b000100) begin//beq
			 regdst = 0;
			 alusrc = 0;
			 memtoreg = 0;
			 regwrite = 0;
			 memwrite = 0;
			 branch = 1;
			 extop = 0;
			 aluop = 2'b01;
			 jump = 0;
			 jal = 0;
			 jr = 0;
		 end
		 else if(op == 6'b000010) begin//j
			 regdst = 0;
			 alusrc = 0;
			 memtoreg = 0;
			 regwrite = 0;
			 memwrite = 0;
			 branch = 0;
			 extop = 0;
			 aluop = 2'b01;
			 jump = 1;
			 jal = 0;
			 jr = 0;
		 end
		  else if(op == 6'b000011) begin//jal
			 regdst = 0;
			 alusrc = 0;
			 memtoreg = 0;
			 regwrite = 1;
			 memwrite = 0;
			 branch = 0;
			 extop = 0;
			 aluop = 2'b01;
			 jump = 1;
			 jal = 1;
			 jr = 0;
		 end
		 else if(op == 6'b000000 && func == 6'b001000) begin//jr
			 regdst = 0;
			 alusrc = 0;
			 memtoreg = 0;
			 regwrite = 0;
			 memwrite = 0;
			 branch = 0;
			 extop = 0;
			 aluop = 2'b01;
			 jump = 1;
			 jal = 0;
			 jr = 1;
		 end
		end
endmodule
