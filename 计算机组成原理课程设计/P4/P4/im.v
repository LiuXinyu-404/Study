`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:27:03 11/24/2018 
// Design Name: 
// Module Name:    im 
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
module im(
    input [31:0] pc,
    output [31:0] instr,
	 output [25:0] addr,
	 output [15:0] imme,
	 output [31:26] op,
	 output [25:21] rs,
	 output [20:16] rt,
	 output [15:11] rd,
	 output [10:6] shamt,
	 output [5:0] func
    );

	reg[31:0] im_reg[0:2047];
   initial begin
     $readmemh("code.txt",im_reg);
   end
	
	assign instr = im_reg[pc];
	assign {op,rs,rt,rd,shamt,func} = instr;
	assign imme = {rd,shamt,func};
	assign addr = {rs,rt,rd,shamt,func};
	
endmodule
