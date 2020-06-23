`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/23 20:25:25
// Design Name: 
// Module Name: PC_adder_32b
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: add 4 to the address input from PC each cycle
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PC_adder_32b(
	input [31:0]addr_in, offset, 
	output [31:0]addr_out
    );
	assign addr_out = addr_in + offset;
endmodule
