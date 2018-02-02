`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:26:45 12/03/2017 
// Design Name: 
// Module Name:  instructionmemory 
// Project Name:
// Target Devices:
// Tool versions:
// Description:
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module instructionmemory(
    output reg[31:0] instruction,
    input [11:2] instructionAddress,
	 input reset
    );
	 reg [31:0]instrmem[0:1023];
	 always @(*)
		begin
			if(reset)
				begin
					instruction<=0;
				end
			else
			begin
			$readmemb("E:\Learning/College/machine/Done/new8.txt", instrmem);
			instruction<=instrmem[instructionAddress];
			end
		end
endmodule
