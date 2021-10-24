`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2020 15:26:25
// Design Name: 
// Module Name: recv
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


module recv(clk, sample_clk, rx, ideal_rx, rv_data);

input clk, sample_clk, rx, ideal_rx;
output reg [7:0]rv_data;
reg [3:0]high_bit, low_bit;
reg null;

initial 
    rv_data = 8'b0000_0000;
always @(posedge sample_clk)
begin
    high_bit = 4'b0000;
    low_bit = 4'b0000;
    null = 1'b0;
end

always @(negedge clk)
if(ideal_rx==1'b0)
begin
    if(null==1'b0)
    begin
        if(rx == 1'b0)
            low_bit = low_bit + 4'b0001;
        else
            high_bit = high_bit + 4'b0001;
    end
end

always @(negedge sample_clk)
if(ideal_rx == 1'b0)
begin
    if(high_bit >= low_bit)
        rv_data[7] <= 1'b1;
    else
        rv_data[7] <= 1'b0;
    rv_data[6] <= rv_data[7];
    rv_data[5] <= rv_data[6];
    rv_data[4] <= rv_data[5];
    rv_data[3] <= rv_data[4];
    rv_data[2] <= rv_data[3];
    rv_data[1] <= rv_data[2];
    rv_data[0] <= rv_data[1];
    null = 1'b1;
end
endmodule
