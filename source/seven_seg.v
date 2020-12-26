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


module seven_seg(rst,clk_system,clk,clk2,sw1,sw2,sw3,quant,quant2,quant3, quant4, max_add, max_add2, max_add3, max_add4,
pay_remain,pay_remain2,pay_remain3, pay_remain4,back, back2,back3,back4,sale1,sale2,sale3,sale4,
count1,count2,count3, count4,
seg_en,seg_en2,seg_en3, seg_en4, DIG,Y,buzz);
    input rst;
    input clk_system,clk,clk2;
    input sw1,sw2,sw3;
    input [3:0] quant; //max quant = 15
    input [3:0] quant2; //item 2
    input [3:0] quant3; //item 3
    input [3:0] quant4; //item 4
    input [3:0] max_add;
    input [3:0] max_add2;
    input [3:0] max_add3;
    input [3:0] max_add4;
    input [3:0] pay_remain;
    input [3:0] pay_remain2;
    input [3:0] pay_remain3;
    input [3:0] pay_remain4;
    input [3:0] back;
    input [3:0] back2;
    input [3:0] back3;
    input [3:0] back4;
    input [3:0] sale1;
    input [3:0] sale2;
    input [3:0] sale3;
    input [3:0] sale4;
    input [3:0] count1;//sale count
    input [3:0] count2;
    input [3:0] count3;
    input [3:0] count4;
    input seg_en, seg_en2,seg_en3, seg_en4;//enable for item 1 and 2
    output [7:0] DIG;
    output [7:0] Y;
    output buzz;
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
    
    wire [7:0] pay_remain_show_four1;
    wire [7:0] pay_remain_show_four2;
    wire [7:0] pay_remain_show_three1;
    wire [7:0] pay_remain_show_three2;
    wire [7:0] pay_remain_show_two1;
    wire [7:0] pay_remain_show_two2;
    wire [7:0] pay_remain_show1;
    wire [7:0] pay_remain_show2;
    
    wire [7:0] back_show_four1;
    wire [7:0] back_show_four2;
    wire [7:0] back_show_three1;
    wire [7:0] back_show_three2;
    wire [7:0] back_show_two1;
    wire [7:0] back_show_two2;
    wire [7:0] back_show1;
    wire [7:0] back_show2;
    
    wire [7:0] sale_show1;
    wire [7:0] sale_show2;
    wire [7:0] sale_show_two1;
    wire [7:0] sale_show_two2;
    wire [7:0] sale_show_three1;
    wire [7:0] sale_show_three2;
    wire [7:0] sale_show_four1;
    wire [7:0] sale_show_four2;
    
    wire [7:0] count_show1;
    wire [7:0] count_show2;
    wire [7:0] count_show_two1;
    wire [7:0] count_show_two2;
    wire [7:0] count_show_three1;
    wire [7:0] count_show_three2;
    wire [7:0] count_show_four1;
    wire [7:0] count_show_four2;
    
    wire[4:0] countdown;
    wire[7:0] cd_show1;
    wire[7:0] cd_show2;
    wire cd_en_temp;
    reg cd_en = 0;
    wire [1:0] scan_cd;
    
