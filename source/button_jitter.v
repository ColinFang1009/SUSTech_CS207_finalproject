
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/19 17:04:54
// Design Name: 
// Module Name: button_jitter
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

`timescale 1ns / 1ps

// this module tries to elimiate the jitter in button pressing
// use 20ms as a counter

module button_jitter(
    input clk,//clock
    input but_in,//button input
    output but_out //button output after de-bouncing
);

reg [1:0] record = 2'b00;
wire change_detect;
reg [16:0] cnt;
reg out;

always @(posedge clk)
    record <= {record[0],but_in};

assign change_detect = record[0] ^ record[1];

always @(posedge clk)
    if(change_detect==1)
        cnt <= 0;
    else
        cnt <= cnt + 1;

always @(posedge clk)
    if(cnt == 10_0000) begin
        out <= record[0];
    end

assign but_out = out;

endmodule
