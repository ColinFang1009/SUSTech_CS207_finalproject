`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/15 23:49:26
// Design Name: 
// Module Name: top
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


module top(rst,rst2,clk,rst_n,sw1,sw2,sw3,S1,S2,S3,S4,row,col,DIG, Y);
    input rst;//zero
    input rst2;//reset2
    input clk;
    input rst_n; //reset
    input sw1,sw2,sw3;
    input S1,S2,S3,S4;
    input [3:0] row;
    input [3:0] col;
    //input[15:0] key_press;
    //input[15:0] key_edge;
    output [7:0] DIG;
    output [7:0] Y;
    wire  [15:0] key_press;
    wire [15:0] key_edge;
    wire clkout;
    wire clkout2;
    wire [3:0] quant;
    wire [3:0] quant2;
    wire [3:0] quant3;
    wire [3:0] quant4;
    wire [3:0] max_add;
    wire [3:0] max_add2;
    wire [3:0] max_add3;
    wire [3:0] max_add4;
    reg en1,en2,en3,en4;
    parameter capacity = 15;
    always@ (S1,S2,S3,S4)
        case({S1, S2, S3, S4})
            4'b0001:{en1,en2,en3,en4} = 4'b0001;
            4'b0010:{en1,en2,en3,en4} = 4'b0010;
            4'b0100:{en1,en2,en3,en4} = 4'b0100;
            4'b1000:{en1,en2,en3,en4} = 4'b1000;
            default:{en1,en2,en3,en4} = 4'b0000;
        endcase
    clock ut1(rst,clk,clkout);
    clock_two ut2(rst,clk,clkout2);
    //rst,clk,clk2,sw1,sw2,sw3,quant,quant2,quant3, quant4, max_add, max_add2, max_add3, max_add4
    seven_seg show1(rst,clkout,clkout2,sw1,sw2,sw3,quant,quant2,quant3, quant4, max_add, max_add2, max_add3, max_add4,en1,en2,en3,en4,DIG,Y);
    //seven_seg_two show2(rst,clkout,clkout2,quant2,en2,DIG,Y);
    //module manage(sw1,sw2,sw3,sw4,clk,rst_n,key_press,key_edge,max_spp1,max_spp2,max_spp3,max_spp4,rest1,rest2,rest3,rest4);
    manage add(.sw1(S1),.sw2(S2),.sw3(S3),.sw4(S4),.clk(clk),.rst_n(rst_n),.key_press(key_press),.key_edge(key_edge),
    .max_spp1(max_add),.max_spp2(max_add2),.max_spp3(max_add3),.max_spp4(max_add4),
    .rest1(quant),.rest2(quant2),.rest3(quant3),.rest4(quant4));
    
    input_process input_process_inst(
        clk, rst2,
        row,
        col,
        key_press,
        key_edge
    );

    
    
//    always @(posedge clkout2) begin
//        quant <=  quant + 1;
//        if(quant == capacity) quant <= 0;
//        quant2 <=  2;
//        quant3 <=  1;
//        quant4 <= quant - 1;
//        max_add <= capacity - quant;
//        max_add2 <= capacity - quant2;
//        max_add3 <= capacity - quant3;
//        max_add4 <= capacity - quant4;
//        end
endmodule
