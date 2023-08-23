`timescale 1ns/1ns
`include "pulse_width_modulation.v"
module pulse_width_modulation_tb;
    reg clk;
    reg[3:0] duty_cycle;
    wire out_wave;

    pulse_width_modulation UUT(
        .clk(clk),
        .duty_cycle(duty_cycle),
        .out_wave(out_wave)
    );

    initial begin
        clk = 1;
        forever begin
            #5; clk = ~clk;
        end
    end

    initial begin
        $dumpfile("pulse_width_modulation_tb.vcd");
        $dumpvars(0, pulse_width_modulation_tb);

        // Min duty cycle
        duty_cycle = 4'h1;
        #1000;
        // Half duty cycle
        duty_cycle = 4'h8;
        #1000;
        // 100% duty cycle
        duty_cycle = 4'h0;
        #1000;

        $finish;
    end
endmodule