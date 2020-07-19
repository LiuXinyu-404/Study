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
module Grf(
	 input [31:0] Pc_In,
    input [4:0] A1_In,
    input [4:0] A2_In,
    input [4:0] A3_In,
    input [31:0] Wd3_In,
    output [31:0] Rd1_Out,
    output [31:0] Rd2_Out,
    input Clk,
    input We3_In,
    input Reset
    );
	reg[31:0] Grf_Reg[0:31];
	wire [31:0] Spc;
	integer i;
	
	initial begin 
	for(i = 0; i <= 31; i=i+1)
				Grf_Reg[i] = 0;
	end
	
	assign Rd1_Out = Grf_Reg[A1_In];
	assign Rd2_Out = Grf_Reg[A2_In];
	assign Spc = 12288 + (Pc_In << 2);
	
	always @(posedge Clk) begin
		if(Reset) begin
			for(i = 0; i <= 31; i=i+1)
				Grf_Reg[i] = 0;
		end
		else if(We3_In == 1 && A3_In != 0) begin
			$display("%d@%h: $%d <= %h", $time, Spc, A3_In, Wd3_In);
			if(A3_In != 0)
				Grf_Reg[A3_In] = Wd3_In;
		end
	end
endmodule
