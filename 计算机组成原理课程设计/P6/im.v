`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:27:03 11/24/2018 
// Design Name: 
// Module Name:    im 
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
module Im(
    input [31:0] Pc_In,
    output [31:0] Instr_Out
    );

	reg [31:0] Im_Reg[0:4096];
	integer i;
	
   initial begin
	  for(i = 0; i <= 4096; i=i+1)
				Im_Reg[i] = 0;
     $readmemh("code.txt",Im_Reg);
   end
	
	assign Instr_Out = Im_Reg[Pc_In];
	
endmodule
