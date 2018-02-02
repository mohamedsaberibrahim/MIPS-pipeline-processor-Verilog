`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:32:24 12/05/2017
// Design Name:   ForwardUnit
// Module Name:   C:/Users/Mohamed Saber/Desktop/projects/PipelineProject/ForwardUnittb.v
// Project Name:  PipelineProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ForwardUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module fwtb;
reg [4:0] mem;
reg [4:0] wb;
reg [4:0] rs;
reg [4:0] rt;
reg memen;
reg wben;
wire [1:0] FA;
wire [1:0] FB;
ForwardUnit fw(
	FA, //output sellectorA
	FB, //outpit sellectorB
	memen, //enable on ex/eme
	wben,  //enable on mem/wb
	mem, // addres of register in ex/mem
	wb, // addres of register in mem/wb
	rs, //addres of rs in id/ex
	rt  //addres of rt in id/ex
	);
initial 
begin
$monitor( $time,,"%b %b %b %b %b %b %b %b",FA,FB,memen,wben,mem,wb,rs,rt);
mem=5'b00110;
wb=5'b00110;
rs=5'b00111;
rt=5'b00111;
memen=1;
wben=1;
#10
mem=5'b00110;
wb=5'b00110;
rs=5'b00111;
rt=5'b00111;
memen=1;
wben=1;
#10
mem=5'b00111;
wb=5'b00111;
rs=5'b00111;
rt=5'b00110;
memen=1;
wben=1;
end
endmodule 

