`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:46:46 10/06/2018 
// Design Name: 
// Module Name:    moudle 
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
module moudle(
    );
	 
	 reg [4:0]a;
	 reg [4:0]b;
	 
	initial begin
		a=10;
		b=20;
		$display("a=%d,b=%d\n",a,b);
		end

endmodule
