`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/22 10:32:20
// Design Name: 
// Module Name: icmem_tb
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


module icmem_tb(

    );
    reg clk;
    reg rst;
    wire[15:0] inst;
    initial begin
		forever #5 clk = ~clk;
	end
	icmem icmem_0(
	   .clk(clk),
	   .rst(rst),
	   .inst(inst)
	);
	initial begin
	   clk=0;
	   rst=0;
	   #20;
	   rst=1;
	   #20;
	   #20;
	end
endmodule
