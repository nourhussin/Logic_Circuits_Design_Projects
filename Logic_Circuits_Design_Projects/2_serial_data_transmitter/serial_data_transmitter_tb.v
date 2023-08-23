`timescale 1ns/1ns
`include "serial_data_transmitter.v"
module serial_data_transmitter_tb ;
    reg[6:0] in_data;
    reg clk, start_transmit;
    wire serial_out;

    serial_data_transmitter UUT(
        .in_data(in_data),
        .clk(clk),
        .start_transmit(start_transmit),
        .serial_out(serial_out)
    );

    initial begin
        clk = 0;
        forever begin
            #1; clk = ~clk;
        end
    end

    initial begin
        $dumpfile("serial_data_transmitter_tb.vcd");
        $dumpvars(0,serial_data_transmitter_tb);

    // Do Nothing
    in_data = 7'b011011;
    start_transmit = 1'b0;
    #5;

    // Start
    start_transmit = 1'b1;
    #10;

    // Load data while transmitting (X)
    in_data = 7'b1111110;
    #4;
    start_transmit = 1'b0;
    #20;

    // Load data after transmitting
    start_transmit = 1'b1;
    in_data = 7'b0010011;
    #4; 
    start_transmit = 1'b0;
    #30;
    $finish;

    end
endmodule