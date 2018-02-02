`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:46:32 12/05/2017 
// Design Name: 
// Module Name:    Comparator 
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

/*module Comparator(
    input [31:0] in1,
    input [31:0] in2,
    output zero
    );
 xor z0(out0,in1[0],in2[0]);
 xor z1(out1,in1[1],in2[1]);
 xor z2(out2,in1[2],in2[2]);
 xor z3(out3,in1[3],in2[3]);
 xor z4(out4,in1[4],in2[4]);
 xor z5(out5,in1[5],in2[5]);
 xor z6(out6,in1[6],in2[6]);
 xor z7(out7,in1[7],in2[7]);
 xor z8(out8,in1[8],in2[8]);
 xor z9(out9,in1[9],in2[9]);
 xor z10(out10,in1[10],in2[10]);
 xor z11(out11,in1[11],in2[11]);
 xor z12(out12,in1[12],in2[12]);
 xor z13(out13,in1[13],in2[13]);
 xor z14(out14,in1[14],in2[14]);
 xor z15(out15,in1[15],in2[15]);
 xor z16(out16,in1[16],in2[16]);
 xor z17(out17,in1[17],in2[17]);
 xor z18(out18,in1[18],in2[18]);
 xor z19(out19,in1[19],in2[19]);
 xor z20(out20,in1[20],in2[20]);
 xor z21(out21,in1[21],in2[21]);
 xor z22(out22,in1[22],in2[22]);
 xor z23(out23,in1[23],in2[23]);
 xor z24(out24,in1[24],in2[24]);
 xor z25(out25,in1[25],in2[25]);
 xor z26(out26,in1[26],in2[26]);
 xor z27(out27,in1[27],in2[27]);
 xor z28(out28,in1[28],in2[28]);
 xor z29(out29,in1[29],in2[29]);
 xor z30(out30,in1[30],in2[30]);
 xor z31(out31,in1[31],in2[31]);
	or r1(OUT1,out1,out2);
	or r2(OUT2,out3,OUT1);
	or r3(OUT3,out4,OUT2);
	or r4(OUT4,out5,OUT3);
	or r5(OUT5,out6,OUT4);
	or r6(OUT6,out7,OUT5);
	or r7(OUT7,out8,OUT6);
	or r8(OUT8,out9,OUT7);
	or r9(OUT9,out10,OUT8);
	or r10(OUT10,out11,OUT9);
	or r11(OUt11,out12,OUT10);
	or r12(OUT12,out13,OUT11);
	or r13(OUT13,out14,OUT12);
	or r14(OUT14,out15,OUT13);
	or r15(OUT15,out16,OUT14);
	or r16(OUT16,out17,OUT15);
	or r17(OUT17,out18,OUT16);
	or r18(OUT18,out19,OUT17);
	or r19(OUT19,out20,OUT18);
	or r20(OUT20,out21,OUT19);
	or r21(OUT21,out22,OUT20);
	or r22(OUT22,out23,OUT21);
	or r23(OUT23,out24,OUT22);
	or r24(OUT24,out25,OUT23);
	or r25(OUT25,out26,OUT24);
	or r26(OUT26,out27,OUT25);
	or r27(OUT27,out28,OUT26);
	or r28(OUT28,out29,OUT27);
	or r29(OUT29,out30,OUT28);
	or r30(zero,out31,OUT29);
endmodule
*/
module Comparator(
    input [31:0] in1,
    input [31:0] in2,
    output reg xorResult
    );
always@(in1 or in2)
begin
	if(in1==in2)
	begin
 	xorResult=1'b1;
	end
	else
	begin
	xorResult=1'b0;
	end
 end 
endmodule
