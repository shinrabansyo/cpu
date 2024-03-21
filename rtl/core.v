module Alu(
  input  [7:0]  io_command,
  input  [31:0] io_a,
  input  [31:0] io_b,
  output        io_zero,
  output [31:0] io_out
);
  wire  _io_out_T = io_command == 8'h1; // @[Alu.scala 20:17]
  wire [31:0] _io_out_T_2 = io_a + io_b; // @[Alu.scala 20:40]
  wire  _io_out_T_3 = io_command == 8'h2; // @[Alu.scala 21:17]
  wire [31:0] _io_out_T_5 = io_a - io_b; // @[Alu.scala 21:40]
  wire [31:0] _io_out_T_6 = _io_out_T_3 ? _io_out_T_5 : 32'h0; // @[Mux.scala 101:16]
  assign io_zero = io_out == 32'h0; // @[Alu.scala 17:22]
  assign io_out = _io_out_T ? _io_out_T_2 : _io_out_T_6; // @[Mux.scala 101:16]
endmodule
module UartTx(
  input        clock,
  input        reset,
  output       io_tx,
  output       io_din_ready,
  input        io_din_valid,
  input  [7:0] io_din_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg [11:0] rateCounter; // @[Uart.scala 26:28]
  reg [3:0] bitCounter; // @[Uart.scala 27:28]
  reg  bits_0; // @[Uart.scala 28:24]
  reg  bits_1; // @[Uart.scala 28:24]
  reg  bits_2; // @[Uart.scala 28:24]
  reg  bits_3; // @[Uart.scala 28:24]
  reg  bits_4; // @[Uart.scala 28:24]
  reg  bits_5; // @[Uart.scala 28:24]
  reg  bits_6; // @[Uart.scala 28:24]
  reg  bits_7; // @[Uart.scala 28:24]
  reg  bits_8; // @[Uart.scala 28:24]
  reg  bits_9; // @[Uart.scala 28:24]
  wire  _io_tx_T = bitCounter == 4'h0; // @[Uart.scala 30:23]
  wire [9:0] _T_1 = {1'h1,io_din_bits,1'h0}; // @[Cat.scala 33:92]
  wire  _GEN_0 = _io_tx_T & io_din_valid ? _T_1[0] : bits_0; // @[Uart.scala 38:31 39:10 28:24]
  wire  _GEN_1 = _io_tx_T & io_din_valid ? _T_1[1] : bits_1; // @[Uart.scala 38:31 39:10 28:24]
  wire  _GEN_2 = _io_tx_T & io_din_valid ? _T_1[2] : bits_2; // @[Uart.scala 38:31 39:10 28:24]
  wire  _GEN_3 = _io_tx_T & io_din_valid ? _T_1[3] : bits_3; // @[Uart.scala 38:31 39:10 28:24]
  wire  _GEN_4 = _io_tx_T & io_din_valid ? _T_1[4] : bits_4; // @[Uart.scala 38:31 39:10 28:24]
  wire  _GEN_5 = _io_tx_T & io_din_valid ? _T_1[5] : bits_5; // @[Uart.scala 38:31 39:10 28:24]
  wire  _GEN_6 = _io_tx_T & io_din_valid ? _T_1[6] : bits_6; // @[Uart.scala 38:31 39:10 28:24]
  wire  _GEN_7 = _io_tx_T & io_din_valid ? _T_1[7] : bits_7; // @[Uart.scala 38:31 39:10 28:24]
  wire  _GEN_8 = _io_tx_T & io_din_valid ? _T_1[8] : bits_8; // @[Uart.scala 38:31 39:10 28:24]
  wire [3:0] _GEN_10 = _io_tx_T & io_din_valid ? 4'ha : bitCounter; // @[Uart.scala 38:31 40:16 27:28]
  wire [3:0] _bitCounter_T_1 = bitCounter - 4'h1; // @[Uart.scala 48:32]
  wire [11:0] _rateCounter_T_1 = rateCounter - 12'h1; // @[Uart.scala 51:34]
  assign io_tx = bitCounter == 4'h0 | bits_0; // @[Uart.scala 30:31]
  assign io_din_ready = bitCounter == 4'h0; // @[Uart.scala 31:26]
  always @(posedge clock) begin
    if (reset) begin // @[Uart.scala 26:28]
      rateCounter <= 12'h0; // @[Uart.scala 26:28]
    end else if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 12'h0) begin // @[Uart.scala 44:31]
        rateCounter <= 12'h83c; // @[Uart.scala 49:19]
      end else begin
        rateCounter <= _rateCounter_T_1; // @[Uart.scala 51:19]
      end
    end else if (_io_tx_T & io_din_valid) begin // @[Uart.scala 38:31]
      rateCounter <= 12'h83c; // @[Uart.scala 41:17]
    end
    if (reset) begin // @[Uart.scala 27:28]
      bitCounter <= 4'h0; // @[Uart.scala 27:28]
    end else if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 12'h0) begin // @[Uart.scala 44:31]
        bitCounter <= _bitCounter_T_1; // @[Uart.scala 48:18]
      end else begin
        bitCounter <= _GEN_10;
      end
    end else begin
      bitCounter <= _GEN_10;
    end
    if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 12'h0) begin // @[Uart.scala 44:31]
        bits_0 <= bits_1; // @[Uart.scala 47:37]
      end else begin
        bits_0 <= _GEN_0;
      end
    end else begin
      bits_0 <= _GEN_0;
    end
    if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 12'h0) begin // @[Uart.scala 44:31]
        bits_1 <= bits_2; // @[Uart.scala 47:37]
      end else begin
        bits_1 <= _GEN_1;
      end
    end else begin
      bits_1 <= _GEN_1;
    end
    if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 12'h0) begin // @[Uart.scala 44:31]
        bits_2 <= bits_3; // @[Uart.scala 47:37]
      end else begin
        bits_2 <= _GEN_2;
      end
    end else begin
      bits_2 <= _GEN_2;
    end
    if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 12'h0) begin // @[Uart.scala 44:31]
        bits_3 <= bits_4; // @[Uart.scala 47:37]
      end else begin
        bits_3 <= _GEN_3;
      end
    end else begin
      bits_3 <= _GEN_3;
    end
    if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 12'h0) begin // @[Uart.scala 44:31]
        bits_4 <= bits_5; // @[Uart.scala 47:37]
      end else begin
        bits_4 <= _GEN_4;
      end
    end else begin
      bits_4 <= _GEN_4;
    end
    if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 12'h0) begin // @[Uart.scala 44:31]
        bits_5 <= bits_6; // @[Uart.scala 47:37]
      end else begin
        bits_5 <= _GEN_5;
      end
    end else begin
      bits_5 <= _GEN_5;
    end
    if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 12'h0) begin // @[Uart.scala 44:31]
        bits_6 <= bits_7; // @[Uart.scala 47:37]
      end else begin
        bits_6 <= _GEN_6;
      end
    end else begin
      bits_6 <= _GEN_6;
    end
    if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 12'h0) begin // @[Uart.scala 44:31]
        bits_7 <= bits_8; // @[Uart.scala 47:37]
      end else begin
        bits_7 <= _GEN_7;
      end
    end else begin
      bits_7 <= _GEN_7;
    end
    if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 12'h0) begin // @[Uart.scala 44:31]
        bits_8 <= bits_9; // @[Uart.scala 47:37]
      end else begin
        bits_8 <= _GEN_8;
      end
    end else begin
      bits_8 <= _GEN_8;
    end
    if (_io_tx_T & io_din_valid) begin // @[Uart.scala 38:31]
      bits_9 <= _T_1[9]; // @[Uart.scala 39:10]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  rateCounter = _RAND_0[11:0];
  _RAND_1 = {1{`RANDOM}};
  bitCounter = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  bits_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  bits_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  bits_2 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  bits_3 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  bits_4 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  bits_5 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  bits_6 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  bits_7 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  bits_8 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  bits_9 = _RAND_11[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module UartRx(
  input        clock,
  input        reset,
  input        io_dout_ready,
  output       io_dout_valid,
  output [7:0] io_dout_bits,
  input        io_rx
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
`endif // RANDOMIZE_REG_INIT
  reg [11:0] rateCounter; // @[Uart.scala 63:28]
  reg [3:0] bitCounter; // @[Uart.scala 65:27]
  reg  bits_1; // @[Uart.scala 66:17]
  reg  bits_2; // @[Uart.scala 66:17]
  reg  bits_3; // @[Uart.scala 66:17]
  reg  bits_4; // @[Uart.scala 66:17]
  reg  bits_5; // @[Uart.scala 66:17]
  reg  bits_6; // @[Uart.scala 66:17]
  reg  bits_7; // @[Uart.scala 66:17]
  reg  bits_8; // @[Uart.scala 66:17]
  reg  bits_9; // @[Uart.scala 66:17]
  reg  rxRegs_0; // @[Uart.scala 68:23]
  reg  rxRegs_1; // @[Uart.scala 68:23]
  reg  rxRegs_2; // @[Uart.scala 68:23]
  reg  running; // @[Uart.scala 73:24]
  reg  outValid; // @[Uart.scala 76:25]
  reg [7:0] outBits; // @[Uart.scala 77:20]
  wire  _GEN_0 = outValid & io_dout_ready ? 1'h0 : outValid; // @[Uart.scala 83:30 84:14 76:25]
  wire  _GEN_3 = ~rxRegs_1 & rxRegs_0 | running; // @[Uart.scala 108:35 112:15 73:24]
  wire [7:0] _outBits_T = {bits_8,bits_7,bits_6,bits_5,bits_4,bits_3,bits_2,bits_1}; // @[Cat.scala 33:92]
  wire [3:0] _bitCounter_T_1 = bitCounter - 4'h1; // @[Uart.scala 129:34]
  wire  _GEN_4 = bitCounter == 4'h0 | _GEN_0; // @[Uart.scala 119:32 120:18]
  wire [11:0] _rateCounter_T_1 = rateCounter - 12'h1; // @[Uart.scala 132:34]
  assign io_dout_valid = outValid; // @[Uart.scala 79:17]
  assign io_dout_bits = outBits; // @[Uart.scala 80:16]
  always @(posedge clock) begin
    if (reset) begin // @[Uart.scala 63:28]
      rateCounter <= 12'h0; // @[Uart.scala 63:28]
    end else if (~running) begin // @[Uart.scala 107:18]
      if (~rxRegs_1 & rxRegs_0) begin // @[Uart.scala 108:35]
        rateCounter <= 12'hc5a; // @[Uart.scala 110:19]
      end
    end else if (rateCounter == 12'h0) begin // @[Uart.scala 115:31]
      if (!(bitCounter == 4'h0)) begin // @[Uart.scala 119:32]
        rateCounter <= 12'h83c; // @[Uart.scala 128:21]
      end
    end else begin
      rateCounter <= _rateCounter_T_1; // @[Uart.scala 132:19]
    end
    if (reset) begin // @[Uart.scala 65:27]
      bitCounter <= 4'h0; // @[Uart.scala 65:27]
    end else if (~running) begin // @[Uart.scala 107:18]
      if (~rxRegs_1 & rxRegs_0) begin // @[Uart.scala 108:35]
        bitCounter <= 4'h9; // @[Uart.scala 111:18]
      end
    end else if (rateCounter == 12'h0) begin // @[Uart.scala 115:31]
      if (!(bitCounter == 4'h0)) begin // @[Uart.scala 119:32]
        bitCounter <= _bitCounter_T_1; // @[Uart.scala 129:20]
      end
    end
    if (!(~running)) begin // @[Uart.scala 107:18]
      if (rateCounter == 12'h0) begin // @[Uart.scala 115:31]
        bits_1 <= bits_2; // @[Uart.scala 117:45]
      end
    end
    if (!(~running)) begin // @[Uart.scala 107:18]
      if (rateCounter == 12'h0) begin // @[Uart.scala 115:31]
        bits_2 <= bits_3; // @[Uart.scala 117:45]
      end
    end
    if (!(~running)) begin // @[Uart.scala 107:18]
      if (rateCounter == 12'h0) begin // @[Uart.scala 115:31]
        bits_3 <= bits_4; // @[Uart.scala 117:45]
      end
    end
    if (!(~running)) begin // @[Uart.scala 107:18]
      if (rateCounter == 12'h0) begin // @[Uart.scala 115:31]
        bits_4 <= bits_5; // @[Uart.scala 117:45]
      end
    end
    if (!(~running)) begin // @[Uart.scala 107:18]
      if (rateCounter == 12'h0) begin // @[Uart.scala 115:31]
        bits_5 <= bits_6; // @[Uart.scala 117:45]
      end
    end
    if (!(~running)) begin // @[Uart.scala 107:18]
      if (rateCounter == 12'h0) begin // @[Uart.scala 115:31]
        bits_6 <= bits_7; // @[Uart.scala 117:45]
      end
    end
    if (!(~running)) begin // @[Uart.scala 107:18]
      if (rateCounter == 12'h0) begin // @[Uart.scala 115:31]
        bits_7 <= bits_8; // @[Uart.scala 117:45]
      end
    end
    if (!(~running)) begin // @[Uart.scala 107:18]
      if (rateCounter == 12'h0) begin // @[Uart.scala 115:31]
        bits_8 <= bits_9; // @[Uart.scala 117:45]
      end
    end
    if (!(~running)) begin // @[Uart.scala 107:18]
      if (rateCounter == 12'h0) begin // @[Uart.scala 115:31]
        bits_9 <= rxRegs_0; // @[Uart.scala 116:22]
      end
    end
    if (reset) begin // @[Uart.scala 68:23]
      rxRegs_0 <= 1'h0; // @[Uart.scala 68:23]
    end else begin
      rxRegs_0 <= rxRegs_1; // @[Uart.scala 98:50]
    end
    if (reset) begin // @[Uart.scala 68:23]
      rxRegs_1 <= 1'h0; // @[Uart.scala 68:23]
    end else begin
      rxRegs_1 <= rxRegs_2; // @[Uart.scala 98:50]
    end
    if (reset) begin // @[Uart.scala 68:23]
      rxRegs_2 <= 1'h0; // @[Uart.scala 68:23]
    end else begin
      rxRegs_2 <= io_rx; // @[Uart.scala 97:24]
    end
    if (reset) begin // @[Uart.scala 73:24]
      running <= 1'h0; // @[Uart.scala 73:24]
    end else if (~running) begin // @[Uart.scala 107:18]
      running <= _GEN_3;
    end else if (rateCounter == 12'h0) begin // @[Uart.scala 115:31]
      if (bitCounter == 4'h0) begin // @[Uart.scala 119:32]
        running <= 1'h0; // @[Uart.scala 126:17]
      end
    end
    if (reset) begin // @[Uart.scala 76:25]
      outValid <= 1'h0; // @[Uart.scala 76:25]
    end else if (~running) begin // @[Uart.scala 107:18]
      outValid <= _GEN_0;
    end else if (rateCounter == 12'h0) begin // @[Uart.scala 115:31]
      outValid <= _GEN_4;
    end else begin
      outValid <= _GEN_0;
    end
    if (!(~running)) begin // @[Uart.scala 107:18]
      if (rateCounter == 12'h0) begin // @[Uart.scala 115:31]
        if (bitCounter == 4'h0) begin // @[Uart.scala 119:32]
          outBits <= _outBits_T; // @[Uart.scala 121:17]
        end
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  rateCounter = _RAND_0[11:0];
  _RAND_1 = {1{`RANDOM}};
  bitCounter = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  bits_1 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  bits_2 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  bits_3 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  bits_4 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  bits_5 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  bits_6 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  bits_7 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  bits_8 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  bits_9 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  rxRegs_0 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  rxRegs_1 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  rxRegs_2 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  running = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  outValid = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  outBits = _RAND_16[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module IOBus(
  input         clock,
  input         reset,
  input  [31:0] io_devId,
  input         io_din_ready,
  output        io_din_valid,
  output [7:0]  io_din_bits,
  output        io_dout_ready,
  input         io_dout_valid,
  input  [7:0]  io_dout_bits,
  output        io_tx,
  input         io_rx
);
  wire  uartTx_clock; // @[IOBus.scala 16:22]
  wire  uartTx_reset; // @[IOBus.scala 16:22]
  wire  uartTx_io_tx; // @[IOBus.scala 16:22]
  wire  uartTx_io_din_ready; // @[IOBus.scala 16:22]
  wire  uartTx_io_din_valid; // @[IOBus.scala 16:22]
  wire [7:0] uartTx_io_din_bits; // @[IOBus.scala 16:22]
  wire  uartRx_clock; // @[IOBus.scala 17:22]
  wire  uartRx_reset; // @[IOBus.scala 17:22]
  wire  uartRx_io_dout_ready; // @[IOBus.scala 17:22]
  wire  uartRx_io_dout_valid; // @[IOBus.scala 17:22]
  wire [7:0] uartRx_io_dout_bits; // @[IOBus.scala 17:22]
  wire  uartRx_io_rx; // @[IOBus.scala 17:22]
  wire  isUart = io_devId == 32'h0; // @[IOBus.scala 21:23]
  UartTx uartTx ( // @[IOBus.scala 16:22]
    .clock(uartTx_clock),
    .reset(uartTx_reset),
    .io_tx(uartTx_io_tx),
    .io_din_ready(uartTx_io_din_ready),
    .io_din_valid(uartTx_io_din_valid),
    .io_din_bits(uartTx_io_din_bits)
  );
  UartRx uartRx ( // @[IOBus.scala 17:22]
    .clock(uartRx_clock),
    .reset(uartRx_reset),
    .io_dout_ready(uartRx_io_dout_ready),
    .io_dout_valid(uartRx_io_dout_valid),
    .io_dout_bits(uartRx_io_dout_bits),
    .io_rx(uartRx_io_rx)
  );
  assign io_din_valid = isUart ? uartRx_io_dout_valid : 1'h1; // @[Mux.scala 101:16]
  assign io_din_bits = isUart ? uartRx_io_dout_bits : 8'h0; // @[Mux.scala 101:16]
  assign io_dout_ready = isUart ? uartTx_io_din_ready : 1'h1; // @[Mux.scala 101:16]
  assign io_tx = uartTx_io_tx; // @[IOBus.scala 42:9]
  assign uartTx_clock = clock;
  assign uartTx_reset = reset;
  assign uartTx_io_din_valid = isUart & io_dout_valid; // @[IOBus.scala 46:17 44:23 47:25]
  assign uartTx_io_din_bits = isUart ? io_dout_bits : 8'h0; // @[IOBus.scala 46:17 45:22 48:24]
  assign uartRx_clock = clock;
  assign uartRx_reset = reset;
  assign uartRx_io_dout_ready = isUart & io_din_ready; // @[IOBus.scala 35:17 34:24 36:26]
  assign uartRx_io_rx = io_rx; // @[IOBus.scala 24:16]
endmodule
module Core(
  input        clock,
  input        reset,
  output       io_tx,
  input        io_rx,
  output [5:0] io_led
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_28;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
`endif // RANDOMIZE_REG_INIT
  wire [7:0] alu_io_command; // @[Core.scala 14:19]
  wire [31:0] alu_io_a; // @[Core.scala 14:19]
  wire [31:0] alu_io_b; // @[Core.scala 14:19]
  wire  alu_io_zero; // @[Core.scala 14:19]
  wire [31:0] alu_io_out; // @[Core.scala 14:19]
  wire  ioBus_clock; // @[Core.scala 15:21]
  wire  ioBus_reset; // @[Core.scala 15:21]
  wire [31:0] ioBus_io_devId; // @[Core.scala 15:21]
  wire  ioBus_io_din_ready; // @[Core.scala 15:21]
  wire  ioBus_io_din_valid; // @[Core.scala 15:21]
  wire [7:0] ioBus_io_din_bits; // @[Core.scala 15:21]
  wire  ioBus_io_dout_ready; // @[Core.scala 15:21]
  wire  ioBus_io_dout_valid; // @[Core.scala 15:21]
  wire [7:0] ioBus_io_dout_bits; // @[Core.scala 15:21]
  wire  ioBus_io_tx; // @[Core.scala 15:21]
  wire  ioBus_io_rx; // @[Core.scala 15:21]
  reg [7:0] imem [0:6143]; // @[Core.scala 20:32]
  wire  imem_instr_MPORT_en; // @[Core.scala 20:32]
  wire [12:0] imem_instr_MPORT_addr; // @[Core.scala 20:32]
  wire [7:0] imem_instr_MPORT_data; // @[Core.scala 20:32]
  wire  imem_instr_MPORT_1_en; // @[Core.scala 20:32]
  wire [12:0] imem_instr_MPORT_1_addr; // @[Core.scala 20:32]
  wire [7:0] imem_instr_MPORT_1_data; // @[Core.scala 20:32]
  wire  imem_instr_MPORT_2_en; // @[Core.scala 20:32]
  wire [12:0] imem_instr_MPORT_2_addr; // @[Core.scala 20:32]
  wire [7:0] imem_instr_MPORT_2_data; // @[Core.scala 20:32]
  wire  imem_instr_MPORT_3_en; // @[Core.scala 20:32]
  wire [12:0] imem_instr_MPORT_3_addr; // @[Core.scala 20:32]
  wire [7:0] imem_instr_MPORT_3_data; // @[Core.scala 20:32]
  wire  imem_instr_MPORT_4_en; // @[Core.scala 20:32]
  wire [12:0] imem_instr_MPORT_4_addr; // @[Core.scala 20:32]
  wire [7:0] imem_instr_MPORT_4_data; // @[Core.scala 20:32]
  wire  imem_instr_MPORT_5_en; // @[Core.scala 20:32]
  wire [12:0] imem_instr_MPORT_5_addr; // @[Core.scala 20:32]
  wire [7:0] imem_instr_MPORT_5_data; // @[Core.scala 20:32]
  reg  imem_instr_MPORT_en_pipe_0;
  reg [12:0] imem_instr_MPORT_addr_pipe_0;
  reg  imem_instr_MPORT_1_en_pipe_0;
  reg [12:0] imem_instr_MPORT_1_addr_pipe_0;
  reg  imem_instr_MPORT_2_en_pipe_0;
  reg [12:0] imem_instr_MPORT_2_addr_pipe_0;
  reg  imem_instr_MPORT_3_en_pipe_0;
  reg [12:0] imem_instr_MPORT_3_addr_pipe_0;
  reg  imem_instr_MPORT_4_en_pipe_0;
  reg [12:0] imem_instr_MPORT_4_addr_pipe_0;
  reg  imem_instr_MPORT_5_en_pipe_0;
  reg [12:0] imem_instr_MPORT_5_addr_pipe_0;
  reg [7:0] dmem [0:4095]; // @[Core.scala 22:32]
  wire  dmem_dmem_raw_MPORT_en; // @[Core.scala 22:32]
  wire [11:0] dmem_dmem_raw_MPORT_addr; // @[Core.scala 22:32]
  wire [7:0] dmem_dmem_raw_MPORT_data; // @[Core.scala 22:32]
  wire  dmem_dmem_raw_MPORT_1_en; // @[Core.scala 22:32]
  wire [11:0] dmem_dmem_raw_MPORT_1_addr; // @[Core.scala 22:32]
  wire [7:0] dmem_dmem_raw_MPORT_1_data; // @[Core.scala 22:32]
  wire  dmem_dmem_raw_MPORT_2_en; // @[Core.scala 22:32]
  wire [11:0] dmem_dmem_raw_MPORT_2_addr; // @[Core.scala 22:32]
  wire [7:0] dmem_dmem_raw_MPORT_2_data; // @[Core.scala 22:32]
  wire  dmem_dmem_raw_MPORT_3_en; // @[Core.scala 22:32]
  wire [11:0] dmem_dmem_raw_MPORT_3_addr; // @[Core.scala 22:32]
  wire [7:0] dmem_dmem_raw_MPORT_3_data; // @[Core.scala 22:32]
  wire [7:0] dmem_MPORT_data; // @[Core.scala 22:32]
  wire [11:0] dmem_MPORT_addr; // @[Core.scala 22:32]
  wire  dmem_MPORT_mask; // @[Core.scala 22:32]
  wire  dmem_MPORT_en; // @[Core.scala 22:32]
  wire [7:0] dmem_MPORT_2_data; // @[Core.scala 22:32]
  wire [11:0] dmem_MPORT_2_addr; // @[Core.scala 22:32]
  wire  dmem_MPORT_2_mask; // @[Core.scala 22:32]
  wire  dmem_MPORT_2_en; // @[Core.scala 22:32]
  wire [7:0] dmem_MPORT_4_data; // @[Core.scala 22:32]
  wire [11:0] dmem_MPORT_4_addr; // @[Core.scala 22:32]
  wire  dmem_MPORT_4_mask; // @[Core.scala 22:32]
  wire  dmem_MPORT_4_en; // @[Core.scala 22:32]
  wire [7:0] dmem_MPORT_6_data; // @[Core.scala 22:32]
  wire [11:0] dmem_MPORT_6_addr; // @[Core.scala 22:32]
  wire  dmem_MPORT_6_mask; // @[Core.scala 22:32]
  wire  dmem_MPORT_6_en; // @[Core.scala 22:32]
  reg  dmem_dmem_raw_MPORT_en_pipe_0;
  reg [11:0] dmem_dmem_raw_MPORT_addr_pipe_0;
  reg  dmem_dmem_raw_MPORT_1_en_pipe_0;
  reg [11:0] dmem_dmem_raw_MPORT_1_addr_pipe_0;
  reg  dmem_dmem_raw_MPORT_2_en_pipe_0;
  reg [11:0] dmem_dmem_raw_MPORT_2_addr_pipe_0;
  reg  dmem_dmem_raw_MPORT_3_en_pipe_0;
  reg [11:0] dmem_dmem_raw_MPORT_3_addr_pipe_0;
  reg [31:0] regfile [0:31]; // @[Core.scala 29:27]
  wire  regfile_alu_io_a_MPORT_en; // @[Core.scala 29:27]
  wire [4:0] regfile_alu_io_a_MPORT_addr; // @[Core.scala 29:27]
  wire [31:0] regfile_alu_io_a_MPORT_data; // @[Core.scala 29:27]
  wire  regfile_alu_io_a_MPORT_1_en; // @[Core.scala 29:27]
  wire [4:0] regfile_alu_io_a_MPORT_1_addr; // @[Core.scala 29:27]
  wire [31:0] regfile_alu_io_a_MPORT_1_data; // @[Core.scala 29:27]
  wire  regfile_alu_io_a_MPORT_2_en; // @[Core.scala 29:27]
  wire [4:0] regfile_alu_io_a_MPORT_2_addr; // @[Core.scala 29:27]
  wire [31:0] regfile_alu_io_a_MPORT_2_data; // @[Core.scala 29:27]
  wire  regfile_alu_io_a_MPORT_3_en; // @[Core.scala 29:27]
  wire [4:0] regfile_alu_io_a_MPORT_3_addr; // @[Core.scala 29:27]
  wire [31:0] regfile_alu_io_a_MPORT_3_data; // @[Core.scala 29:27]
  wire  regfile_alu_io_a_MPORT_4_en; // @[Core.scala 29:27]
  wire [4:0] regfile_alu_io_a_MPORT_4_addr; // @[Core.scala 29:27]
  wire [31:0] regfile_alu_io_a_MPORT_4_data; // @[Core.scala 29:27]
  wire  regfile_alu_io_a_MPORT_5_en; // @[Core.scala 29:27]
  wire [4:0] regfile_alu_io_a_MPORT_5_addr; // @[Core.scala 29:27]
  wire [31:0] regfile_alu_io_a_MPORT_5_data; // @[Core.scala 29:27]
  wire  regfile_alu_io_a_MPORT_6_en; // @[Core.scala 29:27]
  wire [4:0] regfile_alu_io_a_MPORT_6_addr; // @[Core.scala 29:27]
  wire [31:0] regfile_alu_io_a_MPORT_6_data; // @[Core.scala 29:27]
  wire  regfile_alu_io_a_MPORT_7_en; // @[Core.scala 29:27]
  wire [4:0] regfile_alu_io_a_MPORT_7_addr; // @[Core.scala 29:27]
  wire [31:0] regfile_alu_io_a_MPORT_7_data; // @[Core.scala 29:27]
  wire  regfile_alu_io_a_MPORT_8_en; // @[Core.scala 29:27]
  wire [4:0] regfile_alu_io_a_MPORT_8_addr; // @[Core.scala 29:27]
  wire [31:0] regfile_alu_io_a_MPORT_8_data; // @[Core.scala 29:27]
  wire  regfile_alu_io_b_MPORT_en; // @[Core.scala 29:27]
  wire [4:0] regfile_alu_io_b_MPORT_addr; // @[Core.scala 29:27]
  wire [31:0] regfile_alu_io_b_MPORT_data; // @[Core.scala 29:27]
  wire  regfile_alu_io_b_MPORT_1_en; // @[Core.scala 29:27]
  wire [4:0] regfile_alu_io_b_MPORT_1_addr; // @[Core.scala 29:27]
  wire [31:0] regfile_alu_io_b_MPORT_1_data; // @[Core.scala 29:27]
  wire  regfile_alu_io_b_MPORT_2_en; // @[Core.scala 29:27]
  wire [4:0] regfile_alu_io_b_MPORT_2_addr; // @[Core.scala 29:27]
  wire [31:0] regfile_alu_io_b_MPORT_2_data; // @[Core.scala 29:27]
  wire  regfile_alu_io_b_MPORT_3_en; // @[Core.scala 29:27]
  wire [4:0] regfile_alu_io_b_MPORT_3_addr; // @[Core.scala 29:27]
  wire [31:0] regfile_alu_io_b_MPORT_3_data; // @[Core.scala 29:27]
  wire  regfile_alu_io_b_MPORT_4_en; // @[Core.scala 29:27]
  wire [4:0] regfile_alu_io_b_MPORT_4_addr; // @[Core.scala 29:27]
  wire [31:0] regfile_alu_io_b_MPORT_4_data; // @[Core.scala 29:27]
  wire  regfile_alu_io_b_MPORT_5_en; // @[Core.scala 29:27]
  wire [4:0] regfile_alu_io_b_MPORT_5_addr; // @[Core.scala 29:27]
  wire [31:0] regfile_alu_io_b_MPORT_5_data; // @[Core.scala 29:27]
  wire  regfile_MPORT_1_en; // @[Core.scala 29:27]
  wire [4:0] regfile_MPORT_1_addr; // @[Core.scala 29:27]
  wire [31:0] regfile_MPORT_1_data; // @[Core.scala 29:27]
  wire  regfile_MPORT_3_en; // @[Core.scala 29:27]
  wire [4:0] regfile_MPORT_3_addr; // @[Core.scala 29:27]
  wire [31:0] regfile_MPORT_3_data; // @[Core.scala 29:27]
  wire  regfile_MPORT_5_en; // @[Core.scala 29:27]
  wire [4:0] regfile_MPORT_5_addr; // @[Core.scala 29:27]
  wire [31:0] regfile_MPORT_5_data; // @[Core.scala 29:27]
  wire  regfile_MPORT_7_en; // @[Core.scala 29:27]
  wire [4:0] regfile_MPORT_7_addr; // @[Core.scala 29:27]
  wire [31:0] regfile_MPORT_7_data; // @[Core.scala 29:27]
  wire  regfile_MPORT_9_en; // @[Core.scala 29:27]
  wire [4:0] regfile_MPORT_9_addr; // @[Core.scala 29:27]
  wire [31:0] regfile_MPORT_9_data; // @[Core.scala 29:27]
  wire  regfile_MPORT_10_en; // @[Core.scala 29:27]
  wire [4:0] regfile_MPORT_10_addr; // @[Core.scala 29:27]
  wire [31:0] regfile_MPORT_10_data; // @[Core.scala 29:27]
  wire  regfile_MPORT_11_en; // @[Core.scala 29:27]
  wire [4:0] regfile_MPORT_11_addr; // @[Core.scala 29:27]
  wire [31:0] regfile_MPORT_11_data; // @[Core.scala 29:27]
  wire  regfile_ioBus_io_dout_bits_MPORT_en; // @[Core.scala 29:27]
  wire [4:0] regfile_ioBus_io_dout_bits_MPORT_addr; // @[Core.scala 29:27]
  wire [31:0] regfile_ioBus_io_dout_bits_MPORT_data; // @[Core.scala 29:27]
  wire  regfile_io_led_MPORT_en; // @[Core.scala 29:27]
  wire [4:0] regfile_io_led_MPORT_addr; // @[Core.scala 29:27]
  wire [31:0] regfile_io_led_MPORT_data; // @[Core.scala 29:27]
  wire [31:0] regfile_MPORT_8_data; // @[Core.scala 29:27]
  wire [4:0] regfile_MPORT_8_addr; // @[Core.scala 29:27]
  wire  regfile_MPORT_8_mask; // @[Core.scala 29:27]
  wire  regfile_MPORT_8_en; // @[Core.scala 29:27]
  reg  first_time; // @[Core.scala 25:31]
  reg [31:0] pc; // @[Core.scala 26:31]
  reg [31:0] pc_next_plus_6; // @[Core.scala 27:31]
  reg  load_ready; // @[Core.scala 45:31]
  wire [47:0] _instr_T_24 = {imem_instr_MPORT_5_data,imem_instr_MPORT_4_data,imem_instr_MPORT_3_data,
    imem_instr_MPORT_2_data,imem_instr_MPORT_1_data,imem_instr_MPORT_data}; // @[Cat.scala 33:92]
  wire [47:0] instr = first_time ? 48'h0 : _instr_T_24; // @[Core.scala 49:15]
  wire [4:0] opcode = instr[4:0]; // @[Core.scala 73:22]
  wire  _pc_next_T = opcode == 5'h3; // @[Core.scala 57:13]
  wire [2:0] opcode_sub = instr[7:5]; // @[Core.scala 74:22]
  wire  _pc_next_T_1 = opcode_sub == 3'h0; // @[Core.scala 57:40]
  wire  _pc_next_T_2 = opcode == 5'h3 & opcode_sub == 3'h0; // @[Core.scala 57:26]
  wire  _pc_next_T_3 = alu_io_zero; // @[Core.scala 57:68]
  wire  _pc_next_T_4 = opcode == 5'h3 & opcode_sub == 3'h0 & alu_io_zero; // @[Core.scala 57:53]
  wire [24:0] imm_r = instr[47:23]; // @[Core.scala 82:22]
  wire [6:0] _imm_r_sext_T_2 = imm_r[24] ? 7'h7f : 7'h0; // @[Bitwise.scala 77:12]
  wire [31:0] imm_r_sext = {_imm_r_sext_T_2,imm_r}; // @[Cat.scala 33:92]
  wire [31:0] _pc_next_T_6 = pc + imm_r_sext; // @[Core.scala 57:88]
  wire  _pc_next_T_8 = opcode_sub == 3'h1; // @[Core.scala 58:40]
  wire  _pc_next_T_9 = _pc_next_T & opcode_sub == 3'h1; // @[Core.scala 58:26]
  wire  _pc_next_T_11 = _pc_next_T & opcode_sub == 3'h1 & ~alu_io_zero; // @[Core.scala 58:53]
  wire  _pc_next_T_16 = _pc_next_T & opcode_sub == 3'h3; // @[Core.scala 59:26]
  wire  _pc_next_T_21 = _pc_next_T & opcode_sub == 3'h3 & (alu_io_out[31] | _pc_next_T_3); // @[Core.scala 59:53]
  wire  _pc_next_T_25 = opcode_sub == 3'h2; // @[Core.scala 60:40]
  wire  _pc_next_T_26 = _pc_next_T & opcode_sub == 3'h2; // @[Core.scala 60:26]
  wire  _pc_next_T_29 = _pc_next_T & opcode_sub == 3'h2 & alu_io_out[31]; // @[Core.scala 60:53]
  wire  _pc_next_T_34 = _pc_next_T & opcode_sub == 3'h4; // @[Core.scala 61:26]
  wire  _pc_next_T_35 = opcode == 5'h4; // @[Core.scala 63:13]
  wire  _pc_next_T_37 = opcode == 5'h4 & ~load_ready; // @[Core.scala 63:26]
  wire  _pc_next_T_38 = opcode == 5'h6; // @[Core.scala 65:13]
  wire  _pc_next_T_40 = opcode == 5'h6 & _pc_next_T_1; // @[Core.scala 65:26]
  wire  _pc_next_T_42 = opcode == 5'h6 & _pc_next_T_1 & ~ioBus_io_din_valid; // @[Core.scala 65:53]
  wire  _pc_next_T_45 = _pc_next_T_38 & _pc_next_T_8; // @[Core.scala 66:26]
  wire  _pc_next_T_47 = _pc_next_T_38 & _pc_next_T_8 & ~ioBus_io_dout_ready; // @[Core.scala 66:53]
  wire [31:0] _pc_next_T_48 = _pc_next_T_47 ? pc : pc_next_plus_6; // @[Mux.scala 101:16]
  wire [31:0] _pc_next_T_49 = _pc_next_T_42 ? pc : _pc_next_T_48; // @[Mux.scala 101:16]
  wire [31:0] _pc_next_T_50 = _pc_next_T_37 ? pc : _pc_next_T_49; // @[Mux.scala 101:16]
  wire [31:0] _pc_next_T_51 = _pc_next_T_34 ? alu_io_out : _pc_next_T_50; // @[Mux.scala 101:16]
  wire [31:0] _pc_next_T_52 = _pc_next_T_29 ? _pc_next_T_6 : _pc_next_T_51; // @[Mux.scala 101:16]
  wire [31:0] _pc_next_T_53 = _pc_next_T_21 ? _pc_next_T_6 : _pc_next_T_52; // @[Mux.scala 101:16]
  wire [31:0] _pc_next_T_54 = _pc_next_T_11 ? _pc_next_T_6 : _pc_next_T_53; // @[Mux.scala 101:16]
  wire [31:0] pc_next = _pc_next_T_4 ? _pc_next_T_6 : _pc_next_T_54; // @[Mux.scala 101:16]
  wire [32:0] _instr_T = {{1'd0}, pc_next}; // @[Core.scala 49:76]
  wire [31:0] _instr_T_5 = pc_next + 32'h1; // @[Core.scala 49:76]
  wire [31:0] _instr_T_9 = pc_next + 32'h2; // @[Core.scala 49:76]
  wire [31:0] _instr_T_13 = pc_next + 32'h3; // @[Core.scala 49:76]
  wire [31:0] _instr_T_17 = pc_next + 32'h4; // @[Core.scala 49:76]
  wire [31:0] _instr_T_21 = pc_next + 32'h5; // @[Core.scala 49:76]
  wire [31:0] _pc_next_plus_6_T_1 = pc_next + 32'h6; // @[Core.scala 52:29]
  wire [4:0] rd = instr[12:8]; // @[Core.scala 75:22]
  wire [31:0] imm = instr[47:16]; // @[Core.scala 81:22]
  wire  _command_T = opcode == 5'h1; // @[Core.scala 88:13]
  wire  _command_T_2 = opcode == 5'h1 & _pc_next_T_8; // @[Core.scala 88:26]
  wire  _command_T_5 = _command_T & _pc_next_T_25; // @[Core.scala 89:26]
  wire  _command_T_6 = opcode == 5'h2; // @[Core.scala 91:13]
  wire  _command_T_8 = opcode == 5'h2 & _pc_next_T_8; // @[Core.scala 91:26]
  wire  _command_T_11 = _command_T_6 & _pc_next_T_25; // @[Core.scala 92:26]
  wire  _command_T_29 = _pc_next_T_35 & _pc_next_T_1; // @[Core.scala 100:26]
  wire  _command_T_32 = _pc_next_T_35 & _pc_next_T_25; // @[Core.scala 101:26]
  wire  _command_T_33 = opcode == 5'h5; // @[Core.scala 103:13]
  wire  _command_T_35 = opcode == 5'h5 & _pc_next_T_1; // @[Core.scala 103:26]
  wire [7:0] _command_T_42 = _pc_next_T_45 ? 8'h1 : 8'h0; // @[Mux.scala 101:16]
  wire [7:0] _command_T_43 = _pc_next_T_40 ? 8'h1 : _command_T_42; // @[Mux.scala 101:16]
  wire [7:0] _command_T_44 = _command_T_35 ? 8'h1 : _command_T_43; // @[Mux.scala 101:16]
  wire [7:0] _command_T_45 = _command_T_32 ? 8'h1 : _command_T_44; // @[Mux.scala 101:16]
  wire [7:0] _command_T_46 = _command_T_29 ? 8'h1 : _command_T_45; // @[Mux.scala 101:16]
  wire [7:0] _command_T_47 = _pc_next_T_34 ? 8'h1 : _command_T_46; // @[Mux.scala 101:16]
  wire [7:0] _command_T_48 = _pc_next_T_16 ? 8'h2 : _command_T_47; // @[Mux.scala 101:16]
  wire [7:0] _command_T_49 = _pc_next_T_26 ? 8'h2 : _command_T_48; // @[Mux.scala 101:16]
  wire [7:0] _command_T_50 = _pc_next_T_9 ? 8'h2 : _command_T_49; // @[Mux.scala 101:16]
  wire [7:0] _command_T_51 = _pc_next_T_2 ? 8'h2 : _command_T_50; // @[Mux.scala 101:16]
  wire [7:0] _command_T_52 = _command_T_11 ? 8'h2 : _command_T_51; // @[Mux.scala 101:16]
  wire [7:0] _command_T_53 = _command_T_8 ? 8'h1 : _command_T_52; // @[Mux.scala 101:16]
  wire [7:0] _command_T_54 = _command_T_5 ? 8'h2 : _command_T_53; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_a_T_24 = _pc_next_T_34 ? regfile_alu_io_a_MPORT_8_data : regfile_alu_io_a_MPORT_data; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_a_T_25 = _pc_next_T_45 ? regfile_alu_io_a_MPORT_7_data : _alu_io_a_T_24; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_a_T_26 = _pc_next_T_40 ? regfile_alu_io_a_MPORT_6_data : _alu_io_a_T_25; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_a_T_27 = _command_T_35 ? regfile_alu_io_a_MPORT_5_data : _alu_io_a_T_26; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_a_T_28 = _command_T_32 ? regfile_alu_io_a_MPORT_4_data : _alu_io_a_T_27; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_a_T_29 = _command_T_29 ? regfile_alu_io_a_MPORT_3_data : _alu_io_a_T_28; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_a_T_30 = _command_T_11 ? regfile_alu_io_a_MPORT_2_data : _alu_io_a_T_29; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_42 = _pc_next_T_45 ? imm : 32'h0; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_43 = _pc_next_T_40 ? imm : _alu_io_b_T_42; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_44 = _command_T_35 ? imm : _alu_io_b_T_43; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_45 = _command_T_32 ? imm : _alu_io_b_T_44; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_46 = _command_T_29 ? imm : _alu_io_b_T_45; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_47 = _pc_next_T_34 ? imm : _alu_io_b_T_46; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_48 = _pc_next_T_16 ? regfile_alu_io_b_MPORT_5_data : _alu_io_b_T_47; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_49 = _pc_next_T_26 ? regfile_alu_io_b_MPORT_4_data : _alu_io_b_T_48; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_50 = _pc_next_T_9 ? regfile_alu_io_b_MPORT_3_data : _alu_io_b_T_49; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_51 = _pc_next_T_2 ? regfile_alu_io_b_MPORT_2_data : _alu_io_b_T_50; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_52 = _command_T_11 ? imm : _alu_io_b_T_51; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_53 = _command_T_8 ? imm : _alu_io_b_T_52; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_54 = _command_T_5 ? regfile_alu_io_b_MPORT_1_data : _alu_io_b_T_53; // @[Mux.scala 101:16]
  wire [32:0] _dmem_raw_T = {{1'd0}, alu_io_out}; // @[Core.scala 172:47]
  wire [31:0] _dmem_raw_T_5 = alu_io_out + 32'h1; // @[Core.scala 172:47]
  wire [31:0] _dmem_raw_T_9 = alu_io_out + 32'h2; // @[Core.scala 172:47]
  wire [31:0] _dmem_raw_T_13 = alu_io_out + 32'h3; // @[Core.scala 172:47]
  wire [31:0] dmem_raw = {dmem_dmem_raw_MPORT_3_data,dmem_dmem_raw_MPORT_2_data,dmem_dmem_raw_MPORT_1_data,
    dmem_dmem_raw_MPORT_data}; // @[Cat.scala 33:92]
  wire  _T_22 = rd == 5'h0; // @[Core.scala 188:9]
  wire [31:0] _T_27 = pc + 32'h6; // @[Core.scala 190:61]
  wire [31:0] _T_54 = 32'hff & dmem_raw; // @[Core.scala 197:65]
  wire  _T_61 = _pc_next_T_40 & ioBus_io_din_valid; // @[Core.scala 200:53]
  wire [31:0] _T_70 = _pc_next_T_45 ? regfile_MPORT_11_data : alu_io_out; // @[Mux.scala 101:16]
  wire [31:0] _T_71 = _pc_next_T_42 ? regfile_MPORT_10_data : _T_70; // @[Mux.scala 101:16]
  wire [31:0] _T_72 = _T_61 ? {{24'd0}, ioBus_io_din_bits} : _T_71; // @[Mux.scala 101:16]
  wire [31:0] _T_73 = _command_T_35 ? regfile_MPORT_9_data : _T_72; // @[Mux.scala 101:16]
  wire [31:0] _T_74 = _command_T_32 ? _T_54 : _T_73; // @[Mux.scala 101:16]
  wire [31:0] _T_75 = _command_T_29 ? dmem_raw : _T_74; // @[Mux.scala 101:16]
  wire [31:0] _T_76 = _pc_next_T_34 ? _T_27 : _T_75; // @[Mux.scala 101:16]
  wire [31:0] _T_77 = _pc_next_T_16 ? _T_27 : _T_76; // @[Mux.scala 101:16]
  wire [31:0] _T_78 = _pc_next_T_26 ? _T_27 : _T_77; // @[Mux.scala 101:16]
  wire [31:0] _T_79 = _pc_next_T_9 ? _T_27 : _T_78; // @[Mux.scala 101:16]
  wire [31:0] _T_80 = _pc_next_T_2 ? _T_27 : _T_79; // @[Mux.scala 101:16]
  Alu alu ( // @[Core.scala 14:19]
    .io_command(alu_io_command),
    .io_a(alu_io_a),
    .io_b(alu_io_b),
    .io_zero(alu_io_zero),
    .io_out(alu_io_out)
  );
  IOBus ioBus ( // @[Core.scala 15:21]
    .clock(ioBus_clock),
    .reset(ioBus_reset),
    .io_devId(ioBus_io_devId),
    .io_din_ready(ioBus_io_din_ready),
    .io_din_valid(ioBus_io_din_valid),
    .io_din_bits(ioBus_io_din_bits),
    .io_dout_ready(ioBus_io_dout_ready),
    .io_dout_valid(ioBus_io_dout_valid),
    .io_dout_bits(ioBus_io_dout_bits),
    .io_tx(ioBus_io_tx),
    .io_rx(ioBus_io_rx)
  );
  assign imem_instr_MPORT_en = imem_instr_MPORT_en_pipe_0;
  assign imem_instr_MPORT_addr = imem_instr_MPORT_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_data = imem[imem_instr_MPORT_addr]; // @[Core.scala 20:32]
  `else
  assign imem_instr_MPORT_data = imem_instr_MPORT_addr >= 13'h1800 ? _RAND_1[7:0] : imem[imem_instr_MPORT_addr]; // @[Core.scala 20:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_1_en = imem_instr_MPORT_1_en_pipe_0;
  assign imem_instr_MPORT_1_addr = imem_instr_MPORT_1_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_1_data = imem[imem_instr_MPORT_1_addr]; // @[Core.scala 20:32]
  `else
  assign imem_instr_MPORT_1_data = imem_instr_MPORT_1_addr >= 13'h1800 ? _RAND_2[7:0] : imem[imem_instr_MPORT_1_addr]; // @[Core.scala 20:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_2_en = imem_instr_MPORT_2_en_pipe_0;
  assign imem_instr_MPORT_2_addr = imem_instr_MPORT_2_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_2_data = imem[imem_instr_MPORT_2_addr]; // @[Core.scala 20:32]
  `else
  assign imem_instr_MPORT_2_data = imem_instr_MPORT_2_addr >= 13'h1800 ? _RAND_3[7:0] : imem[imem_instr_MPORT_2_addr]; // @[Core.scala 20:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_3_en = imem_instr_MPORT_3_en_pipe_0;
  assign imem_instr_MPORT_3_addr = imem_instr_MPORT_3_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_3_data = imem[imem_instr_MPORT_3_addr]; // @[Core.scala 20:32]
  `else
  assign imem_instr_MPORT_3_data = imem_instr_MPORT_3_addr >= 13'h1800 ? _RAND_4[7:0] : imem[imem_instr_MPORT_3_addr]; // @[Core.scala 20:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_4_en = imem_instr_MPORT_4_en_pipe_0;
  assign imem_instr_MPORT_4_addr = imem_instr_MPORT_4_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_4_data = imem[imem_instr_MPORT_4_addr]; // @[Core.scala 20:32]
  `else
  assign imem_instr_MPORT_4_data = imem_instr_MPORT_4_addr >= 13'h1800 ? _RAND_5[7:0] : imem[imem_instr_MPORT_4_addr]; // @[Core.scala 20:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_5_en = imem_instr_MPORT_5_en_pipe_0;
  assign imem_instr_MPORT_5_addr = imem_instr_MPORT_5_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_5_data = imem[imem_instr_MPORT_5_addr]; // @[Core.scala 20:32]
  `else
  assign imem_instr_MPORT_5_data = imem_instr_MPORT_5_addr >= 13'h1800 ? _RAND_6[7:0] : imem[imem_instr_MPORT_5_addr]; // @[Core.scala 20:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign dmem_dmem_raw_MPORT_en = dmem_dmem_raw_MPORT_en_pipe_0;
  assign dmem_dmem_raw_MPORT_addr = dmem_dmem_raw_MPORT_addr_pipe_0;
  assign dmem_dmem_raw_MPORT_data = dmem[dmem_dmem_raw_MPORT_addr]; // @[Core.scala 22:32]
  assign dmem_dmem_raw_MPORT_1_en = dmem_dmem_raw_MPORT_1_en_pipe_0;
  assign dmem_dmem_raw_MPORT_1_addr = dmem_dmem_raw_MPORT_1_addr_pipe_0;
  assign dmem_dmem_raw_MPORT_1_data = dmem[dmem_dmem_raw_MPORT_1_addr]; // @[Core.scala 22:32]
  assign dmem_dmem_raw_MPORT_2_en = dmem_dmem_raw_MPORT_2_en_pipe_0;
  assign dmem_dmem_raw_MPORT_2_addr = dmem_dmem_raw_MPORT_2_addr_pipe_0;
  assign dmem_dmem_raw_MPORT_2_data = dmem[dmem_dmem_raw_MPORT_2_addr]; // @[Core.scala 22:32]
  assign dmem_dmem_raw_MPORT_3_en = dmem_dmem_raw_MPORT_3_en_pipe_0;
  assign dmem_dmem_raw_MPORT_3_addr = dmem_dmem_raw_MPORT_3_addr_pipe_0;
  assign dmem_dmem_raw_MPORT_3_data = dmem[dmem_dmem_raw_MPORT_3_addr]; // @[Core.scala 22:32]
  assign dmem_MPORT_data = regfile_MPORT_1_data[7:0];
  assign dmem_MPORT_addr = _dmem_raw_T[11:0];
  assign dmem_MPORT_mask = 1'h1;
  assign dmem_MPORT_en = _command_T_33 & _pc_next_T_1;
  assign dmem_MPORT_2_data = regfile_MPORT_3_data[15:8];
  assign dmem_MPORT_2_addr = _dmem_raw_T_5[11:0];
  assign dmem_MPORT_2_mask = 1'h1;
  assign dmem_MPORT_2_en = _command_T_33 & _pc_next_T_1;
  assign dmem_MPORT_4_data = regfile_MPORT_5_data[23:16];
  assign dmem_MPORT_4_addr = _dmem_raw_T_9[11:0];
  assign dmem_MPORT_4_mask = 1'h1;
  assign dmem_MPORT_4_en = _command_T_33 & _pc_next_T_1;
  assign dmem_MPORT_6_data = regfile_MPORT_7_data[31:24];
  assign dmem_MPORT_6_addr = _dmem_raw_T_13[11:0];
  assign dmem_MPORT_6_mask = 1'h1;
  assign dmem_MPORT_6_en = _command_T_33 & _pc_next_T_1;
  assign regfile_alu_io_a_MPORT_en = 1'h1;
  assign regfile_alu_io_a_MPORT_addr = instr[17:13];
  assign regfile_alu_io_a_MPORT_data = regfile[regfile_alu_io_a_MPORT_addr]; // @[Core.scala 29:27]
  assign regfile_alu_io_a_MPORT_1_en = 1'h1;
  assign regfile_alu_io_a_MPORT_1_addr = {2'h0,instr[15:13]};
  assign regfile_alu_io_a_MPORT_1_data = regfile[regfile_alu_io_a_MPORT_1_addr]; // @[Core.scala 29:27]
  assign regfile_alu_io_a_MPORT_2_en = 1'h1;
  assign regfile_alu_io_a_MPORT_2_addr = {2'h0,instr[15:13]};
  assign regfile_alu_io_a_MPORT_2_data = regfile[regfile_alu_io_a_MPORT_2_addr]; // @[Core.scala 29:27]
  assign regfile_alu_io_a_MPORT_3_en = 1'h1;
  assign regfile_alu_io_a_MPORT_3_addr = {2'h0,instr[15:13]};
  assign regfile_alu_io_a_MPORT_3_data = regfile[regfile_alu_io_a_MPORT_3_addr]; // @[Core.scala 29:27]
  assign regfile_alu_io_a_MPORT_4_en = 1'h1;
  assign regfile_alu_io_a_MPORT_4_addr = {2'h0,instr[15:13]};
  assign regfile_alu_io_a_MPORT_4_data = regfile[regfile_alu_io_a_MPORT_4_addr]; // @[Core.scala 29:27]
  assign regfile_alu_io_a_MPORT_5_en = 1'h1;
  assign regfile_alu_io_a_MPORT_5_addr = {2'h0,instr[15:13]};
  assign regfile_alu_io_a_MPORT_5_data = regfile[regfile_alu_io_a_MPORT_5_addr]; // @[Core.scala 29:27]
  assign regfile_alu_io_a_MPORT_6_en = 1'h1;
  assign regfile_alu_io_a_MPORT_6_addr = {2'h0,instr[15:13]};
  assign regfile_alu_io_a_MPORT_6_data = regfile[regfile_alu_io_a_MPORT_6_addr]; // @[Core.scala 29:27]
  assign regfile_alu_io_a_MPORT_7_en = 1'h1;
  assign regfile_alu_io_a_MPORT_7_addr = {2'h0,instr[15:13]};
  assign regfile_alu_io_a_MPORT_7_data = regfile[regfile_alu_io_a_MPORT_7_addr]; // @[Core.scala 29:27]
  assign regfile_alu_io_a_MPORT_8_en = 1'h1;
  assign regfile_alu_io_a_MPORT_8_addr = {2'h0,instr[15:13]};
  assign regfile_alu_io_a_MPORT_8_data = regfile[regfile_alu_io_a_MPORT_8_addr]; // @[Core.scala 29:27]
  assign regfile_alu_io_b_MPORT_en = 1'h1;
  assign regfile_alu_io_b_MPORT_addr = instr[22:18];
  assign regfile_alu_io_b_MPORT_data = regfile[regfile_alu_io_b_MPORT_addr]; // @[Core.scala 29:27]
  assign regfile_alu_io_b_MPORT_1_en = 1'h1;
  assign regfile_alu_io_b_MPORT_1_addr = instr[22:18];
  assign regfile_alu_io_b_MPORT_1_data = regfile[regfile_alu_io_b_MPORT_1_addr]; // @[Core.scala 29:27]
  assign regfile_alu_io_b_MPORT_2_en = 1'h1;
  assign regfile_alu_io_b_MPORT_2_addr = instr[22:18];
  assign regfile_alu_io_b_MPORT_2_data = regfile[regfile_alu_io_b_MPORT_2_addr]; // @[Core.scala 29:27]
  assign regfile_alu_io_b_MPORT_3_en = 1'h1;
  assign regfile_alu_io_b_MPORT_3_addr = instr[22:18];
  assign regfile_alu_io_b_MPORT_3_data = regfile[regfile_alu_io_b_MPORT_3_addr]; // @[Core.scala 29:27]
  assign regfile_alu_io_b_MPORT_4_en = 1'h1;
  assign regfile_alu_io_b_MPORT_4_addr = instr[22:18];
  assign regfile_alu_io_b_MPORT_4_data = regfile[regfile_alu_io_b_MPORT_4_addr]; // @[Core.scala 29:27]
  assign regfile_alu_io_b_MPORT_5_en = 1'h1;
  assign regfile_alu_io_b_MPORT_5_addr = instr[22:18];
  assign regfile_alu_io_b_MPORT_5_data = regfile[regfile_alu_io_b_MPORT_5_addr]; // @[Core.scala 29:27]
  assign regfile_MPORT_1_en = _command_T_33 & _pc_next_T_1;
  assign regfile_MPORT_1_addr = instr[12:8];
  assign regfile_MPORT_1_data = regfile[regfile_MPORT_1_addr]; // @[Core.scala 29:27]
  assign regfile_MPORT_3_en = _command_T_33 & _pc_next_T_1;
  assign regfile_MPORT_3_addr = instr[12:8];
  assign regfile_MPORT_3_data = regfile[regfile_MPORT_3_addr]; // @[Core.scala 29:27]
  assign regfile_MPORT_5_en = _command_T_33 & _pc_next_T_1;
  assign regfile_MPORT_5_addr = instr[12:8];
  assign regfile_MPORT_5_data = regfile[regfile_MPORT_5_addr]; // @[Core.scala 29:27]
  assign regfile_MPORT_7_en = _command_T_33 & _pc_next_T_1;
  assign regfile_MPORT_7_addr = instr[12:8];
  assign regfile_MPORT_7_data = regfile[regfile_MPORT_7_addr]; // @[Core.scala 29:27]
  assign regfile_MPORT_9_en = 1'h1;
  assign regfile_MPORT_9_addr = instr[12:8];
  assign regfile_MPORT_9_data = regfile[regfile_MPORT_9_addr]; // @[Core.scala 29:27]
  assign regfile_MPORT_10_en = 1'h1;
  assign regfile_MPORT_10_addr = instr[12:8];
  assign regfile_MPORT_10_data = regfile[regfile_MPORT_10_addr]; // @[Core.scala 29:27]
  assign regfile_MPORT_11_en = 1'h1;
  assign regfile_MPORT_11_addr = instr[12:8];
  assign regfile_MPORT_11_data = regfile[regfile_MPORT_11_addr]; // @[Core.scala 29:27]
  assign regfile_ioBus_io_dout_bits_MPORT_en = 1'h1;
  assign regfile_ioBus_io_dout_bits_MPORT_addr = instr[12:8];
  assign regfile_ioBus_io_dout_bits_MPORT_data = regfile[regfile_ioBus_io_dout_bits_MPORT_addr]; // @[Core.scala 29:27]
  assign regfile_io_led_MPORT_en = 1'h1;
  assign regfile_io_led_MPORT_addr = 5'h1;
  assign regfile_io_led_MPORT_data = regfile[regfile_io_led_MPORT_addr]; // @[Core.scala 29:27]
  assign regfile_MPORT_8_data = _T_22 ? 32'h0 : _T_80;
  assign regfile_MPORT_8_addr = instr[12:8];
  assign regfile_MPORT_8_mask = 1'h1;
  assign regfile_MPORT_8_en = 1'h1;
  assign io_tx = ioBus_io_tx; // @[Core.scala 18:9]
  assign io_led = regfile_io_led_MPORT_data[5:0]; // @[Core.scala 214:30]
  assign alu_io_command = _command_T_2 ? 8'h1 : _command_T_54; // @[Mux.scala 101:16]
  assign alu_io_a = _command_T_8 ? regfile_alu_io_a_MPORT_1_data : _alu_io_a_T_30; // @[Mux.scala 101:16]
  assign alu_io_b = _command_T_2 ? regfile_alu_io_b_MPORT_data : _alu_io_b_T_54; // @[Mux.scala 101:16]
  assign ioBus_clock = clock;
  assign ioBus_reset = reset;
  assign ioBus_io_devId = alu_io_out; // @[Core.scala 206:18]
  assign ioBus_io_din_ready = _pc_next_T_40 & ioBus_io_din_valid; // @[Core.scala 208:74]
  assign ioBus_io_dout_valid = _pc_next_T_38 & _pc_next_T_8; // @[Core.scala 210:47]
  assign ioBus_io_dout_bits = regfile_ioBus_io_dout_bits_MPORT_data[7:0]; // @[Core.scala 211:22]
  assign ioBus_io_rx = io_rx; // @[Core.scala 17:15]
  always @(posedge clock) begin
    imem_instr_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      imem_instr_MPORT_addr_pipe_0 <= _instr_T[12:0];
    end
    imem_instr_MPORT_1_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      imem_instr_MPORT_1_addr_pipe_0 <= _instr_T_5[12:0];
    end
    imem_instr_MPORT_2_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      imem_instr_MPORT_2_addr_pipe_0 <= _instr_T_9[12:0];
    end
    imem_instr_MPORT_3_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      imem_instr_MPORT_3_addr_pipe_0 <= _instr_T_13[12:0];
    end
    imem_instr_MPORT_4_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      imem_instr_MPORT_4_addr_pipe_0 <= _instr_T_17[12:0];
    end
    imem_instr_MPORT_5_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      imem_instr_MPORT_5_addr_pipe_0 <= _instr_T_21[12:0];
    end
    if (dmem_MPORT_en & dmem_MPORT_mask) begin
      dmem[dmem_MPORT_addr] <= dmem_MPORT_data; // @[Core.scala 22:32]
    end
    if (dmem_MPORT_2_en & dmem_MPORT_2_mask) begin
      dmem[dmem_MPORT_2_addr] <= dmem_MPORT_2_data; // @[Core.scala 22:32]
    end
    if (dmem_MPORT_4_en & dmem_MPORT_4_mask) begin
      dmem[dmem_MPORT_4_addr] <= dmem_MPORT_4_data; // @[Core.scala 22:32]
    end
    if (dmem_MPORT_6_en & dmem_MPORT_6_mask) begin
      dmem[dmem_MPORT_6_addr] <= dmem_MPORT_6_data; // @[Core.scala 22:32]
    end
    dmem_dmem_raw_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      dmem_dmem_raw_MPORT_addr_pipe_0 <= _dmem_raw_T[11:0];
    end
    dmem_dmem_raw_MPORT_1_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      dmem_dmem_raw_MPORT_1_addr_pipe_0 <= _dmem_raw_T_5[11:0];
    end
    dmem_dmem_raw_MPORT_2_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      dmem_dmem_raw_MPORT_2_addr_pipe_0 <= _dmem_raw_T_9[11:0];
    end
    dmem_dmem_raw_MPORT_3_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      dmem_dmem_raw_MPORT_3_addr_pipe_0 <= _dmem_raw_T_13[11:0];
    end
    if (regfile_MPORT_8_en & regfile_MPORT_8_mask) begin
      regfile[regfile_MPORT_8_addr] <= regfile_MPORT_8_data; // @[Core.scala 29:27]
    end
    first_time <= reset; // @[Core.scala 25:{31,31} 50:14]
    if (reset) begin // @[Core.scala 26:31]
      pc <= 32'h0; // @[Core.scala 26:31]
    end else if (_pc_next_T_4) begin // @[Mux.scala 101:16]
      pc <= _pc_next_T_6;
    end else if (_pc_next_T_11) begin // @[Mux.scala 101:16]
      pc <= _pc_next_T_6;
    end else if (_pc_next_T_21) begin // @[Mux.scala 101:16]
      pc <= _pc_next_T_6;
    end else begin
      pc <= _pc_next_T_52;
    end
    if (reset) begin // @[Core.scala 27:31]
      pc_next_plus_6 <= 32'h0; // @[Core.scala 27:31]
    end else begin
      pc_next_plus_6 <= _pc_next_plus_6_T_1; // @[Core.scala 52:18]
    end
    if (reset) begin // @[Core.scala 45:31]
      load_ready <= 1'h0; // @[Core.scala 45:31]
    end else begin
      load_ready <= _pc_next_T_37;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {1{`RANDOM}};
  _RAND_2 = {1{`RANDOM}};
  _RAND_3 = {1{`RANDOM}};
  _RAND_4 = {1{`RANDOM}};
  _RAND_5 = {1{`RANDOM}};
  _RAND_6 = {1{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 6144; initvar = initvar+1)
    imem[initvar] = _RAND_0[7:0];
  _RAND_19 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4096; initvar = initvar+1)
    dmem[initvar] = _RAND_19[7:0];
  _RAND_28 = {1{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    regfile[initvar] = _RAND_28[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  imem_instr_MPORT_en_pipe_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  imem_instr_MPORT_addr_pipe_0 = _RAND_8[12:0];
  _RAND_9 = {1{`RANDOM}};
  imem_instr_MPORT_1_en_pipe_0 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  imem_instr_MPORT_1_addr_pipe_0 = _RAND_10[12:0];
  _RAND_11 = {1{`RANDOM}};
  imem_instr_MPORT_2_en_pipe_0 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  imem_instr_MPORT_2_addr_pipe_0 = _RAND_12[12:0];
  _RAND_13 = {1{`RANDOM}};
  imem_instr_MPORT_3_en_pipe_0 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  imem_instr_MPORT_3_addr_pipe_0 = _RAND_14[12:0];
  _RAND_15 = {1{`RANDOM}};
  imem_instr_MPORT_4_en_pipe_0 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  imem_instr_MPORT_4_addr_pipe_0 = _RAND_16[12:0];
  _RAND_17 = {1{`RANDOM}};
  imem_instr_MPORT_5_en_pipe_0 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  imem_instr_MPORT_5_addr_pipe_0 = _RAND_18[12:0];
  _RAND_20 = {1{`RANDOM}};
  dmem_dmem_raw_MPORT_en_pipe_0 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  dmem_dmem_raw_MPORT_addr_pipe_0 = _RAND_21[11:0];
  _RAND_22 = {1{`RANDOM}};
  dmem_dmem_raw_MPORT_1_en_pipe_0 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  dmem_dmem_raw_MPORT_1_addr_pipe_0 = _RAND_23[11:0];
  _RAND_24 = {1{`RANDOM}};
  dmem_dmem_raw_MPORT_2_en_pipe_0 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  dmem_dmem_raw_MPORT_2_addr_pipe_0 = _RAND_25[11:0];
  _RAND_26 = {1{`RANDOM}};
  dmem_dmem_raw_MPORT_3_en_pipe_0 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  dmem_dmem_raw_MPORT_3_addr_pipe_0 = _RAND_27[11:0];
  _RAND_29 = {1{`RANDOM}};
  first_time = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  pc = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  pc_next_plus_6 = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  load_ready = _RAND_32[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
