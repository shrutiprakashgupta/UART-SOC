`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2020 15:24:05
// Design Name: 
// Module Name: main_tb
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


module main_tb();

reg clk, rst, ideal, intt, ideal_rx, rx;
reg [7:0]lcr, dll, dlh;
wire tx;

always #5 clk = ~clk;

initial 
begin 
    //clock is started with the rst signal being drawn low from a high value
    //Initially no transmission or reception occurs(No interrupt issues as nothing is transmitted) - unless ideal and ideal_rx are drawn from high to low
    //For parity style (xx0 No parity bit, 001 Odd, 011 Even, 101 High stick parity, 111 Low stick parity
    //The transmission and reception occur at baud rate - it is determined by dividing the original clock with the divisor followed by division with 16 as receiver samples 16 times in one clock cycle. 
    //Tx is generated at negedge
    //Rx is sampled at negedge
        
        clk<=0; rst<=1; ideal<=1; ideal_rx<=1; intt<=0; lcr<=8'b1000_1011; dll<=8'b0000_0010; dlh<=8'b0000_0000; rx<=0;#20;
        rst<=0; ideal<=0; ideal_rx<=0;#1200;
        rx <= 1'b1;#1200;
        rx <= 1'b0;#1200;
        rx <= 1'b1;#1200;
        rx <= 1'b0;#1200;
        rx <= 1'b1;#1200;
        rx <= 1'b1;#1200;
        rx <= 1'b1;#1200;
        rx <= 1'b1;#1200;
        rx <= 1'b0;#1200;
        rx <= 1'b0;#1200;
        rx <= 1'b1;#1200;
        rx <= 1'b1;#1200;
        rx <= 1'b0;#1200;
        rx <= 1'b1;#1200;
        rx <= 1'b1;#1200;
        rx <= 1'b1;#1200;
        rx <= 1'b0;#1200;
        rx <= 1'b0;#1200;
        rx <= 1'b1;#1200;
        rx <= 1'b0;#1200;
        rx <= 1'b0;#1200;
        rx <= 1'b0;#1200;
        rx <= 1'b0;#1200;
        rx <= 1'b0;#1200;
        #9000;
        intt<=1;#1500;
        intt<=0;
end

//The final design does not provide LCR, DLL and DLH as input, however, for running the simulations they are kept as output, thus the commented function instantiation should be used for simulation.
    //The function heading would also need to be changed (use the commented one).
// interface uut(.clk(clk), .rst(rst), .ideal(ideal), .intt(intt), .lcr(lcr), .dll(dll), .dlh(dlh), .ideal_rx(ideal_rx), .rx(rx), .tx(tx));  
interface uut(.clk(clk), .rst(rst), .ideal(ideal), .intt(intt), .ideal_rx(ideal_rx), .rx(rx), .tx(tx));  
endmodule
