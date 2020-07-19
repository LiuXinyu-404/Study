`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:57:58 10/26/2018 
// Design Name: 
// Module Name:    string 
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
module string(
    input clk,
    input clr,
    input [7:0] in,
    output reg out
    );
	 integer state = 0;
	 
	 always@(posedge clr)begin
	 state <= 0;
	 out <= 0;
	 end
	 always@(posedge clk)begin
	 if(clr == 1) begin
	 state <= 0;
	 out <= 0;
	 end
	 else begin
	 case(state)
	 0: if(in >= "0" && in <="9") begin
			state <= 1;
			out <= 1;
			end
		 else begin
		  state <= 3;
		  out <= 0;
		  end
	 1: if(in == "+" || in == "*") begin
			state <= 2;
			out <= 0;
			end
		 else begin
		  state <= 3;
		  out <= 0;
		  end
	 2: if(in >= "0" && in <="9") begin
			state <= 1;
			out <= 1;
			end
		 else begin
		  state <= 3;
		  out <= 0;
		  end
	 endcase
	 end
	 end

endmodule
