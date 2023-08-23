`timescale 100ms/100ms
`include "digital_clock.v"
module digital_clock_tb;
    reg clk,adjust_clock;
    reg[5:0]  in_minutes, in_seconds;
    reg[3:0] in_hours;
    wire[5:0]  minutes, seconds;
    wire[3:0] hours;

    digital_clock UUT(
        .clk(clk),
        .adjust_clock(adjust_clock),
        .in_hours(in_hours),
        .in_minutes(in_minutes),
        .in_seconds(in_seconds),
        .hours(hours),
        .minutes(minutes),
        .seconds(seconds)
    );

    initial begin
        clk = 0;
        forever begin
            #5; clk = ~clk;
        end
    end

    initial begin
        $dumpfile("digital_clock_tb.vcd");
        $dumpvars(0, digital_clock_tb);
        // Adjust clock
        in_hours = 4'h1; in_minutes= 6'h3B; in_seconds= 6'h00;
        adjust_clock = 1'b1;
        #20;
        // Start
        adjust_clock = 1'b0;
        #10000;
        $finish;
    end
endmodule