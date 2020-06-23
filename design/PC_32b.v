`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/23 19:56:01
// Design Name: 
// Module Name: PC_32b
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


module PC_32b(
	input clk, clr, 
	input [31:0]addr_in,
	output reg [31:0]addr_out
    );
    
    always @(posedge clk or posedge clr) begin
    		if (clr) begin
    			addr_out <= 32'h0; 			
    		end

    		else begin
    			addr_out <= addr_in;
    		end
    	end	
    	
endmodule
