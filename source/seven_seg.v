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


module seven_seg(rst,clk,clk2,quant,quant2,quant3, quant4, seg_en,seg_en2,seg_en3, seg_en4, DIG,Y);
    input rst;
    input clk,clk2;
    input [3:0] quant; //max quant = 15
    input [3:0] quant2; //item 2
    input [3:0] quant3; //item 3
    input [3:0] quant4; //item 4
    input seg_en, seg_en2,seg_en3, seg_en4;//enable for item 1 and 2
    output [7:0] DIG;
    output [7:0] Y;
    reg [1:0] select;
    reg en1, en2, en3, en4;
    reg [3:0] scan_cnt;
    reg [3:0] scan_cnt2;//item2 
    reg [3:0] scan_cnt3;
    reg [3:0] scan_cnt4;
    reg [7:0] Y_r;
    reg [7:0] Y_r1;
    reg [7:0] Y_r2;
    reg [7:0] Y_r3;
    reg [7:0] Y_r4;
    reg [7:0] DIG_r;
    reg [7:0] DIG_r1;
    reg [7:0] DIG_r2;
    reg [7:0] DIG_r3;
    reg [7:0] DIG_r4;
    reg [7:0] quant_show1;
    reg [7:0] quant_show2;
    reg [7:0] quant_show_two1;
    reg [7:0] quant_show_two2;
    reg [7:0] quant_show_three1;
    reg [7:0] quant_show_three2;
    reg [7:0] quant_show_four1;
    reg [7:0] quant_show_four2;
    assign Y = (~Y_r[7:0]);//{1'b1,(~Y_r[6:0])}
    assign DIG = ~DIG_r;
    
    //item1
    always @ (quant)
       begin
       case(quant)
        4'b0000:begin quant_show1 = 8'b00111111; quant_show2 = 8'b00111111; end //00
        4'b0001:begin quant_show1 = 8'b00111111; quant_show2 = 8'b00000110; end//01
        4'b0010:begin quant_show1 = 8'b00111111; quant_show2 = 8'b01011011; end//02
        4'b0011:begin quant_show1 = 8'b00111111; quant_show2 = 8'b01001111; end//03
        4'b0100:begin quant_show1 = 8'b00111111; quant_show2 = 8'b01100110; end//04
        4'b0101:begin quant_show1 = 8'b00111111; quant_show2 = 8'b01101101; end//05
        4'b0110:begin quant_show1 = 8'b00111111; quant_show2 = 8'b01111101; end//06
        4'b0111:begin quant_show1 = 8'b00111111; quant_show2 = 8'b00100111; end//07
        4'b1000:begin quant_show1 = 8'b00111111; quant_show2 = 8'b01111111; end//08
        4'b1001:begin quant_show1 = 8'b00000110; quant_show2 = 8'b01100111; end//09
        4'b1010:begin quant_show1 = 8'b00000110; quant_show2 = 8'b00111111; end//10
        4'b1011:begin quant_show1 = 8'b00000110; quant_show2 = 8'b00000110; end//11
        4'b1100:begin quant_show1 = 8'b00000110; quant_show2 = 8'b01011011; end//12
        4'b1101:begin quant_show1 = 8'b00000110; quant_show2 = 8'b01001111; end//13
        4'b1110:begin quant_show1 = 8'b00000110; quant_show2 = 8'b01100110; end//14
        4'b1111:begin quant_show1 = 8'b00000110; quant_show2 = 8'b01101101; end//15
        default:begin quant_show1 = 8'b00111111; quant_show2 = 8'b00111111; end //00
        endcase
        end
    
    //item2
    always @ (quant2)
           begin
           case(quant2)
            4'b0000:begin quant_show_two1 = 8'b00111111; quant_show_two2 = 8'b00111111; end //00
            4'b0001:begin quant_show_two1 = 8'b00111111; quant_show_two2 = 8'b00000110; end//01
            4'b0010:begin quant_show_two1 = 8'b00111111; quant_show_two2 = 8'b01011011; end//02
            4'b0011:begin quant_show_two1 = 8'b00111111; quant_show_two2 = 8'b01001111; end//03
            4'b0100:begin quant_show_two1 = 8'b00111111; quant_show_two2 = 8'b01100110; end//04
            4'b0101:begin quant_show_two1 = 8'b00111111; quant_show_two2 = 8'b01101101; end//05
            4'b0110:begin quant_show_two1 = 8'b00111111; quant_show_two2 = 8'b01111101; end//06
            4'b0111:begin quant_show_two1 = 8'b00111111; quant_show_two2 = 8'b00100111; end//07
            4'b1000:begin quant_show_two1 = 8'b00111111; quant_show_two2 = 8'b01111111; end//08
            4'b1001:begin quant_show_two1 = 8'b00000110; quant_show_two2 = 8'b01100111; end//09
            4'b1010:begin quant_show_two1 = 8'b00000110; quant_show_two2 = 8'b00111111; end//10
            4'b1011:begin quant_show_two1 = 8'b00000110; quant_show_two2 = 8'b00000110; end//11
            4'b1100:begin quant_show_two1 = 8'b00000110; quant_show_two2 = 8'b01011011; end//12
            4'b1101:begin quant_show_two1 = 8'b00000110; quant_show_two2 = 8'b01001111; end//13
            4'b1110:begin quant_show_two1 = 8'b00000110; quant_show_two2 = 8'b01100110; end//14
            4'b1111:begin quant_show_two1 = 8'b00000110; quant_show_two2 = 8'b01101101; end//15
            default:begin quant_show_two1 = 8'b00111111; quant_show_two2 = 8'b00111111; end //00
            endcase
            end
            
    always @ (quant3)
          begin
           case(quant3)
             4'b0000:begin quant_show_three1 = 8'b00111111; quant_show_three2 = 8'b00111111; end //00
             4'b0001:begin quant_show_three1 = 8'b00111111; quant_show_three2 = 8'b00000110; end//01
             4'b0010:begin quant_show_three1 = 8'b00111111; quant_show_three2 = 8'b01011011; end//02
             4'b0011:begin quant_show_three1 = 8'b00111111; quant_show_three2 = 8'b01001111; end//03
             4'b0100:begin quant_show_three1 = 8'b00111111; quant_show_three2 = 8'b01100110; end//04
             4'b0101:begin quant_show_three1 = 8'b00111111; quant_show_three2 = 8'b01101101; end//05
             4'b0110:begin quant_show_three1 = 8'b00111111; quant_show_three2 = 8'b01111101; end//06
             4'b0111:begin quant_show_three1 = 8'b00111111; quant_show_three2 = 8'b00100111; end//07
             4'b1000:begin quant_show_three1 = 8'b00111111; quant_show_three2 = 8'b01111111; end//08
             4'b1001:begin quant_show_three1 = 8'b00000110; quant_show_three2 = 8'b01100111; end//09
             4'b1010:begin quant_show_three1 = 8'b00000110; quant_show_three2 = 8'b00111111; end//10
             4'b1011:begin quant_show_three1 = 8'b00000110; quant_show_three2 = 8'b00000110; end//11
             4'b1100:begin quant_show_three1 = 8'b00000110; quant_show_three2 = 8'b01011011; end//12
             4'b1101:begin quant_show_three1 = 8'b00000110; quant_show_three2 = 8'b01001111; end//13
             4'b1110:begin quant_show_three1 = 8'b00000110; quant_show_three2 = 8'b01100110; end//14
             4'b1111:begin quant_show_three1 = 8'b00000110; quant_show_three2 = 8'b01101101; end//15
             default:begin quant_show_three1 = 8'b00111111; quant_show_three2 = 8'b00111111; end //00
             endcase
          end
    //item 4
    always @ (quant4)
            begin
             case(quant4)
             4'b0000:begin quant_show_four1 = 8'b00111111; quant_show_four2 = 8'b00111111; end //00
             4'b0001:begin quant_show_four1 = 8'b00111111; quant_show_four2 = 8'b00000110; end//01
             4'b0010:begin quant_show_four1 = 8'b00111111; quant_show_four2 = 8'b01011011; end//02
             4'b0011:begin quant_show_four1 = 8'b00111111; quant_show_four2 = 8'b01001111; end//03
             4'b0100:begin quant_show_four1 = 8'b00111111; quant_show_four2 = 8'b01100110; end//04
             4'b0101:begin quant_show_four1 = 8'b00111111; quant_show_four2 = 8'b01101101; end//05
             4'b0110:begin quant_show_four1 = 8'b00111111; quant_show_four2 = 8'b01111101; end//06
             4'b0111:begin quant_show_four1 = 8'b00111111; quant_show_four2 = 8'b00100111; end//07
             4'b1000:begin quant_show_four1 = 8'b00111111; quant_show_four2 = 8'b01111111; end//08
             4'b1001:begin quant_show_four1 = 8'b00000110; quant_show_four2 = 8'b01100111; end//09
             4'b1010:begin quant_show_four1 = 8'b00000110; quant_show_four2 = 8'b00111111; end//10
             4'b1011:begin quant_show_four1 = 8'b00000110; quant_show_four2 = 8'b00000110; end//11
             4'b1100:begin quant_show_four1 = 8'b00000110; quant_show_four2 = 8'b01011011; end//12
             4'b1101:begin quant_show_four1 = 8'b00000110; quant_show_four2 = 8'b01001111; end//13
             4'b1110:begin quant_show_four1 = 8'b00000110; quant_show_four2 = 8'b01100110; end//14
             4'b1111:begin quant_show_four1 = 8'b00000110; quant_show_four2 = 8'b01101101; end//15
             default:begin quant_show_four1 = 8'b00111111; quant_show_four2 = 8'b00111111; end //00
             endcase
          end   
    
    always @(DIG_r1,DIG_r2,DIG_r3,DIG_r4)
        case({seg_en,seg_en2,seg_en3,seg_en4})
            4'b1000:begin DIG_r = DIG_r1;Y_r = Y_r1;end
            4'b0100:begin DIG_r = DIG_r2;Y_r = Y_r2;end
            4'b0010:begin DIG_r = DIG_r3;Y_r = Y_r3;end
            4'b0001:begin DIG_r = DIG_r4;Y_r = Y_r4;end
            default:begin DIG_r = 8'b0000_0000; Y_r = 8'b0000_0000; end
        endcase
    //item1
    always @(scan_cnt)
       begin
       if(~seg_en)
            DIG_r1 = 8'b0000_0000;
       else
        case ( scan_cnt)
            4'b0000: DIG_r1 = 8'b0000_0000;//0
            4'b0001: DIG_r1 = 8'b0000_0010;//1
            4'b0010: DIG_r1 = 8'b0000_0100;//2
            4'b0011: DIG_r1 = 8'b0010_0000;//3
            4'b0100: DIG_r1 = 8'b0010_0000;//4
            4'b0101: DIG_r1 = 8'b0001_0000;//5
            4'b0110: DIG_r1 = 8'b0100_0000;//6
            4'b0111: DIG_r1 = 8'b0000_0001;//7
            4'b1000: DIG_r1 = 8'b0100_0000;//8
            4'b1001: DIG_r1 = 8'b1000_0000;//9
            4'b1010: DIG_r1 = 8'b0010_0000;//10
            4'b1011: DIG_r1 = 8'b0000_0001;//11
            4'b1100: DIG_r1 = 8'b1000_0000;//12
            4'b1101: DIG_r1 = 8'b0000_0100;//13
            4'b1110: DIG_r1 = 8'b0000_0010;//14
            4'b1111: DIG_r1 = 8'b1000_0000;//15
            default:DIG_r1 = 8'b0000_0000;
        endcase
    end
    //item 2
    always @(scan_cnt2)
           begin
           if(~seg_en2)
                DIG_r2 = 8'b0000_0000;
           else
            case ( scan_cnt2)
                4'b0000: DIG_r2 = 8'b0000_0000;//0
                4'b0001: DIG_r2 = 8'b0000_0010;//1
                4'b0010: DIG_r2 = 8'b0000_0100;//2
                4'b0011: DIG_r2 = 8'b0010_0000;//3
                4'b0100: DIG_r2 = 8'b0010_0000;//4
                4'b0101: DIG_r2 = 8'b0001_0000;//5
                4'b0110: DIG_r2 = 8'b0100_0000;//6
                4'b0111: DIG_r2 = 8'b0000_0001;//7
                4'b1000: DIG_r2 = 8'b0100_0000;//8
                4'b1001: DIG_r2 = 8'b1000_0000;//9
                4'b1010: DIG_r2 = 8'b0010_0000;//10
                4'b1011: DIG_r2 = 8'b0000_0001;//11
                4'b1100: DIG_r2 = 8'b1000_0000;//12
                4'b1101: DIG_r2 = 8'b0000_0100;//13
                4'b1110: DIG_r2 = 8'b0000_0010;//14
                4'b1111: DIG_r2 = 8'b1000_0000;//15
                default:DIG_r2 = 8'b0000_0000;
            endcase
        end
    always @(scan_cnt3)
           begin
           if(~seg_en3)
                DIG_r3 = 8'b0000_0000;
           else
            case ( scan_cnt3)
               4'b0000: DIG_r3 = 8'b0000_0000;//0
               4'b0001: DIG_r3 = 8'b0000_0010;//1
               4'b0010: DIG_r3 = 8'b0000_0100;//2
               4'b0011: DIG_r3 = 8'b0010_0000;//3
               4'b0100: DIG_r3 = 8'b0010_0000;//4
               4'b0101: DIG_r3 = 8'b0001_0000;//5
               4'b0110: DIG_r3 = 8'b0100_0000;//6
               4'b0111: DIG_r3 = 8'b0000_0001;//7
               4'b1000: DIG_r3 = 8'b0100_0000;//8
               4'b1001: DIG_r3 = 8'b1000_0000;//9
               4'b1010: DIG_r3 = 8'b0010_0000;//10
               4'b1011: DIG_r3 = 8'b0000_0001;//11
               4'b1100: DIG_r3 = 8'b1000_0000;//12
               4'b1101: DIG_r3 = 8'b0000_0100;//13
               4'b1110: DIG_r3 = 8'b0000_0010;//14
               4'b1111: DIG_r3 = 8'b1000_0000;//15
               default:DIG_r3 = 8'b0000_0000;
              endcase
       end
    always @(scan_cnt4)
           begin
           if(~seg_en4)
               DIG_r4 = 8'b0000_0000;
          else
          case ( scan_cnt4)
             4'b0000: DIG_r4 = 8'b0000_0000;//0
             4'b0001: DIG_r4 = 8'b0000_0010;//1
             4'b0010: DIG_r4 = 8'b0000_0100;//2
             4'b0011: DIG_r4 = 8'b0010_0000;//3
             4'b0100: DIG_r4 = 8'b0010_0000;//4
             4'b0101: DIG_r4 = 8'b0001_0000;//5
             4'b0110: DIG_r4 = 8'b0100_0000;//6
             4'b0111: DIG_r4 = 8'b0000_0001;//7
             4'b1000: DIG_r4 = 8'b0100_0000;//8
             4'b1001: DIG_r4 = 8'b1000_0000;//9
             4'b1010: DIG_r4 = 8'b0010_0000;//10
             4'b1011: DIG_r4 = 8'b0000_0001;//11
             4'b1100: DIG_r4 = 8'b1000_0000;//12
             4'b1101: DIG_r4 = 8'b0000_0100;//13
             4'b1110: DIG_r4 = 8'b0000_0010;//14
             4'b1111: DIG_r4 = 8'b1000_0000;//15
           default:DIG_r4 = 8'b0000_0000;
           endcase
       end   
   always @(posedge clk or negedge rst) //clkout or negedge rst
      if(!rst)begin
        scan_cnt <=0;
        scan_cnt2 <=0;
        scan_cnt3 <=0;
        scan_cnt4 <=0;
        end
      else
      begin
        case({en1,en2,en3,en4})
        4'b0001: begin
            scan_cnt <= scan_cnt + 3;
            scan_cnt2 <= scan_cnt2 + 3;
            scan_cnt3 <= scan_cnt3 + 3;
            scan_cnt4 <= scan_cnt4 + 3;
            if(scan_cnt == 9) scan_cnt <= 0;
            if(scan_cnt2 == 9) scan_cnt2 <= 0;
            if(scan_cnt3 == 9) scan_cnt3 <= 0;
            if(scan_cnt4 == 9) scan_cnt4 <= 0;
        end
        4'b0010:begin
             scan_cnt <= 0;
             scan_cnt2 <= 0;
             scan_cnt3 <= 0;
             scan_cnt4 <= 0;//scan_cnt + 4
             ///if(scan_cnt == 12) scan_cnt <= 0;
        end
       4'b0100: begin
            scan_cnt <= scan_cnt + 5;
            if(scan_cnt == 15) scan_cnt <= 0;
            scan_cnt2 <= scan_cnt2 + 5;
            if(scan_cnt2 == 15) scan_cnt2 <= 0;
            scan_cnt3 <= scan_cnt3 + 5;
            if(scan_cnt3 == 15) scan_cnt3 <= 0;
            scan_cnt4 <= scan_cnt4 + 5;
            if(scan_cnt4 == 15) scan_cnt4 <= 0;
        end
        4'b1000:begin
             scan_cnt <= scan_cnt + 7;
             if(scan_cnt == 14) scan_cnt <= 0;
             scan_cnt2 <= scan_cnt2 + 7;
             if(scan_cnt2 == 14) scan_cnt2 <= 0;
             scan_cnt3 <= scan_cnt3 + 7;
             if(scan_cnt3 == 14) scan_cnt3 <= 0;
             scan_cnt4 <= scan_cnt4 + 7;
             if(scan_cnt4 == 14) scan_cnt4 <= 0;
        end
        endcase
        end
 
    always @ (posedge clk2)
        if(select == 2'b11)
            select <= 2'b00;
        else
            select <= select + 1;
     
   always @ (select)
     case(select)
        2'b00:{en1,en2,en3,en4} = 4'b0001;
        2'b01:{en1,en2,en3,en4} = 4'b0010;
        2'b10:{en1,en2,en3,en4} = 4'b0100;
        2'b11:{en1,en2,en3,en4} = 4'b1000;
      endcase
    
   //3,6,9: name  5,10,15:price p xx 7,14:storage
   always @ (scan_cnt)
      begin
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
      
      always @ (scan_cnt2)
            begin
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
    always @ (scan_cnt3)
           begin
           case (scan_cnt3)
                 0: Y_r3 = 8'b00000000; //0:0111111
                 1: Y_r3 = 8'b01101101; //1:0000110
                 2: Y_r3 = 8'b00111001; //2:1011011
                 3: Y_r3 = 8'b00111111; //3:1001111 H20
                 4: Y_r3 = 8'b01111001; //4:1100110 nothing
                 5: Y_r3 = 8'b01011011; //5:1101101 P 02
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
     always @ (scan_cnt4)
            begin
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
endmodule
