`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/25 22:02:17
// Design Name: 
// Module Name: MUX3
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MUX3(
	input [1:0]S,
	input [15:0] A,C,
	input [8:0] B,
	output [15:0] Y
    );
	assign Y=(S==2'b00)?A:((S==2'b01)?B:C);
endmodule
