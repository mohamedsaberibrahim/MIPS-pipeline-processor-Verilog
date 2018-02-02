`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:30:43 12/05/2017 
// Design Name: 
// Module Name:    ForwardUnit 
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
module ForwardUnit (
	output wire [1:0] ForwardA, //output sellectorA
	output wire [1:0] ForwardB, //outpit sellectorB
	input MemRegWrite, //enable on ex/eme
	input WbRegWrite,  //enable on mem/wb
	input [4:0] MEMWriteReg, // addres of register in ex/mem
	input [4:0] WBWriteReg, // addres of register in mem/wb
	input [4:0] EX_rs, //addres of rs in id/ex
	input [4:0] EX_rt  //addres of rt in id/ex
	);
	or orMEM_WriteReg(a,MEMWriteReg[4],MEMWriteReg[3],MEMWriteReg[2],MEMWriteReg[1],MEMWriteReg[0]);
	or orWB_WriteReg(c,WBWriteReg[4],WBWriteReg[3],WBWriteReg[2],WBWriteReg[1],WBWriteReg[0]);
	//check if MEMWriteReg,WBWriteReg !=0
	CompareAddress MEMWriteReg_EX_rs(b,MEMWriteReg,EX_rs);
	and andX(x,MemRegWrite,a,b);
	//chexk value of x
	CompareAddress WBWriteReg_EX_rs(d,WBWriteReg,EX_rs);
	and andY(y,WbRegWrite,c,d);
	//check value of y
	assign ForwardA[1] =x; //forwoard a[1]
	not notxgate(notx,x);
	and NOTxANDy(ForwardA[0],notx,y); //forward a[0]

	CompareAddress MEMWriteReg_EX_rt(b1,MEMWriteReg,EX_rt);
	and andX1(x1,MemRegWrite,a,b1);
	//chexk value of x1
	CompareAddress WBWriteReg_EX_rt(d1,WBWriteReg,EX_rt);
	and andY1(y1,WbRegWrite,c,d1);
	//chexk value of y1
	assign ForwardB[1] =x1; //forwoard b[1]
	not notx1gate(notx1,x1);
	and NOTx1ANDy1(ForwardB[0],notx1,y1); //forward b[0]

endmodule
module newForward (
	output reg [1:0] ForwardA, //output sellectorA
	output reg [1:0] ForwardB, //outpit sellectorB
	input MemRegWrite, //enable on ex/eme
	input WbRegWrite,  //enable on mem/wb
	input [4:0] MEMWriteReg, // addres of register in ex/mem
	input [4:0] WBWriteReg, // addres of register in mem/wb
	input [4:0] EX_rs, //addres of rs in id/ex
	input [4:0] EX_rt  //addres of rt in id/ex
	);
	always @ (EX_rs or MemRegWrite or WbRegWrite)
	begin
	if((MemRegWrite==1)&&(MEMWriteReg==EX_rs))
	begin
	ForwardA<=2'b01;
	end
	else if ((WbRegWrite==1)&&(WBWriteReg==EX_rs))
	begin
	ForwardA<=2'b10;
	end
	else 
	begin
	ForwardA<=2'b00;
	end
	end
	always @ (EX_rt or MemRegWrite or WbRegWrite)
	begin
	if((MemRegWrite==1)&&(MEMWriteReg==EX_rt))
	begin
	ForwardB<=2'b01;
	end
	else if ((WbRegWrite==1)&&(WBWriteReg==EX_rt))
	begin
	ForwardB<=2'b10;
	end
	else 
	begin
	ForwardB<=2'b00;
	end
	end
	
	
	
endmodule
module forward(input [4:0] IDEXRS,
input [4:0] IDEXRT,
input [4:0] EXMEMRD,
input [4:0] MEMWBRD,
input EXMEMRegWrite,
input MEMWBRegWrite,
output [1:0] forwardA,
output [1:0]forwardB);
assign forwardA=((EXMEMRegWrite ==1'b1) && (EXMEMRD != 5'd0 || EXMEMRD === 5'bxxxxx) && (EXMEMRD === IDEXRS))?2'b10:((MEMWBRegWrite == 1'b1) && (MEMWBRD != 5'd0 || MEMWBRD === 5'bxxxxx) && ~((EXMEMRegWrite==1'b1) && (EXMEMRD != 5'd0 || EXMEMRD === 5'bxxxxx) && ~(EXMEMRD === IDEXRS)) && (MEMWBRD === IDEXRS))?2'b01:2'b00;
assign forwardB=((EXMEMRegWrite ==1'b1) && (EXMEMRD != 5'd0 || EXMEMRD === 5'bxxxxx) && (EXMEMRD === IDEXRT))?2'b10:((MEMWBRegWrite == 1'b1) && (MEMWBRD != 5'd0 || MEMWBRD === 5'bxxxxx) && ~((EXMEMRegWrite==1'b1) && (EXMEMRD != 5'd0 || EXMEMRD === 5'bxxxxx) && ~(EXMEMRD === IDEXRT)) && (MEMWBRD === IDEXRT))?2'b01:2'b00;
endmodule


/*
module CompareAddress(equal,Addr1,Addr2); //compare 2 adresses to check if they are the same
	output equal;
	wire equal;
	input [4:0] Addr1,Addr2;
	wire [4:0] Addr1,Addr2,xorAddress;
	xor xorAddress4(xorAddress[4],Addr1[4],Addr2[4]);
	xor xorAddress3(xorAddress[3],Addr1[3],Addr2[3]);
	xor xorAddress2(xorAddress[2],Addr1[2],Addr2[2]);
	xor xorAddress1(xorAddress[1],Addr1[1],Addr2[1]);
	xor xorAddress0(xorAddress[0],Addr1[0],Addr2[0]);
	or Orgate1(OrAddr,xorAddress[4],xorAddress[3],xorAddress[2],xorAddress[1],xorAddress[0]);
	not notgate1(equal,OrAddr);
endmodule
module ForwardUnit (
	output wire [1:0] ForwardA, //output sellectorA
	output wire [1:0] ForwardB, //outpit sellectorB
	input MemRegWrite, //enable on ex/eme
	input WbRegWrite,  //enable on mem/wb
	input [4:0] MEMWriteReg, // addres of register in ex/mem
	input [4:0] WBWriteReg, // addres of register in mem/wb
	input [4:0] EX_rs, //addres of rs in id/ex
	input [4:0] EX_rt  //addres of rt in id/ex
	);
if (EX/MEM.RegWrite
and (EX/MEM.RegisterRd ? 0)
and (EX/MEM.RegisterRd = ID/EX.RegisterRs)) ForwardA = 10;
if (EX/MEM.RegWrite
and (EX/MEM.RegisterRd ? 0)
and (EX/MEM.RegisterRd = ID/EX.RegisterRt)) ForwardB = 10;
if (MEM/WB.RegWrite
and (MEM/WB.RegisterRd ? 0)
and ( MEM/WB.RegisterRd = ID/EX.RegisterRs)) ForwardA = 01;
if (MEM/WB.RegWrite
and (MEM/WB.RegisterRd ? 0)
and (MEM/WB.RegisterRd = ID/EX.RegisterRt)) ForwardB = 01;
if (MEM/WB.RegWrite
and (MEM/WB.RegisterRd ? 0)
and not(EX/MEM.RegWrite and (EX/MEM.RegisterRd ? 0)
and (EX/MEM.RegisterRd ? ID/EX.RegisterRs))
and (MEM/WB.RegisterRd = ID/EX.RegisterRs)) ForwardA = 01;
if (MEM/WB.RegWrite
and (MEM/WB.RegisterRd ? 0)
and not(EX/MEM.RegWrite and (EX/MEM.RegisterRd ? 0)
and (EX/MEM.RegisterRd ? ID/EX.RegisterRt))
and (MEM/WB.RegisterRd = ID/EX.RegisterRt)) ForwardB = 01;*/

