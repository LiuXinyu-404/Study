`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:50:14 10/03/2018 
// Design Name: 
// Module Name:    Sample 
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
module Sample(input clk);
	
	wire a;
	reg b;
	
	initial begin
		b=0;
	end
	
	always@(posedge clk) begin
		b=~b;
	end
	
	wire x,y,z;
	
	AndGate and1(x, y, z);

endmodule
