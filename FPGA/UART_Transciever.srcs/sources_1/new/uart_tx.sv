
module uart_tx #(
        parameter   dataBits = 8, 
                    stopBitTick = 16
        )
    (
           input clk,                       // clock crystal 
           input reset_n,                   // external crystal
           input s_tick,       
           input [0:7] din,
           output logic tx_done_tick,       // signal that this module has completed and other module can extract data
           output tx
    );
    
    // the finite state machine states
    typedef enum {idle, start, data, stop} state_type;
    
    state_type state_now, state_next; 
    reg [7:0] s_next, s_reg;
    reg [7:0] b_next, b_reg;
    reg tx_reg, tx_next;                             // register for transmit lane           
    reg [7:0] dataIn_reg = 8'b0100_0110;             
    
    always_ff @ (posedge clk)
    begin
        if(!reset_n)
            begin
                s_reg   <= 0;
                b_reg   <= 0;
                tx_reg  <= 0;
                state_now <= idle;
            end
        else
            begin
                state_now <= state_next;
                s_reg   <= s_next;
                b_reg   <= b_next;
                tx_reg  <= tx_next;
            end
    end
    
    always_comb
    begin
        state_next = state_now;
        s_next = s_reg;
        tx_next = tx_reg;
        b_next = b_reg;
        case(state_now)
            // not transmitting, tx is high, tx pulls low for 7 
            idle:
                begin
                    //dataIn_reg = din;
                    tx_done_tick = 0;
                    tx_next = 0;
                    s_next = 0;
                    b_next = 0;
                    state_next = start;
                    dataIn_reg = din;
                end
            start:
                begin
                    if(s_tick == 1)
                    begin
                        if(s_reg == stopBitTick - 1)
                            begin
                                s_next = 0;
                                state_next = data;
                                tx_next = dataIn_reg[7];
                                tx_done_tick = 1;
                            end
                        else
                            begin
                                s_next = s_reg + 1;
                            end
                    end
                end
            data:
                begin 
                    if(s_tick == 1)
                        begin 
                            if(s_reg == stopBitTick - 1)
                                begin
                                    s_next = 0;
                                   
                                    if(b_reg == (dataBits-1)) // 8-bit data
                                        begin
                                            state_next = stop;
                                            tx_next = 1;
                                        end
                                    else
                                        begin
                                            tx_next = dataIn_reg[6-b_next];
                                            b_next = b_reg + 'd1; 
                                        end                   
                                end
                            else
                                s_next = s_reg + 'd1;
                        end
                end
            stop:
                begin
                    if(s_tick == 1)
                    begin
                        if(s_reg == stopBitTick - 1)
                            begin
                                s_next = 0;
                                state_next = idle;   
                                tx_next = 1;           
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
