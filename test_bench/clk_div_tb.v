`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2020 14:12:12
// Design Name: 
// Module Name: clk_div_tb
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


module clk_div_tb();
reg clk,rst;
reg [7:0]dll,dlh;
wire br;

always #5 clk = ~clk;
initial 
begin
clk <= 1; rst=1; dll <= 8'b0000_0110; dlh <= 8'b0000_0000;#10;
rst = 0;
end

baud_gen uut(.clk(clk), .rst(rst), .br(br), .div({dlh,dll}));
endmodule
