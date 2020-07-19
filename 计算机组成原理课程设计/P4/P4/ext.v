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
module ext(
    input [15:0] imme,
    output reg [31:0] ext_out,
    input extop
    );
	 
	 always @(*) begin
		if(extop)
			ext_out = $signed(imme);
		else
			ext_out = imme;
	 end

endmodule
