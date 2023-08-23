module pulse_width_modulation(
    input clk,
    input[3:0] duty_cycle,
    output reg out_wave
);
    reg [3:0] counter = 4'b0000;

    always @(duty_cycle)
        counter = 4'b0000;
    always @(posedge clk)
    begin
        if(duty_cycle == 0)
            out_wave <= 1'b1;
        else if(counter < duty_cycle)begin
            out_wave <= 1'b1;
            counter = counter + 1;
        end
        else begin
            out_wave <= 1'b0;
            counter = counter + 1;
        end
    end


endmodule
