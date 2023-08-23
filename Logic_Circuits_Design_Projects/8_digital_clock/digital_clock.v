module digital_clock(
    input clk, adjust_clock,
    input[5:0]  in_minutes, in_seconds,
    input[3:0] in_hours,
    output reg[5:0]  minutes, seconds,
    output reg[3:0] hours
);

    always @(posedge clk && in_hours<12 && in_minutes<60 && in_seconds<60)
    begin
        if(adjust_clock)
        begin
            hours <= in_hours;
            minutes <= in_minutes;
            seconds <= in_seconds;
        end
        else
        begin
            if(seconds == 59)
            begin
                seconds <= 0;
                if(minutes == 59)
                begin
                    minutes <= 0;
                    if(hours == 12)
                        hours <= 0;
                    else
                        hours <= hours +1;
                end
                else
                    minutes <= minutes +1;
            end
            else
                seconds <= seconds +1;
        end
    end

endmodule