`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:03:46 10/26/2018 
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
    input [15:0] imm,
    input [1:0] EOp,
    output reg [31:0] ext
    );
	 always @(*) begin
	 case(EOp)
		2'b00: ext = $signed(imm);
		2'b01: ext = imm;
		2'b10: ext = {imm,0};
		2'b11: begin
				 ext = $signed(imm);
				 ext = ext<<2;
				 end
	endcase
	end

endmodule
