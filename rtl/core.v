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
  reg [7:0] rateCounter; // @[Uart.scala 26:28]
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
  wire [7:0] _rateCounter_T_1 = rateCounter - 8'h1; // @[Uart.scala 51:34]
  assign io_tx = bitCounter == 4'h0 | bits_0; // @[Uart.scala 30:31]
  assign io_din_ready = bitCounter == 4'h0; // @[Uart.scala 31:26]
  always @(posedge clock) begin
    if (reset) begin // @[Uart.scala 26:28]
      rateCounter <= 8'h0; // @[Uart.scala 26:28]
    end else if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 8'h0) begin // @[Uart.scala 44:31]
        rateCounter <= 8'he9; // @[Uart.scala 49:19]
      end else begin
        rateCounter <= _rateCounter_T_1; // @[Uart.scala 51:19]
      end
    end else if (_io_tx_T & io_din_valid) begin // @[Uart.scala 38:31]
      rateCounter <= 8'he9; // @[Uart.scala 41:17]
    end
    if (reset) begin // @[Uart.scala 27:28]
      bitCounter <= 4'h0; // @[Uart.scala 27:28]
    end else if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 8'h0) begin // @[Uart.scala 44:31]
        bitCounter <= _bitCounter_T_1; // @[Uart.scala 48:18]
      end else begin
        bitCounter <= _GEN_10;
      end
    end else begin
      bitCounter <= _GEN_10;
    end
    if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 8'h0) begin // @[Uart.scala 44:31]
        bits_0 <= bits_1; // @[Uart.scala 47:37]
      end else begin
        bits_0 <= _GEN_0;
      end
    end else begin
      bits_0 <= _GEN_0;
    end
    if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 8'h0) begin // @[Uart.scala 44:31]
        bits_1 <= bits_2; // @[Uart.scala 47:37]
      end else begin
        bits_1 <= _GEN_1;
      end
    end else begin
      bits_1 <= _GEN_1;
    end
    if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 8'h0) begin // @[Uart.scala 44:31]
        bits_2 <= bits_3; // @[Uart.scala 47:37]
      end else begin
        bits_2 <= _GEN_2;
      end
    end else begin
      bits_2 <= _GEN_2;
    end
    if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 8'h0) begin // @[Uart.scala 44:31]
        bits_3 <= bits_4; // @[Uart.scala 47:37]
      end else begin
        bits_3 <= _GEN_3;
      end
    end else begin
      bits_3 <= _GEN_3;
    end
    if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 8'h0) begin // @[Uart.scala 44:31]
        bits_4 <= bits_5; // @[Uart.scala 47:37]
      end else begin
        bits_4 <= _GEN_4;
      end
    end else begin
      bits_4 <= _GEN_4;
    end
    if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 8'h0) begin // @[Uart.scala 44:31]
        bits_5 <= bits_6; // @[Uart.scala 47:37]
      end else begin
        bits_5 <= _GEN_5;
      end
    end else begin
      bits_5 <= _GEN_5;
    end
    if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 8'h0) begin // @[Uart.scala 44:31]
        bits_6 <= bits_7; // @[Uart.scala 47:37]
      end else begin
        bits_6 <= _GEN_6;
      end
    end else begin
      bits_6 <= _GEN_6;
    end
    if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 8'h0) begin // @[Uart.scala 44:31]
        bits_7 <= bits_8; // @[Uart.scala 47:37]
      end else begin
        bits_7 <= _GEN_7;
      end
    end else begin
      bits_7 <= _GEN_7;
    end
    if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 8'h0) begin // @[Uart.scala 44:31]
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
  rateCounter = _RAND_0[7:0];
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
  reg [8:0] rateCounter; // @[Uart.scala 63:28]
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
  wire [8:0] _rateCounter_T_1 = rateCounter - 9'h1; // @[Uart.scala 132:34]
  assign io_dout_valid = outValid; // @[Uart.scala 79:17]
  assign io_dout_bits = outBits; // @[Uart.scala 80:16]
  always @(posedge clock) begin
    if (reset) begin // @[Uart.scala 63:28]
      rateCounter <= 9'h0; // @[Uart.scala 63:28]
    end else if (~running) begin // @[Uart.scala 107:18]
      if (~rxRegs_1 & rxRegs_0) begin // @[Uart.scala 108:35]
        rateCounter <= 9'h15e; // @[Uart.scala 110:19]
      end
    end else if (rateCounter == 9'h0) begin // @[Uart.scala 115:31]
      if (!(bitCounter == 4'h0)) begin // @[Uart.scala 119:32]
        rateCounter <= 9'he9; // @[Uart.scala 128:21]
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
    end else if (rateCounter == 9'h0) begin // @[Uart.scala 115:31]
      if (!(bitCounter == 4'h0)) begin // @[Uart.scala 119:32]
        bitCounter <= _bitCounter_T_1; // @[Uart.scala 129:20]
      end
    end
    if (!(~running)) begin // @[Uart.scala 107:18]
      if (rateCounter == 9'h0) begin // @[Uart.scala 115:31]
        bits_1 <= bits_2; // @[Uart.scala 117:45]
      end
    end
    if (!(~running)) begin // @[Uart.scala 107:18]
      if (rateCounter == 9'h0) begin // @[Uart.scala 115:31]
        bits_2 <= bits_3; // @[Uart.scala 117:45]
      end
    end
    if (!(~running)) begin // @[Uart.scala 107:18]
      if (rateCounter == 9'h0) begin // @[Uart.scala 115:31]
        bits_3 <= bits_4; // @[Uart.scala 117:45]
      end
    end
    if (!(~running)) begin // @[Uart.scala 107:18]
      if (rateCounter == 9'h0) begin // @[Uart.scala 115:31]
        bits_4 <= bits_5; // @[Uart.scala 117:45]
      end
    end
    if (!(~running)) begin // @[Uart.scala 107:18]
      if (rateCounter == 9'h0) begin // @[Uart.scala 115:31]
        bits_5 <= bits_6; // @[Uart.scala 117:45]
      end
    end
    if (!(~running)) begin // @[Uart.scala 107:18]
      if (rateCounter == 9'h0) begin // @[Uart.scala 115:31]
        bits_6 <= bits_7; // @[Uart.scala 117:45]
      end
    end
    if (!(~running)) begin // @[Uart.scala 107:18]
      if (rateCounter == 9'h0) begin // @[Uart.scala 115:31]
        bits_7 <= bits_8; // @[Uart.scala 117:45]
      end
    end
    if (!(~running)) begin // @[Uart.scala 107:18]
      if (rateCounter == 9'h0) begin // @[Uart.scala 115:31]
        bits_8 <= bits_9; // @[Uart.scala 117:45]
      end
    end
    if (!(~running)) begin // @[Uart.scala 107:18]
      if (rateCounter == 9'h0) begin // @[Uart.scala 115:31]
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
    end else if (rateCounter == 9'h0) begin // @[Uart.scala 115:31]
      if (bitCounter == 4'h0) begin // @[Uart.scala 119:32]
        running <= 1'h0; // @[Uart.scala 126:17]
      end
    end
    if (reset) begin // @[Uart.scala 76:25]
      outValid <= 1'h0; // @[Uart.scala 76:25]
    end else if (~running) begin // @[Uart.scala 107:18]
      outValid <= _GEN_0;
    end else if (rateCounter == 9'h0) begin // @[Uart.scala 115:31]
      outValid <= _GEN_4;
    end else begin
      outValid <= _GEN_0;
    end
    if (!(~running)) begin // @[Uart.scala 107:18]
      if (rateCounter == 9'h0) begin // @[Uart.scala 115:31]
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
  rateCounter = _RAND_0[8:0];
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
  input   clock,
  input   reset,
  output  io_tx,
  input   io_rx
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
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [63:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  wire [7:0] alu_io_command; // @[Core.scala 13:19]
  wire [31:0] alu_io_a; // @[Core.scala 13:19]
  wire [31:0] alu_io_b; // @[Core.scala 13:19]
  wire  alu_io_zero; // @[Core.scala 13:19]
  wire [31:0] alu_io_out; // @[Core.scala 13:19]
  wire  ioBus_clock; // @[Core.scala 14:21]
  wire  ioBus_reset; // @[Core.scala 14:21]
  wire [31:0] ioBus_io_devId; // @[Core.scala 14:21]
  wire  ioBus_io_din_ready; // @[Core.scala 14:21]
  wire  ioBus_io_din_valid; // @[Core.scala 14:21]
  wire [7:0] ioBus_io_din_bits; // @[Core.scala 14:21]
  wire  ioBus_io_dout_ready; // @[Core.scala 14:21]
  wire  ioBus_io_dout_valid; // @[Core.scala 14:21]
  wire [7:0] ioBus_io_dout_bits; // @[Core.scala 14:21]
  wire  ioBus_io_tx; // @[Core.scala 14:21]
  wire  ioBus_io_rx; // @[Core.scala 14:21]
  reg [7:0] imem [0:6143]; // @[Core.scala 19:24]
  wire  imem_instr_MPORT_en; // @[Core.scala 19:24]
  wire [12:0] imem_instr_MPORT_addr; // @[Core.scala 19:24]
  wire [7:0] imem_instr_MPORT_data; // @[Core.scala 19:24]
  wire  imem_instr_MPORT_1_en; // @[Core.scala 19:24]
  wire [12:0] imem_instr_MPORT_1_addr; // @[Core.scala 19:24]
  wire [7:0] imem_instr_MPORT_1_data; // @[Core.scala 19:24]
  wire  imem_instr_MPORT_2_en; // @[Core.scala 19:24]
  wire [12:0] imem_instr_MPORT_2_addr; // @[Core.scala 19:24]
  wire [7:0] imem_instr_MPORT_2_data; // @[Core.scala 19:24]
  wire  imem_instr_MPORT_3_en; // @[Core.scala 19:24]
  wire [12:0] imem_instr_MPORT_3_addr; // @[Core.scala 19:24]
  wire [7:0] imem_instr_MPORT_3_data; // @[Core.scala 19:24]
  wire  imem_instr_MPORT_4_en; // @[Core.scala 19:24]
  wire [12:0] imem_instr_MPORT_4_addr; // @[Core.scala 19:24]
  wire [7:0] imem_instr_MPORT_4_data; // @[Core.scala 19:24]
  wire  imem_instr_MPORT_5_en; // @[Core.scala 19:24]
  wire [12:0] imem_instr_MPORT_5_addr; // @[Core.scala 19:24]
  wire [7:0] imem_instr_MPORT_5_data; // @[Core.scala 19:24]
  reg [7:0] dmem [0:4095]; // @[Core.scala 21:24]
  wire  dmem_dmem_raw_MPORT_en; // @[Core.scala 21:24]
  wire [11:0] dmem_dmem_raw_MPORT_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_dmem_raw_MPORT_data; // @[Core.scala 21:24]
  wire  dmem_dmem_raw_MPORT_1_en; // @[Core.scala 21:24]
  wire [11:0] dmem_dmem_raw_MPORT_1_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_dmem_raw_MPORT_1_data; // @[Core.scala 21:24]
  wire  dmem_dmem_raw_MPORT_2_en; // @[Core.scala 21:24]
  wire [11:0] dmem_dmem_raw_MPORT_2_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_dmem_raw_MPORT_2_data; // @[Core.scala 21:24]
  wire  dmem_dmem_raw_MPORT_3_en; // @[Core.scala 21:24]
  wire [11:0] dmem_dmem_raw_MPORT_3_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_dmem_raw_MPORT_3_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_46_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_46_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_46_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_47_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_47_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_47_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_48_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_48_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_48_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_49_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_49_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_49_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_50_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_50_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_50_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_51_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_51_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_51_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_52_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_52_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_52_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_53_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_53_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_53_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_54_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_54_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_54_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_55_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_55_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_55_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_56_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_56_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_56_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_57_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_57_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_57_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_58_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_58_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_58_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_59_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_59_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_59_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_60_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_60_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_60_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_61_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_61_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_61_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_62_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_62_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_62_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_63_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_63_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_63_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_64_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_64_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_64_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_65_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_65_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_65_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_66_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_66_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_66_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_67_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_67_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_67_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_68_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_68_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_68_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_69_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_69_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_69_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_70_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_70_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_70_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_71_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_71_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_71_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_72_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_72_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_72_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_73_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_73_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_73_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_74_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_74_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_74_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_75_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_75_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_75_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_76_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_76_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_76_data; // @[Core.scala 21:24]
  wire  dmem_MPORT_77_en; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_77_addr; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_77_data; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_data; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_addr; // @[Core.scala 21:24]
  wire  dmem_MPORT_mask; // @[Core.scala 21:24]
  wire  dmem_MPORT_en; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_2_data; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_2_addr; // @[Core.scala 21:24]
  wire  dmem_MPORT_2_mask; // @[Core.scala 21:24]
  wire  dmem_MPORT_2_en; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_4_data; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_4_addr; // @[Core.scala 21:24]
  wire  dmem_MPORT_4_mask; // @[Core.scala 21:24]
  wire  dmem_MPORT_4_en; // @[Core.scala 21:24]
  wire [7:0] dmem_MPORT_6_data; // @[Core.scala 21:24]
  wire [11:0] dmem_MPORT_6_addr; // @[Core.scala 21:24]
  wire  dmem_MPORT_6_mask; // @[Core.scala 21:24]
  wire  dmem_MPORT_6_en; // @[Core.scala 21:24]
  reg [31:0] regfile [0:31]; // @[Core.scala 26:24]
  wire  regfile_alu_io_a_MPORT_en; // @[Core.scala 26:24]
  wire [4:0] regfile_alu_io_a_MPORT_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_alu_io_a_MPORT_data; // @[Core.scala 26:24]
  wire  regfile_alu_io_a_MPORT_1_en; // @[Core.scala 26:24]
  wire [4:0] regfile_alu_io_a_MPORT_1_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_alu_io_a_MPORT_1_data; // @[Core.scala 26:24]
  wire  regfile_alu_io_a_MPORT_2_en; // @[Core.scala 26:24]
  wire [4:0] regfile_alu_io_a_MPORT_2_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_alu_io_a_MPORT_2_data; // @[Core.scala 26:24]
  wire  regfile_alu_io_a_MPORT_3_en; // @[Core.scala 26:24]
  wire [4:0] regfile_alu_io_a_MPORT_3_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_alu_io_a_MPORT_3_data; // @[Core.scala 26:24]
  wire  regfile_alu_io_a_MPORT_4_en; // @[Core.scala 26:24]
  wire [4:0] regfile_alu_io_a_MPORT_4_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_alu_io_a_MPORT_4_data; // @[Core.scala 26:24]
  wire  regfile_alu_io_a_MPORT_5_en; // @[Core.scala 26:24]
  wire [4:0] regfile_alu_io_a_MPORT_5_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_alu_io_a_MPORT_5_data; // @[Core.scala 26:24]
  wire  regfile_alu_io_a_MPORT_6_en; // @[Core.scala 26:24]
  wire [4:0] regfile_alu_io_a_MPORT_6_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_alu_io_a_MPORT_6_data; // @[Core.scala 26:24]
  wire  regfile_alu_io_b_MPORT_en; // @[Core.scala 26:24]
  wire [4:0] regfile_alu_io_b_MPORT_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_alu_io_b_MPORT_data; // @[Core.scala 26:24]
  wire  regfile_alu_io_b_MPORT_1_en; // @[Core.scala 26:24]
  wire [4:0] regfile_alu_io_b_MPORT_1_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_alu_io_b_MPORT_1_data; // @[Core.scala 26:24]
  wire  regfile_alu_io_b_MPORT_2_en; // @[Core.scala 26:24]
  wire [4:0] regfile_alu_io_b_MPORT_2_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_alu_io_b_MPORT_2_data; // @[Core.scala 26:24]
  wire  regfile_alu_io_b_MPORT_3_en; // @[Core.scala 26:24]
  wire [4:0] regfile_alu_io_b_MPORT_3_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_alu_io_b_MPORT_3_data; // @[Core.scala 26:24]
  wire  regfile_alu_io_b_MPORT_4_en; // @[Core.scala 26:24]
  wire [4:0] regfile_alu_io_b_MPORT_4_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_alu_io_b_MPORT_4_data; // @[Core.scala 26:24]
  wire  regfile_alu_io_b_MPORT_5_en; // @[Core.scala 26:24]
  wire [4:0] regfile_alu_io_b_MPORT_5_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_alu_io_b_MPORT_5_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_1_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_1_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_1_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_3_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_3_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_3_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_5_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_5_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_5_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_7_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_7_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_7_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_9_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_9_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_9_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_10_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_10_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_10_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_11_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_11_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_11_data; // @[Core.scala 26:24]
  wire  regfile_ioBus_io_dout_bits_MPORT_en; // @[Core.scala 26:24]
  wire [4:0] regfile_ioBus_io_dout_bits_MPORT_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_ioBus_io_dout_bits_MPORT_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_12_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_12_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_12_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_13_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_13_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_13_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_14_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_14_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_14_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_15_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_15_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_15_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_16_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_16_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_16_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_17_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_17_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_17_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_18_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_18_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_18_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_19_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_19_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_19_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_20_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_20_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_20_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_21_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_21_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_21_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_22_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_22_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_22_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_23_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_23_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_23_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_24_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_24_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_24_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_25_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_25_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_25_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_26_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_26_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_26_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_27_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_27_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_27_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_28_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_28_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_28_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_29_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_29_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_29_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_30_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_30_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_30_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_31_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_31_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_31_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_32_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_32_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_32_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_33_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_33_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_33_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_34_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_34_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_34_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_35_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_35_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_35_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_36_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_36_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_36_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_37_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_37_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_37_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_38_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_38_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_38_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_39_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_39_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_39_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_40_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_40_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_40_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_41_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_41_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_41_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_42_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_42_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_42_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_43_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_43_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_43_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_44_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_44_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_44_data; // @[Core.scala 26:24]
  wire  regfile_MPORT_45_en; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_45_addr; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_45_data; // @[Core.scala 26:24]
  wire [31:0] regfile_MPORT_8_data; // @[Core.scala 26:24]
  wire [4:0] regfile_MPORT_8_addr; // @[Core.scala 26:24]
  wire  regfile_MPORT_8_mask; // @[Core.scala 26:24]
  wire  regfile_MPORT_8_en; // @[Core.scala 26:24]
  reg [31:0] pc; // @[Core.scala 24:28]
  reg [31:0] pc_fetching; // @[Core.scala 25:28]
  reg [47:0] instr; // @[Core.scala 28:28]
  wire [4:0] opcode = instr[4:0]; // @[Core.scala 72:22]
  wire  _pc_T = opcode == 5'h6; // @[Core.scala 46:13]
  wire [2:0] opcode_sub = instr[7:5]; // @[Core.scala 73:22]
  wire  _pc_T_1 = opcode_sub == 3'h0; // @[Core.scala 46:40]
  wire  _pc_T_2 = opcode == 5'h6 & opcode_sub == 3'h0; // @[Core.scala 46:26]
  wire  _pc_T_4 = opcode == 5'h6 & opcode_sub == 3'h0 & ~ioBus_io_din_valid; // @[Core.scala 46:53]
  wire  _pc_T_6 = opcode_sub == 3'h1; // @[Core.scala 48:40]
  wire  _pc_T_7 = _pc_T & opcode_sub == 3'h1; // @[Core.scala 48:26]
  wire  _pc_T_9 = _pc_T & opcode_sub == 3'h1 & ~ioBus_io_dout_ready; // @[Core.scala 48:53]
  wire [32:0] _instr_T = {{1'd0}, pc_fetching}; // @[Core.scala 50:67]
  wire [31:0] _instr_T_4 = pc_fetching + 32'h1; // @[Core.scala 50:67]
  wire [31:0] _instr_T_7 = pc_fetching + 32'h2; // @[Core.scala 50:67]
  wire [31:0] _instr_T_10 = pc_fetching + 32'h3; // @[Core.scala 50:67]
  wire [31:0] _instr_T_13 = pc_fetching + 32'h4; // @[Core.scala 50:67]
  wire [31:0] _instr_T_16 = pc_fetching + 32'h5; // @[Core.scala 50:67]
  wire [47:0] _instr_T_18 = {imem_instr_MPORT_5_data,imem_instr_MPORT_4_data,imem_instr_MPORT_3_data,
    imem_instr_MPORT_2_data,imem_instr_MPORT_1_data,imem_instr_MPORT_data}; // @[Cat.scala 33:92]
  wire  _instr_T_19 = opcode == 5'h3; // @[Core.scala 52:13]
  wire [31:0] _pc_fetching_T_1 = pc_fetching + 32'h6; // @[Core.scala 59:39]
  wire  _pc_fetching_T_4 = _instr_T_19 & _pc_T_1; // @[Core.scala 60:26]
  wire  _pc_fetching_T_5 = alu_io_zero; // @[Core.scala 60:68]
  wire  _pc_fetching_T_6 = _instr_T_19 & _pc_T_1 & alu_io_zero; // @[Core.scala 60:53]
  wire [24:0] imm_r = instr[47:23]; // @[Core.scala 81:22]
  wire [6:0] _imm_r_sext_T_2 = imm_r[24] ? 7'h7f : 7'h0; // @[Bitwise.scala 77:12]
  wire [31:0] imm_r_sext = {_imm_r_sext_T_2,imm_r}; // @[Cat.scala 33:92]
  wire [31:0] _pc_fetching_T_8 = pc + imm_r_sext; // @[Core.scala 60:88]
  wire  _pc_fetching_T_11 = _instr_T_19 & _pc_T_6; // @[Core.scala 61:26]
  wire  _pc_fetching_T_13 = _instr_T_19 & _pc_T_6 & ~alu_io_zero; // @[Core.scala 61:53]
  wire  _pc_fetching_T_18 = _instr_T_19 & opcode_sub == 3'h3; // @[Core.scala 62:26]
  wire  _pc_fetching_T_23 = _instr_T_19 & opcode_sub == 3'h3 & (alu_io_out[31] | _pc_fetching_T_5); // @[Core.scala 62:53]
  wire  _pc_fetching_T_27 = opcode_sub == 3'h2; // @[Core.scala 63:40]
  wire  _pc_fetching_T_28 = _instr_T_19 & opcode_sub == 3'h2; // @[Core.scala 63:26]
  wire  _pc_fetching_T_31 = _instr_T_19 & opcode_sub == 3'h2 & alu_io_out[31]; // @[Core.scala 63:53]
  wire [31:0] _pc_fetching_T_44 = _pc_T_9 ? pc_fetching : _pc_fetching_T_1; // @[Mux.scala 101:16]
  wire [31:0] _pc_fetching_T_45 = _pc_T_4 ? pc_fetching : _pc_fetching_T_44; // @[Mux.scala 101:16]
  wire [31:0] _pc_fetching_T_46 = _pc_fetching_T_31 ? _pc_fetching_T_8 : _pc_fetching_T_45; // @[Mux.scala 101:16]
  wire [4:0] rd = instr[12:8]; // @[Core.scala 74:22]
  wire [4:0] rs1 = instr[17:13]; // @[Core.scala 75:22]
  wire [4:0] rs1_i = {2'h0,instr[15:13]}; // @[Cat.scala 33:92]
  wire [31:0] imm = instr[47:16]; // @[Core.scala 80:22]
  wire  _command_T = opcode == 5'h1; // @[Core.scala 87:13]
  wire  _command_T_2 = opcode == 5'h1 & _pc_T_6; // @[Core.scala 87:26]
  wire  _command_T_5 = _command_T & _pc_fetching_T_27; // @[Core.scala 88:26]
  wire  _command_T_6 = opcode == 5'h2; // @[Core.scala 90:13]
  wire  _command_T_8 = opcode == 5'h2 & _pc_T_6; // @[Core.scala 90:26]
  wire  _command_T_11 = _command_T_6 & _pc_fetching_T_27; // @[Core.scala 91:26]
  wire  _command_T_26 = opcode == 5'h4 & _pc_T_1; // @[Core.scala 98:26]
  wire  _command_T_27 = opcode == 5'h5; // @[Core.scala 100:13]
  wire  _command_T_29 = opcode == 5'h5 & _pc_T_1; // @[Core.scala 100:26]
  wire [7:0] _command_T_36 = _pc_T_7 ? 8'h1 : 8'h0; // @[Mux.scala 101:16]
  wire [7:0] _command_T_37 = _pc_T_2 ? 8'h1 : _command_T_36; // @[Mux.scala 101:16]
  wire [7:0] _command_T_38 = _command_T_29 ? 8'h1 : _command_T_37; // @[Mux.scala 101:16]
  wire [7:0] _command_T_39 = _command_T_26 ? 8'h1 : _command_T_38; // @[Mux.scala 101:16]
  wire [7:0] _command_T_40 = _pc_fetching_T_18 ? 8'h2 : _command_T_39; // @[Mux.scala 101:16]
  wire [7:0] _command_T_41 = _pc_fetching_T_28 ? 8'h2 : _command_T_40; // @[Mux.scala 101:16]
  wire [7:0] _command_T_42 = _pc_fetching_T_11 ? 8'h2 : _command_T_41; // @[Mux.scala 101:16]
  wire [7:0] _command_T_43 = _pc_fetching_T_4 ? 8'h2 : _command_T_42; // @[Mux.scala 101:16]
  wire [7:0] _command_T_44 = _command_T_11 ? 8'h2 : _command_T_43; // @[Mux.scala 101:16]
  wire [7:0] _command_T_45 = _command_T_8 ? 8'h1 : _command_T_44; // @[Mux.scala 101:16]
  wire [7:0] _command_T_46 = _command_T_5 ? 8'h2 : _command_T_45; // @[Mux.scala 101:16]
  wire [7:0] command = _command_T_2 ? 8'h1 : _command_T_46; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_a_T_18 = _pc_T_7 ? regfile_alu_io_a_MPORT_6_data : regfile_alu_io_a_MPORT_data; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_a_T_19 = _pc_T_2 ? regfile_alu_io_a_MPORT_5_data : _alu_io_a_T_18; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_a_T_20 = _command_T_29 ? regfile_alu_io_a_MPORT_4_data : _alu_io_a_T_19; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_a_T_21 = _command_T_26 ? regfile_alu_io_a_MPORT_3_data : _alu_io_a_T_20; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_a_T_22 = _command_T_11 ? regfile_alu_io_a_MPORT_2_data : _alu_io_a_T_21; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_36 = _pc_T_7 ? imm : 32'h0; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_37 = _pc_T_2 ? imm : _alu_io_b_T_36; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_38 = _command_T_29 ? imm : _alu_io_b_T_37; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_39 = _command_T_26 ? imm : _alu_io_b_T_38; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_40 = _pc_fetching_T_18 ? regfile_alu_io_b_MPORT_5_data : _alu_io_b_T_39; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_41 = _pc_fetching_T_28 ? regfile_alu_io_b_MPORT_4_data : _alu_io_b_T_40; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_42 = _pc_fetching_T_11 ? regfile_alu_io_b_MPORT_3_data : _alu_io_b_T_41; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_43 = _pc_fetching_T_4 ? regfile_alu_io_b_MPORT_2_data : _alu_io_b_T_42; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_44 = _command_T_11 ? imm : _alu_io_b_T_43; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_45 = _command_T_8 ? imm : _alu_io_b_T_44; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_46 = _command_T_5 ? regfile_alu_io_b_MPORT_1_data : _alu_io_b_T_45; // @[Mux.scala 101:16]
  wire [32:0] _dmem_raw_T = {{1'd0}, alu_io_out}; // @[Core.scala 160:47]
  wire [31:0] _dmem_raw_T_4 = alu_io_out + 32'h1; // @[Core.scala 160:47]
  wire [31:0] _dmem_raw_T_7 = alu_io_out + 32'h2; // @[Core.scala 160:47]
  wire [31:0] _dmem_raw_T_10 = alu_io_out + 32'h3; // @[Core.scala 160:47]
  wire [31:0] dmem_raw = {dmem_dmem_raw_MPORT_3_data,dmem_dmem_raw_MPORT_2_data,dmem_dmem_raw_MPORT_1_data,
    dmem_dmem_raw_MPORT_data}; // @[Cat.scala 33:92]
  wire  _T_19 = rd == 5'h0; // @[Core.scala 170:9]
  wire [31:0] _T_24 = pc + 32'h6; // @[Core.scala 172:61]
  wire  _T_49 = _pc_T_2 & ioBus_io_din_valid; // @[Core.scala 180:53]
  wire [31:0] _T_58 = _pc_T_7 ? regfile_MPORT_11_data : alu_io_out; // @[Mux.scala 101:16]
  wire [31:0] _T_59 = _pc_T_4 ? regfile_MPORT_10_data : _T_58; // @[Mux.scala 101:16]
  wire [31:0] _T_60 = _T_49 ? {{24'd0}, ioBus_io_din_bits} : _T_59; // @[Mux.scala 101:16]
  wire [31:0] _T_61 = _command_T_29 ? regfile_MPORT_9_data : _T_60; // @[Mux.scala 101:16]
  wire [31:0] _T_62 = _command_T_26 ? dmem_raw : _T_61; // @[Mux.scala 101:16]
  wire [31:0] _T_63 = _pc_fetching_T_18 ? _T_24 : _T_62; // @[Mux.scala 101:16]
  wire [31:0] _T_64 = _pc_fetching_T_28 ? _T_24 : _T_63; // @[Mux.scala 101:16]
  wire [31:0] _T_65 = _pc_fetching_T_11 ? _T_24 : _T_64; // @[Mux.scala 101:16]
  wire [31:0] _T_66 = _pc_fetching_T_4 ? _T_24 : _T_65; // @[Mux.scala 101:16]
  wire  _T_69 = ~reset; // @[Core.scala 199:9]
  wire [31:0] _T_168 = {dmem_MPORT_49_data,dmem_MPORT_48_data,dmem_MPORT_47_data,dmem_MPORT_46_data}; // @[Cat.scala 33:92]
  wire [31:0] _T_171 = {dmem_MPORT_53_data,dmem_MPORT_52_data,dmem_MPORT_51_data,dmem_MPORT_50_data}; // @[Cat.scala 33:92]
  wire [31:0] _T_174 = {dmem_MPORT_57_data,dmem_MPORT_56_data,dmem_MPORT_55_data,dmem_MPORT_54_data}; // @[Cat.scala 33:92]
  wire [31:0] _T_177 = {dmem_MPORT_61_data,dmem_MPORT_60_data,dmem_MPORT_59_data,dmem_MPORT_58_data}; // @[Cat.scala 33:92]
  wire [31:0] _T_180 = {dmem_MPORT_65_data,dmem_MPORT_64_data,dmem_MPORT_63_data,dmem_MPORT_62_data}; // @[Cat.scala 33:92]
  wire [31:0] _T_183 = {dmem_MPORT_69_data,dmem_MPORT_68_data,dmem_MPORT_67_data,dmem_MPORT_66_data}; // @[Cat.scala 33:92]
  wire [31:0] _T_186 = {dmem_MPORT_73_data,dmem_MPORT_72_data,dmem_MPORT_71_data,dmem_MPORT_70_data}; // @[Cat.scala 33:92]
  wire [31:0] _T_189 = {dmem_MPORT_77_data,dmem_MPORT_76_data,dmem_MPORT_75_data,dmem_MPORT_74_data}; // @[Cat.scala 33:92]
  Alu alu ( // @[Core.scala 13:19]
    .io_command(alu_io_command),
    .io_a(alu_io_a),
    .io_b(alu_io_b),
    .io_zero(alu_io_zero),
    .io_out(alu_io_out)
  );
  IOBus ioBus ( // @[Core.scala 14:21]
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
  assign imem_instr_MPORT_en = 1'h1;
  assign imem_instr_MPORT_addr = _instr_T[12:0];
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_data = imem[imem_instr_MPORT_addr]; // @[Core.scala 19:24]
  `else
  assign imem_instr_MPORT_data = imem_instr_MPORT_addr >= 13'h1800 ? _RAND_1[7:0] : imem[imem_instr_MPORT_addr]; // @[Core.scala 19:24]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_1_en = 1'h1;
  assign imem_instr_MPORT_1_addr = _instr_T_4[12:0];
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_1_data = imem[imem_instr_MPORT_1_addr]; // @[Core.scala 19:24]
  `else
  assign imem_instr_MPORT_1_data = imem_instr_MPORT_1_addr >= 13'h1800 ? _RAND_2[7:0] : imem[imem_instr_MPORT_1_addr]; // @[Core.scala 19:24]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_2_en = 1'h1;
  assign imem_instr_MPORT_2_addr = _instr_T_7[12:0];
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_2_data = imem[imem_instr_MPORT_2_addr]; // @[Core.scala 19:24]
  `else
  assign imem_instr_MPORT_2_data = imem_instr_MPORT_2_addr >= 13'h1800 ? _RAND_3[7:0] : imem[imem_instr_MPORT_2_addr]; // @[Core.scala 19:24]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_3_en = 1'h1;
  assign imem_instr_MPORT_3_addr = _instr_T_10[12:0];
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_3_data = imem[imem_instr_MPORT_3_addr]; // @[Core.scala 19:24]
  `else
  assign imem_instr_MPORT_3_data = imem_instr_MPORT_3_addr >= 13'h1800 ? _RAND_4[7:0] : imem[imem_instr_MPORT_3_addr]; // @[Core.scala 19:24]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_4_en = 1'h1;
  assign imem_instr_MPORT_4_addr = _instr_T_13[12:0];
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_4_data = imem[imem_instr_MPORT_4_addr]; // @[Core.scala 19:24]
  `else
  assign imem_instr_MPORT_4_data = imem_instr_MPORT_4_addr >= 13'h1800 ? _RAND_5[7:0] : imem[imem_instr_MPORT_4_addr]; // @[Core.scala 19:24]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_5_en = 1'h1;
  assign imem_instr_MPORT_5_addr = _instr_T_16[12:0];
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_5_data = imem[imem_instr_MPORT_5_addr]; // @[Core.scala 19:24]
  `else
  assign imem_instr_MPORT_5_data = imem_instr_MPORT_5_addr >= 13'h1800 ? _RAND_6[7:0] : imem[imem_instr_MPORT_5_addr]; // @[Core.scala 19:24]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign dmem_dmem_raw_MPORT_en = 1'h1;
  assign dmem_dmem_raw_MPORT_addr = _dmem_raw_T[11:0];
  assign dmem_dmem_raw_MPORT_data = dmem[dmem_dmem_raw_MPORT_addr]; // @[Core.scala 21:24]
  assign dmem_dmem_raw_MPORT_1_en = 1'h1;
  assign dmem_dmem_raw_MPORT_1_addr = _dmem_raw_T_4[11:0];
  assign dmem_dmem_raw_MPORT_1_data = dmem[dmem_dmem_raw_MPORT_1_addr]; // @[Core.scala 21:24]
  assign dmem_dmem_raw_MPORT_2_en = 1'h1;
  assign dmem_dmem_raw_MPORT_2_addr = _dmem_raw_T_7[11:0];
  assign dmem_dmem_raw_MPORT_2_data = dmem[dmem_dmem_raw_MPORT_2_addr]; // @[Core.scala 21:24]
  assign dmem_dmem_raw_MPORT_3_en = 1'h1;
  assign dmem_dmem_raw_MPORT_3_addr = _dmem_raw_T_10[11:0];
  assign dmem_dmem_raw_MPORT_3_data = dmem[dmem_dmem_raw_MPORT_3_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_46_en = 1'h1;
  assign dmem_MPORT_46_addr = 12'h0;
  assign dmem_MPORT_46_data = dmem[dmem_MPORT_46_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_47_en = 1'h1;
  assign dmem_MPORT_47_addr = 12'h1;
  assign dmem_MPORT_47_data = dmem[dmem_MPORT_47_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_48_en = 1'h1;
  assign dmem_MPORT_48_addr = 12'h2;
  assign dmem_MPORT_48_data = dmem[dmem_MPORT_48_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_49_en = 1'h1;
  assign dmem_MPORT_49_addr = 12'h3;
  assign dmem_MPORT_49_data = dmem[dmem_MPORT_49_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_50_en = 1'h1;
  assign dmem_MPORT_50_addr = 12'h4;
  assign dmem_MPORT_50_data = dmem[dmem_MPORT_50_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_51_en = 1'h1;
  assign dmem_MPORT_51_addr = 12'h5;
  assign dmem_MPORT_51_data = dmem[dmem_MPORT_51_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_52_en = 1'h1;
  assign dmem_MPORT_52_addr = 12'h6;
  assign dmem_MPORT_52_data = dmem[dmem_MPORT_52_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_53_en = 1'h1;
  assign dmem_MPORT_53_addr = 12'h7;
  assign dmem_MPORT_53_data = dmem[dmem_MPORT_53_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_54_en = 1'h1;
  assign dmem_MPORT_54_addr = 12'h8;
  assign dmem_MPORT_54_data = dmem[dmem_MPORT_54_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_55_en = 1'h1;
  assign dmem_MPORT_55_addr = 12'h9;
  assign dmem_MPORT_55_data = dmem[dmem_MPORT_55_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_56_en = 1'h1;
  assign dmem_MPORT_56_addr = 12'ha;
  assign dmem_MPORT_56_data = dmem[dmem_MPORT_56_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_57_en = 1'h1;
  assign dmem_MPORT_57_addr = 12'hb;
  assign dmem_MPORT_57_data = dmem[dmem_MPORT_57_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_58_en = 1'h1;
  assign dmem_MPORT_58_addr = 12'hc;
  assign dmem_MPORT_58_data = dmem[dmem_MPORT_58_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_59_en = 1'h1;
  assign dmem_MPORT_59_addr = 12'hd;
  assign dmem_MPORT_59_data = dmem[dmem_MPORT_59_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_60_en = 1'h1;
  assign dmem_MPORT_60_addr = 12'he;
  assign dmem_MPORT_60_data = dmem[dmem_MPORT_60_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_61_en = 1'h1;
  assign dmem_MPORT_61_addr = 12'hf;
  assign dmem_MPORT_61_data = dmem[dmem_MPORT_61_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_62_en = 1'h1;
  assign dmem_MPORT_62_addr = 12'h10;
  assign dmem_MPORT_62_data = dmem[dmem_MPORT_62_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_63_en = 1'h1;
  assign dmem_MPORT_63_addr = 12'h11;
  assign dmem_MPORT_63_data = dmem[dmem_MPORT_63_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_64_en = 1'h1;
  assign dmem_MPORT_64_addr = 12'h12;
  assign dmem_MPORT_64_data = dmem[dmem_MPORT_64_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_65_en = 1'h1;
  assign dmem_MPORT_65_addr = 12'h13;
  assign dmem_MPORT_65_data = dmem[dmem_MPORT_65_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_66_en = 1'h1;
  assign dmem_MPORT_66_addr = 12'h14;
  assign dmem_MPORT_66_data = dmem[dmem_MPORT_66_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_67_en = 1'h1;
  assign dmem_MPORT_67_addr = 12'h15;
  assign dmem_MPORT_67_data = dmem[dmem_MPORT_67_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_68_en = 1'h1;
  assign dmem_MPORT_68_addr = 12'h16;
  assign dmem_MPORT_68_data = dmem[dmem_MPORT_68_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_69_en = 1'h1;
  assign dmem_MPORT_69_addr = 12'h17;
  assign dmem_MPORT_69_data = dmem[dmem_MPORT_69_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_70_en = 1'h1;
  assign dmem_MPORT_70_addr = 12'h18;
  assign dmem_MPORT_70_data = dmem[dmem_MPORT_70_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_71_en = 1'h1;
  assign dmem_MPORT_71_addr = 12'h19;
  assign dmem_MPORT_71_data = dmem[dmem_MPORT_71_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_72_en = 1'h1;
  assign dmem_MPORT_72_addr = 12'h1a;
  assign dmem_MPORT_72_data = dmem[dmem_MPORT_72_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_73_en = 1'h1;
  assign dmem_MPORT_73_addr = 12'h1b;
  assign dmem_MPORT_73_data = dmem[dmem_MPORT_73_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_74_en = 1'h1;
  assign dmem_MPORT_74_addr = 12'h1c;
  assign dmem_MPORT_74_data = dmem[dmem_MPORT_74_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_75_en = 1'h1;
  assign dmem_MPORT_75_addr = 12'h1d;
  assign dmem_MPORT_75_data = dmem[dmem_MPORT_75_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_76_en = 1'h1;
  assign dmem_MPORT_76_addr = 12'h1e;
  assign dmem_MPORT_76_data = dmem[dmem_MPORT_76_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_77_en = 1'h1;
  assign dmem_MPORT_77_addr = 12'h1f;
  assign dmem_MPORT_77_data = dmem[dmem_MPORT_77_addr]; // @[Core.scala 21:24]
  assign dmem_MPORT_data = regfile_MPORT_1_data[7:0];
  assign dmem_MPORT_addr = _dmem_raw_T[11:0];
  assign dmem_MPORT_mask = 1'h1;
  assign dmem_MPORT_en = _command_T_27 & _pc_T_1;
  assign dmem_MPORT_2_data = regfile_MPORT_3_data[15:8];
  assign dmem_MPORT_2_addr = _dmem_raw_T_4[11:0];
  assign dmem_MPORT_2_mask = 1'h1;
  assign dmem_MPORT_2_en = _command_T_27 & _pc_T_1;
  assign dmem_MPORT_4_data = regfile_MPORT_5_data[23:16];
  assign dmem_MPORT_4_addr = _dmem_raw_T_7[11:0];
  assign dmem_MPORT_4_mask = 1'h1;
  assign dmem_MPORT_4_en = _command_T_27 & _pc_T_1;
  assign dmem_MPORT_6_data = regfile_MPORT_7_data[31:24];
  assign dmem_MPORT_6_addr = _dmem_raw_T_10[11:0];
  assign dmem_MPORT_6_mask = 1'h1;
  assign dmem_MPORT_6_en = _command_T_27 & _pc_T_1;
  assign regfile_alu_io_a_MPORT_en = 1'h1;
  assign regfile_alu_io_a_MPORT_addr = instr[17:13];
  assign regfile_alu_io_a_MPORT_data = regfile[regfile_alu_io_a_MPORT_addr]; // @[Core.scala 26:24]
  assign regfile_alu_io_a_MPORT_1_en = 1'h1;
  assign regfile_alu_io_a_MPORT_1_addr = {2'h0,instr[15:13]};
  assign regfile_alu_io_a_MPORT_1_data = regfile[regfile_alu_io_a_MPORT_1_addr]; // @[Core.scala 26:24]
  assign regfile_alu_io_a_MPORT_2_en = 1'h1;
  assign regfile_alu_io_a_MPORT_2_addr = {2'h0,instr[15:13]};
  assign regfile_alu_io_a_MPORT_2_data = regfile[regfile_alu_io_a_MPORT_2_addr]; // @[Core.scala 26:24]
  assign regfile_alu_io_a_MPORT_3_en = 1'h1;
  assign regfile_alu_io_a_MPORT_3_addr = {2'h0,instr[15:13]};
  assign regfile_alu_io_a_MPORT_3_data = regfile[regfile_alu_io_a_MPORT_3_addr]; // @[Core.scala 26:24]
  assign regfile_alu_io_a_MPORT_4_en = 1'h1;
  assign regfile_alu_io_a_MPORT_4_addr = {2'h0,instr[15:13]};
  assign regfile_alu_io_a_MPORT_4_data = regfile[regfile_alu_io_a_MPORT_4_addr]; // @[Core.scala 26:24]
  assign regfile_alu_io_a_MPORT_5_en = 1'h1;
  assign regfile_alu_io_a_MPORT_5_addr = {2'h0,instr[15:13]};
  assign regfile_alu_io_a_MPORT_5_data = regfile[regfile_alu_io_a_MPORT_5_addr]; // @[Core.scala 26:24]
  assign regfile_alu_io_a_MPORT_6_en = 1'h1;
  assign regfile_alu_io_a_MPORT_6_addr = {2'h0,instr[15:13]};
  assign regfile_alu_io_a_MPORT_6_data = regfile[regfile_alu_io_a_MPORT_6_addr]; // @[Core.scala 26:24]
  assign regfile_alu_io_b_MPORT_en = 1'h1;
  assign regfile_alu_io_b_MPORT_addr = instr[22:18];
  assign regfile_alu_io_b_MPORT_data = regfile[regfile_alu_io_b_MPORT_addr]; // @[Core.scala 26:24]
  assign regfile_alu_io_b_MPORT_1_en = 1'h1;
  assign regfile_alu_io_b_MPORT_1_addr = instr[22:18];
  assign regfile_alu_io_b_MPORT_1_data = regfile[regfile_alu_io_b_MPORT_1_addr]; // @[Core.scala 26:24]
  assign regfile_alu_io_b_MPORT_2_en = 1'h1;
  assign regfile_alu_io_b_MPORT_2_addr = instr[22:18];
  assign regfile_alu_io_b_MPORT_2_data = regfile[regfile_alu_io_b_MPORT_2_addr]; // @[Core.scala 26:24]
  assign regfile_alu_io_b_MPORT_3_en = 1'h1;
  assign regfile_alu_io_b_MPORT_3_addr = instr[22:18];
  assign regfile_alu_io_b_MPORT_3_data = regfile[regfile_alu_io_b_MPORT_3_addr]; // @[Core.scala 26:24]
  assign regfile_alu_io_b_MPORT_4_en = 1'h1;
  assign regfile_alu_io_b_MPORT_4_addr = instr[22:18];
  assign regfile_alu_io_b_MPORT_4_data = regfile[regfile_alu_io_b_MPORT_4_addr]; // @[Core.scala 26:24]
  assign regfile_alu_io_b_MPORT_5_en = 1'h1;
  assign regfile_alu_io_b_MPORT_5_addr = instr[22:18];
  assign regfile_alu_io_b_MPORT_5_data = regfile[regfile_alu_io_b_MPORT_5_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_1_en = _command_T_27 & _pc_T_1;
  assign regfile_MPORT_1_addr = instr[12:8];
  assign regfile_MPORT_1_data = regfile[regfile_MPORT_1_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_3_en = _command_T_27 & _pc_T_1;
  assign regfile_MPORT_3_addr = instr[12:8];
  assign regfile_MPORT_3_data = regfile[regfile_MPORT_3_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_5_en = _command_T_27 & _pc_T_1;
  assign regfile_MPORT_5_addr = instr[12:8];
  assign regfile_MPORT_5_data = regfile[regfile_MPORT_5_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_7_en = _command_T_27 & _pc_T_1;
  assign regfile_MPORT_7_addr = instr[12:8];
  assign regfile_MPORT_7_data = regfile[regfile_MPORT_7_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_9_en = 1'h1;
  assign regfile_MPORT_9_addr = instr[12:8];
  assign regfile_MPORT_9_data = regfile[regfile_MPORT_9_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_10_en = 1'h1;
  assign regfile_MPORT_10_addr = instr[12:8];
  assign regfile_MPORT_10_data = regfile[regfile_MPORT_10_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_11_en = 1'h1;
  assign regfile_MPORT_11_addr = instr[12:8];
  assign regfile_MPORT_11_data = regfile[regfile_MPORT_11_addr]; // @[Core.scala 26:24]
  assign regfile_ioBus_io_dout_bits_MPORT_en = 1'h1;
  assign regfile_ioBus_io_dout_bits_MPORT_addr = instr[12:8];
  assign regfile_ioBus_io_dout_bits_MPORT_data = regfile[regfile_ioBus_io_dout_bits_MPORT_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_12_en = 1'h1;
  assign regfile_MPORT_12_addr = instr[17:13];
  assign regfile_MPORT_12_data = regfile[regfile_MPORT_12_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_13_en = 1'h1;
  assign regfile_MPORT_13_addr = instr[22:18];
  assign regfile_MPORT_13_data = regfile[regfile_MPORT_13_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_14_en = 1'h1;
  assign regfile_MPORT_14_addr = 5'h0;
  assign regfile_MPORT_14_data = regfile[regfile_MPORT_14_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_15_en = 1'h1;
  assign regfile_MPORT_15_addr = 5'h1;
  assign regfile_MPORT_15_data = regfile[regfile_MPORT_15_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_16_en = 1'h1;
  assign regfile_MPORT_16_addr = 5'h2;
  assign regfile_MPORT_16_data = regfile[regfile_MPORT_16_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_17_en = 1'h1;
  assign regfile_MPORT_17_addr = 5'h3;
  assign regfile_MPORT_17_data = regfile[regfile_MPORT_17_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_18_en = 1'h1;
  assign regfile_MPORT_18_addr = 5'h4;
  assign regfile_MPORT_18_data = regfile[regfile_MPORT_18_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_19_en = 1'h1;
  assign regfile_MPORT_19_addr = 5'h5;
  assign regfile_MPORT_19_data = regfile[regfile_MPORT_19_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_20_en = 1'h1;
  assign regfile_MPORT_20_addr = 5'h6;
  assign regfile_MPORT_20_data = regfile[regfile_MPORT_20_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_21_en = 1'h1;
  assign regfile_MPORT_21_addr = 5'h7;
  assign regfile_MPORT_21_data = regfile[regfile_MPORT_21_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_22_en = 1'h1;
  assign regfile_MPORT_22_addr = 5'h8;
  assign regfile_MPORT_22_data = regfile[regfile_MPORT_22_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_23_en = 1'h1;
  assign regfile_MPORT_23_addr = 5'h9;
  assign regfile_MPORT_23_data = regfile[regfile_MPORT_23_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_24_en = 1'h1;
  assign regfile_MPORT_24_addr = 5'ha;
  assign regfile_MPORT_24_data = regfile[regfile_MPORT_24_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_25_en = 1'h1;
  assign regfile_MPORT_25_addr = 5'hb;
  assign regfile_MPORT_25_data = regfile[regfile_MPORT_25_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_26_en = 1'h1;
  assign regfile_MPORT_26_addr = 5'hc;
  assign regfile_MPORT_26_data = regfile[regfile_MPORT_26_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_27_en = 1'h1;
  assign regfile_MPORT_27_addr = 5'hd;
  assign regfile_MPORT_27_data = regfile[regfile_MPORT_27_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_28_en = 1'h1;
  assign regfile_MPORT_28_addr = 5'he;
  assign regfile_MPORT_28_data = regfile[regfile_MPORT_28_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_29_en = 1'h1;
  assign regfile_MPORT_29_addr = 5'hf;
  assign regfile_MPORT_29_data = regfile[regfile_MPORT_29_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_30_en = 1'h1;
  assign regfile_MPORT_30_addr = 5'h10;
  assign regfile_MPORT_30_data = regfile[regfile_MPORT_30_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_31_en = 1'h1;
  assign regfile_MPORT_31_addr = 5'h11;
  assign regfile_MPORT_31_data = regfile[regfile_MPORT_31_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_32_en = 1'h1;
  assign regfile_MPORT_32_addr = 5'h12;
  assign regfile_MPORT_32_data = regfile[regfile_MPORT_32_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_33_en = 1'h1;
  assign regfile_MPORT_33_addr = 5'h13;
  assign regfile_MPORT_33_data = regfile[regfile_MPORT_33_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_34_en = 1'h1;
  assign regfile_MPORT_34_addr = 5'h14;
  assign regfile_MPORT_34_data = regfile[regfile_MPORT_34_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_35_en = 1'h1;
  assign regfile_MPORT_35_addr = 5'h15;
  assign regfile_MPORT_35_data = regfile[regfile_MPORT_35_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_36_en = 1'h1;
  assign regfile_MPORT_36_addr = 5'h16;
  assign regfile_MPORT_36_data = regfile[regfile_MPORT_36_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_37_en = 1'h1;
  assign regfile_MPORT_37_addr = 5'h17;
  assign regfile_MPORT_37_data = regfile[regfile_MPORT_37_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_38_en = 1'h1;
  assign regfile_MPORT_38_addr = 5'h18;
  assign regfile_MPORT_38_data = regfile[regfile_MPORT_38_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_39_en = 1'h1;
  assign regfile_MPORT_39_addr = 5'h19;
  assign regfile_MPORT_39_data = regfile[regfile_MPORT_39_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_40_en = 1'h1;
  assign regfile_MPORT_40_addr = 5'h1a;
  assign regfile_MPORT_40_data = regfile[regfile_MPORT_40_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_41_en = 1'h1;
  assign regfile_MPORT_41_addr = 5'h1b;
  assign regfile_MPORT_41_data = regfile[regfile_MPORT_41_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_42_en = 1'h1;
  assign regfile_MPORT_42_addr = 5'h1c;
  assign regfile_MPORT_42_data = regfile[regfile_MPORT_42_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_43_en = 1'h1;
  assign regfile_MPORT_43_addr = 5'h1d;
  assign regfile_MPORT_43_data = regfile[regfile_MPORT_43_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_44_en = 1'h1;
  assign regfile_MPORT_44_addr = 5'h1e;
  assign regfile_MPORT_44_data = regfile[regfile_MPORT_44_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_45_en = 1'h1;
  assign regfile_MPORT_45_addr = 5'h1f;
  assign regfile_MPORT_45_data = regfile[regfile_MPORT_45_addr]; // @[Core.scala 26:24]
  assign regfile_MPORT_8_data = _T_19 ? 32'h0 : _T_66;
  assign regfile_MPORT_8_addr = instr[12:8];
  assign regfile_MPORT_8_mask = 1'h1;
  assign regfile_MPORT_8_en = 1'h1;
  assign io_tx = ioBus_io_tx; // @[Core.scala 17:9]
  assign alu_io_command = _command_T_2 ? 8'h1 : _command_T_46; // @[Mux.scala 101:16]
  assign alu_io_a = _command_T_8 ? regfile_alu_io_a_MPORT_1_data : _alu_io_a_T_22; // @[Mux.scala 101:16]
  assign alu_io_b = _command_T_2 ? regfile_alu_io_b_MPORT_data : _alu_io_b_T_46; // @[Mux.scala 101:16]
  assign ioBus_clock = clock;
  assign ioBus_reset = reset;
  assign ioBus_io_devId = alu_io_out; // @[Core.scala 186:18]
  assign ioBus_io_din_ready = _pc_T_2 & ioBus_io_din_valid; // @[Core.scala 188:74]
  assign ioBus_io_dout_valid = _pc_T & _pc_T_6; // @[Core.scala 190:47]
  assign ioBus_io_dout_bits = regfile_ioBus_io_dout_bits_MPORT_data[7:0]; // @[Core.scala 191:22]
  assign ioBus_io_rx = io_rx; // @[Core.scala 16:15]
  always @(posedge clock) begin
    if (dmem_MPORT_en & dmem_MPORT_mask) begin
      dmem[dmem_MPORT_addr] <= dmem_MPORT_data; // @[Core.scala 21:24]
    end
    if (dmem_MPORT_2_en & dmem_MPORT_2_mask) begin
      dmem[dmem_MPORT_2_addr] <= dmem_MPORT_2_data; // @[Core.scala 21:24]
    end
    if (dmem_MPORT_4_en & dmem_MPORT_4_mask) begin
      dmem[dmem_MPORT_4_addr] <= dmem_MPORT_4_data; // @[Core.scala 21:24]
    end
    if (dmem_MPORT_6_en & dmem_MPORT_6_mask) begin
      dmem[dmem_MPORT_6_addr] <= dmem_MPORT_6_data; // @[Core.scala 21:24]
    end
    if (regfile_MPORT_8_en & regfile_MPORT_8_mask) begin
      regfile[regfile_MPORT_8_addr] <= regfile_MPORT_8_data; // @[Core.scala 26:24]
    end
    if (reset) begin // @[Core.scala 24:28]
      pc <= 32'h0; // @[Core.scala 24:28]
    end else if (!(_pc_T_4)) begin // @[Mux.scala 101:16]
      if (!(_pc_T_9)) begin // @[Mux.scala 101:16]
        pc <= pc_fetching;
      end
    end
    if (reset) begin // @[Core.scala 25:28]
      pc_fetching <= 32'h0; // @[Core.scala 25:28]
    end else if (_pc_fetching_T_6) begin // @[Mux.scala 101:16]
      pc_fetching <= _pc_fetching_T_8;
    end else if (_pc_fetching_T_13) begin // @[Mux.scala 101:16]
      pc_fetching <= _pc_fetching_T_8;
    end else if (_pc_fetching_T_23) begin // @[Mux.scala 101:16]
      pc_fetching <= _pc_fetching_T_8;
    end else begin
      pc_fetching <= _pc_fetching_T_46;
    end
    if (reset) begin // @[Core.scala 28:28]
      instr <= 48'h0; // @[Core.scala 28:28]
    end else if (_instr_T_19) begin // @[Mux.scala 101:16]
      instr <= 48'h0;
    end else if (!(_pc_T_4)) begin // @[Mux.scala 101:16]
      if (!(_pc_T_9)) begin // @[Mux.scala 101:16]
        instr <= _instr_T_18;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset) begin
          $fwrite(32'h80000002,"pc_fetching : 0x%x\n",pc_fetching); // @[Core.scala 199:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"pc          : 0x%x\n",pc); // @[Core.scala 200:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"instr       : 0x%x\n",instr); // @[Core.scala 201:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"opcode      : 0x%x\n",opcode); // @[Core.scala 202:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"opcode_sub  : 0x%x\n",opcode_sub); // @[Core.scala 203:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"rs1         : 0x%x\n",rs1); // @[Core.scala 204:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"rs1_i       : 0x%x\n",rs1_i); // @[Core.scala 205:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(rs1): 0x%x\n",regfile_MPORT_12_data); // @[Core.scala 206:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(rs2): 0x%x\n",regfile_MPORT_13_data); // @[Core.scala 207:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"imm         : 0x%x\n",imm); // @[Core.scala 208:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"imm_r_sext  : 0x%x\n",imm_r_sext); // @[Core.scala 209:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"command     : 0x%x\n",command); // @[Core.scala 210:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"alu.io.a    : 0x%x\n",alu_io_a); // @[Core.scala 211:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"alu.io.b    : 0x%x\n",alu_io_b); // @[Core.scala 212:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"alu.io.out  : 0x%x\n",alu_io_out); // @[Core.scala 213:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"pc+sext(imm): 0x%x\n",_pc_fetching_T_8); // @[Core.scala 214:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"zero        : 0x%x\n",alu_io_zero); // @[Core.scala 215:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(0)  : 0x%x\n",regfile_MPORT_14_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(1)  : 0x%x\n",regfile_MPORT_15_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(2)  : 0x%x\n",regfile_MPORT_16_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(3)  : 0x%x\n",regfile_MPORT_17_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(4)  : 0x%x\n",regfile_MPORT_18_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(5)  : 0x%x\n",regfile_MPORT_19_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(6)  : 0x%x\n",regfile_MPORT_20_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(7)  : 0x%x\n",regfile_MPORT_21_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(8)  : 0x%x\n",regfile_MPORT_22_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(9)  : 0x%x\n",regfile_MPORT_23_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(10)  : 0x%x\n",regfile_MPORT_24_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(11)  : 0x%x\n",regfile_MPORT_25_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(12)  : 0x%x\n",regfile_MPORT_26_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(13)  : 0x%x\n",regfile_MPORT_27_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(14)  : 0x%x\n",regfile_MPORT_28_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(15)  : 0x%x\n",regfile_MPORT_29_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(16)  : 0x%x\n",regfile_MPORT_30_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(17)  : 0x%x\n",regfile_MPORT_31_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(18)  : 0x%x\n",regfile_MPORT_32_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(19)  : 0x%x\n",regfile_MPORT_33_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(20)  : 0x%x\n",regfile_MPORT_34_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(21)  : 0x%x\n",regfile_MPORT_35_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(22)  : 0x%x\n",regfile_MPORT_36_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(23)  : 0x%x\n",regfile_MPORT_37_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(24)  : 0x%x\n",regfile_MPORT_38_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(25)  : 0x%x\n",regfile_MPORT_39_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(26)  : 0x%x\n",regfile_MPORT_40_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(27)  : 0x%x\n",regfile_MPORT_41_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(28)  : 0x%x\n",regfile_MPORT_42_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(29)  : 0x%x\n",regfile_MPORT_43_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(30)  : 0x%x\n",regfile_MPORT_44_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"regfile(31)  : 0x%x\n",regfile_MPORT_45_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"dmem(%d) : 0x%x\n",1'h0,_T_168); // @[Core.scala 220:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"dmem(%d) : 0x%x\n",3'h4,_T_171); // @[Core.scala 220:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"dmem(%d) : 0x%x\n",4'h8,_T_174); // @[Core.scala 220:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"dmem(%d) : 0x%x\n",4'hc,_T_177); // @[Core.scala 220:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"dmem(%d) : 0x%x\n",5'h10,_T_180); // @[Core.scala 220:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"dmem(%d) : 0x%x\n",5'h14,_T_183); // @[Core.scala 220:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"dmem(%d) : 0x%x\n",5'h18,_T_186); // @[Core.scala 220:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"dmem(%d) : 0x%x\n",5'h1c,_T_189); // @[Core.scala 220:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_69) begin
          $fwrite(32'h80000002,"----------------------\n"); // @[Core.scala 225:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
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
  _RAND_7 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4096; initvar = initvar+1)
    dmem[initvar] = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    regfile[initvar] = _RAND_8[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  pc = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  pc_fetching = _RAND_10[31:0];
  _RAND_11 = {2{`RANDOM}};
  instr = _RAND_11[47:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
