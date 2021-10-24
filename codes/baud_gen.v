`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2020 13:24:25
// Design Name: 
// Module Name: baud_gen
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


module baud_gen(clk, rst, br);

input clk,rst;
output reg br;
reg [3:0]brgcount;

always @(posedge clk)
begin
    if(rst)
    begin
        brgcount = 4'b0000;
        br = 0;
    end
    else 
        brgcount = brgcount + 1'b1;
    if (brgcount==4'b1111)
    begin
        brgcount = 16'b0000_0000_0000_0000;
        br = ~br;
    end
end
endmodule
