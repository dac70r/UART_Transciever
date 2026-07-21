// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue Jul 21 21:36:55 2026
// Host        : DennisE16 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file {C:/Users/Dennis
//               Wong/Documents/FPGA_Projects/UART_Transciever/FPGA/UART_Transciever.sim/sim_1/impl/timing/xsim/my_sim_time_impl.v}
// Design      : Top_Module
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ECO_CHECKSUM = "ed45c527" *) 
(* NotValidForBitStream *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
module Top_Module
   (clk,
    reset_n,
    rx,
    din,
    rx_done_tick,
    tx_done_tick,
    dout,
    led,
    tx);
  input clk;
  input reset_n;
  input rx;
  input [7:0]din;
  output rx_done_tick;
  output tx_done_tick;
  output [7:0]dout;
  output led;
  output tx;

  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [7:0]dout;
  wire [7:0]dout_OBUF;
  wire led;
  wire led_OBUF;
  wire lopt;
  wire my_uart_tx_n_2;
  wire reset_n;
  wire reset_n_IBUF;
  wire rx;
  wire rx_IBUF;
  wire rx_done_tick;
  wire rx_done_tick_OBUF;
  wire tx;
  wire tx_OBUF;
  wire tx_done_tick;
  wire tx_done_tick_OBUF;

initial begin
 $sdf_annotate("my_sim_time_impl.sdf",,,,"tool_control");
end
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  OBUF \dout_OBUF[0]_inst 
       (.I(dout_OBUF[0]),
        .O(dout[0]));
  OBUF \dout_OBUF[1]_inst 
       (.I(dout_OBUF[1]),
        .O(dout[1]));
  OBUF \dout_OBUF[2]_inst 
       (.I(dout_OBUF[2]),
        .O(dout[2]));
  OBUF \dout_OBUF[3]_inst 
       (.I(dout_OBUF[3]),
        .O(dout[3]));
  OBUF \dout_OBUF[4]_inst 
       (.I(dout_OBUF[4]),
        .O(dout[4]));
  OBUF \dout_OBUF[5]_inst 
       (.I(dout_OBUF[5]),
        .O(dout[5]));
  OBUF \dout_OBUF[6]_inst 
       (.I(dout_OBUF[6]),
        .O(dout[6]));
  OBUF \dout_OBUF[7]_inst 
       (.I(dout_OBUF[7]),
        .O(dout[7]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF led_OBUF_inst
       (.I(lopt),
        .O(led));
  baud_rate_generator my_baud_rate_generator
       (.clk_IBUF_BUFG(clk_IBUF_BUFG),
        .led_OBUF(led_OBUF),
        .lopt(lopt),
        .reset_n_IBUF(reset_n_IBUF));
  uart_rx my_uart_rx
       (.Q(dout_OBUF),
        .SR(my_uart_tx_n_2),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .led_OBUF(led_OBUF),
        .reset_n_IBUF(reset_n_IBUF),
        .rx_IBUF(rx_IBUF),
        .rx_done_tick_OBUF(rx_done_tick_OBUF));
  uart_tx my_uart_tx
       (.SR(my_uart_tx_n_2),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .led_OBUF(led_OBUF),
        .reset_n_IBUF(reset_n_IBUF),
        .tx_OBUF(tx_OBUF),
        .tx_done_tick_OBUF(tx_done_tick_OBUF));
  IBUF reset_n_IBUF_inst
       (.I(reset_n),
        .O(reset_n_IBUF));
  IBUF rx_IBUF_inst
       (.I(rx),
        .O(rx_IBUF));
  OBUF rx_done_tick_OBUF_inst
       (.I(rx_done_tick_OBUF),
        .O(rx_done_tick));
  OBUF tx_OBUF_inst
       (.I(tx_OBUF),
        .O(tx));
  OBUF tx_done_tick_OBUF_inst
       (.I(tx_done_tick_OBUF),
        .O(tx_done_tick));
endmodule

module baud_rate_generator
   (led_OBUF,
    clk_IBUF_BUFG,
    reset_n_IBUF,
    lopt);
  output led_OBUF;
  input clk_IBUF_BUFG;
  input reset_n_IBUF;
  output lopt;

  wire clk_IBUF_BUFG;
  wire \counter[0]_i_1_n_0 ;
  wire \counter[0]_i_3_n_0 ;
  wire \counter[0]_i_4_n_0 ;
  wire [9:0]counter_reg;
  wire \counter_reg[0]_i_2_n_0 ;
  wire \counter_reg[0]_i_2_n_4 ;
  wire \counter_reg[0]_i_2_n_5 ;
  wire \counter_reg[0]_i_2_n_6 ;
  wire \counter_reg[0]_i_2_n_7 ;
  wire \counter_reg[4]_i_1_n_0 ;
  wire \counter_reg[4]_i_1_n_4 ;
  wire \counter_reg[4]_i_1_n_5 ;
  wire \counter_reg[4]_i_1_n_6 ;
  wire \counter_reg[4]_i_1_n_7 ;
  wire \counter_reg[8]_i_1_n_6 ;
  wire \counter_reg[8]_i_1_n_7 ;
  wire led_OBUF;
  wire reset_n_IBUF;
  wire ticker_i_1_n_0;
  wire ticker_reg_lopt_replica_1;
  wire [2:0]\NLW_counter_reg[0]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_counter_reg[4]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_counter_reg[8]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_counter_reg[8]_i_1_O_UNCONNECTED ;

  assign lopt = ticker_reg_lopt_replica_1;
  LUT6 #(
    .INIT(64'h00200000FFFFFFFF)) 
    \counter[0]_i_1 
       (.I0(counter_reg[9]),
        .I1(counter_reg[6]),
        .I2(\counter[0]_i_3_n_0 ),
        .I3(counter_reg[8]),
        .I4(counter_reg[7]),
        .I5(reset_n_IBUF),
        .O(\counter[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000040)) 
    \counter[0]_i_3 
       (.I0(counter_reg[2]),
        .I1(counter_reg[1]),
        .I2(counter_reg[3]),
        .I3(counter_reg[4]),
        .I4(counter_reg[0]),
        .I5(counter_reg[5]),
        .O(\counter[0]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_4 
       (.I0(counter_reg[0]),
        .O(\counter[0]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_7 ),
        .Q(counter_reg[0]),
        .R(\counter[0]_i_1_n_0 ));
  CARRY4 \counter_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\counter_reg[0]_i_2_n_0 ,\NLW_counter_reg[0]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\counter_reg[0]_i_2_n_4 ,\counter_reg[0]_i_2_n_5 ,\counter_reg[0]_i_2_n_6 ,\counter_reg[0]_i_2_n_7 }),
        .S({counter_reg[3:1],\counter[0]_i_4_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_6 ),
        .Q(counter_reg[1]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_5 ),
        .Q(counter_reg[2]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_4 ),
        .Q(counter_reg[3]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_7 ),
        .Q(counter_reg[4]),
        .R(\counter[0]_i_1_n_0 ));
  CARRY4 \counter_reg[4]_i_1 
       (.CI(\counter_reg[0]_i_2_n_0 ),
        .CO({\counter_reg[4]_i_1_n_0 ,\NLW_counter_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[4]_i_1_n_4 ,\counter_reg[4]_i_1_n_5 ,\counter_reg[4]_i_1_n_6 ,\counter_reg[4]_i_1_n_7 }),
        .S(counter_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_6 ),
        .Q(counter_reg[5]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_5 ),
        .Q(counter_reg[6]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_4 ),
        .Q(counter_reg[7]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_7 ),
        .Q(counter_reg[8]),
        .R(\counter[0]_i_1_n_0 ));
  CARRY4 \counter_reg[8]_i_1 
       (.CI(\counter_reg[4]_i_1_n_0 ),
        .CO(\NLW_counter_reg[8]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_counter_reg[8]_i_1_O_UNCONNECTED [3:2],\counter_reg[8]_i_1_n_6 ,\counter_reg[8]_i_1_n_7 }),
        .S({1'b0,1'b0,counter_reg[9:8]}));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_6 ),
        .Q(counter_reg[9]),
        .R(\counter[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0020000000000000)) 
    ticker_i_1
       (.I0(counter_reg[9]),
        .I1(counter_reg[6]),
        .I2(\counter[0]_i_3_n_0 ),
        .I3(counter_reg[8]),
        .I4(counter_reg[7]),
        .I5(reset_n_IBUF),
        .O(ticker_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ticker_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(ticker_i_1_n_0),
        .Q(led_OBUF),
        .R(1'b0));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    ticker_reg_lopt_replica
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(ticker_i_1_n_0),
        .Q(ticker_reg_lopt_replica_1),
        .R(1'b0));
endmodule

module uart_rx
   (rx_done_tick_OBUF,
    Q,
    rx_IBUF,
    led_OBUF,
    reset_n_IBUF,
    clk_IBUF_BUFG,
    SR);
  output rx_done_tick_OBUF;
  output [7:0]Q;
  input rx_IBUF;
  input led_OBUF;
  input reset_n_IBUF;
  input clk_IBUF_BUFG;
  input [0:0]SR;

  wire \FSM_sequential_state_now[0]_i_1_n_0 ;
  wire \FSM_sequential_state_now[1]_i_1_n_0 ;
  wire \FSM_sequential_state_now[1]_i_2_n_0 ;
  wire \FSM_sequential_state_now[1]_i_3_n_0 ;
  wire \FSM_sequential_state_now[1]_i_4_n_0 ;
  wire \FSM_sequential_state_now[1]_i_5_n_0 ;
  wire [7:0]Q;
  wire [0:0]SR;
  wire b_next;
  wire [7:0]b_reg;
  wire clk_IBUF_BUFG;
  wire dout_reg;
  wire led_OBUF;
  wire n_next;
  wire [2:0]n_reg;
  wire \n_reg[0]_i_1_n_0 ;
  wire \n_reg[1]_i_1_n_0 ;
  wire \n_reg[2]_i_1_n_0 ;
  wire reset_n_IBUF;
  wire rx_IBUF;
  wire rx_done_tick_OBUF;
  wire rx_done_tick_reg_i_1_n_0;
  wire rx_done_tick_reg_i_2_n_0;
  wire rx_done_tick_reg_i_3_n_0;
  wire s_next;
  wire [3:0]s_reg;
  wire \s_reg[0]_i_1_n_0 ;
  wire \s_reg[1]_i_1_n_0 ;
  wire \s_reg[2]_i_1_n_0 ;
  wire \s_reg[3]_i_2_n_0 ;
  wire \s_reg[3]_i_3_n_0 ;
  wire [1:0]state_now;

  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \FSM_sequential_state_now[0]_i_1 
       (.I0(state_now[0]),
        .I1(\FSM_sequential_state_now[1]_i_2_n_0 ),
        .I2(reset_n_IBUF),
        .O(\FSM_sequential_state_now[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h6A00)) 
    \FSM_sequential_state_now[1]_i_1 
       (.I0(state_now[1]),
        .I1(\FSM_sequential_state_now[1]_i_2_n_0 ),
        .I2(state_now[0]),
        .I3(reset_n_IBUF),
        .O(\FSM_sequential_state_now[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF11F111F111F1)) 
    \FSM_sequential_state_now[1]_i_2 
       (.I0(rx_IBUF),
        .I1(\FSM_sequential_state_now[1]_i_3_n_0 ),
        .I2(\FSM_sequential_state_now[1]_i_4_n_0 ),
        .I3(\s_reg[3]_i_3_n_0 ),
        .I4(\FSM_sequential_state_now[1]_i_5_n_0 ),
        .I5(rx_done_tick_reg_i_3_n_0),
        .O(\FSM_sequential_state_now[1]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \FSM_sequential_state_now[1]_i_3 
       (.I0(state_now[0]),
        .I1(state_now[1]),
        .O(\FSM_sequential_state_now[1]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0400)) 
    \FSM_sequential_state_now[1]_i_4 
       (.I0(s_reg[3]),
        .I1(led_OBUF),
        .I2(state_now[1]),
        .I3(state_now[0]),
        .O(\FSM_sequential_state_now[1]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hEAAA)) 
    \FSM_sequential_state_now[1]_i_5 
       (.I0(state_now[0]),
        .I1(n_reg[2]),
        .I2(n_reg[0]),
        .I3(n_reg[1]),
        .O(\FSM_sequential_state_now[1]_i_5_n_0 ));
  (* FSM_ENCODED_STATES = "idle:00,start:01,data:10,stop:11," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_now_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_sequential_state_now[0]_i_1_n_0 ),
        .Q(state_now[0]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "idle:00,start:01,data:10,stop:11," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_now_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_sequential_state_now[1]_i_1_n_0 ),
        .Q(state_now[1]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    \b_reg[7]_i_1 
       (.I0(rx_done_tick_reg_i_3_n_0),
        .I1(state_now[0]),
        .O(b_next));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(b_next),
        .D(b_reg[1]),
        .Q(b_reg[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(b_next),
        .D(b_reg[2]),
        .Q(b_reg[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(b_next),
        .D(b_reg[3]),
        .Q(b_reg[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(b_next),
        .D(b_reg[4]),
        .Q(b_reg[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(b_next),
        .D(b_reg[5]),
        .Q(b_reg[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(b_next),
        .D(b_reg[6]),
        .Q(b_reg[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(b_next),
        .D(b_reg[7]),
        .Q(b_reg[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(b_next),
        .D(rx_IBUF),
        .Q(b_reg[7]),
        .R(SR));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \dout_reg_reg[0] 
       (.CLR(1'b0),
        .D(b_reg[0]),
        .G(dout_reg),
        .GE(1'b1),
        .Q(Q[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \dout_reg_reg[1] 
       (.CLR(1'b0),
        .D(b_reg[1]),
        .G(dout_reg),
        .GE(1'b1),
        .Q(Q[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \dout_reg_reg[2] 
       (.CLR(1'b0),
        .D(b_reg[2]),
        .G(dout_reg),
        .GE(1'b1),
        .Q(Q[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \dout_reg_reg[3] 
       (.CLR(1'b0),
        .D(b_reg[3]),
        .G(dout_reg),
        .GE(1'b1),
        .Q(Q[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \dout_reg_reg[4] 
       (.CLR(1'b0),
        .D(b_reg[4]),
        .G(dout_reg),
        .GE(1'b1),
        .Q(Q[4]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \dout_reg_reg[5] 
       (.CLR(1'b0),
        .D(b_reg[5]),
        .G(dout_reg),
        .GE(1'b1),
        .Q(Q[5]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \dout_reg_reg[6] 
       (.CLR(1'b0),
        .D(b_reg[6]),
        .G(dout_reg),
        .GE(1'b1),
        .Q(Q[6]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \dout_reg_reg[7] 
       (.CLR(1'b0),
        .D(b_reg[7]),
        .G(dout_reg),
        .GE(1'b1),
        .Q(Q[7]));
  LUT2 #(
    .INIT(4'h8)) 
    \dout_reg_reg[7]_i_1 
       (.I0(rx_done_tick_reg_i_3_n_0),
        .I1(state_now[0]),
        .O(dout_reg));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h6200)) 
    \n_reg[0]_i_1 
       (.I0(n_reg[0]),
        .I1(n_next),
        .I2(state_now[1]),
        .I3(reset_n_IBUF),
        .O(\n_reg[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h62A20000)) 
    \n_reg[1]_i_1 
       (.I0(n_reg[1]),
        .I1(n_next),
        .I2(state_now[1]),
        .I3(n_reg[0]),
        .I4(reset_n_IBUF),
        .O(\n_reg[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h62A2A2A200000000)) 
    \n_reg[2]_i_1 
       (.I0(n_reg[2]),
        .I1(n_next),
        .I2(state_now[1]),
        .I3(n_reg[1]),
        .I4(n_reg[0]),
        .I5(reset_n_IBUF),
        .O(\n_reg[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1000030010000000)) 
    \n_reg[2]_i_2 
       (.I0(\FSM_sequential_state_now[1]_i_5_n_0 ),
        .I1(\s_reg[3]_i_3_n_0 ),
        .I2(s_reg[3]),
        .I3(led_OBUF),
        .I4(state_now[1]),
        .I5(state_now[0]),
        .O(n_next));
  FDRE #(
    .INIT(1'b0)) 
    \n_reg_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\n_reg[0]_i_1_n_0 ),
        .Q(n_reg[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \n_reg_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\n_reg[1]_i_1_n_0 ),
        .Q(n_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \n_reg_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\n_reg[2]_i_1_n_0 ),
        .Q(n_reg[2]),
        .R(1'b0));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    rx_done_tick_reg
       (.CLR(1'b0),
        .D(rx_done_tick_reg_i_1_n_0),
        .G(rx_done_tick_reg_i_2_n_0),
        .GE(1'b1),
        .Q(rx_done_tick_OBUF));
  LUT2 #(
    .INIT(4'h8)) 
    rx_done_tick_reg_i_1
       (.I0(state_now[1]),
        .I1(led_OBUF),
        .O(rx_done_tick_reg_i_1_n_0));
  LUT3 #(
    .INIT(8'h8B)) 
    rx_done_tick_reg_i_2
       (.I0(rx_done_tick_reg_i_3_n_0),
        .I1(state_now[0]),
        .I2(state_now[1]),
        .O(rx_done_tick_reg_i_2_n_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    rx_done_tick_reg_i_3
       (.I0(led_OBUF),
        .I1(state_now[1]),
        .I2(s_reg[3]),
        .I3(s_reg[1]),
        .I4(s_reg[0]),
        .I5(s_reg[2]),
        .O(rx_done_tick_reg_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h5754)) 
    \s_reg[0]_i_1 
       (.I0(s_reg[0]),
        .I1(state_now[0]),
        .I2(state_now[1]),
        .I3(rx_IBUF),
        .O(\s_reg[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h02FEFE02)) 
    \s_reg[1]_i_1 
       (.I0(rx_IBUF),
        .I1(state_now[0]),
        .I2(state_now[1]),
        .I3(s_reg[1]),
        .I4(s_reg[0]),
        .O(\s_reg[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h02FEFEFEFE020202)) 
    \s_reg[2]_i_1 
       (.I0(rx_IBUF),
        .I1(state_now[0]),
        .I2(state_now[1]),
        .I3(s_reg[1]),
        .I4(s_reg[0]),
        .I5(s_reg[2]),
        .O(\s_reg[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF300FF00FF005555)) 
    \s_reg[3]_i_1 
       (.I0(rx_IBUF),
        .I1(s_reg[3]),
        .I2(\s_reg[3]_i_3_n_0 ),
        .I3(led_OBUF),
        .I4(state_now[1]),
        .I5(state_now[0]),
        .O(s_next));
  LUT5 #(
    .INIT(32'hCCCA303A)) 
    \s_reg[3]_i_2 
       (.I0(rx_IBUF),
        .I1(\s_reg[3]_i_3_n_0 ),
        .I2(state_now[1]),
        .I3(state_now[0]),
        .I4(s_reg[3]),
        .O(\s_reg[3]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h7F)) 
    \s_reg[3]_i_3 
       (.I0(s_reg[1]),
        .I1(s_reg[0]),
        .I2(s_reg[2]),
        .O(\s_reg[3]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s_reg_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(s_next),
        .D(\s_reg[0]_i_1_n_0 ),
        .Q(s_reg[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_reg_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(s_next),
        .D(\s_reg[1]_i_1_n_0 ),
        .Q(s_reg[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_reg_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(s_next),
        .D(\s_reg[2]_i_1_n_0 ),
        .Q(s_reg[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_reg_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(s_next),
        .D(\s_reg[3]_i_2_n_0 ),
        .Q(s_reg[3]),
        .R(SR));
endmodule

module uart_tx
   (tx_done_tick_OBUF,
    tx_OBUF,
    SR,
    clk_IBUF_BUFG,
    reset_n_IBUF,
    led_OBUF);
  output tx_done_tick_OBUF;
  output tx_OBUF;
  output [0:0]SR;
  input clk_IBUF_BUFG;
  input reset_n_IBUF;
  input led_OBUF;

  wire \FSM_onehot_state_now[3]_i_2_n_0 ;
  wire \FSM_onehot_state_now[3]_i_3_n_0 ;
  wire \FSM_onehot_state_now[3]_i_4_n_0 ;
  wire [0:0]SR;
  wire b_next;
  wire [7:0]b_reg;
  wire \b_reg[0]_i_1_n_0 ;
  wire \b_reg[1]_i_1_n_0 ;
  wire \b_reg[2]_i_1_n_0 ;
  wire \b_reg[3]_i_1_n_0 ;
  wire \b_reg[4]_i_1_n_0 ;
  wire \b_reg[5]_i_1_n_0 ;
  wire \b_reg[6]_i_1_n_0 ;
  wire \b_reg[6]_i_2_n_0 ;
  wire \b_reg[7]_i_2_n_0 ;
  wire \b_reg[7]_i_3_n_0 ;
  wire clk_IBUF_BUFG;
  wire led_OBUF;
  wire reset_n_IBUF;
  wire s_next;
  wire \s_reg[0]_i_1__0_n_0 ;
  wire \s_reg[1]_i_1__0_n_0 ;
  wire \s_reg[2]_i_1__0_n_0 ;
  wire \s_reg[3]_i_2__0_n_0 ;
  wire \s_reg[3]_i_3__0_n_0 ;
  wire \s_reg_reg_n_0_[0] ;
  wire \s_reg_reg_n_0_[1] ;
  wire \s_reg_reg_n_0_[2] ;
  wire \s_reg_reg_n_0_[3] ;
  wire [3:0]state_now;
  wire tx_OBUF;
  wire tx_done_tick_OBUF;
  wire tx_done_tick_reg_i_1_n_0;
  wire tx_done_tick_reg_i_2_n_0;
  wire tx_next;
  wire tx_reg_i_2_n_0;
  wire tx_reg_i_3_n_0;
  wire tx_reg_i_4_n_0;

  LUT1 #(
    .INIT(2'h1)) 
    \FSM_onehot_state_now[3]_i_1 
       (.I0(reset_n_IBUF),
        .O(SR));
  LUT6 #(
    .INIT(64'hFEFFAAAAFEFEAAAA)) 
    \FSM_onehot_state_now[3]_i_2 
       (.I0(state_now[0]),
        .I1(state_now[3]),
        .I2(state_now[1]),
        .I3(\FSM_onehot_state_now[3]_i_3_n_0 ),
        .I4(\FSM_onehot_state_now[3]_i_4_n_0 ),
        .I5(state_now[2]),
        .O(\FSM_onehot_state_now[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \FSM_onehot_state_now[3]_i_3 
       (.I0(b_reg[4]),
        .I1(b_reg[5]),
        .I2(b_reg[7]),
        .I3(b_reg[6]),
        .I4(b_reg[3]),
        .I5(\b_reg[6]_i_2_n_0 ),
        .O(\FSM_onehot_state_now[3]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \FSM_onehot_state_now[3]_i_4 
       (.I0(led_OBUF),
        .I1(\s_reg_reg_n_0_[2] ),
        .I2(\s_reg_reg_n_0_[0] ),
        .I3(\s_reg_reg_n_0_[1] ),
        .I4(\s_reg_reg_n_0_[3] ),
        .O(\FSM_onehot_state_now[3]_i_4_n_0 ));
  (* FSM_ENCODED_STATES = "idle:0001,start:0010,data:0100,stop:1000," *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_now_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_now[3]_i_2_n_0 ),
        .D(state_now[3]),
        .Q(state_now[0]),
        .S(SR));
  (* FSM_ENCODED_STATES = "idle:0001,start:0010,data:0100,stop:1000," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_now_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_now[3]_i_2_n_0 ),
        .D(state_now[0]),
        .Q(state_now[1]),
        .R(SR));
  (* FSM_ENCODED_STATES = "idle:0001,start:0010,data:0100,stop:1000," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_now_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_now[3]_i_2_n_0 ),
        .D(state_now[1]),
        .Q(state_now[2]),
        .R(SR));
  (* FSM_ENCODED_STATES = "idle:0001,start:0010,data:0100,stop:1000," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_now_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_now[3]_i_2_n_0 ),
        .D(state_now[2]),
        .Q(state_now[3]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \b_reg[0]_i_1 
       (.I0(state_now[2]),
        .I1(b_reg[0]),
        .O(\b_reg[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h48)) 
    \b_reg[1]_i_1 
       (.I0(b_reg[0]),
        .I1(state_now[2]),
        .I2(b_reg[1]),
        .O(\b_reg[1]_i_1_n_0 ));
  (* \PinAttr:I3:HOLD_DETOUR  = "192" *) 
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h7080)) 
    \b_reg[2]_i_1 
       (.I0(b_reg[0]),
        .I1(b_reg[1]),
        .I2(state_now[2]),
        .I3(b_reg[2]),
        .O(\b_reg[2]_i_1_n_0 ));
  (* \PinAttr:I2:HOLD_DETOUR  = "192" *) 
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h7F008000)) 
    \b_reg[3]_i_1 
       (.I0(b_reg[1]),
        .I1(b_reg[0]),
        .I2(b_reg[2]),
        .I3(state_now[2]),
        .I4(b_reg[3]),
        .O(\b_reg[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \b_reg[4]_i_1 
       (.I0(b_reg[2]),
        .I1(b_reg[0]),
        .I2(b_reg[1]),
        .I3(b_reg[3]),
        .I4(state_now[2]),
        .I5(b_reg[4]),
        .O(\b_reg[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hDF002000)) 
    \b_reg[5]_i_1 
       (.I0(b_reg[3]),
        .I1(\b_reg[6]_i_2_n_0 ),
        .I2(b_reg[4]),
        .I3(state_now[2]),
        .I4(b_reg[5]),
        .O(\b_reg[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hDFFF000020000000)) 
    \b_reg[6]_i_1 
       (.I0(b_reg[4]),
        .I1(\b_reg[6]_i_2_n_0 ),
        .I2(b_reg[3]),
        .I3(b_reg[5]),
        .I4(state_now[2]),
        .I5(b_reg[6]),
        .O(\b_reg[6]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h7F)) 
    \b_reg[6]_i_2 
       (.I0(b_reg[1]),
        .I1(b_reg[0]),
        .I2(b_reg[2]),
        .O(\b_reg[6]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFF80)) 
    \b_reg[7]_i_1__0 
       (.I0(\FSM_onehot_state_now[3]_i_4_n_0 ),
        .I1(state_now[2]),
        .I2(\FSM_onehot_state_now[3]_i_3_n_0 ),
        .I3(state_now[0]),
        .O(b_next));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hB040)) 
    \b_reg[7]_i_2 
       (.I0(\b_reg[7]_i_3_n_0 ),
        .I1(b_reg[6]),
        .I2(state_now[2]),
        .I3(b_reg[7]),
        .O(\b_reg[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \b_reg[7]_i_3 
       (.I0(b_reg[4]),
        .I1(b_reg[2]),
        .I2(b_reg[0]),
        .I3(b_reg[1]),
        .I4(b_reg[3]),
        .I5(b_reg[5]),
        .O(\b_reg[7]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(b_next),
        .D(\b_reg[0]_i_1_n_0 ),
        .Q(b_reg[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(b_next),
        .D(\b_reg[1]_i_1_n_0 ),
        .Q(b_reg[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(b_next),
        .D(\b_reg[2]_i_1_n_0 ),
        .Q(b_reg[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(b_next),
        .D(\b_reg[3]_i_1_n_0 ),
        .Q(b_reg[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(b_next),
        .D(\b_reg[4]_i_1_n_0 ),
        .Q(b_reg[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(b_next),
        .D(\b_reg[5]_i_1_n_0 ),
        .Q(b_reg[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(b_next),
        .D(\b_reg[6]_i_1_n_0 ),
        .Q(b_reg[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \b_reg_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(b_next),
        .D(\b_reg[7]_i_2_n_0 ),
        .Q(b_reg[7]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h00FE)) 
    \s_reg[0]_i_1__0 
       (.I0(state_now[2]),
        .I1(state_now[1]),
        .I2(state_now[3]),
        .I3(\s_reg_reg_n_0_[0] ),
        .O(\s_reg[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h00FEFE00)) 
    \s_reg[1]_i_1__0 
       (.I0(state_now[3]),
        .I1(state_now[1]),
        .I2(state_now[2]),
        .I3(\s_reg_reg_n_0_[0] ),
        .I4(\s_reg_reg_n_0_[1] ),
        .O(\s_reg[1]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFEFEFE000000)) 
    \s_reg[2]_i_1__0 
       (.I0(state_now[3]),
        .I1(state_now[1]),
        .I2(state_now[2]),
        .I3(\s_reg_reg_n_0_[1] ),
        .I4(\s_reg_reg_n_0_[0] ),
        .I5(\s_reg_reg_n_0_[2] ),
        .O(\s_reg[2]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFAAA8)) 
    \s_reg[3]_i_1__0 
       (.I0(led_OBUF),
        .I1(state_now[3]),
        .I2(state_now[1]),
        .I3(state_now[2]),
        .I4(state_now[0]),
        .O(s_next));
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \s_reg[3]_i_2__0 
       (.I0(\s_reg[3]_i_3__0_n_0 ),
        .I1(\s_reg_reg_n_0_[2] ),
        .I2(\s_reg_reg_n_0_[0] ),
        .I3(\s_reg_reg_n_0_[1] ),
        .I4(\s_reg_reg_n_0_[3] ),
        .O(\s_reg[3]_i_2__0_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \s_reg[3]_i_3__0 
       (.I0(state_now[3]),
        .I1(state_now[1]),
        .I2(state_now[2]),
        .O(\s_reg[3]_i_3__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s_reg_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(s_next),
        .D(\s_reg[0]_i_1__0_n_0 ),
        .Q(\s_reg_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_reg_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(s_next),
        .D(\s_reg[1]_i_1__0_n_0 ),
        .Q(\s_reg_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_reg_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(s_next),
        .D(\s_reg[2]_i_1__0_n_0 ),
        .Q(\s_reg_reg_n_0_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_reg_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(s_next),
        .D(\s_reg[3]_i_2__0_n_0 ),
        .Q(\s_reg_reg_n_0_[3] ),
        .R(SR));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    tx_done_tick_reg
       (.CLR(1'b0),
        .D(tx_done_tick_reg_i_1_n_0),
        .G(tx_done_tick_reg_i_2_n_0),
        .GE(1'b1),
        .Q(tx_done_tick_OBUF));
  LUT2 #(
    .INIT(4'h8)) 
    tx_done_tick_reg_i_1
       (.I0(state_now[1]),
        .I1(led_OBUF),
        .O(tx_done_tick_reg_i_1_n_0));
  LUT3 #(
    .INIT(8'hF8)) 
    tx_done_tick_reg_i_2
       (.I0(state_now[1]),
        .I1(\FSM_onehot_state_now[3]_i_4_n_0 ),
        .I2(state_now[0]),
        .O(tx_done_tick_reg_i_2_n_0));
  LUT5 #(
    .INIT(32'hFFFFFE00)) 
    tx_reg_i_1
       (.I0(state_now[3]),
        .I1(state_now[1]),
        .I2(state_now[2]),
        .I3(\FSM_onehot_state_now[3]_i_4_n_0 ),
        .I4(state_now[0]),
        .O(tx_next));
  LUT6 #(
    .INIT(64'hBABAEAAAFABAEAAA)) 
    tx_reg_i_2
       (.I0(tx_reg_i_3_n_0),
        .I1(b_reg[1]),
        .I2(state_now[2]),
        .I3(b_reg[2]),
        .I4(b_reg[0]),
        .I5(tx_reg_i_4_n_0),
        .O(tx_reg_i_2_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    tx_reg_i_3
       (.I0(state_now[3]),
        .I1(led_OBUF),
        .O(tx_reg_i_3_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    tx_reg_i_4
       (.I0(b_reg[3]),
        .I1(b_reg[6]),
        .I2(b_reg[7]),
        .I3(b_reg[5]),
        .I4(b_reg[4]),
        .O(tx_reg_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    tx_reg_reg
       (.C(clk_IBUF_BUFG),
        .CE(tx_next),
        .D(tx_reg_i_2_n_0),
        .Q(tx_OBUF),
        .R(SR));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
