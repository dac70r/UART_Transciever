
module Top_Module(
        input clk,
        input reset_n,
        input rx,
        input [7:0] din,
        output rx_done_tick,
        output tx_done_tick,
        output [7:0] dout, 
        output led,
        output tx
    );
    
    wire tick;
    
    baud_rate_generator my_baud_rate_generator (.clk(clk), .reset_n(reset_n), .tick(tick));
    uart_rx my_uart_rx(.clk(clk), .reset_n(reset_n), .rx(rx), .s_tick(tick), .rx_done_tick(rx_done_tick), .dout(dout));
    uart_tx my_uart_tx
    (
           .clk(clk),               // clock crystal 
           .reset_n(reset_n),       // external crystal
           .s_tick(tick),       
           .din(din),
           .tx_done_tick,           // signal that this module has completed and other module can extract data
           .tx(tx)
    );
    
    assign led = tick; // show up on simulation
    
endmodule
