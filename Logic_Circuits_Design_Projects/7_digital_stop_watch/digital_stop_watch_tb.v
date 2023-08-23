`timescale 1ns/1ns
`include "digital_stop_watch.v"
module digital_stop_watch_tb;
    reg clk, start_stopn;
    reg[5:0] minutes,seconds;
    wire finish;
    wire[5:0] out_minutes,  out_seconds;

    digital_stop_watch UUT(
        .clk(clk),
        .start_stopn(start_stopn),
        .minutes(minutes),
        .seconds(seconds),
        .finish(finish),
        .out_minutes(out_minutes),
        .out_seconds(out_seconds)
    );

    initial begin
        clk = 0;
        forever begin
            #5; clk = ~clk;
        end
    end

    initial begin
        $dumpfile("digital_stop_watch_tb.vcd");
        $dumpvars(0, digital_stop_watch_tb);
        // Check default values
        minutes = 6'd1; seconds = 6'd24;
        start_stopn = 1'b0;
        #20;
        // Start 
        start_stopn = 1'b1;
        #100;
        // Stop while working
        start_stopn = 1'b0;
        #50;
        // Countinue
        start_stopn = 1'b1;
        #800;
        // Enter unvalid minutes
        minutes = 6'b111111;
        #50;
        $finish;
    end
endmodule