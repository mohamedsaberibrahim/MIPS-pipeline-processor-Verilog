`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:57:35 12/05/2017 
// Design Name: 
// Module Name:    register 
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
module D_FF (q, d, reset, clk);
output reg q;
input d, reset, clk;
//reg q; // Indicate that q is stateholding
 
always @(posedge clk or posedge reset)
	begin
//	q <= 0;
		if (reset)
			begin
				q <= 0; // On reset, set to 0
			end
		else
			begin
				q <= d; // Otherwise out = d 
			end
	end
endmodule
// 1 bit register 
module RegBit(BitOut, BitData, WriteEn,reset, clk);
output BitOut; // 1 bit of register
input BitData, WriteEn; 
input reset,clk;
wire d,f1, f2; // input of D Flip-Flop
wire reset;
//assign reset=0;
and U1(f1, BitOut, (~WriteEn));
and U2(f2, BitData, WriteEn);
or  U3(d, f1, f2);
D_FF DFF0(BitOut, d, reset, clk);
endmodule

//32 bit register 
module register(RegOut,RegIn,WriteEn,reset,clk); 
output [31:0] RegOut;
input [31:0] RegIn;
input WriteEn,reset, clk;
RegBit bit31(RegOut[31],RegIn[31],WriteEn,reset,clk);
RegBit bit30(RegOut[30],RegIn[30],WriteEn,reset,clk);
RegBit bit29(RegOut[29],RegIn[29],WriteEn,reset,clk); 
RegBit bit28(RegOut[28],RegIn[28],WriteEn,reset,clk); 
RegBit bit27(RegOut[27],RegIn[27],WriteEn,reset,clk); 
RegBit bit26(RegOut[26],RegIn[26],WriteEn,reset,clk); 
RegBit bit25(RegOut[25],RegIn[25],WriteEn,reset,clk); 
RegBit bit24(RegOut[24],RegIn[24],WriteEn,reset,clk); 
RegBit bit23(RegOut[23],RegIn[23],WriteEn,reset,clk); 
RegBit bit22(RegOut[22],RegIn[22],WriteEn,reset,clk); 
RegBit bit21(RegOut[21],RegIn[21],WriteEn,reset,clk); 
RegBit bit20(RegOut[20],RegIn[20],WriteEn,reset,clk); 
RegBit bit19(RegOut[19],RegIn[19],WriteEn,reset,clk); 
RegBit bit18(RegOut[18],RegIn[18],WriteEn,reset,clk); 
RegBit bit17(RegOut[17],RegIn[17],WriteEn,reset,clk); 
RegBit bit16(RegOut[16],RegIn[16],WriteEn,reset,clk); 
RegBit bit15(RegOut[15],RegIn[15],WriteEn,reset,clk); 
RegBit bit14(RegOut[14],RegIn[14],WriteEn,reset,clk); 
RegBit bit13(RegOut[13],RegIn[13],WriteEn,reset,clk); 
RegBit bit12(RegOut[12],RegIn[12],WriteEn,reset,clk); 
RegBit bit11(RegOut[11],RegIn[11],WriteEn,reset,clk); 
RegBit bit10(RegOut[10],RegIn[10],WriteEn,reset,clk); 
RegBit bit9 (RegOut[9], RegIn[9], WriteEn,reset,clk); 
RegBit bit8 (RegOut[8], RegIn[8], WriteEn,reset,clk); 
RegBit bit7 (RegOut[7], RegIn[7], WriteEn,reset,clk); 
RegBit bit6 (RegOut[6], RegIn[6], WriteEn,reset,clk); 
RegBit bit5 (RegOut[5], RegIn[5], WriteEn,reset,clk); 
RegBit bit4 (RegOut[4], RegIn[4], WriteEn,reset,clk); 
RegBit bit3 (RegOut[3], RegIn[3], WriteEn,reset,clk); 
RegBit bit2 (RegOut[2], RegIn[2], WriteEn,reset,clk); 
RegBit bit1 (RegOut[1], RegIn[1], WriteEn,reset,clk); 
RegBit bit0 (RegOut[0], RegIn[0], WriteEn,reset,clk); 

endmodule
