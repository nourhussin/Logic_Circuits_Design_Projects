`timescale 1ns/1ns
`include "super_register_8bits.v"
module super_register_8bits_tb;
    reg[7:0] in_data;
    reg[2:0] operation;
    reg clk, in_shift_right, in_shift_left;
    wire[7:0] out_data;
    wire flag;

    localparam load = 3'h0;
    localparam shift_right = 3'h1;
    localparam shift_left  = 3'h2;
    localparam rotate_right = 3'h3;
    localparam rotate_left  = 3'h4;
    localparam store = 3'h5;
    localparam count_up = 3'h6;
    localparam count_down = 3'h7;

    super_register_8bits UUT(
        .in_data(in_data),
        .operation(operation),
        .clk(clk),
        .in_shift_left(in_shift_left),
        .in_shift_right(in_shift_right),
        .out_data(out_data),
        .flag(flag)
    );
    initial begin
        clk = 0;
        forever begin
            #5; clk = ~clk;
        end
    end
    initial begin
        $dumpfile("super_register_8bits_tb.vcd");
        $dumpvars(0, super_register_8bits_tb);
        
        // Check default
        in_data = 8'hA4;
        operation = store;
        in_shift_left = 1'b0;
        in_shift_right = 1'b0;
        #30;

        // Load 
        operation = load;
        #30;

        // Count up
        operation = count_up;
        #100;

        // Count down
        operation = count_down;
        #50; in_data = 8'h73;

        // Shift right
        operation = shift_right;
        #30; in_shift_right = 1'b1;
        #100;
        
        // Load new data
        operation = load;
        #40;

        // Shift left
        operation = shift_left;
        #60;

        // Rotate left
        operation = rotate_left;
        #50;
        $finish;
    end

endmodule