`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:20:44 11/24/2018 
// Design Name: 
// Module Name:    dm 
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
module DM(
    input Clk,
    input Reset,
    input MemWrite_In,
	 input [5:0] Op_In,
	 input [31:0] Pc_In,
    input [31:0] Addr_In,
    input [31:0] D_In,
    output reg [31:0] D_Out
    );
	
	reg [31:0] dm_reg[0:4096];
	reg [31:0] Data;
	wire [31:0] Addr;
	wire [31:0] Spc;
	integer i;
	
	initial begin
	for(i = 0; i <= 4096; i=i+1)
				dm_reg[i] = 0;
	Data = 0;
	end
	assign Spc = 12288 + (Pc_In << 2);
	
	always @(posedge Clk) begin
		Data = dm_reg[Addr_In[31:2]];
		if(Reset) begin
			for(i = 0; i <= 31; i=i+1)
				dm_reg[i] = 0;
		end
//////////////////////////////////////////////////////////////////////
		else if(MemWrite_In == 1) begin
			if(Op_In == 6'b101011)//sw
				dm_reg[Addr_In[31:2]] = D_In;
			else if(Op_In == 6'b101000) begin//sb
				if(Addr_In[1:0] == 2'b11)
					Data [31:24] = D_In[7:0];
				else if(Addr_In[1:0] == 2'b10)
					Data [23:16] = D_In[7:0];
				else if(Addr_In[1:0] == 2'b01)
					Data [15:8] = D_In[7:0];
				else if(Addr_In[1:0] == 2'b00)
					Data [7:0] = D_In[7:0];
				dm_reg[Addr_In[31:2]] = Data;
			end
			else if(Op_In == 6'b101001) begin//sh
				if(Addr_In[1] == 1)
					Data[31:16] = D_In[15:0];
				else if(Addr_In[1] == 0)
					Data[15:0] = D_In[15:0];
				 dm_reg[Addr_In[31:2]] = Data;
			end
			$display("%d@%h: *%h <= %h", $time, Spc, {Addr_In[31:2],2'b0}, dm_reg[Addr_In[31:2]]);
		end
/////////////////////////////////////////////////////////////////////////////////////
		if(Op_In == 6'b100011)//lw
			D_Out = Data;
		else if(Op_In == 6'b100000) begin//lb
			if(Addr_In[1:0] == 2'b11)
				D_Out = $signed(Data[31:24]);
			else if(Addr_In[1:0] == 2'b10)
				D_Out = $signed(Data[23:16]);
			else if(Addr_In[1:0] == 2'b01)
				D_Out = $signed(Data[15:8]);
			else if(Addr_In[1:0] == 2'b00)
				D_Out = $signed(Data[7:0]);
		end
		else if(Op_In == 6'b100100) begin//lbu
			if(Addr_In[1:0] == 2'b11)
				D_Out = Data[31:24];
			else if(Addr_In[1:0] == 2'b10)
				D_Out = Data[23:16];
			else if(Addr_In[1:0] == 2'b01)
				D_Out = Data[15:8];
			else if(Addr_In[1:0] == 2'b00)
				D_Out = Data[7:0];
		end
		else if(Op_In == 6'b100001) begin//lh
			if(Addr_In[1] == 1)
				D_Out = $signed(Data[31:16]);
			else if(Addr_In[1] == 0)
				D_Out = $signed(Data[15:0]);
		end
		else if(Op_In == 6'b100101) begin//lhu
			if(Addr_In[1] == 1)
				D_Out = Data[31:16];
			else if(Addr_In[1] == 0)
				D_Out = Data[15:0];
		end
			
	end
endmodule
