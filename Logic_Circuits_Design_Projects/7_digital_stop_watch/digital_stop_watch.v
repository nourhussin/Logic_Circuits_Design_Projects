module digital_stop_watch (
    input clk, start_stopn,
    input[5:0] minutes, seconds,
    output reg[5:0] out_minutes, out_seconds,
    output finish
);
    assign finish = (out_minutes==0 && out_seconds==0)? 1'b1 : 1'b0;
    always @(posedge clk && minutes<60 && seconds<60)
    begin
            // Load 
            out_minutes <= minutes;
            out_seconds <= seconds;

        if(start_stopn &&(out_minutes>0 || out_seconds>0))
        begin
            if (out_seconds==0)
            begin
                out_seconds <= 6'h3B;
                out_minutes <= out_minutes -1;
            end
            else
            begin
                out_seconds <= out_seconds -1;
                out_minutes <= out_minutes;
            end
        end

        else if(~start_stopn || (out_minutes==0 && out_seconds==0))
        begin
            out_minutes <= out_minutes;
            out_seconds <= out_seconds;
        end

    end
endmodule