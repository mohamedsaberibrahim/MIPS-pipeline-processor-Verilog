`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:59:30 12/03/2017 
// Design Name: 
// Module Name:    RegisterFile 
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
module RegisterFile(
    input CLK,
    input [4:0] read1,
    input [4:0] read2,
    input [31:0] writeData,
    input RegWrite,
	 input [4:0] write,
    output reg[31:0] register1,
    output reg[31:0] register2
    );
	 integer i;
	 integer file;
			reg [31:0] registers[0:31];
			always @ (read1 or registers[read1])
					begin
					if (read1 == 0) begin register1=0; end
					else begin	register1 = registers[read1]; end
					end
			always @ (read2 or registers[read2])
				begin
				if (read2 == 0) begin register2=0; end
				else begin register2 = registers[read2]; end
				end
			always @(posedge CLK)
					begin
					if(RegWrite && (write!=0))
							begin
								registers[write] <= writeData;
								file = $fopen("E:/register.txt");
								$fmonitor(file,"@%h \n%b",write,registers[write]);
							end
					end
endmodule
