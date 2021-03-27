`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/22 01:29:00
// Design Name: 
// Module Name: dcmem_tb
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


module dcmem_tb(
	
    );
	reg clk;
	reg wen;
	reg[15:0]	addr;
	reg[15:0]	dataw;
	wire[15:0]	datar;
	
	initial begin
		forever #5 clk = ~clk;
	end
	dcmem dcmem_0(.clk(clk),
			.MemWEn(wen),
			.addr(addr),
			.dataw(dataw),
			.datar(datar)
		);
	initial begin
		clk = 0;
		wen=1'b0;
		addr=15'b0;
		dataw=15'b0;
		
		
		# 21
		addr=15'b1;
		# 21
		addr=15'b10;
		# 21
		addr=15'b11;
	end
	
endmodule
