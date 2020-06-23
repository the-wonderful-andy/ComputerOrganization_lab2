`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/24 00:47:34
// Design Name: 
// Module Name: divider_tb
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


module divider_tb();
reg hclk;
wire lclk;

Clk_div #(
	.HALF_DIV(5)
	) 
	div
	(
	.hclk(hclk), 
	.lclk(lclk)
	);

initial begin
	hclk <= 0;
end

always begin
	#1 hclk <= ~hclk;
end


endmodule
