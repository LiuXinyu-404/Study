`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:56:29 12/05/2018 
// Design Name: 
// Module Name:    PcBranch 
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
module PcBranch(
    input [31:0] Pc_In,
    input [15:0] Imme_In,
    output reg [31:0] Pc_Out
    );
	 reg [31:0] Sign_Imme;
	 always @(*) begin
	 Sign_Imme = $signed(Imme_In);
	 Pc_Out = Pc_In + Sign_Imme ;
	 end

endmodule
