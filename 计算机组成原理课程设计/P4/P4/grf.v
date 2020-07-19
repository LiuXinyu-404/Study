`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:16:10 11/24/2018 
// Design Name: 
// Module Name:    grf 
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
module grf(
	 input [31:0] pc,
    input [4:0] a1,
    input [4:0] a2,
    input [4:0] a3,
    input [31:0] wd3,
    output [31:0] rd1,
    output [31:0] rd2,
    input clk,
    input we3,
    input reset
    );
	reg[31:0] grf_reg[0:31];
	
	integer i;
	
	initial begin 
	for(i = 0; i <= 31; i=i+1)
				grf_reg[i] = 0;
	end
	
	assign rd1 = grf_reg[a1];
	assign rd2 = grf_reg[a2];
	
	always @(posedge clk) begin
		if(reset) begin
			for(i = 0; i <= 31; i=i+1)
				grf_reg[i] = 0;
		end
		else if(we3 == 1) begin
			$display("@%h:$%d<=%h", pc, a3, wd3);
			if(a3 != 0)
				grf_reg[a3] = wd3;
		end
	end
endmodule
