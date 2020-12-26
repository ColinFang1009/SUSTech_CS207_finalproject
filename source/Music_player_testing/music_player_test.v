`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/21 23:51:14
// Design Name: 
// Module Name: music_player_test
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

module music_player_test(
    input clk,
    input rst,
    output[23:0] led,
    output buzzer
);
music_player music_inst(clk, rst, led, buzzer);

endmodule