module super_register_8bits (
    input[7:0] in_data,
    input[2:0] operation,
    input clk, in_shift_right, in_shift_left,
    output reg[7:0] out_data,
    output flag // is 1 when all bits of out_data is zeros or ones
);
    localparam load = 3'h0;
    localparam shift_right = 3'h1;
    localparam shift_left  = 3'h2;
    localparam rotate_right = 3'h3;
    localparam rotate_left  = 3'h4;
    localparam store = 3'h5;
    localparam count_up = 3'h6;
    localparam count_down = 3'h7;

    always @(posedge clk) begin

        case(operation)
        load: 
            out_data <= in_data;

        store: 
            out_data <= out_data;
        
        count_up: 
            out_data <= out_data +1;
        
        count_down: 
            out_data <= out_data -1;
        
        rotate_left:
            out_data <= {out_data[6:0], out_data[7]};

        rotate_right:
            out_data <= {out_data[0], out_data[7:1]};
        
        shift_left:
            out_data <= {out_data[6:0], in_shift_left};
        
        shift_right:
            out_data <= {in_shift_right, out_data[7:1]};

        endcase
    end

    assign flag = (out_data==0 || out_data ==8'hff)? 1'b1: 1'b0;
endmodule