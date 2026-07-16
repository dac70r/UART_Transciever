
module uart_tx #(
        parameter   dataBits = 8, 
                    stopBitTick = 16
        )
    (
           input clk,                       // clock crystal 
           input reset_n,                   // external crystal
           input s_tick,       
           input [7:0] din,
           output logic tx_done_tick,       // signal that this module has completed and other module can extract data
           output tx
    );
    
    // the finite state machine states
    typedef enum {idle, start, data, stop} state_type;
    
    state_type state_now, state_next; 
    reg [7:0] s_next, s_reg;
    reg [7:0] b_next, b_reg;
    reg tx_reg;                     // register for transmit lane
    reg [7:0] dataIn_reg;
    
    always_ff @ (posedge clk)
    begin
        if(!reset_n)
            begin
                dataIn_reg <= 8'b0; 
                s_reg <= 0;
                b_reg <= 0;
            end
        else
            begin
                state_now <= state_next;
                s_reg <= s_next;
                b_reg <= b_next;
            end
    end
    
    always_comb
    begin
        case(state_now)
            // not transmitting, tx is high, tx pulls low for 7 
            idle:
                begin
                    tx_done_tick = 0;
                    tx_reg = 0;
                    s_next = 0;
                    b_next = 0;
                    state_next = start;
                end
            start:
                begin
                    if(s_tick == 1)
                    begin
                        if(s_reg == stopBitTick)
                            begin
                                s_next = 0;
                                state_next = data;
                                //tx_done_tick = 1;
                            end
                        else
                            begin
                                s_next = s_reg + 1;
                            end
                    end
                end
            data:
                begin
                    if(b_reg == dataBits)
                        begin
                            s_next = 0;
                            b_next = 0;
                            state_next = stop;
                        end
                    else begin
                        if(s_tick == 1)
                            begin
                                if(s_reg == stopBitTick)
                                    begin
                                        s_next = 0;
                                        b_next = b_reg + 1;
                                    end
                                else
                                    begin
                                        s_next = s_reg + 1;
                                    end
                            end
                    end
                end
            stop:
                begin
                    if(s_tick == 1)
                    begin
                        if(s_reg == stopBitTick)
                            begin
                                s_next = 0;
                                state_next = idle;               
                            end
                        else
                            begin
                                s_next = s_reg + 1;
                            end
                    end
                end
        endcase
    end
    
    assign tx = tx_reg;
    

      
endmodule
