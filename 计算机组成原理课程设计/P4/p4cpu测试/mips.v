`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:08:17 11/23/2018 
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
	wire [31:0] pc, pc4, jpc, npc, spc, aluresult, wd3, rd1, rd2, regin, instr, in1, in2, ext_out, JAL2_in1, JR_in1;//s2
	wire [5:0] op, func;
	wire [4:0] rs, rt, rd, shamt, a1, a2, a3, JAL1_in1;//s1
	wire [15:0] imme;
	wire [25:0] addr;
	wire pcsrc, memwrite, regwrite, memtoreg, zero, jal;
	wire [1:0] aluop;
	
	assign JR_in1 = {0,addr} << 2;
	
	//PC
	pc PC(.pcsrc(pcsrc), 
			.jump(jump), 
			.clk(clk), 
			.reset(reset), 
			.imme(imme), 
			.jpc(jpc), 
			.pc(pc),
			.spc(spc)
			);
	//IM
	im IM(.pc(pc), 
			.instr(instr), 
			.addr(addr), 
			.imme(imme), 
			.op(op), 
			.rs(rs), 
			.rt(rt), 
			.rd(rd), 
			.shamt(shamt), 
			.func(func)
			);
	//ALU
	alu ALU( .op(op), 
				.func(func), 
				.aluop(aluop), 
				.in1(rd1), 
				.in2(in2), 
				.zero(zero), 
				.aluresult(aluresult)
				);
	//DM
	dm DM(.pc(spc), 
			.clk(clk), 
			.reset(reset), 
			.MemWrite(memwrite),
			.addr(aluresult), 
			.din(rd2), 
			.dout(regin)
			);
	//GRF
	grf GRF(	.pc(spc), 
				.a1(rs), 
				.a2(rt), 
				.a3(a3), 
				.wd3(wd3), 
				.rd1(rd1), 
				.rd2(rd2), 
				.clk(clk), 
				.we3(regwrite), 
				.reset(reset)
				);
	//REGDST
	mux REGDST(	.in5_1(rt), 
					.in5_2(rd), 
					.out_5(JAL1_in1), 
					.select(regdst)
					);
	//JAL1
	mux JAL1(.in5_1(JAL1_in1), 
				.in5_2(5'b11111), 
				.out_5(a3), 
				.select(jal)
				);
	//JAL2
	mux JAL2(.in32_1(JAL2_in1), 
				.in32_2(spc+4), 
				.out_32(wd3), 
				.select(jal)
				);
	//MEMTOREG
	mux MEMTOREG(.in32_1(aluresult), 
					 .in32_2(regin), 
					 .out_32(JAL2_in1), 
					 .select(memtoreg)
					 );
	//ALUSRC
	mux ALUSRC(.in32_1(rd2), 
				  .in32_2(ext_out), 
				  .out_32(in2), 
				  .select(alusrc)
				  );
				  
	// JR
	mux JR(.in32_1(JR_in1),
			 .in32_2(rd1),
			 .out_32(jpc), 
			 .select(jr)
				);
	//EXT
	ext EXT( .imme(imme), 
				.ext_out(ext_out), 
				.extop(extop)
				);
	//CTRL
	ctrl CTRL(.op(op), 
				 .func(func),
				 .zero(zero), 
				 .clk(clk), 
				 .regdst(regdst), 
				 .alusrc(alusrc),
				 .regwrite(regwrite), 
				 .memwrite(memwrite), 
				 .extop(extop), 
				 .aluop(aluop), 
				 .memtoreg(memtoreg), 
				 .jump(jump), 
				 .pcsrc(pcsrc),
				 .jal(jal),
				 .jr(jr)
				 );
endmodule