//    reg set;
//    reg [1:0] delay = 2'b11;
    assign Y = (~Y_r[7:0]);//{1'b1,(~Y_r[6:0])}
    assign DIG = ~DIG_r;
    
    //cd_alert(clk_system, rst, set,buzz);
    
    countdown cd(clk_system,clk2, rst, countdown,cd_en_temp,buzz);
    translate_cd cd_translate(countdown, cd_show1, cd_show2);
   // module product_show(quant,max_add,seg_en, clk, clk2, rst, scan_cnt_show,DIG_r, quant_show_out1,quant_show_out2, max_add_out1,max_add_out2);
    product_show product1(quant, max_add,pay_remain,back,sale1,count1,seg_en, cd_en,
    clk, clk2, rst,sw1,sw2,sw3,
    scan_cnt, scan_cd,DIG_r1, 
    quant_show1, quant_show2,max_add_show1, max_add_show2,pay_remain_show1,pay_remain_show2,
    back_show1, back_show2,sale_show1,sale_show2,count_show1,count_show2);
    
    product_show product2(quant2,max_add2,pay_remain2,back2,sale2,count2,seg_en2, cd_en,
    clk, clk2, rst,sw1,sw2,sw3,
    scan_cnt2, scan_cd,DIG_r2, 
    quant_show_two1, quant_show_two2,max_add_show_two1, max_add_show_two2,pay_remain_show_two1,pay_remain_show_two2,
    back_show_two1, back_show_two2,sale_show_two1,sale_show_two2,count_show_two1,count_show_two2);
    
    product_show product3(quant3,max_add3, pay_remain3,back3,sale3,count3,seg_en3, cd_en,
    clk, clk2, rst,sw1,sw2,sw3,
    scan_cnt3, scan_cd,DIG_r3, 
    quant_show_three1, quant_show_three2, max_add_show_three1, max_add_show_three2,pay_remain_show_three1,pay_remain_show_three2,
    back_show_three1, back_show_three2,sale_show_three1,sale_show_three2,count_show_three1,count_show_three2);
    
    product_show product4(quant4,max_add4, pay_remain4,back4,sale4,count4,seg_en4, cd_en,
    clk, clk2, rst,sw1,sw2,sw3,
    scan_cnt4, scan_cd,DIG_r4, 
    quant_show_four1, quant_show_four2, max_add_show_four1, max_add_show_four2,pay_remain_show_four1,pay_remain_show_four2,
    back_show_four1, back_show_four2,sale_show_four1, sale_show_four2,count_show_four1, count_show_four2);
    
    always @ * //(seg_en,seg_en2,seg_en3,seg_en4)//DIG_r1,DIG_r2,DIG_r3,DIG_r4,
        casex({seg_en,seg_en2,seg_en3,seg_en4})
            4'b1xxx:begin DIG_r = DIG_r1;Y_r = Y_r1;end
            4'b01xx:begin DIG_r = DIG_r2;Y_r = Y_r2;end
            4'b001x:begin DIG_r = DIG_r3;Y_r = Y_r3;end
            4'b0001:begin DIG_r = DIG_r4;Y_r = Y_r4;end
            default:begin DIG_r = 8'b1111_1111; Y_r = 8'b1111_1111; end
        endcase

   //3,6,9: name  5,10,15:price p xx 7,14:storage
   always @ *//(scan_cnt,max_add_show2,quant_show2,max_add_show1,quant_show1,sw1,sw2,sw3)
      begin
        case({sw1,sw2,sw3})
        3'b001: begin
        case (scan_cnt)
                0: Y_r1 = 8'b00000000; //0:0111111
                1: Y_r1 = 8'b01101101; //1:0000110
                2: Y_r1 = 8'b00111001; //2:1011011
                3: Y_r1 = 8'b01111001; //3:1001111 CSE
                4: Y_r1 = 8'b00000000; //4:1100110 CSE
                5: Y_r1 = sale_show2; //5:1101101 P12
                6: Y_r1 = 8'b01101101; //6:1111101
                7: Y_r1 = count_show2; //7:0100111 10
                8: Y_r1 = 8'b00000000; //8:1111111
                9: Y_r1 = 8'b00111001; //9:1100111
                10: Y_r1 = sale_show1; //A:1110111
                11: Y_r1 = 8'b01111100; //B:1111100
                12: Y_r1 = 8'b00000000; //C:0111001
                13: Y_r1 = 8'b01011110; //D:1011110
                14: Y_r1 = count_show1; //E:1111001
                15: Y_r1 = 8'b01110011; //F:1110001 P1110011
                default: Y_r1 = 8'b00000000; 
           endcase
                end
        3'b010: begin
        case (scan_cnt)
            0: Y_r1 = 8'b00000000; //0:0111111
            1: Y_r1 = 8'b01101101; //1:0000110
            2: Y_r1 = 8'b00111001; //2:1011011
            3: Y_r1 = 8'b01111001; //3:1001111 CSE
            4: Y_r1 = 8'b00000000; //4:1100110 CSE
            5: Y_r1 = max_add_show2; //5:1101101 P12
            6: Y_r1 = 8'b01101101; //6:1111101
            7: Y_r1 = quant_show2; //7:0100111 10
            8: Y_r1 = 8'b00000000; //8:1111111
            9: Y_r1 = 8'b00111001; //9:1100111
            10: Y_r1 = max_add_show1; //A:1110111
            11: Y_r1 = 8'b01111100; //B:1111100
            12: Y_r1 = 8'b00000000; //C:0111001
            13: Y_r1 = 8'b01011110; //D:1011110
            14: Y_r1 = quant_show1; //E:1111001
            15: Y_r1 = 8'b01110111; //F:1110001 P1110011
            default: Y_r1 = 8'b00000000; 
            endcase
        end
        3'b100: begin
            if(cd_en_temp==1) begin
                cd_en = 1;
                case(scan_cd)
                    2'b00:Y_r1 = cd_show2;
                    2'b01:Y_r1 = cd_show1;
                    2'b10:Y_r1 = pay_remain_show2;
                    2'b11:Y_r1 = pay_remain_show1;
                endcase
            end
            else begin
                cd_en = 0;
                
                case (scan_cnt)
                    0: Y_r1 = 8'b00000000; //0:0111111
                    1: Y_r1 = 8'b01101101; //1:0000110
                    2: Y_r1 = 8'b00111001; //2:1011011
                    3: Y_r1 = 8'b01111001; //3:1001111 CSE
                    4: Y_r1 = 8'b00000000; //4:1100110 CSE
                    5: Y_r1 = back_show2; //5:1101101 P12
                    6: Y_r1 = 8'b01101101; //6:1111101
                    7: Y_r1 = pay_remain_show2; //7:0100111 10
                    8: Y_r1 = 8'b00000000; //8:1111111
                    9: Y_r1 = 8'b00111001; //9:1100111
                    10: Y_r1 = back_show1; //A:1110111
                    11: Y_r1 = 8'b01111100; //B:1111100
                    12: Y_r1 = 8'b01111100; //C:0111001
                    13: Y_r1 = 8'b01111100; //D:1011110
                    14: Y_r1 = pay_remain_show1; //E:1111001
                    15: Y_r1 = 8'b01111100; //F:1110001 P1110011
                    default: Y_r1 = 8'b00000000; 
                    endcase
                end
                end
        default: begin
        case (scan_cnt)
            0: Y_r1 = 8'b00000000; //0:0111111
            1: Y_r1 = 8'b01101101; //1:0000110
            2: Y_r1 = 8'b00111001; //2:1011011
            3: Y_r1 = 8'b01111001; //3:1001111 CSE
            4: Y_r1 = 8'b00000000; //4:1100110 CSE
            5: Y_r1 = 8'b01011011; //5:1101101 P12
            6: Y_r1 = 8'b01101101; //6:1111101
            7: Y_r1 = quant_show2; //7:0100111 10
            8: Y_r1 = 8'b00000000; //8:1111111
            9: Y_r1 = 8'b00111001; //9:1100111
            10: Y_r1 = 8'b00000110; //A:1110111
            11: Y_r1 = 8'b01111100; //B:1111100
            12: Y_r1 = 8'b00000000; //C:0111001
            13: Y_r1 = 8'b01011110; //D:1011110
            14: Y_r1 = quant_show1; //E:1111001
            15: Y_r1 = 8'b01110011; //F:1110001 P1110011
            default: Y_r1 = 8'b00000000; 
            endcase
       end
      endcase
      end 
      
      
   always @ *//(scan_cnt2,max_add_show_two2,max_add_show_two1,quant_show_two2,quant_show_two1,sw1,sw2,sw3)
            begin
            case({sw1,sw2,sw3})
            3'b001: begin
            case (scan_cnt)
                    0: Y_r2 = 8'b00000000; //0:0111111
                    1: Y_r2 = 8'b01101101; //1:0000110
                    2: Y_r2 = 8'b00111001; //2:1011011
                    3: Y_r2 = 8'b01111001; //3:1001111 ACE
                    4: Y_r2 = 8'b00000000; //4:1100110
                    5: Y_r2 = sale_show_two2; //5:1101101 P12
                    6: Y_r2 = 8'b00111001; //6:1111101
                    7: Y_r2 = count_show_two2; //7:0100111 10
                    8: Y_r2 = 8'b00000000; //8:1111111
                    9: Y_r2 = 8'b01110111; //9:1100111
                    10: Y_r2 = sale_show_two1; //A:1110111
                    11: Y_r2 = 8'b01111100; //B:1111100
                    12: Y_r2 = 8'b00000000; //C:0111001
                    13: Y_r2 = 8'b01011110; //D:1011110
                    14: Y_r2 = count_show_two1; //E:1111001
                    15: Y_r2 = 8'b01110011; //F:1110001 P1110011
                    default: Y_r2 = 8'b00000000; 
               endcase
               end
                3'b010: begin
                case (scan_cnt2)
                 0: Y_r2 = 8'b00000000; //0:0111111
                 1: Y_r2 = 8'b01101101; //1:0000110
                 2: Y_r2 = 8'b00111001; //2:1011011
                 3: Y_r2 = 8'b01111001; //3:1001111 ACE
                 4: Y_r2 = 8'b00000000; //4:1100110 nothing
                 5: Y_r2 = max_add_show_two2; //5:1101101 P12
                 6: Y_r2 = 8'b00111001; //6:1111101
                 7: Y_r2 = quant_show_two2; //7:0100111 10
                 8: Y_r2 = 8'b00000000; //8:1111111 
                 9: Y_r2 = 8'b01110111; //9:1100111
                 10: Y_r2 = max_add_show_two1; //A:1110111
                 11: Y_r2 = 8'b01111100; //B:1111100
                 12: Y_r2 = 8'b00000000; //C:0111001
                 13: Y_r2 = 8'b01011110; //D:1011110
                 14: Y_r2 = quant_show_two1; //E:1111001
                 15: Y_r2 = 8'b01110111; //F:1110001 P1110011
                 default: Y_r2 = 8'b00000000; 
                        endcase
                end
              3'b100: begin 
                    if(cd_en_temp == 1) begin
                            cd_en = 1;
                            case(scan_cd)
                                2'b00:Y_r2 = cd_show2;
                                2'b01:Y_r2 = cd_show1;
                                2'b10:Y_r2 = pay_remain_show_two2;
                                2'b11:Y_r2 = pay_remain_show_two1;
                            endcase
                        end
                        else begin
                            cd_en = 0;           
                            case (scan_cnt2)
                               0: Y_r2 = 8'b00000000; //0:0111111
                               1: Y_r2 = 8'b01101101; //1:0000110
                               2: Y_r2 = 8'b00111001; //2:1011011
                               3: Y_r2 = 8'b01111001; //3:1001111 ACE
                               4: Y_r2 = 8'b00000000; //4:1100110 blank
                               5: Y_r2 = back_show_two2; //5:1101101 P 20
                               6: Y_r2 = 8'b00111001; //6:1111101
                               7: Y_r2 = pay_remain_show_two2; //7:0100111 03
                               8: Y_r2 = back_show_two1; //8:1111111
                               9: Y_r2 = 8'b01110111; //9:1100111
                               10: Y_r2 = back_show_two1; //A:1110111
                               11: Y_r2 = 8'b01111100; //B:1111100
                               12: Y_r2 = 8'b01111100; //C:0111001
                               13: Y_r2 = 8'b01011110; //D:1011110
                               14: Y_r2 = pay_remain_show_two1; //E:1111001
                               15: Y_r2 = 8'b01111100; //F:1110001 P1110011
                               default: Y_r2 = 8'b00000000; 
                          endcase
                          end
                          end              
             default: begin            
              case (scan_cnt2)
                 0: Y_r2 = 8'b00000000; //0:0111111
                 1: Y_r2 = 8'b01101101; //1:0000110
                 2: Y_r2 = 8'b00111001; //2:1011011
                 3: Y_r2 = 8'b01111001; //3:1001111 ACE
                 4: Y_r2 = 8'b000000000; //4:1100110 blank
                 5: Y_r2 = 8'b01101101; //5:1101101 P 20
                 6: Y_r2 = 8'b00111001; //6:1111101
                 7: Y_r2 = quant_show_two2; //7:0100111 03
                 8: Y_r2 = 8'b00000000; //8:1111111
                 9: Y_r2 = 8'b01110111; //9:1100111
                 10: Y_r2 = 8'b00000110; //A:1110111
                 11: Y_r2 = 8'b01111100; //B:1111100
                 12: Y_r2 = 8'b00000000; //C:0111001
                 13: Y_r2 = 8'b01011110; //D:1011110
                 14: Y_r2 = quant_show_two1; //E:1111001
                 15: Y_r2 = 8'b01110011; //F:1110001 P1110011
                 default: Y_r2 = 8'b00000000; 
            endcase
            end
            endcase
            end

   always @ *// (scan_cnt3,max_add_show_three2,max_add_show_three1,quant_show_three2,quant_show_three1,sw1,sw2,sw3)
      begin
        case({sw1,sw2,sw3})
         3'b001: begin
               case (scan_cnt3)
                   0: Y_r3 = 8'b00000000; //0:0111111
                   1: Y_r3 = 8'b01101101; //1:0000110
                   2: Y_r3 = 8'b00111001; //2:1011011
                   3: Y_r3 = 8'b00000110; //3:1001111 H20 1110110:1011011:0111111
                   4: Y_r3 = 8'b00000000; //4:1100110 nothing
                   5: Y_r3 = sale_show_three2; //5:1101101
                   6: Y_r3 = 8'b00111111; //6:1111101
                   7: Y_r3 = count_show_three2; //7:0100111 10
                   8: Y_r3 = 8'b00000000; //8:1111111
                   9: Y_r3 = 8'b00000110; //9:1100111
                   10: Y_r3 = sale_show_three1; //A:1110111
                   11: Y_r3 = 8'b01111100; //B:1111100
                   12: Y_r3 = 8'b00000000; //C:0111001
                   13: Y_r3 = 8'b01011110; //D:1011110
                   14: Y_r3 = count_show_three1; //E:1111001
                   15: Y_r3 = 8'b01110011; //F:1110001 P1110011
                   default Y_r3 = 8'b00000000; 
                   endcase
               end
        3'b010: begin
        case (scan_cnt3)
            0: Y_r3 = 8'b00000000; //0:0111111
            1: Y_r3 = 8'b01101101; //1:0000110
            2: Y_r3 = 8'b00111001; //2:1011011
            3: Y_r3 = 8'b00000110; //3:1001111 H20 1110110:1011011:0111111
            4: Y_r3 = 8'b00000000; //4:1100110 nothing
            5: Y_r3 = max_add_show_three2; //5:1101101
            6: Y_r3 = 8'b00111111; //6:1111101
            7: Y_r3 = quant_show_three2; //7:0100111 10
            8: Y_r3 = 8'b00000000; //8:1111111
            9: Y_r3 = 8'b00000110; //9:1100111
            10: Y_r3 = max_add_show_three1; //A:1110111
            11: Y_r3 = 8'b01111100; //B:1111100
            12: Y_r3 = 8'b00000000; //C:0111001
            13: Y_r3 = 8'b01011110; //D:1011110
            14: Y_r3 = quant_show_three1; //E:1111001
            15: Y_r3 = 8'b01110111; //F:1110001 P1110011
            default Y_r3 = 8'b00000000; 
            endcase
        end
        3'b100:begin
            if(cd_en_temp ==1) begin
                cd_en = 1;
                case(scan_cd)
                    2'b00:Y_r3 = cd_show2;
                    2'b01:Y_r3 = cd_show1;
                    2'b10:Y_r3 = pay_remain_show_three2;
                    2'b11:Y_r3 = pay_remain_show_three1;
                endcase
             end
             else begin
             cd_en = 0;
            case (scan_cnt3)
            0: Y_r3 = 8'b00000000; //0:0111111
            1: Y_r3 = 8'b01101101; //1:0000110
            2: Y_r3 = 8'b00111001; //2:1011011
            3: Y_r3 = 8'b00000110; //3:1001111 H20
            4: Y_r3 = back_show_three2; //4:1100110 nothing
            5: Y_r3 = back_show_three2; //5:1101101 P02
            6: Y_r3 = 8'b00111111; //6:1111101
            7: Y_r3 = pay_remain_show_three2; //7:0100111 10
            8: Y_r3 = back_show_three1; //8:1111111
            9: Y_r3 = 8'b00000110; //9:1100111
            10: Y_r3 = back_show_three1; //A:1110111
            11: Y_r3 = 8'b01111100; //B:1111100
            12: Y_r3 = 8'b01111100; //C:0111001
            13: Y_r3 = 8'b01011110; //D:1011110
            14: Y_r3 = pay_remain_show_three1; //E:1111001
            15: Y_r3 = 8'b01111100; //F:1110001 P1110011
            default: Y_r3 = 8'b00000000; 
            endcase
       end
       end
        default: begin
        case (scan_cnt3)
            0: Y_r3 = 8'b00000000; //0:0111111
            1: Y_r3 = 8'b01101101; //1:0000110
            2: Y_r3 = 8'b00111001; //2:1011011
            3: Y_r3 = 8'b00000110; //3:1001111 H20
            4: Y_r3 = 8'b00000000; //4:1100110 nothing
            5: Y_r3 = 8'b01011011; //5:1101101 P02
            6: Y_r3 = 8'b00111111; //6:1111101
            7: Y_r3 = quant_show_three2; //7:0100111 10
            8: Y_r3 = 8'b00000000; //8:1111111
            9: Y_r3 = 8'b00000110; //9:1100111
            10: Y_r3 = 8'b00111111; //A:1110111
            11: Y_r3 = 8'b01111100; //B:1111100
            12: Y_r3 = 8'b00000000; //C:0111001
            13: Y_r3 = 8'b01011110; //D:1011110
            14: Y_r3 = quant_show_three1; //E:1111001
            15: Y_r3 = 8'b01110011; //F:1110001 P1110011
            default: Y_r3 = 8'b00000000; 
            endcase
       end
      endcase
      end 
      
   always @ * //(scan_cnt4,sw1,sw2,sw3,max_add_show_four2,max_add_show_four1,quant_show_four2,quant_show_four1)
            begin
            case({sw1,sw2,sw3})
            3'b001: begin
            case (scan_cnt4)
                0: Y_r4= 8'b00000000; //0:0111111
                1: Y_r4= 8'b01101101; //1:0000110
                2: Y_r4= 8'b00111001; //2:1011011
                3: Y_r4= 8'b01011110; //3:1001111 
                4: Y_r4= 8'b00000000; //4:1100110 nothing
                5: Y_r4= sale_show_four2; //5:1101101
                6: Y_r4= 8'b01111100; //6:1111101
                7: Y_r4 = count_show_four2; //7:0100111 10
                8: Y_r4 = 8'b00000000; //8:1111111
                9: Y_r4 = 8'b01011110; //9:1100111
                10: Y_r4 = sale_show_four1; //A:1110111
                11: Y_r4 = 8'b01111100; //B:1111100
                12: Y_r4 = 8'b00000000; //C:0111001
                13: Y_r4 = 8'b01011110; //D:1011110
                14: Y_r4 = count_show_four1; //E:1111001
                15: Y_r4 = 8'b01110011; //F:1110001 P1110011
                default Y_r4 = 8'b00000000; 
                endcase
            end                
                    3'b010: begin
                    case (scan_cnt4)
                        0: Y_r4= 8'b00000000; //0:0111111
                        1: Y_r4= 8'b01101101; //1:0000110
                        2: Y_r4= 8'b00111001; //2:1011011
                        3: Y_r4= 8'b01011110; //3:1001111 C02
                        4: Y_r4= 8'b00000000; //4:1100110 nothing
                        5: Y_r4= max_add_show_four2; //5:1101101
                        6: Y_r4= 8'b01111100; //6:1111101
                        7: Y_r4 = quant_show_four2; //7:0100111 10
                        8: Y_r4 = 8'b00000000; //8:1111111
                        9: Y_r4 = 8'b01011110; //9:1100111
                        10: Y_r4 = max_add_show_four1; //A:1110111
                        11: Y_r4 = 8'b01111100; //B:1111100
                        12: Y_r4 = 8'b00000000; //C:0111001
                        13: Y_r4 = 8'b01011110; //D:1011110
                        14: Y_r4 = quant_show_four1; //E:1111001
                        15: Y_r4 = 8'b01110111; //F:1110001 P1110011
                        default Y_r4 = 8'b00000000; 
                        endcase
                    end
            3'b100: begin
            if(cd_en_temp == 1) begin
                cd_en = 1;
                case(scan_cd)
                    2'b00:Y_r4 = cd_show2;
                    2'b01:Y_r4 = cd_show1;
                    2'b10:Y_r4 = pay_remain_show_four2;
                    2'b11:Y_r4 = pay_remain_show_four1;
                endcase
              end
           else begin
            cd_en = 0;
        case (scan_cnt4)
                0: Y_r4 = 8'b00000000; //0:0111111
                1: Y_r4 = 8'b01101101; //1:0000110
                2: Y_r4 = 8'b00111001; //2:1011011
                3: Y_r4 = 8'b01011110; //3:1001111 C02
                4: Y_r4 = back_show_four2; //4:1100110 back
                5: Y_r4 = back_show_four2; //5:1101101 P 03
                6: Y_r4 = 8'b01111100; //6:1111101
                7: Y_r4 = pay_remain_show_four2; //7:0100111 10
                8: Y_r4 = back_show_four1; //8:1111111
                9: Y_r4 = 8'b01011110; //2:1011011
                10: Y_r4 = back_show_four1; //A:1110111
                11: Y_r4 = 8'b01111100; //B:1111100
                12: Y_r4 = 8'b01111100; //C:0111001
                13: Y_r4 = 8'b01011110; //D:1011110
                14: Y_r4 = quant_show_four1; //E:1111001
                15: Y_r4 = 8'b01111100; //F:1110001 P1110011
                default: Y_r4 = 8'b00000000; 
                endcase
           end
           end            
              default: begin
              case (scan_cnt4)
                  0: Y_r4 = 8'b00000000; //0:0111111
                  1: Y_r4 = 8'b01101101; //1:0000110
                  2: Y_r4 = 8'b00111001; //2:1011011
                  3: Y_r4 = 8'b01011110; //3:1001111 C02
                  4: Y_r4 = 8'b00000000; //4:1100110 nothing
                  5: Y_r4 = 8'b01001111; //5:1101101 P 03
                  6: Y_r4 = 8'b01111100; //6:1111101
                  7: Y_r4 = quant_show_four2; //7:0100111 10
                  8: Y_r4 = 8'b00000000; //8:1111111
                  9: Y_r4 = 8'b01011110; //9:1100111
                  10: Y_r4 = 8'b00111111; //A:1110111
                  11: Y_r4 = 8'b01111100; //B:1111100
                  12: Y_r4 = 8'b00000000; //C:0111001
                  13: Y_r4 = 8'b01011110; //D:1011110
                  14: Y_r4 = quant_show_four1; //E:1111001
                  15: Y_r4 = 8'b01110011; //F:1110001 P1110011
                  default Y_r4 = 8'b00000000; 
                  endcase
            end
            endcase
            end
            
   
//      always @ (clk_system)
//      begin
//        if(set == 1) begin
//            set <= 0;
//        end
//        if(cd_en_temp == 0) begin
//            if(delay > 0) begin
//            set <= 1;end
//            delay <= delay - 1;
//        end
//        else if (cd_en_temp == 1) begin
//            delay <= 2'b11;
//        end
//      end
      

endmodule
