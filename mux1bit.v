`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:15:25 12/07/2017 
// Design Name: 
// Module Name:    mux1bit 
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
module mux1bit(
    input IN1,
    input IN2,
    input sel,
    output reg Out
    );
	 always @ (IN1 or IN2 or sel)
	 begin
	 case(sel)
	 1'b0: begin Out<=IN1;  end
	 1'b1: begin Out<=IN2;  end
	 default: begin Out<=1'bx;  end
	 endcase
	 end
endmodule
