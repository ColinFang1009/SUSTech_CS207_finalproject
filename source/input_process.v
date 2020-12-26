module input_process(
    input clk, rst, //clock, reset
    input[3:0] row, //row input for keyboard
    input[4:0] bt,//five buttons
    output[3:0] col, //column output for keyboard
    output[4:0] bt_press,//button pressing after debouncing
    output[4:0] bt_edge,//edge for button pressing
    output[15:0] key_press, //key pressing after debouncing
    output[15:0] key_edge //edge for key pressing
);
button_edge bt_0(clk, bt[0], bt_press[0], bt_edge[0]);
button_edge bt_1(clk, bt[1], bt_press[1], bt_edge[1]);
button_edge bt_2(clk, bt[2], bt_press[2], bt_edge[2]);
button_edge bt_3(clk, bt[3], bt_press[3], bt_edge[3]);
button_edge bt_4(clk, bt[4], bt_press[4], bt_edge[4]);
wire[15:0] key;
key_scanner key_scanner_0(clk, rst, row, col, key);

button_edge key_0(clk, key[0], key_press[0], key_edge[0]);
button_edge key_1(clk, key[1], key_press[1], key_edge[1]);
button_edge key_2(clk, key[2], key_press[2], key_edge[2]);
button_edge key_3(clk, key[3], key_press[3], key_edge[3]);
button_edge key_4(clk, key[4], key_press[4], key_edge[4]);
button_edge key_5(clk, key[5], key_press[5], key_edge[5]);
button_edge key_6(clk, key[6], key_press[6], key_edge[6]);
button_edge key_7(clk, key[7], key_press[7], key_edge[7]);
button_edge key_8(clk, key[8], key_press[8], key_edge[8]);
button_edge key_9(clk, key[9], key_press[9], key_edge[9]);
button_edge key_10(clk, key[10], key_press[10], key_edge[10]);
button_edge key_11(clk, key[11], key_press[11], key_edge[11]);
button_edge key_12(clk, key[12], key_press[12], key_edge[12]);
button_edge key_13(clk, key[13], key_press[13], key_edge[13]);
button_edge key_14(clk, key[14], key_press[14], key_edge[14]);
button_edge key_15(clk, key[15], key_press[15], key_edge[15]);

endmodule
