`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/25 22:09:41
// Design Name: 
// Module Name: IMM_ADD_tb
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


module IMM_ADD_tb(
    
    );
    reg [4:0]imm;
    reg [3:0]rs1;
    wire [4:0] dst;
    IMM_ADD imm_add(
        .imm(imm),
        .rs1(rs1),
        .dst(dst)
    );
    initial begin
        imm=5'b00001;
        rs1=4'b0010;
        #10;
        imm=5'b01001;
        rs1=4'b0110;
    end
endmodule
