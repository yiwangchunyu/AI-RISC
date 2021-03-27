`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/25 22:05:37
// Design Name: 
// Module Name: IMM_ADD
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


module IMM_ADD(
    input [4:0] imm,
    input [15:0] rs1,
    output reg[15:0] dst
    );
    always@(*)begin
        dst<=imm+rs1;
    end
endmodule
