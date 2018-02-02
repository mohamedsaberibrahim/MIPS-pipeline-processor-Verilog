`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:46:36 12/04/2017 
// Design Name: 
// Module Name:    SingleCycle 
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
module SingleCycle(input clk, input reset,output [31:0] result,output [31:0] instruction,output [31:0] PC_out, output [31:0]PCbranch,output branchsel,
output RegDst,
output ALUSrc,
output  RegWrite,
output  MemtoReg,
output  MemRead,
 output MemWrite,
 output Branch,
 output[1:0] ALUOp,
 output [3:0]ALUcontrol,
 output [4:0]rs,
 output [4:0]rt,
 output [4:0]rd,
output [31:0]register1,
output [31:0]aluin,
output[31:0] writeData);
wire [31:0] PC_in;
wire [31:0] PC4;
wire [4:0] writeRegister;
wire [31:0] signextendout;
wire [31:0] register2;
wire [31:0] Out32;
//wire [31:0] PCbranch;
wire zero;
wire Jump;
wire SignZero;
wire JRControl;
wire [31:0] read_data;
PC mypc(PC_in,PC_out,clk,reset,1'b1);
wire [5:0] Opcode,Function; // Opcode, Function
wire [15:0] imm16;
wire [4:0] shamt;
assign Opcode = instruction[31:26];
assign Function = instruction[5:0];
assign rs = instruction[25:21];
assign rt = instruction[20:16];
assign rd = instruction[15:11];
assign imm16 = instruction[15:0];
assign shamt = instruction[10:6];
PCadder mypcadder1(PC_out,4,PC4);
instructionmemory myinstructionmemory(clk,instruction,PC_out[11:2],reset);
mux5bits mux1(rt,rd,writeRegister,RegDst);
RegisterFile myreg(clk,rs,rt,writeData,RegWrite,writeRegister,reset,register1,register2 );
SignExtend signextendmu(imm16,signextendout);
mux32bits mymux(register2,signextendout,ALUSrc,aluin );
ALU alu1(register1,aluin, ALUcontrol, shamt,zero,result);
Shiftlefttwo shift(signextendout[29:0],Out32);
PCadder mypcadder2(PC4,Out32,PCbranch);
and myand(branchsel,Branch,zero);
//assign branchsel = Branch & zero;
mux32bits mymux1(PC4,PCbranch,branchsel,PC_in);
ControlUnit mycontrol(Opcode,RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,Jump,SignZero,ALUOp);
ALUControl_Block alucontrol(ALUcontrol,JRControl,Opcode,ALUOp, Function);
data_memory mymemory(result,register2,MemWrite,MemRead,clk,read_data);
mux32bits mymux2(result,read_data,MemtoReg,writeData);
endmodule

