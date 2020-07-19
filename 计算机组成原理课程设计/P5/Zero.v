`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:52:45 12/10/2018 
// Design Name: 
// Module Name:    Zero 
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
module Zero(
    input [5:0] Op_In,
    input [31:0] In_1,
    input [31:0] In_2,
    output reg Zero_Out
    );
	 
	 always@(*) begin
		 if(Op_In == 6'b000100) begin//beq
			if(In_1 == In_2)
				Zero_Out = 1;
			else 
				Zero_Out = 0;
			end
	end
	
endmodule
