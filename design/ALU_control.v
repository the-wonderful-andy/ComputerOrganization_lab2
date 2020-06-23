`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/23 20:37:20
// Design Name: 
// Module Name: ALU_control
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


module ALU_control(
	input [5:0]func, 
	input [1:0]Aluop, 
	output [2:0]Alucontrol
    );
	always@(*)begin
		case(Aluop)
		2'b00: Alucontrol <= 3'b000;//add
		2'b01: Alucontrol <= 3'b001;//substract
		2'b10: begin
			case(func)
				6'b100000: Alucontrol <= 3'b000;//add
				6'b100010: Alucontrol <= 3'b001;//substract
				6'b100100: Alucontrol <= 3'b010;//and
				6'b100101: Alucontrol <= 3'b011;//or
				6'b101010: Alucontrol <= 3'b101;//SLT
				default: Alucontrol <= 3'b111;
			endcase
		end

		default: Alucontrol<=3'b111;

		endcase
	end
	
endmodule
