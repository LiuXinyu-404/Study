`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:33:49 12/26/2018 
// Design Name: 
// Module Name:    MultDiv 
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
module MultDiv(
    input clk,
    input reset,
    input start,
	 input [5:0] Funct_In,
    output reg busy,
    input [31:0] In_1,
    input [31:0] In_2,
    output reg [31:0] HI,
    output reg [31:0] LO
    );
	 
	 integer Delay;
	initial begin
		HI = 0;
		LO = 0;
	end
	
	always @(posedge clk) begin
		if(start) begin
			if(Funct_In == 6'b011000) begin//Mult·ûºÅ³Ë
				{HI,LO} = $signed(In_1) * $signed(In_2);
				Delay = 5;
			end
			else if(Funct_In == 6'b011001) begin//MultuÎÞ·ûºÅ³Ë
				{HI,LO} = In_1 * In_2;
				Delay = 5;
			end
			else if(Funct_In == 6'b011010) begin//Div·ûºÅ³ý
				LO = $signed(In_1) / $signed(In_2);
				HI = $signed(In_1) % $signed(In_2);
				Delay = 10;
			end
			else if(Funct_In == 6'b011011) begin//Divu·ûºÅ³ý
				LO = In_1 / In_2;
				HI = In_1 % In_2;
				Delay = 10;
			end
			else if(Funct_In == 6'b010001) begin//MthiÐ´hi¼Ä´æÆ÷
				HI = In_1;
			end
			else if(Funct_In == 6'b010011) begin//MtloÐ´lo¼Ä´æÆ÷
				LO = In_1;
			end
		end
		if(Delay != 0) begin
			Delay = Delay - 1;
			busy = 1;
		end
		else
			busy = 0;
	end

endmodule
