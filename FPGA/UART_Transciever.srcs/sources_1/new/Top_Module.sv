
module Top_Module(
        input clk,
        input reset_n,
        input rx,
        output rx_done_tick,
        output [7:0] dout, 
        output led
    );
    
    wire tick;
    
    baud_rate_generator my_baud_rate_generator (.clk(clk), .reset_n(reset_n), .tick(tick));
    uart_rx my_uart_rx(.clk(clk), .reset_n(reset_n), .rx(rx), .s_tick(tick), .rx_done_tick(rx_done_tick), .dout(dout));
    
    assign led = tick; // show up on simulation
    
endmodule
