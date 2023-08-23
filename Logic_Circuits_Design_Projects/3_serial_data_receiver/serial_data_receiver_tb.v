`timescale 1ns/1ns
`include "serial_data_receiver.v"
module serial_data_receiver_tb;
    reg in_data, clk;
    wire error,data_valid;
    wire[6:0] out_data;

    serial_data_receiver UUT(
        .in_data(in_data),
        .clk(clk),
        .error(error),
        .data_valid(data_valid),
        .out_data(out_data)
    );
    initial begin
        clk = 0;
        forever begin
            #1; clk = ~clk;
        end
    end
    initial begin
        $dumpfile("serial_data_receiver_tb.vcd");
        $dumpvars(0, serial_data_receiver_tb);
        // Sending valid data 1110000 (right parity check =1)
        in_data = 1'b0; #2;
        in_data = 1'b0; #2;
        in_data = 1'b1; #2;
        in_data = 1'b1; #2;
        in_data = 1'b1; #2;
        in_data = 1'b1; #2;
        in_data = 1'b0; #2;
        in_data = 1'b0; #2;
        in_data = 1'b0; #2;
        in_data = 1'b0; #2;
        in_data = 1'b1; #2; // parity check
        in_data = 1'b1; #2;
        // Sending unvalid data 1111000 (wrong parity check =1)
        in_data = 1'b0; #2;
        in_data = 1'b0; #2;
        in_data = 1'b1; #2;
        in_data = 1'b1; #2;
        in_data = 1'b1; #2;
        in_data = 1'b1; #2;
        in_data = 1'b1; #2;
        in_data = 1'b0; #2;
        in_data = 1'b0; #2;
        in_data = 1'b0; #2;
        in_data = 1'b1; #2; // parity check
        in_data = 1'b1; #2;
        // Sending unvalid data 1111000 (right parity check =0)
        in_data = 1'b0; #2;
        in_data = 1'b0; #2;
        in_data = 1'b1; #2;
        in_data = 1'b1; #2;
        in_data = 1'b1; #2;
        in_data = 1'b1; #2;
        in_data = 1'b1; #2;
        in_data = 1'b0; #2;
        in_data = 1'b0; #2;
        in_data = 1'b0; #2;
        in_data = 1'b0; #2; // parity check
        in_data = 1'b0; #2; // stop bit is zero
        // Sending valid data 1000001 (right parity check =0)
        in_data = 1'b0; #2;
        in_data = 1'b0; #2;
        in_data = 1'b1; #2;
        in_data = 1'b1; #2;
        in_data = 1'b0; #2;
        in_data = 1'b0; #2;
        in_data = 1'b0; #2;
        in_data = 1'b0; #2;
        in_data = 1'b0; #2;
        in_data = 1'b1; #2;
        in_data = 1'b0; #2; // parity check
        in_data = 1'b1; #2; #10;
        $finish ;
    end
endmodule