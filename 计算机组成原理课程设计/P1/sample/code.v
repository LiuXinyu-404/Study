`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:11:54 10/08/2018 
// Design Name: 
// Module Name:    code 
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
module code(
    input Clk,
    input Reset,
    input Slt,
    input En,
    output reg[63:0] Output0,
    output reg[63:0] Output1
    );
	 
	 reg[63:0] counter;
	 
	 initial begin
	 Output0=0;
	 Output1=0;
	 counter=0;
	 //$monitor("counter = %d Output0 = %d Output1 = %d",counter,Output0,Output1);
	 end
	 
	 always @(posedge Clk) begin
	 if(Reset) begin
		Output0=0;
		Output1=0;
		counter=0;
		end
	 else if(En)
		if(!Slt)
		Output0=Output0+1;
		else begin
		counter=counter+1;
		Output1=counter/4;
		end
	end
	 
endmodule
