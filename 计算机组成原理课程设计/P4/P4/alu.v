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
module alu(
	 input [5:0] op,
    input [5:0] func,
    input [1:0] aluop,
    input [31:0] in1,
    input [31:0] in2,
    output reg [31:0] aluresult,
	 output reg zero
    );
	 
	 initial begin
		aluresult = 0;
	 end
	 
	 always @(*) begin
		if(aluop == 2'b10) begin//R–Õ÷∏¡Ó
			if(func == 6'b100001) begin//addu
				aluresult = in1 + in2;
			end
			else if(func == 6'b100011) begin
				aluresult = in1 - in2;//subu
			end
		end
		else if(op == 6'b001101) begin
				aluresult = in1 | in2;//ori
			end
		else if(op == 6'b001111) begin
				aluresult[31:16] = in2[15:0];
				aluresult[15:0] = 0;//lui
			end
		else if(op == 6'b100011) begin
				aluresult = in1 + in2;//lw
			end
		else if(op == 6'b101011) begin
				aluresult = in1 + in2;//sw
			end
		else if(op == 6'b000100) begin
				if(in1 == in2)
				zero = 1;
				else if(in1 != in2)
				zero = 0;
			end
	 end
endmodule
