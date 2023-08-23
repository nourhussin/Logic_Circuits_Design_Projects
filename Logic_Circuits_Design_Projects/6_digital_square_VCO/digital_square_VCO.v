module digital_square_VCO(
    input clk, range,
    input[2:0] control_frequency,
    output reg square_wave
);
    /* When range is 0 ---> kHz
       when range is 1 --->  Hz
       -----------------------------------------------------
       control_frequency is from (100 , 200, 300,...,800)
    */
    integer unsigned counter, clk_min_counter;
    wire clk_max_range;
    assign clk_max_range = clk;
    reg clk_min_range;

    always @(posedge clk)
    begin
        if(clk_min_counter < 499)
        begin
            clk_min_counter = clk_min_counter + 1;
            clk_min_range = 1'b1;
        end
        else if(clk_min_counter < 999)
        begin
            clk_min_counter = clk_min_counter + 1;
            clk_min_range = 1'b0;
        end
        else
        begin
            clk_min_counter = 0;
            clk_min_range = 1'b1;
        end
    end
    
    always @(range,control_frequency)
    begin
        counter = 0;
    end

    always @(posedge clk_max_range && range==0)
    begin
        if(counter < (((control_frequency+1) *100)/2)-1)
        begin
            square_wave <= 1'b1;
            counter = counter + 1;
        end
        else if(counter < ((control_frequency+1) *100)-1)
        begin
            square_wave <= 1'b0;
            counter = counter + 1;
        end
        else 
        begin
            square_wave <= 1'b1;
            counter = 0;
        end
    end

    always @(posedge clk_min_range && range==1)
    begin
        if(counter < (((control_frequency+1) *100)/2)-1)
        begin
            square_wave <= 1'b1;
            counter = counter + 1;
        end
        else if(counter < ((control_frequency+1) *100)-1)
        begin
            square_wave <= 1'b0;
            counter = counter + 1;
        end
        else 
        begin
            square_wave <= 1'b1;
            counter = 0;
        end
    end

endmodule