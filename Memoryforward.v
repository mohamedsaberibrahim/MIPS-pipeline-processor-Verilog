`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:59:19 01/24/2018 
// Design Name: 
// Module Name:    Memoryforward 
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
module Memoryforward(input WB_MemRead,input MEM_MemWrite, input [4:0]MEM_ALUResult, input [4:0]WB_WriteRegister,
output reg Memoryforwarding);

always @ (WB_MemRead or MEM_MemWrite or MEM_ALUResult or WB_WriteRegister)
	begin
		if((WB_MemRead)&& (MEM_MemWrite) && (MEM_ALUResult==WB_WriteRegister))
			begin
				Memoryforwarding<=1'b1;
			end
		else
			begin
				Memoryforwarding<=1'b0;
			end
	end
endmodule
