`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:00:00 10/06/2018 
// Design Name: 
// Module Name:    IM 
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
module IM(
    input [9:0] addr,
    output [31:0] instr
    );
	reg [31:0] Memory[2047:0];
	
	initial begin
		//$monitor("Memory[0] = %h", Memory[0]);
		$readmemh("code.txt", Memory, 3,0);
		$display("Memory[0] = %h", Memory[0]);
		end

endmodule
