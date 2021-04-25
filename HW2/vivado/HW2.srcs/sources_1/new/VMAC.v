`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Wang Chunyu  
// Description: 
// Additional Comments:
// q
//////////////////////////////////////////////////////////////////////////////////
module VMAC(
		input				clk,rst,en,
		input		[31:0]	vrs1,
		input		[31:0]	vrs2,
		input		[3:0]	funct,

		output	reg	[31:0]	vrd
    );
	reg	[31:0]	psum[3:0];
	reg	[31:0]	product;
	integer		i;

	always @(*) begin
		if (!funct[3]) begin //mac, do not set bias
//			product<=psum[funct[1:0]];
            product=0;
			for(i=0;i<4;i=i+1)
				product=product+$signed(vrs1[i*8+:8])*$signed(vrs2[i*8+:8]);
			
			//output, shift and truncate
			if(funct[2]==1'b1) begin 
				for(i=0;i<4;i=i+1) begin
					// shift 0, truncate, the lower 8 bit as output. overflow handling, remain sign bit
					if((~psum[i][31]) && (psum[i]>31'b0000000000000000000000001111111))
						vrd[i*8+:8]=8'b01111111;
					else if((psum[i][31]) && (psum[i]<31'b1111111111111111111111110000000))
						vrd[i*8+:8]=8'b10000000;
					else
						vrd[i*8+:8]=psum[i][7:0];
				end
			end
			else begin
		        vrd=0;
			end
		end
		else begin
		  product=0;
		  vrd=0;
		end
	end
	// write psum (scratch pad)
	always@(posedge clk or negedge rst) begin
	    if(!rst) begin
	       for(i=0;i<4;i=i+1)
				psum[i]<=0;
	    end
		else if(en) begin
			if(funct[3]==1'b1) // set bias
				for(i=0;i<4;i=i+1)
					psum[i]<=$signed(vrs1[i*8+:8]);
			else begin// 4 mac
				psum[funct[1:0]]<=psum[funct[1:0]]+product;
			end
		end
	end
endmodule