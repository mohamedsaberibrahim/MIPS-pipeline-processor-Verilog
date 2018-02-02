`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:49:35 12/05/2017 
// Design Name: 
// Module Name:    mux3x32bits 
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
module mux3x32to32(
	output reg [31:0]dataOut,
	input [31:0]A,
	input [31:0]B,
	input [31:0]C,
	input [1:0] select
	);
always @(select or A or B or C)
begin
	if (select==2'b00) dataOut<=A;
	else if (select==2'b01) dataOut <=B;
	else if (select==2'b10) dataOut <=C;
	else dataOut<=A;
end

endmodule
