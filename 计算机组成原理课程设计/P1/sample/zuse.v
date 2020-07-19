`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:19:23 10/09/2018 
// Design Name: 
// Module Name:    zuse 
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
module zuse(
    );
 reg a,b,c;
 
 initial begin
	a=1;
	b=0;
	c=1;
 end
 
 initial begin
	#1;
	b<=c;
	c<=b;
 end

endmodule
