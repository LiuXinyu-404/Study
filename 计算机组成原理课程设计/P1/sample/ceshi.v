`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:26:46 10/06/2018 
// Design Name: 
// Module Name:    ceshi 
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
module ceshi(
    );
	reg [4:0]a;
	reg [4:0]b;
	 
	initial begin
		$monitor("a=%d,b=%d\n",a,b);
		a=10;
		b=20;
		end
	always begin
		#10 a=a+1;
			b=b+1;
		end
	
endmodule
