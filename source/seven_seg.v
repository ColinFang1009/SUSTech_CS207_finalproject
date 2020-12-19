`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/13 16:22:38
// Design Name: 
// Module Name: seven_seg
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


module seven_seg(rst,clk,clk2,sw1,sw2,sw3,quant,quant2,quant3, quant4, max_add, max_add2, max_add3, max_add4,seg_en,seg_en2,seg_en3, seg_en4, DIG,Y);
    input rst;
    input clk,clk2;
    input sw1,sw2,sw3;
    input [3:0] quant; //max quant = 15
    input [3:0] quant2; //item 2
    input [3:0] quant3; //item 3
    input [3:0] quant4; //item 4
    input [3:0] max_add;
    input [3:0] max_add2;
    input [3:0] max_add3;
    input [3:0] max_add4;
    input seg_en, seg_en2,seg_en3, seg_en4;//enable for item 1 and 2
    output [7:0] DIG;
    output [7:0] Y;
    reg [1:0] select;
    reg en1, en2, en3, en4;
    wire [3:0] scan_cnt;
    wire [3:0] scan_cnt2;//item2 
    wire [3:0] scan_cnt3;
    wire [3:0] scan_cnt4;
    reg [7:0] Y_r;
    reg [7:0] Y_r1;
    reg [7:0] Y_r2;
    reg [7:0] Y_r3;
    reg [7:0] Y_r4;
    reg [7:0] DIG_r;
    wire [7:0] DIG_r1;
    wire [7:0] DIG_r2;
    wire [7:0] DIG_r3;
    wire [7:0] DIG_r4;
    wire [7:0] quant_show1;
    wire [7:0] quant_show2;
    wire [7:0] quant_show_two1;
    wire [7:0] quant_show_two2;
    wire [7:0] quant_show_three1;
    wire [7:0] quant_show_three2;
    wire [7:0] quant_show_four1;
    wire [7:0] quant_show_four2;
    wire [7:0] max_add_show1;
    wire [7:0] max_add_show2;
    wire [7:0] max_add_show_two1;
    wire [7:0] max_add_show_two2;
    wire [7:0] max_add_show_three1;
    wire [7:0] max_add_show_three2;
    wire [7:0] max_add_show_four1;
    wire [7:0] max_add_show_four2;
    assign Y = (~Y_r[7:0]);//{1'b1,(~Y_r[6:0])}
    assign DIG = ~DIG_r;
   // module product_show(quant,max_add,seg_en, clk, clk2, rst, scan_cnt_show,DIG_r, quant_show_out1,quant_show_out2, max_add_out1,max_add_out2);
    product_show product1(quant, max_add,seg_en, clk, clk2, rst,scan_cnt, DIG_r1, quant_show1, quant_show2,max_add_show1, max_add_show2);
    product_show product2(quant2,max_add2, seg_en2, clk, clk2, rst,scan_cnt2, DIG_r2, quant_show_two1, quant_show_two2,max_add_show_two1, max_add_show_two2);
    product_show product3(quant3,max_add3, seg_en3, clk, clk2, rst,scan_cnt3, DIG_r3, quant_show_three1, quant_show_three2, max_add_show_three1, max_add_show_three2);
    product_show product4(quant4,max_add4, seg_en4, clk, clk2, rst,scan_cnt4, DIG_r4, quant_show_four1, quant_show_four2, max_add_show_four1, max_add_show_four2);
    
    always @ * //(seg_en,seg_en2,seg_en3,seg_en4)//DIG_r1,DIG_r2,DIG_r3,DIG_r4,
        casex({seg_en,seg_en2,seg_en3,seg_en4})
            4'b1xxx:begin DIG_r = DIG_r1;Y_r = Y_r1;end
            4'b01xx:begin DIG_r = DIG_r2;Y_r = Y_r2;end
            4'b001x:begin DIG_r = DIG_r3;Y_r = Y_r3;end
            4'b0001:begin DIG_r = DIG_r4;Y_r = Y_r4;end
            default:begin DIG_r = 8'b1111_1111; Y_r = 8'b1111_1111; end
        endcase
 
//    always @ (posedge clk2)
//        if(select == 2'b11)
//            select <= 2'b00;0000000
//        else
//            select <= select + 1;

   //3,6,9: name  5,10,15:price p xx 7,14:storage
   always @ (scan_cnt)
      begin
        case({sw1,sw2,sw3})
        3'b010: begin
        case (scan_cnt)
            0: Y_r1 = 8'b00000000; //0:0111111
            1: Y_r1 = 8'b01101101; //1:0000110
            2: Y_r1 = 8'b00111001; //2:1011011
            3: Y_r1 = 8'b01111001; //3:1001111 CSE
            4: Y_r1 = 8'b01111001; //4:1100110 CSE
            5: Y_r1 = max_add_show2; //5:1101101 P12
            6: Y_r1 = 8'b01101101; //6:1111101
            7: Y_r1 = quant_show2; //7:0100111 10
            8: Y_r1 = 8'b01101101; //8:1111111
            9: Y_r1 = 8'b00111001; //9:1100111
            10: Y_r1 = max_add_show1; //A:1110111
            11: Y_r1 = 8'b01111100; //B:1111100
            12: Y_r1 = 8'b00111001; //C:0111001
            13: Y_r1 = 8'b01011110; //D:1011110
            14: Y_r1 = quant_show1; //E:1111001
            15: Y_r1 = 8'b01110111; //F:1110001 P1110011
            default: Y_r1 = 8'b00000000; 
            endcase
        end
        default: begin
        case (scan_cnt)
            0: Y_r1 = 8'b00000000; //0:0111111
            1: Y_r1 = 8'b01101101; //1:0000110
            2: Y_r1 = 8'b00111001; //2:1011011
            3: Y_r1 = 8'b01111001; //3:1001111 CSE
            4: Y_r1 = 8'b01111001; //4:1100110 CSE
            5: Y_r1 = 8'b01011011; //5:1101101 P12
            6: Y_r1 = 8'b01101101; //6:1111101
            7: Y_r1 = quant_show2; //7:0100111 10
            8: Y_r1 = 8'b01101101; //8:1111111
            9: Y_r1 = 8'b00111001; //9:1100111
            10: Y_r1 = 8'b00000110; //A:1110111
            11: Y_r1 = 8'b01111100; //B:1111100
            12: Y_r1 = 8'b00111001; //C:0111001
            13: Y_r1 = 8'b01011110; //D:1011110
            14: Y_r1 = quant_show1; //E:1111001
            15: Y_r1 = 8'b01110011; //F:1110001 P1110011
            default: Y_r1 = 8'b00000000; 
            endcase
       end
      endcase
      end 
   always @ (scan_cnt2)
            begin
            case({sw1,sw2,sw3})
                3'b010: begin
                case (scan_cnt2)
                 0: Y_r2 = 8'b00000000; //0:0111111
                 1: Y_r2 = 8'b01101101; //1:0000110
                 2: Y_r2 = 8'b00111001; //2:1011011
                 3: Y_r2 = 8'b01111001; //3:1001111 ACE
                 4: Y_r2 = 8'b01111001; //4:1100110 nothing
                 5: Y_r2 = max_add_show_two2; //5:1101101 P12
                 6: Y_r2 = 8'b00111001; //6:1111101
                 7: Y_r2 = quant_show_two2; //7:0100111 10
                 8: Y_r2 = 8'b01101101; //8:1111111 
                 9: Y_r2 = 8'b01110111; //9:1100111
                 10: Y_r2 = max_add_show_two1; //A:1110111
                 11: Y_r2 = 8'b01111100; //B:1111100
                 12: Y_r2 = 8'b00111001; //C:0111001
                 13: Y_r2 = 8'b01011110; //D:1011110
                 14: Y_r2 = quant_show_two1; //E:1111001
                 15: Y_r2 = 8'b01110111; //F:1110001 P1110011
                 default: Y_r2 = 8'b00000000; 
                        endcase
                end
             default: begin            
              case (scan_cnt2)
                 0: Y_r2 = 8'b00000000; //0:0111111
                 1: Y_r2 = 8'b01101101; //1:0000110
                 2: Y_r2 = 8'b00111001; //2:1011011
                 3: Y_r2 = 8'b01111001; //3:1001111 ACE
                 4: Y_r2 = 8'b01111001; //4:1100110 blank
                 5: Y_r2 = 8'b00111111; //5:1101101 P 20
                 6: Y_r2 = 8'b00111001; //6:1111101
                 7: Y_r2 = quant_show_two2; //7:0100111 03
                 8: Y_r2 = 8'b01101101; //8:1111111
                 9: Y_r2 = 8'b01110111; //9:1100111
                 10: Y_r2 = 8'b01011011; //A:1110111
                 11: Y_r2 = 8'b01111100; //B:1111100
                 12: Y_r2 = 8'b00111001; //C:0111001
                 13: Y_r2 = 8'b01011110; //D:1011110
                 14: Y_r2 = quant_show_two1; //E:1111001
                 15: Y_r2 = 8'b01110011; //F:1110001 P1110011
                 default: Y_r2 = 8'b00000000; 
            endcase
            end
            endcase
            end

   always @ (scan_cnt3)
      begin
        case({sw1,sw2,sw3})
        3'b010: begin
        case (scan_cnt3)
            0: Y_r3 = 8'b00000000; //0:0111111
            1: Y_r3 = 8'b01101101; //1:0000110
            2: Y_r3 = 8'b00111001; //2:1011011
            3: Y_r3 = 8'b00111111; //3:1001111 H20
            4: Y_r3 = 8'b01111001; //4:1100110 nothing
            5: Y_r3 = max_add_show_three2; //5:1101101
            6: Y_r3 = 8'b01011011; //6:1111101
            7: Y_r3 = quant_show_three2; //7:0100111 10
            8: Y_r3 = 8'b01101101; //8:1111111
            9: Y_r3 = 8'b01110110; //9:1100111
            10: Y_r3 = max_add_show_three1; //A:1110111
            11: Y_r3 = 8'b01111100; //B:1111100
            12: Y_r3 = 8'b00111001; //C:0111001
            13: Y_r3 = 8'b01011110; //D:1011110
            14: Y_r3 = quant_show_three1; //E:1111001
            15: Y_r3 = 8'b01110111; //F:1110001 P1110011
            default Y_r3 = 8'b00000000; 
            endcase
        end
        default: begin
        case (scan_cnt3)
            0: Y_r3 = 8'b00000000; //0:0111111
            1: Y_r3 = 8'b01101101; //1:0000110
            2: Y_r3 = 8'b00111001; //2:1011011
            3: Y_r3 = 8'b00111111; //3:1001111 H20
            4: Y_r3 = 8'b01111001; //4:1100110 nothing
            5: Y_r3 = 8'b01011011; //5:1101101 P02
            6: Y_r3 = 8'b01011011; //6:1111101
            7: Y_r3 = quant_show_three2; //7:0100111 10
            8: Y_r3 = 8'b01101101; //8:1111111
            9: Y_r3 = 8'b01110110; //9:1100111
            10: Y_r3 = 8'b00111111; //A:1110111
            11: Y_r3 = 8'b01111100; //B:1111100
            12: Y_r3 = 8'b00111001; //C:0111001
            13: Y_r3 = 8'b01011110; //D:1011110
            14: Y_r3 = quant_show_three1; //E:1111001
            15: Y_r3 = 8'b01110011; //F:1110001 P1110011
            default: Y_r3 = 8'b00000000; 
            endcase
       end
      endcase
      end 
      
   always @ (scan_cnt4)
            begin
//            case({sw1,sw2,sw3})
//                    3'b010: begin
//                    case (scan_cnt4)
//                        0: Y_r4= 8'b00000000; //0:0111111
//                        1: Y_r4= 8'b01101101; //1:0000110
//                        2: Y_r4= 8'b00111001; //2:1011011
//                        3: Y_r4= 8'b01011011; //3:1001111 C02
//                        4: Y_r4= 8'b01111001; //4:1100110 nothing
//                        5: Y_r4= max_add_show_four2; //5:1101101
//                        6: Y_r4= 8'b00111111; //6:1111101
//                        7: Y_r4 = quant_show_four2; //7:0100111 10
//                        8: Y_r4 = 8'b01101101; //8:1111111
//                        9: Y_r4 = 8'b00111001; //9:1100111
//                        10: Y_r4 = max_add_show_four1; //A:1110111
//                        11: Y_r4 = 8'b01111100; //B:1111100
//                        12: Y_r4 = 8'b00111001; //C:0111001
//                        13: Y_r4 = 8'b01011110; //D:1011110
//                        14: Y_r4 = quant_show_four1; //E:1111001
//                        15: Y_r4 = 8'b01110111; //F:1110001 P1110011
//                        default Y_r4 = 8'b00000000; 
//                        endcase
//                    end
//                    3'b000: begin
              case (scan_cnt4)
                  0: Y_r4 = 8'b00000000; //0:0111111
                  1: Y_r4 = 8'b01101101; //1:0000110
                  2: Y_r4 = 8'b00111001; //2:1011011
                  3: Y_r4 = 8'b01011011; //3:1001111 C02
                  4: Y_r4 = 8'b01111001; //4:1100110 nothing
                  5: Y_r4 = 8'b01001111; //5:1101101 P 03
                  6: Y_r4 = 8'b00111111; //6:1111101
                  7: Y_r4 = quant_show_four2; //7:0100111 10
                  8: Y_r4 = 8'b01101101; //8:1111111
                  9: Y_r4 = 8'b00111001; //9:1100111
                  10: Y_r4 = 8'b00000110; //A:1110111
                  11: Y_r4 = 8'b01111100; //B:1111100
                  12: Y_r4 = 8'b00111001; //C:0111001
                  13: Y_r4 = 8'b01011110; //D:1011110
                  14: Y_r4 = quant_show_four1; //E:1111001
                  15: Y_r4 = 8'b01110011; //F:1110001 P1110011
                  default Y_r4 = 8'b00000000; 
                  endcase
            end
//            endcase
//            end
endmodule
