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
module pc(
    input pcsrc,
    input jump,
    input clk,
    input reset,
    input [15:0] imme,
    input [31:0] jpc,
    output reg [31:0] pc,
	 output reg [31:0] spc
    );
	initial begin
	pc = 32'hffffffff;
	spc = 32'h00002ffc;
	end
	
	reg [31:0] immed;
	
	always @(posedge clk) begin
		if(reset == 1) begin //pc重置
			pc = 32'h00000000;
			spc = 32'h00003000;
		end
		else if(jump == 1) begin
			pc = (jpc - 12288) >> 2;	//pc跳转j指令
			spc = jpc;
		end
		else if(pcsrc == 1) begin
			immed = $signed(imme);
			pc = immed + pc + 1;	//pc跳转b指令
			spc = (pc * 4) + 12288;
		end
		else begin
			pc = pc + 1;//pc自增
			spc = spc + 4;
		end
		end
	
endmodule
