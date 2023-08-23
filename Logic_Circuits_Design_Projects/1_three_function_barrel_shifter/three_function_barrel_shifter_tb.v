`timescale 1ns/1ns
`include "three_function_barrel_shifter.v"

module three_function_barrel_shifter_tb;
    reg[7:0] in_data;
    reg[1:0] operation;
    reg[2:0] number_of_positions;
    reg direction;
    reg clk;
    wire[7:0] out_data;

    three_function_barrel_shifter UUT(
        .in_data(in_data),
        .operation(operation),
        .number_of_positions(number_of_positions),
        .direction(direction),
        .clk(clk),
        .out_data(out_data)
    );

    initial begin
        clk = 0;
        forever begin
            #5; clk = ~clk;
        end
    end
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
    initial begin
        $dumpfile("three_function_barrel_shifter_tb.vcd");
        $dumpvars(0, three_function_barrel_shifter_tb); 

        // Case 1 Expected Output 1011 0110 (B6)
        in_data = 8'b11011010;
        operation = 2'd1;
        number_of_positions = 3'd2;
        direction = 1'b1;
        #20;
        
        // Case 2 Expected Output 1111 0110 (F6)
        operation = 2'd3;
        number_of_positions = 3'd2;
        direction = 1'b1;
        #20;

        // Case 3 Expected Output 1101 0110 (D6)
        operation = 2'd1;
        number_of_positions = 3'd3;
        direction = 1'b0;
        #20;

        // Case 4 Expected Output 0110 1000 (68)
        operation = 2'd2;
        number_of_positions = 3'd2;
        direction = 1'b0;
        #20;

        // Case 5 Expected Output 1111 1111 (FF)
        in_data = 8'hFF;
        operation = 2'd1;
        number_of_positions = 3'd2;
        direction = 1'b1;
        #20;

        // Case 6 Expected Ouput 1010 1010 (AA)
        in_data = 8'hAA;
        operation = 2'd0;
        #20;
        $finish;
    
        
    end
endmodule