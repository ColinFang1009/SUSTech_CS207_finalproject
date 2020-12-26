`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/23 12:33:40
// Design Name: 
// Module Name: edge_generate
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


module edge_generate(
    input clk,
    input in,
    output out_edge
);

reg [1:0] record = 2'b00;

always @(posedge clk)
    record <= {record[0], in};

assign out_edge = record[0] & ~record[1];

endmodule
