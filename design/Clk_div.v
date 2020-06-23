`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/24 00:31:36
// Design Name: 
// Module Name: Clk_div
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


module Clk_div #(
	parameter HALF_DIV=50000000
	)(
    input hclk, 
    output reg lclk
    );

    reg [31:0]couter;

    initial begin
    	couter = 0;
    	lclk = 0;
    end

    always @(posedge hclk) begin
    	couter <= couter + 1;

    	if(couter == HALF_DIV-1)begin
    		couter <= 0;
    		lclk <= ~lclk;
    	end
    end
endmodule
