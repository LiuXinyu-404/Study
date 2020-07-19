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
module dm(
    input clk,
    input reset,
    input MemWrite,
	 input [31:0] pc,
    input [31:0] addr,
    input [31:0] din,
    output [31:0] dout
    );
	
	reg[31:0] dm_reg[0:4096];
	integer i;
	
	initial begin
	for(i = 0; i <= 4096; i=i+1)
				dm_reg[i] = 0;
	end
	
	assign dout = dm_reg[addr];
	always @(posedge clk) begin
		if(reset) begin
			for(i = 0; i <= 4096; i=i+1)
				dm_reg[i] = 0;
		end
		else if(MemWrite == 1) begin
			dm_reg[addr] = din;
			$display("@%h:*%h<=%h",pc, addr,din);
		end
	end
	
endmodule
