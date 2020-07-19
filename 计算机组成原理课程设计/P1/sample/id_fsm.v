`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:23:11 10/11/2018 
// Design Name: 
// Module Name:    id_fsm 
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
module id_fsm(
    input [7:0]char,
    input clk,
    output reg out
    );
	
	integer state = 0;
	initial out = 0;
	
	always @(posedge clk) begin
		case (state)
		0: 
			begin
				state <= ((char >= "a" && char <= "z") || (char >= "A" && char <= "Z")) ? 1 : 0;
				out <= 0;
			end
		1:
			begin
				if((char >= "a" && char <= "z") || (char >= "A" && char <= "Z"))
					begin
						state <= 1;
						out <= 0;
					end
				else if(char >= "0" && char <= "9")
					begin
						state <= 2;
						out <= 1;
					end
				else
					begin
						state <= 0;
						out <= 0;
					end
			end
		2:
			begin
				if((char >= "a" && char <= "z") || (char >= "A" && char <= "Z"))
					begin
						state <= 1;
						out <= 0;
					end
				else if(char >= "0" && char <= "9")
					begin
						state <= 2;
						out <= 1;
					end
				else
					begin
						state <= 0;
						out <= 0;
					end
			end
		endcase
	end
endmodule
