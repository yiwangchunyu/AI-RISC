`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/24 23:36:27
// Design Name: 
// Module Name: ID
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


module ID#(
    parameter ISA_WIDTH=16,
    parameter REG_ADDR_WIDTH=4,
	parameter RED_DATA_WIDTH=16
)(
    input  wire                          rst,
    input  wire    [ISA_WIDTH-1:0]       inst,
	
    output reg      [REG_ADDR_WIDTH-1:0] rs1_addr,
    output reg      [REG_ADDR_WIDTH-1:0] rs2_addr,
	output reg      [REG_ADDR_WIDTH-1:0] rd_addr,
    output reg                           rdW,
	output reg                           dcmW,
    output reg      [4:0]                imm5,
    output reg      [8:0]                imm9,
	output reg                           funct,
	output reg		     				 mux1,
	output reg      [1:0]				 mux2,
	output reg                           macEn
    );
    
    always @ (*) begin
        if(!rst) 
			rs1_addr<=4'b0;
        else 
			rs1_addr<=inst[10:7];
    end
	
	always @ (*) begin
        if(!rst) 
			rs2_addr<=4'b0;
        else 
			rs2_addr<=inst[14:11];
    end
	
	always @ (*) begin
        if(!rst) 
			rd_addr<=4'b0;
        else 
			rd_addr<=inst[6:3];
    end
	always @ (*) begin
        if(!rst) 
			imm5<=5'b0;
        else 
			imm5<=inst[15:11];
    end
	always @ (*) begin
        if(!rst) 
			imm9<=9'b0;
        else 
			imm9<=inst[15:7];
    end
	always @ (*) begin
        if(!rst) 
			funct<=1'b0;
        else 
			funct<=inst[15];
    end
	always @ (*) begin
        if(!rst) 
			rdW<=1'b0;
        else begin
			casex(inst)
				16'bxxxxxxxxxxxxx001: rdW<=1'b1; //load
				16'bxxxxxxxxxxxxx010: rdW<=1'b0; //store
				16'bxxxxxxxxxxxxx011: rdW<=1'b1; //mov
				16'bxxxxxxxxxxxxx100: rdW<=1'b1; //mac
				default: rdW<=1'b0;
			endcase
		end
    end
	always @ (*) begin
        if(!rst) 
			dcmW<=1'b0;
        else begin
			casex(inst)
				16'bxxxxxxxxxxxxx001: dcmW<=1'b0; //load
				16'bxxxxxxxxxxxxx010: dcmW<=1'b1; //store
				16'bxxxxxxxxxxxxx011: dcmW<=1'b0; //mov
				16'bxxxxxxxxxxxxx100: dcmW<=1'b0; //mac
				default: dcmW<=1'b0;
			endcase
		end
    end
	always @ (*) begin
        if(!rst) 
			mux1<=1'b0;
        else begin
			casex(inst)
				16'bxxxxxxxxxxxxx001: mux1<=1'b0; //load
				16'bxxxxxxxxxxxxx010: mux1<=1'b1; //store
				16'bxxxxxxxxxxxxx011: mux1<=1'b1; //mov
				16'bxxxxxxxxxxxxx100: mux1<=1'b1; //mac
				default: mux1<=1'b0;
			endcase
		end
    end
	always @ (*) begin
        if(!rst) 
			mux2<=2'b00;
        else begin
			casex(inst)
				16'bxxxxxxxxxxxxx001: mux2<=2'b10; //load
				16'bxxxxxxxxxxxxx010: mux2<=2'b0; //store
				16'bxxxxxxxxxxxxx011: mux2<=2'b01; //mov
				16'bxxxxxxxxxxxxx100: mux2<=2'b00; //mac
				default: mux2<=2'b0;
			endcase
		end
    end
    always @ (*) begin
        if(!rst) 
			macEn<=1'b0;
        else begin
			casex(inst)
				16'bxxxxxxxxxxxxx001: macEn<=1'b0; //load
				16'bxxxxxxxxxxxxx010: macEn<=1'b0; //store
				16'bxxxxxxxxxxxxx011: macEn<=1'b0; //mov
				16'bxxxxxxxxxxxxx100: macEn<=1'b1; //mac
				default: macEn<=1'b0;
			endcase
		end
    end
endmodule
