`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:44:28 10/26/2018 
// Design Name: 
// Module Name:    gray 
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
module gray(
    input Clk,
    input Reset,
    input En,
    output [2:0] Output,
    output reg Overflow
    );
	 reg [2:0] graycode [7:0];
	 integer cnt; 
	 initial begin
	 Overflow = 0;
	 cnt = 0;
	 graycode[0] = 3'b000;
	 graycode[1] = 3'b001;
	 graycode[2] = 3'b011;
	 graycode[3] = 3'b010;
	 graycode[4] = 3'b110;
	 graycode[5] = 3'b111;
	 graycode[6] = 3'b101;
	 graycode[7] = 3'b100;
	 end
	 
	assign Output = graycode[cnt];
	 
	always@(posedge Clk) begin
	if(Reset) begin
	Overflow = 0;
	cnt = 0;
	end
	else if(cnt==7&&En) begin
	cnt = 0;
	Overflow = 1;
	end
	else if(En)
	cnt = cnt + 1;
	end
	
endmodule
