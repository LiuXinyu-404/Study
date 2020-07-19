`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:20:44 11/24/2018 
// Design Name: 
// Module Name:    dm 
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
module DM(
    input Clk,
    input Reset,
    input MemWrite_In,
	 input [31:0] Pc_In,
    input [31:0] Addr_In,
    input [31:0] D_In,
    output [31:0] D_Out
    );
	
	reg[31:0] dm_reg[0:4096];
	wire [31:0] Spc;
	integer i;
	
	initial begin
	for(i = 0; i <= 4096; i=i+1)
				dm_reg[i] = 0;
	end
	assign Spc = 12288 + (Pc_In << 2);
	assign D_Out = dm_reg[Addr_In];
	always @(posedge Clk) begin
		if(Reset) begin
			for(i = 0; i <= 31; i=i+1)
				dm_reg[i] = 0;
		end
		else if(MemWrite_In == 1) begin
			dm_reg[Addr_In] = D_In;
			$display("%d@%h: *%h <= %h", $time, Spc, Addr_In, D_In);
		end
	end
	
endmodule
