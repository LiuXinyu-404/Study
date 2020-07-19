`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:16:23 12/12/2018 
// Design Name: 
// Module Name:    Pause 
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
module Pause(
	 input [4:0] Rs_In,
	 input [4:0] Rt_In,
	 input [4:0] Rd_E_In,
	 input [4:0] Rd_M_In,
    input [1:0] Tuse_Rs_In,
	 input [1:0] Tuse_Rt_In,
    input [1:0] Tnew_E_In,
    input [1:0] Tnew_M_In,
	 input W_E_In,
	 input W_M_In,
    output Pause_Out
    );
	 wire Pause_rs_E, Pause_rt_E;
	 wire Pause_rs_M, Pause_rt_M;
	assign Pause_rs_E = (Tnew_E_In > Tuse_Rs_In) && (Rs_In == Rd_E_In) && W_E_In;
	assign Pause_rs_M = (Tnew_M_In > Tuse_Rs_In) && (Rs_In == Rd_M_In) && W_M_In;
	assign Pause_rt_E = (Tnew_E_In > Tuse_Rt_In) && (Rt_In == Rd_E_In) && W_E_In;
	assign Pause_rt_M = (Tnew_M_In > Tuse_Rt_In) && (Rt_In == Rd_M_In) && W_M_In;
	assign Pause_Out = Pause_rs_E || Pause_rs_M || Pause_rt_E || Pause_rt_M;

endmodule
