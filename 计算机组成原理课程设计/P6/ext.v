`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:03:57 11/26/2018 
// Design Name: 
// Module Name:    ext 
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
module Ext(
    input [15:0] Imme_In,
    output reg [31:0] Ext_Out,
    input Ext_Op
    );
	 
	 always @(*) begin
		if(Ext_Op)
			Ext_Out = $signed(Imme_In);
		else
			Ext_Out = Imme_In;
	 end

endmodule
