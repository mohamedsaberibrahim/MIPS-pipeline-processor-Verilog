`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:13:42 01/24/2018
// Design Name:   ForwardUnit
// Module Name:   C:/Users/Mohamed Saber/Desktop/projects/PipelineProject/forward.v
// Project Name:  PipelineProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ForwardUnit
//
// Dependencies:

module testForwarding;
reg [4:0] IDEXRS,IDEXRT,EXMEMRD,MEMWBRD;
reg EXMEMRegWrite,MEMWBRegWrite;
wire [1:0] forwardA,forwardB;

initial 
begin
$monitor("IDEXRS=%b,IDEXRT=%b,EXMEMRD=%b,MEMWBRD%b,EXMEMRegWrite=%b,MEMWBRegWrite=%b,forwardA=%b,forwardB=%b",IDEXRS,IDEXRT,EXMEMRD,MEMWBRD,EXMEMRegWrite,MEMWBRegWrite,forwardA,forwardB);
#5
IDEXRS=5'b00101;
IDEXRT=5'b00101;
EXMEMRD=5'b00101;
EXMEMRegWrite=1'b1;
#5
EXMEMRegWrite=1'b0;
MEMWBRegWrite=1'b1;
IDEXRS=5'b00111;
IDEXRT=5'b00111;
EXMEMRD=5'b00101;
MEMWBRD=5'b00111;
#5
EXMEMRegWrite=1'b0;
MEMWBRegWrite=1'b0;
IDEXRS=5'b00111;
IDEXRT=5'b00111;
EXMEMRD=5'b00101;
MEMWBRD=5'b00111;
end 
//forward f1(IDEXRS,IDEXRT,EXMEMRD,MEMWBRD,EXMEMRegWrite,MEMWBRegWrite,forwardA,forwardB);
ForwardUnit Forwarding_Block(forwardA,forwardB,EXMEMRegWrite,MEMWBRegWrite,EXMEMRD,MEMWBRD,IDEXRS,IDEXRT);
endmodule 
