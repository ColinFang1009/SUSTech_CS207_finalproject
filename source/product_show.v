`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/19 20:29:49
// Design Name: 
// Module Name: product_show
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


module product_show(
    input [3:0] quant,
    input [3:0] max_add,
    input [3:0] pay_remain,
    input [3:0] back,
    input seg_en,
    input clk, clk2,
    input rst,
    input sw1,sw2,sw3,
    output [3:0] scan_cnt_show,
    output reg [7:0] DIG_r,
    output [7:0] quant_show_out1,
    output [7:0] quant_show_out2,
    output [7:0] max_add_out1,
    output [7:0] max_add_out2,
    output [7:0] pay_remain_out1,
    output [7:0] pay_remain_out2,
    output [7:0] back_out1,
    output [7:0] back_out2
    );
    reg [3:0] scan_cnt;
    reg [7:0] quant_show1;
    reg [7:0] quant_show2;
    reg [7:0] max_add_show1;
    reg [7:0] max_add_show2;
    reg [7:0] pay_remain_show1;
    reg [7:0] pay_remain_show2;
    reg [7:0] back_show1;
    reg [7:0] back_show2;
    reg en1,en2,en3,en4;
    reg [1:0] select;
    
    assign scan_cnt_show = scan_cnt;
    assign quant_show_out1 = quant_show1;
    assign quant_show_out2 = quant_show2;
    assign max_add_out1 = max_add_show1;
    assign max_add_out2 = max_add_show2;
    assign pay_remain_out1 = pay_remain_show1;
    assign pay_remain_out2 = pay_remain_show2;
    assign back_out1 = back_show1;
    assign back_out2 = back_show2;

    always @ (back) begin
    case(back)
     4'b0000:begin back_show1 = 8'b00111111; back_show2 = 8'b00111111; end //00
     4'b0001:begin back_show1 = 8'b00111111; back_show2 = 8'b00000110; end//01
     4'b0010:begin back_show1 = 8'b00111111; back_show2 = 8'b01011011; end//02
     4'b0011:begin back_show1 = 8'b00111111; back_show2 = 8'b01001111; end//03
     4'b0100:begin back_show1 = 8'b00111111; back_show2 = 8'b01100110; end//04
     4'b0101:begin back_show1 = 8'b00111111; back_show2 = 8'b01101101; end//05
     4'b0110:begin back_show1 = 8'b00111111; back_show2 = 8'b01111101; end//06
     4'b0111:begin back_show1 = 8'b00111111; back_show2 = 8'b00100111; end//07
     4'b1000:begin back_show1 = 8'b00111111; back_show2 = 8'b01111111; end//08
     4'b1001:begin back_show1 = 8'b00000110; back_show2 = 8'b01100111; end//09
     4'b1010:begin back_show1 = 8'b00000110; back_show2 = 8'b00111111; end//10
     4'b1011:begin back_show1 = 8'b00000110; back_show2 = 8'b00000110; end//11
     4'b1100:begin back_show1 = 8'b00000110; back_show2 = 8'b01011011; end//12
     4'b1101:begin back_show1 = 8'b00000110; back_show2 = 8'b01001111; end//13
     4'b1110:begin back_show1 = 8'b00000110; back_show2 = 8'b01100110; end//14
     4'b1111:begin back_show1 = 8'b00000110; back_show2 = 8'b01101101; end//15
     default:begin back_show1 = 8'b00111111; back_show2 = 8'b00111111; end //00
     endcase
     end

    always @ (pay_remain) begin
    case(pay_remain)
     4'b0000:begin pay_remain_show1 = 8'b00111111; pay_remain_show2 = 8'b00111111; end //00
     4'b0001:begin pay_remain_show1 = 8'b00111111; pay_remain_show2 = 8'b00000110; end//01
     4'b0010:begin pay_remain_show1 = 8'b00111111; pay_remain_show2 = 8'b01011011; end//02
     4'b0011:begin pay_remain_show1 = 8'b00111111; pay_remain_show2 = 8'b01001111; end//03
     4'b0100:begin pay_remain_show1 = 8'b00111111; pay_remain_show2 = 8'b01100110; end//04
     4'b0101:begin pay_remain_show1 = 8'b00111111; pay_remain_show2 = 8'b01101101; end//05
     4'b0110:begin pay_remain_show1 = 8'b00111111; pay_remain_show2 = 8'b01111101; end//06
     4'b0111:begin pay_remain_show1 = 8'b00111111; pay_remain_show2 = 8'b00100111; end//07
     4'b1000:begin pay_remain_show1 = 8'b00111111; pay_remain_show2 = 8'b01111111; end//08
     4'b1001:begin pay_remain_show1 = 8'b00000110; pay_remain_show2 = 8'b01100111; end//09
     4'b1010:begin pay_remain_show1 = 8'b00000110; pay_remain_show2 = 8'b00111111; end//10
     4'b1011:begin pay_remain_show1 = 8'b00000110; pay_remain_show2 = 8'b00000110; end//11
     4'b1100:begin pay_remain_show1 = 8'b00000110; pay_remain_show2 = 8'b01011011; end//12
     4'b1101:begin pay_remain_show1 = 8'b00000110; pay_remain_show2 = 8'b01001111; end//13
     4'b1110:begin pay_remain_show1 = 8'b00000110; pay_remain_show2 = 8'b01100110; end//14
     4'b1111:begin pay_remain_show1 = 8'b00000110; pay_remain_show2 = 8'b01101101; end//15
     default:begin pay_remain_show1 = 8'b00111111; pay_remain_show2 = 8'b00111111; end //00
     endcase
     end
    
    always @ (max_add) begin
    case(max_add)
     4'b0000:begin max_add_show1 = 8'b00111111; max_add_show2 = 8'b00111111; end //00
     4'b0001:begin max_add_show1 = 8'b00111111; max_add_show2 = 8'b00000110; end//01
     4'b0010:begin max_add_show1 = 8'b00111111; max_add_show2 = 8'b01011011; end//02
     4'b0011:begin max_add_show1 = 8'b00111111; max_add_show2 = 8'b01001111; end//03
     4'b0100:begin max_add_show1 = 8'b00111111; max_add_show2 = 8'b01100110; end//04
     4'b0101:begin max_add_show1 = 8'b00111111; max_add_show2 = 8'b01101101; end//05
     4'b0110:begin max_add_show1 = 8'b00111111; max_add_show2 = 8'b01111101; end//06
     4'b0111:begin max_add_show1 = 8'b00111111; max_add_show2 = 8'b00100111; end//07
     4'b1000:begin max_add_show1 = 8'b00111111; max_add_show2 = 8'b01111111; end//08
     4'b1001:begin max_add_show1 = 8'b00000110; max_add_show2 = 8'b01100111; end//09
     4'b1010:begin max_add_show1 = 8'b00000110; max_add_show2 = 8'b00111111; end//10
     4'b1011:begin max_add_show1 = 8'b00000110; max_add_show2 = 8'b00000110; end//11
     4'b1100:begin max_add_show1 = 8'b00000110; max_add_show2 = 8'b01011011; end//12
     4'b1101:begin max_add_show1 = 8'b00000110; max_add_show2 = 8'b01001111; end//13
     4'b1110:begin max_add_show1 = 8'b00000110; max_add_show2 = 8'b01100110; end//14
     4'b1111:begin max_add_show1 = 8'b00000110; max_add_show2 = 8'b01101101; end//15
     default:begin max_add_show1 = 8'b00111111; max_add_show2 = 8'b00111111; end //00
     endcase
     end
     
     
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
    always @(scan_cnt,seg_en)
           begin
           if(~seg_en)
                DIG_r = 8'b0000_0000;
           else
            case ( scan_cnt)
                        4'b0000: DIG_r = 8'b0000_0000;//0
                        4'b0001: DIG_r = 8'b0000_0010;//1
                        4'b0010: DIG_r = 8'b0000_0100;//2
                        4'b0011: DIG_r = 8'b0010_0000;//3
                        4'b0100: DIG_r = 8'b0000_0001;//4
                        4'b0101: DIG_r = 8'b0001_0000;//5
                        4'b0110: DIG_r = 8'b0100_0000;//6
                        4'b0111: DIG_r = 8'b0000_0001;//7
                        4'b1000: DIG_r = 8'b0000_0010;//8
                        4'b1001: DIG_r = 8'b1000_0000;//9
                        4'b1010: DIG_r = 8'b0010_0000;//10
                        4'b1011: DIG_r = 8'b0000_0001;//11
                        4'b1100: DIG_r = 8'b0000_0100;//12
                        4'b1101: DIG_r = 8'b0000_0100;//13
                        4'b1110: DIG_r = 8'b0000_0010;//14
                        4'b1111: DIG_r = 8'b1000_0000;//15
                        default:DIG_r = 8'b0000_0000;
                    endcase
                end
    always @(posedge clk or negedge rst) //clkout or negedge rst
              if(!rst)begin
                        scan_cnt <=0;
                        end
              else begin
                  case({sw1,sw2,sw3})
                  3'b100:begin
                                          case({en1,en2,en3,en4})
                                          4'b0001: begin
                                              scan_cnt <= scan_cnt + 3;
                                              if(scan_cnt == 9) scan_cnt <= 0;
                                          end
                                          4'b0010:begin
                                                scan_cnt <=0;
                                               //scan_cnt <= scan_cnt + 4;
                                               //if(scan_cnt == 12) scan_cnt <= 0;
                                          end
                                         4'b0100: begin
                                              scan_cnt <= scan_cnt + 5;
                                              if(scan_cnt == 15) scan_cnt <= 0;
                                          end
                                          4'b1000:begin
                                               scan_cnt <= scan_cnt + 7;
                                               if(scan_cnt == 14) scan_cnt <= 0;
                                          end
                                          endcase
                                          end
                   default: begin
                        case({en1,en2,en3,en4})
                               4'b0001: begin
                                    scan_cnt <= scan_cnt + 3;
                                    if(scan_cnt == 9) scan_cnt <= 0;
                               end
                               4'b0010:begin
                                    scan_cnt <= 0;
                               end
                               4'b0100: begin
                                    scan_cnt <= scan_cnt + 5;
                                      if(scan_cnt == 15) scan_cnt <= 0;
                               end
                                     4'b1000:begin
                                    scan_cnt <= scan_cnt + 7;
                                       if(scan_cnt == 14) scan_cnt <= 0;
                                 end
                           endcase
                        end                   
                     endcase
                    end
    
    always @ (posedge clk2) begin
            if(select == 2'b11)
                select <= 2'b00;
           else
               select <= select + 1; end
                                  
    always @ (select)
         case(select)
              2'b00:{en1,en2,en3,en4} = 4'b0001;
             2'b01:{en1,en2,en3,en4} = 4'b0010;
             2'b10:{en1,en2,en3,en4} = 4'b0100;
              2'b11:{en1,en2,en3,en4} = 4'b1000;
       endcase
endmodule
