`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:04:26 12/03/2017 
// Design Name: 
// Module Name:    PC 
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
module PC(
    input [31:0] PC_in,
    output reg[31:0] PC_out,
    input clk,
    input reset,
	 input PCwriteEn
    );
		always @ (posedge clk or posedge reset)
			begin
				if(reset==1'b1)
				begin
					PC_out <= 0;
				end
				else if(PCwriteEn==1'b1)
				begin
					PC_out <= PC_in;
				end
			end
endmodule
