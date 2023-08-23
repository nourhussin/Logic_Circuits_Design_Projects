`timescale 100ns/ 100ns
`include "digital_square_VCO.v"
module digital_square_VCO_tb;
    reg clk, range;
    reg[2:0] control_frequency;
    wire square_wave;

    digital_square_VCO UUT(
        .clk(clk),
        .range(range),
        .control_frequency(control_frequency),
        .square_wave(square_wave)
    );

    initial begin
        clk = 0;
        forever begin
            #5; clk = ~clk;
        end
    end

    initial begin
        $dumpfile("digital_square_VCO_tb.vcd");
        $dumpvars(0, digital_square_VCO_tb);
        // Frequency = 100 kHz
        range = 1'b0;
        control_frequency = 3'b000;
        #100000;
        // Frequency = 500 kHz
        control_frequency = 3'b100;
        #100000;
        // Frequency = 200 Hz
        control_frequency = 3'b001;
        range = 1'b1;
        #100000000;
        $finish;
    end
endmodule