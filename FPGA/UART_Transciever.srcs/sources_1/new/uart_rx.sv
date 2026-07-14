
module uart_rx #(
        parameter   dataBits = 8,           // change per requirements
                    stopBitTick = 16        // change per sampling rate
        )
    (
        input clk,      // clock crystal
        input reset_n,  // external reset
        input rx,       // from the source
        input s_tick,   // from the baud generator
        output logic rx_done_tick,    // signal that this module completed and other module can extract data
        output [7:0] dout       // extract dout 
    );
    
    // the finite state machine states
    typedef enum {idle, start, data, stop} state_type;
    
    // signal declaration
    state_type state_now, state_next;
    reg [3:0] s_reg, s_next;
    reg [2:0] n_reg, n_next;
    reg [7:0] b_reg, b_next;
    
    // register for value of dout
    reg [7:0] dout_reg = 8'd0;
    
    always_ff @ (posedge clk)
    begin
        if(!reset_n) begin 
            state_now <= idle;
            s_reg <= 0;
            n_reg <= 0;
            b_reg <= 0;
        end
        else
            begin
                state_now <= state_next;
                s_reg <= s_next;
                n_reg <= n_next;
                b_reg <= b_next;
            end
    end
    
    //
    always_comb
    begin
        state_next = state_now;
        s_next = s_reg;
        n_next = n_reg;
        b_next = b_reg;
        case(state_now)
            idle:   
                begin               // if rx is 0 (start condition), we proceed to the next state
                    rx_done_tick = 1'b0;  
                    if(~rx)
                    begin 
                        state_next = start;
                        s_next = 0;
                    end
                end
            start:
                begin   // if s_ticks are received, we process to count to 7 (middle point for oversampling rate of 16)
//                    s_next = 0;     // reset    
//                    n_next = 0;     // reset
//                    b_next = 8'b0000_0000; // reset
                    if(s_tick == 1)
                        begin 
                            if(s_reg == (stopBitTick/2) - 1)
                                begin
                                    state_next = data;
                                    s_next = 0;
                                    n_next = 0; 
                                end
                            else
                                s_next = s_reg + 'd1;
                        end
                end
            data:
                begin 
                    if(s_tick == 1)
                        begin 
                            if(s_reg == stopBitTick - 1)
                                begin
                                    s_next = 0;
                                    b_next = {rx, b_reg[7:1]};
                                    if(n_reg == (dataBits-1)) // 8-bit data
                                        state_next = stop;
                                    else
                                        n_next = n_reg + 'd1;                    
                                end
                            else
                                s_next = s_reg + 'd1;
                        end
                end
            stop:
                begin
                    if(s_tick == 1)
                        begin 
                            if(s_reg == (stopBitTick - 1)) //15       
                                begin
                                    state_next = idle;
                                    rx_done_tick = 1'b1;
                                    dout_reg = b_reg;                  
                                end
                            else
                                s_next = s_reg + 'd1;
                        end
                end

        endcase
    end
    
    assign dout = dout_reg; //(rx_done_tick == 1) ? b_reg : 'bZ;
    
endmodule
