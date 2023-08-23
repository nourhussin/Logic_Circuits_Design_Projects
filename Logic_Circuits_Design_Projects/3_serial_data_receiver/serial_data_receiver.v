module serial_data_receiver(
    input in_data, clk,
    output reg error, data_valid,
    output reg [6:0] out_data
);
    reg[9:0] receiver_reg;
    integer position = 8;
    always @(posedge clk) begin
    
        if(in_data && receiver_reg==0)
            receiver_reg[9] <=1'b1;

        else if(receiver_reg[9] && position > -1) 
        begin
            receiver_reg[position] <= in_data;
            position = position -1;
            data_valid <= 1'b0;
        end

        else if(position <= -1) 
        begin
            if(receiver_reg[0] && (receiver_reg[1] == ^receiver_reg[8:2]))
            begin
                out_data <= receiver_reg[8:2];
                error <= 1'b0;
                data_valid <= 1'b1;
            end
            else 
            begin
                error <= 1'b1;
                data_valid <= 1'b0;
            end
            receiver_reg <= 10'd0;
            position = 8;
        end
        else 
        begin
            receiver_reg <= 10'd0;
            error <= 1'b0;
            data_valid <= 1'b0;
            out_data <= 7'd0;
        end
    end

endmodule