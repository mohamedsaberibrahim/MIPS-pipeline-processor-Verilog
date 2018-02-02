`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:01:08 12/04/2017 
// Design Name: 
// Module Name:    mux32bits 
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
module mux32bits(
    input [31:0] A,
    input [31:0] B,
	 input sel,
    output reg[31:0] Out
    );
	always @(sel or A or B)
	begin
	case(sel)
	1'b0: begin Out<=A; end
	1'b1: begin Out<=B; end
	default: begin Out=32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx; end
	endcase
	end
endmodule
