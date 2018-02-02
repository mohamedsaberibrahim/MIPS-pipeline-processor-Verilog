`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:50:58 12/03/2017 
// Design Name: 
// Module Name:    Shiftlefttwo 
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
module Shiftlefttwo(
    input [29:0] In32,
	 output reg[31:0] Out32
    );
	 always @(In32)
		begin
			Out32 <= {In32[29:0],2'b00};
		end
endmodule
