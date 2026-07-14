`timescale 1ns / 1ps

module my_sim();
        logic clk;
        logic reset_n;
        logic led;
        logic rx;
        logic rx_done_tick;
        logic [7:0] dout;
        
        Top_Module uut (.clk(clk), .reset_n(reset_n), .led(led), .rx(rx), .rx_done_tick(rx_done_tick), .dout(dout));
        
        initial
        begin
            clk = 0;
            reset_n = 1;
            rx = 1;
        end
        
        always 
            begin
                #5
                clk = ~clk;
            end
            
        initial begin
        // 1. Assert reset immediately at time 0
        reset_n = 0; 
        
        // 2. Hold reset low for 2 clock cycles (20ns) to let hardware stabilize
        #20; 
        
        // 3. De-assert reset to let the counter start running
        reset_n = 1;
        
        // 4. (Optional) Stop simulation after a set time so it doesn't run forever
         #3255; 
         rx = 0; #52080;    // start bit

         rx = 1; #104160;
         rx = 0; #104160;
         rx = 1; #104160;
         rx = 0; #104160;
         
         rx = 1; #104160;
         rx = 0; #104160;
         rx = 1; #104160;
         rx = 0; #104160;
         
         rx = 1; #104160;   // stop bit 
         rx = 1; #104160;   // idle after stop bit 
         
         //////////////////////////////////////////////////////////////////
         rx = 0; #52080;    // start bit

         rx = 1; #104160;
         rx = 1; #104160;
         rx = 1; #104160;
         rx = 1; #104160;
         
         rx = 1; #104160;
         rx = 0; #104160;
         rx = 1; #104160;
         rx = 0; #104160;
         
         rx = 1; #104160;   // stop bit 
         rx = 1; #104160;   // idle after stop bit 
         
         $finish;
    end
    
endmodule
