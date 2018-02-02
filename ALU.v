`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:15:59 12/03/2017 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
		input signed [31:0] in1,
		input signed [31:0] in2, 
		input [3:0] op, 
		input [4:0] shamt,
		output zero,
		output reg signed [31:0] result);
assign zero =((in1-in2)==0)?1:0;
	always @ (in1 or in2 or op or shamt)
		case(op)
		4'b0000: begin result <= in1+in2; end
		4'b0001: begin result <= in1-in2; end
		4'b0010: begin result <= in1&in2; end
		4'b0011: begin  result <= in1|in2; end
		4'b0100: begin  result <= in1<<shamt; end
		4'b0101: begin result <= in1>>shamt; end
		4'b0110: begin  result <= in1>>>shamt; end
		4'b0111: begin  result <= ~(in1|in2); end
		4'b1000: begin result <= (in2>in1)?1:0; end
		default: begin result <=32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx; end
		endcase
endmodule 
