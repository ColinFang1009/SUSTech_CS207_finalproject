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


module top(rst,rst2,rst_test,clk,rst_n,sw1,sw2,sw3,S1,S2,S3,S4,row,col,bt,DIG, Y,test);
    input rst;//zero
    input rst2;//reset2
    input rst_test;//new
    input clk;
    input rst_n; //reset
    input sw1,sw2,sw3;
    input S1,S2,S3,S4;
    input [3:0] row;
    output [3:0] col;//input
    input[4:0] bt;
    //input[15:0] key_press;
    //input[15:0] key_edge;
    output [7:0] DIG;
    output [7:0] Y;
    output test;
    wire  [15:0] key_press;
    wire [15:0] key_edge;
    wire[4:0] bt_press;
    wire[4:0] bt_edge;
    
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
    wire [3:0] pay_remain;
    wire [3:0] pay_remain2;
    wire [3:0] pay_remain3;
    wire [3:0] pay_remain4;
    wire [3:0] back1;
    wire [3:0] back2;
    wire [3:0] back3;
    wire [3:0] back4;
    wire signal;
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

    //used to be: rst
    seven_seg show1(rst_n,clkout,clkout2,sw1,sw2,sw3,quant,quant2,quant3, quant4, max_add, max_add2, max_add3, max_add4,
    pay_remain,pay_remain2,pay_remain3, pay_remain4,back1,back2,back3,back4,
    en1,en2,en3,en4,DIG,Y);
    
//    quant_control qt_ctl(.clk(clkout),.sw1(S1),.sw2(S2),.sw3(S3),.sw4(S4),.signal(signal),
//    .quant1(quant),.quant2(quant2),.quant3(quant3),.quant4(quant4));
    
    pay(.sw1(S1),.sw2(S2),.sw3(S3),.sw4(S4),.clk(clk),.rst_n(rst_n),.bt_press(bt_press),.bt_edge(bt_edge),
    .remain1(pay_remain),.remain2(pay_remain2),.remain3(pay_remain3),.remain4(pay_remain4),
    .back1(back1),.back2(back2),.back3(back3),.back4(back4),
    .signal(signal));
    
    //manage_test t(S1,S2,S3,S4,clk,rst_n,rst_test,row,col,max_add,quant,test);
    manage add(.sw1(S1),.sw2(S2),.sw3(S3),.sw4(S4),.clk(clk),.rst_n(rst_n),.key_press(key_press),.key_edge(key_edge),
    .max_spp1(max_add),.max_spp2(max_add2),.max_spp3(max_add3),.max_spp4(max_add4),
    .rest1(quant),.rest2(quant2),.rest3(quant3),.rest4(quant4));
    
    input_process input_process_inst(
       clk, rst2,
        row,bt,
        col,
        bt_press,
        bt_edge,
        key_press,
        key_edge
    );
    
//    always @(posedge clkout2) begin
        //pay_remain <= pay_remain + 1;
 //       if( pay_remain != 15) //quant != 0
  //          test <= 1;
  //       else
  //          test <= 0;
//        quant <=  quant + 1;
//        if(quant == capacity) quant <= 0;
//        quant2 <=  2;
//        quant3 <=  1;
//        quant4 <= quant - 1;
//        max_add <= capacity - quant;
//        max_add2 <= capacity - quant2;
//        max_add3 <= capacity - quant3;
//        max_add4 <= capacity - quant4;


   //     end
//    always @(quant, max_add,bt_edge,bt_press)begin
        //        if(bt_edge == 5'b00001 | 
        //        bt_edge == 5'b00010 |
        //        bt_edge == 5'b10000 |
        //        bt_edge == 5'b01000 | 
        //        bt_press == 5'b00001 | 
        //        bt_press == 5'b00100 |
        //        bt_press == 5'b10000 |
        //        bt_press == 5'b01000 |
        //        bt_edge == 5'b1111)begin
        //            test = 1;
        //            end
        //        else
        //            test <= 0;
        //    end
endmodule
