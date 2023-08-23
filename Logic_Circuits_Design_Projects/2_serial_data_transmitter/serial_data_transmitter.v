module serial_data_transmitter(
    input[6:0] in_data,
    input start_transmit,clk,
    output serial_out
);
    reg[9:0] transmitter_reg;
    assign serial_out = transmitter_reg[9];
    always @(posedge clk) begin
        if(start_transmit && (transmitter_reg == 0))
            transmitter_reg <= {1'b1, in_data, ^in_data, 1'b1};
        else if (|transmitter_reg)
            transmitter_reg <= transmitter_reg << 1;
        else
            transmitter_reg <= 10'd0;
    end
endmodule