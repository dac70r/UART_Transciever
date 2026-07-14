
module baud_rate_generator(
        input       clk,
        input       reset_n,
        output      tick
    );
    
    reg [31:0]  counter = 32'd0;
    reg         ticker = 0;
    
    always_ff @ (posedge clk)
    begin
        if (!reset_n) begin counter <= 0; ticker <= 0; end
        else
            begin
                if(counter == 651-1)
                    begin
                        counter <= 0;
                        ticker <= 1;
                    end
                else
                    begin
                        ticker <= 0;
                        counter <= counter + 1;
                    end
            end
    end
    
    assign tick = ticker;
    
endmodule
