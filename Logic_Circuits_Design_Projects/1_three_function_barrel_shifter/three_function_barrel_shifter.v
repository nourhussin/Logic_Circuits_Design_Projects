module three_function_barrel_shifter(
    input[7:0] in_data,
    input[1:0] operation,
    input[2:0] number_of_positions,
    input direction,
    input clk,
    output reg signed[7:0] out_data
);
/* Input Control Signals
    ---------------------------------------
    direction == 0 ---> left
    direction == 1 ---> right
    ---------------------------------------
    operation == 0 ---> store (default)
    operation == 1 ---> rotate
    operation == 2 ---> logic shift
    operation == 3 ---> arithmetic shift
    ---------------------------------------
*/
    always @(posedge clk)begin
        case(operation)
        2'b00:
            out_data <= in_data;

        2'b01:
            if(direction)
                out_data <= in_data >> number_of_positions | in_data << (8-number_of_positions);
            else
                out_data <= in_data << number_of_positions | in_data >> (8-number_of_positions);
        
        2'b10:
            if(direction)
                out_data <= in_data >> number_of_positions;
            else
                out_data <= in_data << number_of_positions;
        
        2'b11:
            if(direction)
                out_data <= in_data >>> number_of_positions;
            else
                out_data <= in_data << number_of_positions;

        endcase
    end
endmodule