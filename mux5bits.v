`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:05:39 12/04/2017 
// Design Name: 
// Module Name:    mux5bits 
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
module mux5bits(
    input [4:0] A,
    input [4:0] B,
    output reg [4:0] Out,
    input Select
    );
	always @(Select or A or B)
	begin
	if (Select==1'b0)begin Out<=A; end
	else if (Select==1'b1)begin Out<=B; end
	end
endmodule
