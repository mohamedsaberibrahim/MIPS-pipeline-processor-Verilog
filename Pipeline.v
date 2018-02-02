`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:45:53 12/05/2017 
// Design Name: 
// Module Name:    Pipeline 
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
module Pipeline(
    input reset,
    input clk,
	 output [31:0] PC_out,
	 wire IFID_WriteEn,
	 wire [31:0]PCbranch,
	 wire branchselect,
	 wire [31:0] instruction ,
	 wire [31:0] ID_Instruction,
	 wire [31:0]ReadData1,
	 wire [31:0]ReadData2,
	 wire [31:0] Read1,
	 wire [31:0]Read2,
	 wire ID_zero,
	 wire [1:0]ID_ForwardA,
	wire [1:0]ID_ForwardB,	
	wire [31:0]Ext_imm,
	 wire Stall_flush,
	 wire [31:0] EX_Instruction,
	 wire EX_RegDst,
	wire EX_ALUSrc,
	wire EX_MemtoReg,
	wire EX_RegWrite,
	wire EX_MemRead,
	wire EX_MemWrite,
	wire EX_Branch,
	wire[1:0]ForwardA,
	wire[1:0]ForwardB,
	wire [4:0]EX_rs,
	wire [4:0]EX_rt,
	wire[31:0]Bus_A_ALU,
	wire[31:0]Bus_B_ALU,
	wire [1:0]EX_ALUOp,
	wire[3:0]ALUControl,
	wire [4:0]EX_WriteRegister,
	wire [31:0]EX_ALUResult,
	wire[31:0] MEM_ALUResult ,
	wire[31:0] WriteDataOfMem,
	wire [31:0]Memory_Write_forwarded,
	wire[31:0] MEM_ReadDataOfMem,
	wire MEM_MemWrite,
	wire MEM_MemRead,
	wire Memoryforwarding,
	wire[31:0]WB_WriteData,
	wire[4:0] WB_WriteRegister,
	wire WB_RegWrite,
	wire WB_MemtoReg);
//=========wires============
wire [31:0] PC4;
wire [31:0] PC_in;
wire [31:0] ID_PC4;
wire [5:0] Opcode;
wire [5:0] Function;
wire [4:0]rd;
wire [4:0]rt;
wire [4:0]rs;
wire [15:0]imm16;
wire[1:0]ALUOp;
wire [31:0]writeData;
wire [4:0]write;
wire [31:0] EX_PC4;
wire [31:0] EX_ReadData1;
wire [31:0] EX_ReadData2;
wire [31:0]EX_Im16_Ext;
//wire [4:0]EX_rs;
//wire [4:0]EX_rt;
wire [4:0]EX_rd;
wire ID_RegDst,ID_ALUSrc,ID_MemtoReg,ID_RegWrite,ID_MemRead,ID_MemWrite,ID_Branch,ID_Jump,ID_SignZero;
wire [1:0]ID_ALUOp;
wire [31:0]Bus_B_forwarded;
//wire [31:0]Bus_B_ALU;
wire [5:0]EX_Opcode;
wire [5:0]EX_Function;
wire [4:0]EX_shamt;
//wire [3:0]ALUControl;
wire JRControl;
//wire [1:0]ID_ForwardA;
//wire [1:0]ID_ForwardB;
wire zero;
//wire [4:0]EX_WriteRegister;
wire MEM_MemtoReg,MEM_RegWrite;
wire [4:0]MEM_WriteRegister;
wire [31:0]WB_ReadDataOfMem;
wire [31:0]WB_ALUResult;
//wire WB_MemtoReg;
//wire [31:0]ReadData1;
//wire [31:0]ReadData2;
wire [31:0]Out32;
//=========IF stage=========
PC pcfirst(PC_in,PC_out,clk,reset,PC_WriteEn);
PCadder firstpc(PC_out,4,PC4);
instructionmemory insmem(instruction,PC_out[11:2],reset);
// =========IFID register=========
register IFID_PC4(ID_PC4,PC4,IFID_WriteEn,reset,clk);
register IFID_Instruction(ID_Instruction,instruction,IFID_WriteEn,reset,clk);
//========= ID STAGE===========
assign Opcode = ID_Instruction[31:26];
//assign Function = ID_Instruction[5:0];
assign rs = ID_Instruction[25:21];
assign rt = ID_Instruction[20:16];
//assign rd = ID_Instruction[15:11];
assign imm16= ID_Instruction[15:0];
ControlUnit mycontrol(Opcode,RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,Jump,SignZero,ALUOp);
RegisterFile myregfile(clk,rs,rt,WB_WriteData,WB_RegWrite,WB_WriteRegister,ReadData1,ReadData2);
//WB_forward WB_forward_block(ReadData1Out,ReadData2Out,ReadData1,ReadData2,rs,rt,WB_WriteRegister,WB_WriteData,WB_RegWrite);
Comparator compare(Read1, Read2,ID_zero);
and branchselector(branchselect,ID_zero,Branch);
SignExtend extend(imm16,Ext_imm);
Shiftlefttwo shift(Ext_imm[29:0],Out32);
StallControl newstall(PC_WriteEn,IFID_WriteEn,Stall_flush,Branch,EX_Branch,EX_Opcode,MemWrite,EX_RegWrite,EX_MemRead,MEM_MemRead,EX_WriteRegister,MEM_WriteRegister,rs,rt,EX_branchselect);
PCadder mypcadder2(ID_PC4,Out32,PCbranch);
ForwardUnit ID_Forwarding(ID_ForwardA,ID_ForwardB,MEM_RegWrite,WB_RegWrite,MEM_WriteRegister,WB_WriteRegister,rs,rt);
//wire [31:0] Read1,Read2;
mux3x32to32 mux3AA(Read1,ReadData1,WB_WriteData,MEM_ALUResult,ID_ForwardA);
mux3x32to32 mux3BB(Read2,ReadData2,WB_WriteData,MEM_ALUResult,ID_ForwardB);
mux32bits mymux0(PC4,PCbranch,branchselect,PC_in);
mux1bit x1(RegDst,1'b0,Stall_flush,ID_RegDst);
mux1bit x2(ALUSrc,1'b0,Stall_flush,ID_ALUSrc);
mux1bit x3(MemtoReg,1'b0,Stall_flush,ID_MemtoReg);
mux1bit x4(RegWrite,1'b0,Stall_flush,ID_RegWrite);
mux1bit x5(MemRead,1'b0,Stall_flush,ID_MemRead);
mux1bit x6(MemWrite,1'b0,Stall_flush,ID_MemWrite);
mux1bit x7(Branch,1'b0,Stall_flush,ID_Branch);
//mux1bit x8(Jump,1'b0,Stall_flush,ID_Jump);
//mux1bit x9(SignZero,1'b0,Stall_flush,ID_SignZero);
mux1bit x10(ALUOp[0],1'b0,Stall_flush,ID_ALUOp[0]);
mux1bit x11(ALUOp[1],1'b0,Stall_flush,ID_ALUOp[1]);
//=============IDEX register===========
//register IDEX_PC4(EX_PC4,ID_PC4,1'b1,reset,clk);
register IDEX_ReadData1(EX_ReadData1,Read1,1'b1,reset,clk);
register IDEX_ReadData2(EX_ReadData2,Read2,1'b1,reset,clk);
register IDEX_Im16_Ext(EX_Im16_Ext,Ext_imm,1'b1,reset,clk);
register IDEX_rs_rt_rd(EX_Instruction,ID_Instruction,1'b1,reset,clk);
assign EX_rs = EX_Instruction[25:21];
assign EX_rt = EX_Instruction[20:16];
assign EX_rd = EX_Instruction[15:11];
RegBit  IDEX_RegDst(EX_RegDst, ID_RegDst, 1'b1,reset, clk);
RegBit  IDEX_branchsel(EX_branchselect, branchselect, 1'b1,reset, clk);
RegBit  IDEX_ALUSrc(EX_ALUSrc, ID_ALUSrc, 1'b1,reset, clk);
RegBit  IDEX_MemtoReg(EX_MemtoReg, ID_MemtoReg, 1'b1,reset, clk);
RegBit  IDEX_RegWrite(EX_RegWrite, ID_RegWrite, 1'b1,reset, clk);
RegBit  IDEX_MemRead(EX_MemRead, ID_MemRead, 1'b1,reset, clk);
RegBit  IDEX_MemWrite(EX_MemWrite, ID_MemWrite, 1'b1,reset, clk);
RegBit  IDEX_Branch(EX_Branch, ID_Branch, 1'b1,reset, clk);
//RegBit  IDEX_JRControl(EX_Jump, ID_Jump, 1'b1,reset, clk);
RegBit  IDEX_ALUOp1(EX_ALUOp[1], ID_ALUOp[1], 1'b1,reset, clk);
RegBit  IDEX_ALUOp0(EX_ALUOp[0], ID_ALUOp[0], 1'b1,reset, clk);
//==========EXE stage==============
ForwardUnit Forwarding_Block(ForwardA,ForwardB,MEM_RegWrite,WB_RegWrite,MEM_WriteRegister,WB_WriteRegister,EX_rs,EX_rt);
// mux 3 x32 to 32 to choose source of ALU (forwarding)
//forward fore(EX_rs,EX_rt,MEM_WriteRegister,WB_WriteRegister,MEM_RegWrite,WB_RegWrite,ForwardA,ForwardB);
mux3x32to32 mux3A(Bus_A_ALU,EX_ReadData1,WB_WriteData,MEM_ALUResult,ForwardA);
mux3x32to32 mux3B(Bus_B_forwarded,EX_ReadData2,WB_WriteData,MEM_ALUResult,ForwardB);
// mux 2x32 to 32 to select source Bus B of ALU
mux32bits muxALUSrc( Bus_B_forwarded,EX_Im16_Ext,EX_ALUSrc,Bus_B_ALU); //feh mux na2es hussein hwa ely 2aly ektb comment
// ALU Control
assign EX_Opcode = EX_Instruction[31:26];
assign EX_Function = EX_Instruction[5:0];
assign EX_shamt= EX_Instruction[10:6];
ALUControl_Block alucontrol(ALUControl,JRControl,EX_Opcode,EX_ALUOp,EX_Function);
// ALU
ALU myalublock(Bus_A_ALU,Bus_B_ALU, ALUControl,EX_shamt,zero,EX_ALUResult);
// mux 2x5 to 5 choose shift register is Rd or Rt
mux5bits muxRegDst( EX_rt,EX_rd,EX_WriteRegister, EX_RegDst);

//================= register EX/MEM==================

register EXMEM_ALUResult(MEM_ALUResult,EX_ALUResult,1'b1,reset,clk);
register EXMEM_WriteDataOfMem(WriteDataOfMem, Bus_B_forwarded,1'b1,reset,clk);
RegBit  EXMEM_MemtoReg(MEM_MemtoReg, EX_MemtoReg, 1'b1,reset, clk);
RegBit  EXMEM_RegWrite(MEM_RegWrite, EX_RegWrite, 1'b1,reset, clk);
RegBit  EXMEM_MemRead(MEM_MemRead, EX_MemRead, 1'b1,reset, clk);
RegBit  EXMEM_MemWrite(MEM_MemWrite, EX_MemWrite, 1'b1,reset, clk);
RegBit  EXMEM_WriteRegister4(MEM_WriteRegister[4], EX_WriteRegister[4], 1'b1,reset, clk);
RegBit  EXMEM_WriteRegister3(MEM_WriteRegister[3], EX_WriteRegister[3], 1'b1,reset, clk);
RegBit  EXMEM_WriteRegister2(MEM_WriteRegister[2], EX_WriteRegister[2], 1'b1,reset, clk);
RegBit  EXMEM_WriteRegister1(MEM_WriteRegister[1], EX_WriteRegister[1], 1'b1,reset, clk);
RegBit  EXMEM_WriteRegister0(MEM_WriteRegister[0], EX_WriteRegister[0], 1'b1,reset, clk);

//==============MEM STAGE=================

Memoryforward forwardingmemory(WB_MemRead,MEM_MemWrite,MEM_ALUResult[4:0],WB_WriteRegister,Memoryforwarding);
mux32bits muxMemorySel(WriteDataOfMem,WB_ReadDataOfMem,Memoryforwarding,Memory_Write_forwarded);
data_memory Dmemory(MEM_ALUResult,Memory_Write_forwarded,MEM_MemWrite, MEM_MemRead,clk, MEM_ReadDataOfMem);

//=========== register MEM/WB===========

register MEMWB_ReadDataOfMem(WB_ReadDataOfMem,MEM_ReadDataOfMem,1'b1,reset,clk);
register MEMWB_ALUResult(WB_ALUResult,MEM_ALUResult,1'b1,reset,clk);
RegBit  MEMWB_WriteRegister4(WB_WriteRegister[4], MEM_WriteRegister[4], 1'b1,reset, clk);
RegBit  MEMWB_WriteRegister3(WB_WriteRegister[3], MEM_WriteRegister[3], 1'b1,reset, clk);
RegBit  MEMWB_WriteRegister2(WB_WriteRegister[2], MEM_WriteRegister[2], 1'b1,reset, clk);
RegBit  MEMWB_WriteRegister1(WB_WriteRegister[1], MEM_WriteRegister[1], 1'b1,reset, clk);
RegBit  MEMWB_WriteRegister0(WB_WriteRegister[0], MEM_WriteRegister[0], 1'b1,reset, clk);
RegBit  MEMWB_MemRead(WB_MemRead, MEM_MemRead, 1'b1,reset, clk);
RegBit  MEMWB_MemtoReg(WB_MemtoReg, MEM_MemtoReg, 1'b1,reset, clk);
RegBit  MEMWB_RegWrite(WB_RegWrite, MEM_RegWrite, 1'b1,reset, clk);

//===============WB stage=================

mux32bits muxkoko(WB_ALUResult, WB_ReadDataOfMem,WB_MemtoReg, WB_WriteData);

endmodule
