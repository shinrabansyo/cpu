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
  wire  _io_out_T_6 = io_command == 8'h3; // @[Alu.scala 22:17]
  wire [31:0] _io_out_T_7 = io_a & io_b; // @[Alu.scala 22:40]
  wire  _io_out_T_8 = io_command == 8'h4; // @[Alu.scala 23:17]
  wire [31:0] _io_out_T_9 = io_a | io_b; // @[Alu.scala 23:40]
  wire  _io_out_T_10 = io_command == 8'h5; // @[Alu.scala 24:17]
  wire [31:0] _io_out_T_11 = io_a ^ io_b; // @[Alu.scala 24:40]
  wire  _io_out_T_12 = io_command == 8'h6; // @[Alu.scala 25:17]
  wire [31:0] _io_out_T_14 = io_a >> io_b[4:0]; // @[Alu.scala 25:40]
  wire  _io_out_T_15 = io_command == 8'h7; // @[Alu.scala 26:17]
  wire [31:0] _io_out_T_19 = $signed(io_a) >>> io_b[4:0]; // @[Alu.scala 26:62]
  wire  _io_out_T_20 = io_command == 8'h8; // @[Alu.scala 27:17]
  wire [62:0] _GEN_0 = {{31'd0}, io_a}; // @[Alu.scala 27:40]
  wire [62:0] _io_out_T_22 = _GEN_0 << io_b[4:0]; // @[Alu.scala 27:40]
  wire [62:0] _io_out_T_23 = _io_out_T_20 ? _io_out_T_22 : 63'h0; // @[Mux.scala 101:16]
  wire [62:0] _io_out_T_24 = _io_out_T_15 ? {{31'd0}, _io_out_T_19} : _io_out_T_23; // @[Mux.scala 101:16]
  wire [62:0] _io_out_T_25 = _io_out_T_12 ? {{31'd0}, _io_out_T_14} : _io_out_T_24; // @[Mux.scala 101:16]
  wire [62:0] _io_out_T_26 = _io_out_T_10 ? {{31'd0}, _io_out_T_11} : _io_out_T_25; // @[Mux.scala 101:16]
  wire [62:0] _io_out_T_27 = _io_out_T_8 ? {{31'd0}, _io_out_T_9} : _io_out_T_26; // @[Mux.scala 101:16]
  wire [62:0] _io_out_T_28 = _io_out_T_6 ? {{31'd0}, _io_out_T_7} : _io_out_T_27; // @[Mux.scala 101:16]
  wire [62:0] _io_out_T_29 = _io_out_T_3 ? {{31'd0}, _io_out_T_5} : _io_out_T_28; // @[Mux.scala 101:16]
  wire [62:0] _io_out_T_30 = _io_out_T ? {{31'd0}, _io_out_T_2} : _io_out_T_29; // @[Mux.scala 101:16]
  assign io_zero = io_out == 32'h0; // @[Alu.scala 17:22]
  assign io_out = _io_out_T_30[31:0]; // @[Alu.scala 19:10]
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
  wire  _GEN_3 = ~rxRegs_1 & rxRegs_0 | running; // @[Uart.scala 108:35 112:15 73:24]
  wire [7:0] _outBits_T = {bits_8,bits_7,bits_6,bits_5,bits_4,bits_3,bits_2,bits_1}; // @[Cat.scala 33:92]
  wire [3:0] _bitCounter_T_1 = bitCounter - 4'h1; // @[Uart.scala 129:34]
  wire  _GEN_4 = bitCounter == 4'h0 | outValid; // @[Uart.scala 119:32 120:18]
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
    end else if (!(~running)) begin // @[Uart.scala 107:18]
      if (rateCounter == 12'h0) begin // @[Uart.scala 115:31]
        outValid <= _GEN_4;
      end
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
module Spi(
  input        clock,
  input        reset,
  output       io_mosi,
  input        io_miso,
  output       io_sclk,
  output       io_din_ready,
  input        io_din_valid,
  input  [7:0] io_din_bits,
  output       io_dout_valid,
  output [7:0] io_dout_bits,
  output       io_clkshamt_ready,
  input        io_clkshamt_valid,
  input  [2:0] io_clkshamt_bits,
  output [2:0] io_clkshamtO,
  output       io_spiMode_ready,
  input        io_spiMode_valid,
  input  [1:0] io_spiMode_bits,
  output [1:0] io_spiModeO
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
`endif // RANDOMIZE_REG_INIT
  reg  sclk; // @[Spi.scala 24:21]
  reg [8:0] sclkCounter; // @[Spi.scala 25:28]
  reg [2:0] clkshamt; // @[Spi.scala 26:25]
  reg [7:0] shiftReg; // @[Spi.scala 31:25]
  reg [3:0] bitCounter; // @[Spi.scala 32:27]
  reg  busy; // @[Spi.scala 33:21]
  reg  misoBuf; // @[Spi.scala 34:24]
  reg  spiModeReady; // @[Spi.scala 35:29]
  reg  clkshamtReady; // @[Spi.scala 36:30]
  reg  outValid; // @[Spi.scala 37:25]
  reg  cpol; // @[Spi.scala 38:21]
  reg  cpha; // @[Spi.scala 39:21]
  reg  isFirstSclk; // @[Spi.scala 41:28]
  wire  _posedge_T = ~sclk; // @[Spi.scala 59:18]
  wire [7:0] _sclkCounter_T = 8'h1 << clkshamt; // @[Spi.scala 61:27]
  wire [7:0] _sclkCounter_T_2 = _sclkCounter_T - 8'h1; // @[Spi.scala 61:40]
  wire  _GEN_0 = ~(bitCounter == 4'h1 & sclk == cpol & cpha) ? _posedge_T : sclk; // @[Spi.scala 62:60 63:14 24:21]
  wire [8:0] _sclkCounter_T_4 = sclkCounter - 9'h1; // @[Spi.scala 66:34]
  wire  _GEN_1 = sclkCounter == 9'h0 ? 1'h0 : isFirstSclk; // @[Spi.scala 57:31 58:19 41:28]
  wire  _GEN_2 = sclkCounter == 9'h0 & ~sclk; // @[Spi.scala 51:11 57:31 59:15]
  wire  _GEN_3 = sclkCounter == 9'h0 & sclk; // @[Spi.scala 52:11 57:31 60:15]
  wire  _GEN_5 = sclkCounter == 9'h0 ? _GEN_0 : sclk; // @[Spi.scala 24:21 57:31]
  wire  _T_6 = io_spiMode_valid & io_spiMode_ready; // @[Spi.scala 68:33]
  wire  _GEN_6 = ~(io_spiMode_valid & io_spiMode_ready) ? cpol : sclk; // @[Spi.scala 68:55 69:10 24:21]
  wire  _GEN_7 = busy ? _GEN_1 : isFirstSclk; // @[Spi.scala 56:14 41:28]
  wire  posedge_ = busy & _GEN_2; // @[Spi.scala 51:11 56:14]
  wire  negedge_ = busy & _GEN_3; // @[Spi.scala 52:11 56:14]
  wire  _GEN_11 = busy ? _GEN_5 : _GEN_6; // @[Spi.scala 56:14]
  wire  mode_1_2 = cpol ^ cpha; // @[Spi.scala 77:21]
  wire  _io_din_ready_T_1 = bitCounter == 4'h0; // @[Spi.scala 79:54]
  wire  _T_10 = io_clkshamt_valid & io_clkshamt_ready; // @[Spi.scala 87:28]
  wire [2:0] _sclkCounter_T_6 = io_clkshamt_bits + 3'h1; // @[Spi.scala 88:48]
  wire [7:0] _sclkCounter_T_7 = 8'h1 << _sclkCounter_T_6; // @[Spi.scala 88:27]
  wire [7:0] _sclkCounter_T_9 = _sclkCounter_T_7 - 8'h1; // @[Spi.scala 88:56]
  wire [2:0] _sclkCounter_T_11 = clkshamt + 3'h1; // @[Spi.scala 90:40]
  wire [7:0] _sclkCounter_T_12 = 8'h1 << _sclkCounter_T_11; // @[Spi.scala 90:27]
  wire [7:0] _sclkCounter_T_14 = _sclkCounter_T_12 - 8'h1; // @[Spi.scala 90:48]
  wire [7:0] _GEN_12 = io_clkshamt_valid & io_clkshamt_ready ? _sclkCounter_T_9 : _sclkCounter_T_14; // @[Spi.scala 87:50 88:19 90:19]
  wire [7:0] _GEN_13 = io_din_valid & ~busy ? io_din_bits : shiftReg; // @[Spi.scala 81:31 82:14 31:25]
  wire  _GEN_14 = io_din_valid & ~busy | busy; // @[Spi.scala 81:31 83:10 33:21]
  wire [3:0] _GEN_15 = io_din_valid & ~busy ? 4'h8 : bitCounter; // @[Spi.scala 81:31 84:16 32:27]
  wire  _GEN_18 = _T_10 ? 1'h0 : clkshamtReady; // @[Spi.scala 101:48 102:19 36:30]
  wire [1:0] _sclk_T_3 = {io_spiMode_bits[1],io_spiMode_bits[1]}; // @[Cat.scala 33:92]
  wire  _GEN_22 = _T_6 ? 1'h0 : spiModeReady; // @[Spi.scala 107:46 110:18 35:29]
  wire [1:0] _GEN_23 = _T_6 ? _sclk_T_3 : {{1'd0}, _GEN_11}; // @[Spi.scala 107:46 111:10]
  wire [8:0] _shiftReg_T = {shiftReg, 1'h0}; // @[Spi.scala 131:33]
  wire [8:0] _GEN_49 = {{8'd0}, misoBuf}; // @[Spi.scala 131:39]
  wire [8:0] _shiftReg_T_1 = _shiftReg_T | _GEN_49; // @[Spi.scala 131:39]
  wire [3:0] _bitCounter_T_1 = bitCounter - 4'h1; // @[Spi.scala 132:36]
  wire [8:0] _GEN_24 = posedge_ & ~(cpha & isFirstSclk) ? _shiftReg_T_1 : {{1'd0}, _GEN_13}; // @[Spi.scala 129:49 131:20]
  wire [3:0] _GEN_25 = posedge_ & ~(cpha & isFirstSclk) ? _bitCounter_T_1 : _GEN_15; // @[Spi.scala 129:49 132:22]
  wire  _GEN_26 = negedge_ ? io_miso : misoBuf; // @[Spi.scala 134:23 136:19 34:24]
  wire [8:0] _GEN_27 = negedge_ & ~(cpol & isFirstSclk) ? _shiftReg_T_1 : {{1'd0}, _GEN_13}; // @[Spi.scala 140:49 142:20]
  wire [3:0] _GEN_28 = negedge_ & ~(cpol & isFirstSclk) ? _bitCounter_T_1 : _GEN_15; // @[Spi.scala 140:49 143:22]
  wire  _GEN_29 = posedge_ ? io_miso : misoBuf; // @[Spi.scala 145:23 147:19 34:24]
  wire [8:0] _GEN_30 = mode_1_2 ? _GEN_24 : _GEN_27; // @[Spi.scala 127:22]
  wire  _GEN_33 = _io_din_ready_T_1 | _GEN_7; // @[Spi.scala 118:30 119:19]
  wire  _GEN_35 = _io_din_ready_T_1 | outValid; // @[Spi.scala 118:30 121:16]
  wire  _GEN_36 = _io_din_ready_T_1 | _GEN_18; // @[Spi.scala 118:30 122:21]
  wire  _GEN_37 = _io_din_ready_T_1 | _GEN_22; // @[Spi.scala 118:30 123:20]
  wire [8:0] _GEN_38 = _io_din_ready_T_1 ? {{1'd0}, _GEN_13} : _GEN_30; // @[Spi.scala 118:30]
  wire  _GEN_41 = busy ? _GEN_33 : _GEN_7; // @[Spi.scala 117:14]
  wire  _GEN_44 = busy ? _GEN_36 : _GEN_18; // @[Spi.scala 117:14]
  wire  _GEN_45 = busy ? _GEN_37 : _GEN_22; // @[Spi.scala 117:14]
  wire [8:0] _GEN_46 = busy ? _GEN_38 : {{1'd0}, _GEN_13}; // @[Spi.scala 117:14]
  wire [1:0] _GEN_51 = reset ? 2'h0 : _GEN_23; // @[Spi.scala 24:{21,21}]
  wire [8:0] _GEN_52 = reset ? 9'h0 : _GEN_46; // @[Spi.scala 31:{25,25}]
  assign io_mosi = shiftReg[7]; // @[Spi.scala 114:22]
  assign io_sclk = sclk; // @[Spi.scala 55:11]
  assign io_din_ready = io_din_valid & busy & bitCounter == 4'h0; // @[Spi.scala 79:40]
  assign io_dout_valid = outValid; // @[Spi.scala 95:17]
  assign io_dout_bits = shiftReg; // @[Spi.scala 94:16]
  assign io_clkshamt_ready = clkshamtReady; // @[Spi.scala 100:21]
  assign io_clkshamtO = clkshamt; // @[Spi.scala 48:16]
  assign io_spiMode_ready = spiModeReady; // @[Spi.scala 106:20]
  assign io_spiModeO = {cpol,cpha}; // @[Cat.scala 33:92]
  always @(posedge clock) begin
    sclk <= _GEN_51[0]; // @[Spi.scala 24:{21,21}]
    if (reset) begin // @[Spi.scala 25:28]
      sclkCounter <= 9'h0; // @[Spi.scala 25:28]
    end else if (io_din_valid & ~busy) begin // @[Spi.scala 81:31]
      sclkCounter <= {{1'd0}, _GEN_12};
    end else if (busy) begin // @[Spi.scala 56:14]
      if (sclkCounter == 9'h0) begin // @[Spi.scala 57:31]
        sclkCounter <= {{1'd0}, _sclkCounter_T_2}; // @[Spi.scala 61:19]
      end else begin
        sclkCounter <= _sclkCounter_T_4; // @[Spi.scala 66:19]
      end
    end
    if (reset) begin // @[Spi.scala 26:25]
      clkshamt <= 3'h0; // @[Spi.scala 26:25]
    end else if (_T_10) begin // @[Spi.scala 101:48]
      clkshamt <= io_clkshamt_bits; // @[Spi.scala 103:14]
    end
    shiftReg <= _GEN_52[7:0]; // @[Spi.scala 31:{25,25}]
    if (reset) begin // @[Spi.scala 32:27]
      bitCounter <= 4'h0; // @[Spi.scala 32:27]
    end else if (busy) begin // @[Spi.scala 117:14]
      if (_io_din_ready_T_1) begin // @[Spi.scala 118:30]
        bitCounter <= _GEN_15;
      end else if (mode_1_2) begin // @[Spi.scala 127:22]
        bitCounter <= _GEN_25;
      end else begin
        bitCounter <= _GEN_28;
      end
    end else begin
      bitCounter <= _GEN_15;
    end
    if (reset) begin // @[Spi.scala 33:21]
      busy <= 1'h0; // @[Spi.scala 33:21]
    end else if (busy) begin // @[Spi.scala 117:14]
      if (_io_din_ready_T_1) begin // @[Spi.scala 118:30]
        busy <= 1'h0; // @[Spi.scala 120:12]
      end else begin
        busy <= _GEN_14;
      end
    end else begin
      busy <= _GEN_14;
    end
    if (reset) begin // @[Spi.scala 34:24]
      misoBuf <= 1'h0; // @[Spi.scala 34:24]
    end else if (busy) begin // @[Spi.scala 117:14]
      if (!(_io_din_ready_T_1)) begin // @[Spi.scala 118:30]
        if (mode_1_2) begin // @[Spi.scala 127:22]
          misoBuf <= _GEN_26;
        end else begin
          misoBuf <= _GEN_29;
        end
      end
    end
    spiModeReady <= reset | _GEN_45; // @[Spi.scala 35:{29,29}]
    clkshamtReady <= reset | _GEN_44; // @[Spi.scala 36:{30,30}]
    if (reset) begin // @[Spi.scala 37:25]
      outValid <= 1'h0; // @[Spi.scala 37:25]
    end else if (busy) begin // @[Spi.scala 117:14]
      outValid <= _GEN_35;
    end
    if (reset) begin // @[Spi.scala 38:21]
      cpol <= 1'h0; // @[Spi.scala 38:21]
    end else if (_T_6) begin // @[Spi.scala 107:46]
      cpol <= io_spiMode_bits[1]; // @[Spi.scala 108:10]
    end
    if (reset) begin // @[Spi.scala 39:21]
      cpha <= 1'h0; // @[Spi.scala 39:21]
    end else if (_T_6) begin // @[Spi.scala 107:46]
      cpha <= io_spiMode_bits[0]; // @[Spi.scala 109:10]
    end
    isFirstSclk <= reset | _GEN_41; // @[Spi.scala 41:{28,28}]
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
  sclk = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  sclkCounter = _RAND_1[8:0];
  _RAND_2 = {1{`RANDOM}};
  clkshamt = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  shiftReg = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  bitCounter = _RAND_4[3:0];
  _RAND_5 = {1{`RANDOM}};
  busy = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  misoBuf = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  spiModeReady = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  clkshamtReady = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  outValid = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  cpol = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  cpha = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  isFirstSclk = _RAND_12[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module GeneralPurposeOutput(
  input        clock,
  input        reset,
  input        io_din_valid,
  input  [7:0] io_din_bits,
  output [7:0] io_dout,
  output [7:0] io_pinOut
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] pinOutReg; // @[Gpio.scala 15:26]
  assign io_dout = pinOutReg; // @[Gpio.scala 19:11]
  assign io_pinOut = pinOutReg; // @[Gpio.scala 17:13]
  always @(posedge clock) begin
    if (reset) begin // @[Gpio.scala 15:26]
      pinOutReg <= 8'h0; // @[Gpio.scala 15:26]
    end else if (io_din_valid) begin // @[Gpio.scala 21:23]
      pinOutReg <= io_din_bits; // @[Gpio.scala 22:15]
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
  pinOutReg = _RAND_0[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ClkCounter(
  input         clock,
  input         reset,
  output [63:0] io_clkCount,
  output [63:0] io_msCount
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] counter; // @[ClkCounter.scala 17:24]
  wire [63:0] _counter_T_1 = counter + 64'h1; // @[ClkCounter.scala 18:22]
  reg [63:0] msCount; // @[ClkCounter.scala 24:24]
  reg [31:0] msCounter; // @[ClkCounter.scala 25:26]
  wire [63:0] _msCount_T_1 = msCount + 64'h1; // @[ClkCounter.scala 32:24]
  wire [31:0] _msCounter_T_1 = msCounter + 32'h1; // @[ClkCounter.scala 34:28]
  assign io_clkCount = counter; // @[ClkCounter.scala 20:15]
  assign io_msCount = msCount; // @[ClkCounter.scala 28:14]
  always @(posedge clock) begin
    if (reset) begin // @[ClkCounter.scala 17:24]
      counter <= 64'h0; // @[ClkCounter.scala 17:24]
    end else begin
      counter <= _counter_T_1; // @[ClkCounter.scala 18:11]
    end
    if (reset) begin // @[ClkCounter.scala 24:24]
      msCount <= 64'h0; // @[ClkCounter.scala 24:24]
    end else if (msCounter >= 32'h4f1a) begin // @[ClkCounter.scala 30:37]
      msCount <= _msCount_T_1; // @[ClkCounter.scala 32:13]
    end
    if (reset) begin // @[ClkCounter.scala 25:26]
      msCounter <= 32'h0; // @[ClkCounter.scala 25:26]
    end else if (msCounter >= 32'h4f1a) begin // @[ClkCounter.scala 30:37]
      msCounter <= 32'h0; // @[ClkCounter.scala 31:15]
    end else begin
      msCounter <= _msCounter_T_1; // @[ClkCounter.scala 34:15]
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
  _RAND_0 = {2{`RANDOM}};
  counter = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  msCount = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  msCounter = _RAND_2[31:0];
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
  output [31:0] io_din_bits,
  output        io_dout_ready,
  input         io_dout_valid,
  input  [31:0] io_dout_bits,
  output        io_tx,
  input         io_rx,
  output        io_sclk,
  output        io_mosi,
  input         io_miso,
  output [7:0]  io_gpout
);
  wire  uartTx_clock; // @[IOBus.scala 24:23]
  wire  uartTx_reset; // @[IOBus.scala 24:23]
  wire  uartTx_io_tx; // @[IOBus.scala 24:23]
  wire  uartTx_io_din_ready; // @[IOBus.scala 24:23]
  wire  uartTx_io_din_valid; // @[IOBus.scala 24:23]
  wire [7:0] uartTx_io_din_bits; // @[IOBus.scala 24:23]
  wire  uartRx_clock; // @[IOBus.scala 25:23]
  wire  uartRx_reset; // @[IOBus.scala 25:23]
  wire  uartRx_io_dout_valid; // @[IOBus.scala 25:23]
  wire [7:0] uartRx_io_dout_bits; // @[IOBus.scala 25:23]
  wire  uartRx_io_rx; // @[IOBus.scala 25:23]
  wire  spi_clock; // @[IOBus.scala 26:23]
  wire  spi_reset; // @[IOBus.scala 26:23]
  wire  spi_io_mosi; // @[IOBus.scala 26:23]
  wire  spi_io_miso; // @[IOBus.scala 26:23]
  wire  spi_io_sclk; // @[IOBus.scala 26:23]
  wire  spi_io_din_ready; // @[IOBus.scala 26:23]
  wire  spi_io_din_valid; // @[IOBus.scala 26:23]
  wire [7:0] spi_io_din_bits; // @[IOBus.scala 26:23]
  wire  spi_io_dout_valid; // @[IOBus.scala 26:23]
  wire [7:0] spi_io_dout_bits; // @[IOBus.scala 26:23]
  wire  spi_io_clkshamt_ready; // @[IOBus.scala 26:23]
  wire  spi_io_clkshamt_valid; // @[IOBus.scala 26:23]
  wire [2:0] spi_io_clkshamt_bits; // @[IOBus.scala 26:23]
  wire [2:0] spi_io_clkshamtO; // @[IOBus.scala 26:23]
  wire  spi_io_spiMode_ready; // @[IOBus.scala 26:23]
  wire  spi_io_spiMode_valid; // @[IOBus.scala 26:23]
  wire [1:0] spi_io_spiMode_bits; // @[IOBus.scala 26:23]
  wire [1:0] spi_io_spiModeO; // @[IOBus.scala 26:23]
  wire  gpout_clock; // @[IOBus.scala 27:23]
  wire  gpout_reset; // @[IOBus.scala 27:23]
  wire  gpout_io_din_valid; // @[IOBus.scala 27:23]
  wire [7:0] gpout_io_din_bits; // @[IOBus.scala 27:23]
  wire [7:0] gpout_io_dout; // @[IOBus.scala 27:23]
  wire [7:0] gpout_io_pinOut; // @[IOBus.scala 27:23]
  wire  counter_clock; // @[IOBus.scala 28:23]
  wire  counter_reset; // @[IOBus.scala 28:23]
  wire [63:0] counter_io_clkCount; // @[IOBus.scala 28:23]
  wire [63:0] counter_io_msCount; // @[IOBus.scala 28:23]
  wire  isUart = io_devId == 32'h0; // @[IOBus.scala 44:29]
  wire  isSpiData = io_devId == 32'h1; // @[IOBus.scala 45:29]
  wire  isSpiMode = io_devId == 32'h2; // @[IOBus.scala 46:29]
  wire  isSpiCshamt = io_devId == 32'h3; // @[IOBus.scala 47:29]
  wire  isGpout = io_devId == 32'h4; // @[IOBus.scala 48:29]
  wire  isClkCountL = io_devId == 32'h1000; // @[IOBus.scala 49:29]
  wire  isClkCountU = io_devId == 32'h1001; // @[IOBus.scala 50:29]
  wire  isClkFreq = io_devId == 32'h1002; // @[IOBus.scala 51:29]
  wire  isMsCountL = io_devId == 32'h1003; // @[IOBus.scala 52:29]
  wire  isMsCountU = io_devId == 32'h1004; // @[IOBus.scala 53:29]
  wire  _io_din_valid_T = isSpiData ? spi_io_dout_valid : 1'h1; // @[Mux.scala 101:16]
  wire  _io_din_valid_T_1 = isUart ? uartRx_io_dout_valid : _io_din_valid_T; // @[Mux.scala 101:16]
  wire [31:0] _io_din_bits_T_4 = isMsCountU ? counter_io_msCount[63:32] : 32'h0; // @[Mux.scala 101:16]
  wire [31:0] _io_din_bits_T_5 = isMsCountL ? counter_io_msCount[31:0] : _io_din_bits_T_4; // @[Mux.scala 101:16]
  wire [31:0] _io_din_bits_T_6 = isClkFreq ? 32'h134fd90 : _io_din_bits_T_5; // @[Mux.scala 101:16]
  wire [31:0] _io_din_bits_T_7 = isClkCountU ? counter_io_clkCount[63:32] : _io_din_bits_T_6; // @[Mux.scala 101:16]
  wire [31:0] _io_din_bits_T_8 = isClkCountL ? counter_io_clkCount[31:0] : _io_din_bits_T_7; // @[Mux.scala 101:16]
  wire [31:0] _io_din_bits_T_9 = isGpout ? {{24'd0}, gpout_io_dout} : _io_din_bits_T_8; // @[Mux.scala 101:16]
  wire [31:0] _io_din_bits_T_10 = isSpiCshamt ? {{29'd0}, spi_io_clkshamtO} : _io_din_bits_T_9; // @[Mux.scala 101:16]
  wire [31:0] _io_din_bits_T_11 = isSpiMode ? {{30'd0}, spi_io_spiModeO} : _io_din_bits_T_10; // @[Mux.scala 101:16]
  wire [31:0] _io_din_bits_T_12 = isSpiData ? {{24'd0}, spi_io_dout_bits} : _io_din_bits_T_11; // @[Mux.scala 101:16]
  wire [31:0] _io_din_bits_T_13 = isUart ? {{24'd0}, uartRx_io_dout_bits} : _io_din_bits_T_12; // @[Mux.scala 101:16]
  wire  _GEN_2 = isGpout & io_dout_valid; // @[IOBus.scala 114:25 135:27 136:30]
  wire [31:0] _GEN_3 = isGpout ? io_dout_bits : 32'h0; // @[IOBus.scala 120:25 135:27 137:30]
  wire  _GEN_4 = isSpiCshamt & io_dout_valid; // @[IOBus.scala 113:25 132:31 133:29]
  wire [31:0] _GEN_5 = isSpiCshamt ? io_dout_bits : 32'h0; // @[IOBus.scala 119:25 132:31 134:29]
  wire  _GEN_6 = isSpiCshamt ? 1'h0 : _GEN_2; // @[IOBus.scala 114:25 132:31]
  wire [31:0] _GEN_7 = isSpiCshamt ? 32'h0 : _GEN_3; // @[IOBus.scala 120:25 132:31]
  wire  _GEN_8 = isSpiMode & io_dout_valid; // @[IOBus.scala 112:25 129:29 130:28]
  wire [31:0] _GEN_9 = isSpiMode ? io_dout_bits : 32'h0; // @[IOBus.scala 118:25 129:29 131:28]
  wire  _GEN_10 = isSpiMode ? 1'h0 : _GEN_4; // @[IOBus.scala 113:25 129:29]
  wire [31:0] _GEN_11 = isSpiMode ? 32'h0 : _GEN_5; // @[IOBus.scala 119:25 129:29]
  wire  _GEN_12 = isSpiMode ? 1'h0 : _GEN_6; // @[IOBus.scala 114:25 129:29]
  wire [31:0] _GEN_13 = isSpiMode ? 32'h0 : _GEN_7; // @[IOBus.scala 120:25 129:29]
  wire  _GEN_14 = isSpiData & io_dout_valid; // @[IOBus.scala 126:29 127:24 111:25]
  wire [31:0] _GEN_15 = isSpiData ? io_dout_bits : 32'h0; // @[IOBus.scala 126:29 128:24 117:25]
  wire  _GEN_16 = isSpiData ? 1'h0 : _GEN_8; // @[IOBus.scala 112:25 126:29]
  wire [31:0] _GEN_17 = isSpiData ? 32'h0 : _GEN_9; // @[IOBus.scala 118:25 126:29]
  wire  _GEN_18 = isSpiData ? 1'h0 : _GEN_10; // @[IOBus.scala 113:25 126:29]
  wire [31:0] _GEN_19 = isSpiData ? 32'h0 : _GEN_11; // @[IOBus.scala 119:25 126:29]
  wire  _GEN_20 = isSpiData ? 1'h0 : _GEN_12; // @[IOBus.scala 114:25 126:29]
  wire [31:0] _GEN_21 = isSpiData ? 32'h0 : _GEN_13; // @[IOBus.scala 120:25 126:29]
  wire  _GEN_22 = isUart & io_dout_valid; // @[IOBus.scala 123:19 110:25 124:27]
  wire [31:0] _GEN_23 = isUart ? io_dout_bits : 32'h0; // @[IOBus.scala 123:19 116:25 125:27]
  wire  _GEN_24 = isUart ? 1'h0 : _GEN_14; // @[IOBus.scala 123:19 111:25]
  wire [31:0] _GEN_25 = isUart ? 32'h0 : _GEN_15; // @[IOBus.scala 123:19 117:25]
  wire  _GEN_26 = isUart ? 1'h0 : _GEN_16; // @[IOBus.scala 123:19 112:25]
  wire [31:0] _GEN_27 = isUart ? 32'h0 : _GEN_17; // @[IOBus.scala 123:19 118:25]
  wire  _GEN_28 = isUart ? 1'h0 : _GEN_18; // @[IOBus.scala 123:19 113:25]
  wire [31:0] _GEN_29 = isUart ? 32'h0 : _GEN_19; // @[IOBus.scala 123:19 119:25]
  wire  _GEN_30 = isUart ? 1'h0 : _GEN_20; // @[IOBus.scala 123:19 114:25]
  wire [31:0] _GEN_31 = isUart ? 32'h0 : _GEN_21; // @[IOBus.scala 123:19 120:25]
  wire  _io_dout_ready_T_1 = isSpiCshamt ? spi_io_clkshamt_ready : 1'h1; // @[Mux.scala 101:16]
  wire  _io_dout_ready_T_2 = isSpiMode ? spi_io_spiMode_ready : _io_dout_ready_T_1; // @[Mux.scala 101:16]
  wire  _io_dout_ready_T_3 = isSpiData ? spi_io_din_ready : _io_dout_ready_T_2; // @[Mux.scala 101:16]
  wire  _io_dout_ready_T_4 = isUart ? uartTx_io_din_ready : _io_dout_ready_T_3; // @[Mux.scala 101:16]
  wire [31:0] _GEN_33 = io_dout_valid ? _GEN_23 : 32'h0; // @[IOBus.scala 122:21 116:25]
  wire [31:0] _GEN_35 = io_dout_valid ? _GEN_25 : 32'h0; // @[IOBus.scala 122:21 117:25]
  wire [31:0] _GEN_37 = io_dout_valid ? _GEN_27 : 32'h0; // @[IOBus.scala 122:21 118:25]
  wire [31:0] _GEN_39 = io_dout_valid ? _GEN_29 : 32'h0; // @[IOBus.scala 122:21 119:25]
  wire [31:0] _GEN_41 = io_dout_valid ? _GEN_31 : 32'h0; // @[IOBus.scala 122:21 120:25]
  UartTx uartTx ( // @[IOBus.scala 24:23]
    .clock(uartTx_clock),
    .reset(uartTx_reset),
    .io_tx(uartTx_io_tx),
    .io_din_ready(uartTx_io_din_ready),
    .io_din_valid(uartTx_io_din_valid),
    .io_din_bits(uartTx_io_din_bits)
  );
  UartRx uartRx ( // @[IOBus.scala 25:23]
    .clock(uartRx_clock),
    .reset(uartRx_reset),
    .io_dout_valid(uartRx_io_dout_valid),
    .io_dout_bits(uartRx_io_dout_bits),
    .io_rx(uartRx_io_rx)
  );
  Spi spi ( // @[IOBus.scala 26:23]
    .clock(spi_clock),
    .reset(spi_reset),
    .io_mosi(spi_io_mosi),
    .io_miso(spi_io_miso),
    .io_sclk(spi_io_sclk),
    .io_din_ready(spi_io_din_ready),
    .io_din_valid(spi_io_din_valid),
    .io_din_bits(spi_io_din_bits),
    .io_dout_valid(spi_io_dout_valid),
    .io_dout_bits(spi_io_dout_bits),
    .io_clkshamt_ready(spi_io_clkshamt_ready),
    .io_clkshamt_valid(spi_io_clkshamt_valid),
    .io_clkshamt_bits(spi_io_clkshamt_bits),
    .io_clkshamtO(spi_io_clkshamtO),
    .io_spiMode_ready(spi_io_spiMode_ready),
    .io_spiMode_valid(spi_io_spiMode_valid),
    .io_spiMode_bits(spi_io_spiMode_bits),
    .io_spiModeO(spi_io_spiModeO)
  );
  GeneralPurposeOutput gpout ( // @[IOBus.scala 27:23]
    .clock(gpout_clock),
    .reset(gpout_reset),
    .io_din_valid(gpout_io_din_valid),
    .io_din_bits(gpout_io_din_bits),
    .io_dout(gpout_io_dout),
    .io_pinOut(gpout_io_pinOut)
  );
  ClkCounter counter ( // @[IOBus.scala 28:23]
    .clock(counter_clock),
    .reset(counter_reset),
    .io_clkCount(counter_io_clkCount),
    .io_msCount(counter_io_msCount)
  );
  assign io_din_valid = io_din_ready & _io_din_valid_T_1; // @[IOBus.scala 66:20 68:18 92:18]
  assign io_din_bits = io_din_ready ? _io_din_bits_T_13 : 32'h0; // @[IOBus.scala 66:20 73:17 93:17]
  assign io_dout_ready = io_dout_valid & _io_dout_ready_T_4; // @[IOBus.scala 122:21 140:19 148:19]
  assign io_tx = uartTx_io_tx; // @[IOBus.scala 105:12]
  assign io_sclk = spi_io_sclk; // @[IOBus.scala 106:12]
  assign io_mosi = spi_io_mosi; // @[IOBus.scala 107:12]
  assign io_gpout = gpout_io_pinOut; // @[IOBus.scala 108:12]
  assign uartTx_clock = clock;
  assign uartTx_reset = reset;
  assign uartTx_io_din_valid = io_dout_valid & _GEN_22; // @[IOBus.scala 122:21 110:25]
  assign uartTx_io_din_bits = _GEN_33[7:0];
  assign uartRx_clock = clock;
  assign uartRx_reset = reset;
  assign uartRx_io_rx = io_rx; // @[IOBus.scala 63:16]
  assign spi_clock = clock;
  assign spi_reset = reset;
  assign spi_io_miso = io_miso; // @[IOBus.scala 64:16]
  assign spi_io_din_valid = io_dout_valid & _GEN_24; // @[IOBus.scala 122:21 111:25]
  assign spi_io_din_bits = _GEN_35[7:0];
  assign spi_io_clkshamt_valid = io_dout_valid & _GEN_28; // @[IOBus.scala 122:21 113:25]
  assign spi_io_clkshamt_bits = _GEN_39[2:0];
  assign spi_io_spiMode_valid = io_dout_valid & _GEN_26; // @[IOBus.scala 122:21 112:25]
  assign spi_io_spiMode_bits = _GEN_37[1:0];
  assign gpout_clock = clock;
  assign gpout_reset = reset;
  assign gpout_io_din_valid = io_dout_valid & _GEN_30; // @[IOBus.scala 122:21 114:25]
  assign gpout_io_din_bits = _GEN_41[7:0];
  assign counter_clock = clock;
  assign counter_reset = reset;
endmodule
module Core(
  input        clock,
  input        reset,
  output       io_tx,
  input        io_rx,
  output       io_sclk,
  output       io_mosi,
  input        io_miso,
  output [7:0] io_gpout
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
  wire [7:0] alu_io_command; // @[Core.scala 23:19]
  wire [31:0] alu_io_a; // @[Core.scala 23:19]
  wire [31:0] alu_io_b; // @[Core.scala 23:19]
  wire  alu_io_zero; // @[Core.scala 23:19]
  wire [31:0] alu_io_out; // @[Core.scala 23:19]
  wire  ioBus_clock; // @[Core.scala 26:21]
  wire  ioBus_reset; // @[Core.scala 26:21]
  wire [31:0] ioBus_io_devId; // @[Core.scala 26:21]
  wire  ioBus_io_din_ready; // @[Core.scala 26:21]
  wire  ioBus_io_din_valid; // @[Core.scala 26:21]
  wire [31:0] ioBus_io_din_bits; // @[Core.scala 26:21]
  wire  ioBus_io_dout_ready; // @[Core.scala 26:21]
  wire  ioBus_io_dout_valid; // @[Core.scala 26:21]
  wire [31:0] ioBus_io_dout_bits; // @[Core.scala 26:21]
  wire  ioBus_io_tx; // @[Core.scala 26:21]
  wire  ioBus_io_rx; // @[Core.scala 26:21]
  wire  ioBus_io_sclk; // @[Core.scala 26:21]
  wire  ioBus_io_mosi; // @[Core.scala 26:21]
  wire  ioBus_io_miso; // @[Core.scala 26:21]
  wire [7:0] ioBus_io_gpout; // @[Core.scala 26:21]
  reg [7:0] imem [0:6143]; // @[Core.scala 36:32]
  wire  imem_instr_MPORT_en; // @[Core.scala 36:32]
  wire [12:0] imem_instr_MPORT_addr; // @[Core.scala 36:32]
  wire [7:0] imem_instr_MPORT_data; // @[Core.scala 36:32]
  wire  imem_instr_MPORT_1_en; // @[Core.scala 36:32]
  wire [12:0] imem_instr_MPORT_1_addr; // @[Core.scala 36:32]
  wire [7:0] imem_instr_MPORT_1_data; // @[Core.scala 36:32]
  wire  imem_instr_MPORT_2_en; // @[Core.scala 36:32]
  wire [12:0] imem_instr_MPORT_2_addr; // @[Core.scala 36:32]
  wire [7:0] imem_instr_MPORT_2_data; // @[Core.scala 36:32]
  wire  imem_instr_MPORT_3_en; // @[Core.scala 36:32]
  wire [12:0] imem_instr_MPORT_3_addr; // @[Core.scala 36:32]
  wire [7:0] imem_instr_MPORT_3_data; // @[Core.scala 36:32]
  wire  imem_instr_MPORT_4_en; // @[Core.scala 36:32]
  wire [12:0] imem_instr_MPORT_4_addr; // @[Core.scala 36:32]
  wire [7:0] imem_instr_MPORT_4_data; // @[Core.scala 36:32]
  wire  imem_instr_MPORT_5_en; // @[Core.scala 36:32]
  wire [12:0] imem_instr_MPORT_5_addr; // @[Core.scala 36:32]
  wire [7:0] imem_instr_MPORT_5_data; // @[Core.scala 36:32]
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
  reg [7:0] dmem [0:4095]; // @[Core.scala 38:32]
  wire  dmem_dmem_read_data_MPORT_en; // @[Core.scala 38:32]
  wire [11:0] dmem_dmem_read_data_MPORT_addr; // @[Core.scala 38:32]
  wire [7:0] dmem_dmem_read_data_MPORT_data; // @[Core.scala 38:32]
  wire  dmem_dmem_read_data_MPORT_1_en; // @[Core.scala 38:32]
  wire [11:0] dmem_dmem_read_data_MPORT_1_addr; // @[Core.scala 38:32]
  wire [7:0] dmem_dmem_read_data_MPORT_1_data; // @[Core.scala 38:32]
  wire  dmem_dmem_read_data_MPORT_2_en; // @[Core.scala 38:32]
  wire [11:0] dmem_dmem_read_data_MPORT_2_addr; // @[Core.scala 38:32]
  wire [7:0] dmem_dmem_read_data_MPORT_2_data; // @[Core.scala 38:32]
  wire  dmem_dmem_read_data_MPORT_3_en; // @[Core.scala 38:32]
  wire [11:0] dmem_dmem_read_data_MPORT_3_addr; // @[Core.scala 38:32]
  wire [7:0] dmem_dmem_read_data_MPORT_3_data; // @[Core.scala 38:32]
  wire [7:0] dmem_MPORT_data; // @[Core.scala 38:32]
  wire [11:0] dmem_MPORT_addr; // @[Core.scala 38:32]
  wire  dmem_MPORT_mask; // @[Core.scala 38:32]
  wire  dmem_MPORT_en; // @[Core.scala 38:32]
  wire [7:0] dmem_MPORT_2_data; // @[Core.scala 38:32]
  wire [11:0] dmem_MPORT_2_addr; // @[Core.scala 38:32]
  wire  dmem_MPORT_2_mask; // @[Core.scala 38:32]
  wire  dmem_MPORT_2_en; // @[Core.scala 38:32]
  wire [7:0] dmem_MPORT_4_data; // @[Core.scala 38:32]
  wire [11:0] dmem_MPORT_4_addr; // @[Core.scala 38:32]
  wire  dmem_MPORT_4_mask; // @[Core.scala 38:32]
  wire  dmem_MPORT_4_en; // @[Core.scala 38:32]
  wire [7:0] dmem_MPORT_6_data; // @[Core.scala 38:32]
  wire [11:0] dmem_MPORT_6_addr; // @[Core.scala 38:32]
  wire  dmem_MPORT_6_mask; // @[Core.scala 38:32]
  wire  dmem_MPORT_6_en; // @[Core.scala 38:32]
  wire [7:0] dmem_MPORT_8_data; // @[Core.scala 38:32]
  wire [11:0] dmem_MPORT_8_addr; // @[Core.scala 38:32]
  wire  dmem_MPORT_8_mask; // @[Core.scala 38:32]
  wire  dmem_MPORT_8_en; // @[Core.scala 38:32]
  wire [7:0] dmem_MPORT_10_data; // @[Core.scala 38:32]
  wire [11:0] dmem_MPORT_10_addr; // @[Core.scala 38:32]
  wire  dmem_MPORT_10_mask; // @[Core.scala 38:32]
  wire  dmem_MPORT_10_en; // @[Core.scala 38:32]
  wire [7:0] dmem_MPORT_12_data; // @[Core.scala 38:32]
  wire [11:0] dmem_MPORT_12_addr; // @[Core.scala 38:32]
  wire  dmem_MPORT_12_mask; // @[Core.scala 38:32]
  wire  dmem_MPORT_12_en; // @[Core.scala 38:32]
  reg  dmem_dmem_read_data_MPORT_en_pipe_0;
  reg [11:0] dmem_dmem_read_data_MPORT_addr_pipe_0;
  reg  dmem_dmem_read_data_MPORT_1_en_pipe_0;
  reg [11:0] dmem_dmem_read_data_MPORT_1_addr_pipe_0;
  reg  dmem_dmem_read_data_MPORT_2_en_pipe_0;
  reg [11:0] dmem_dmem_read_data_MPORT_2_addr_pipe_0;
  reg  dmem_dmem_read_data_MPORT_3_en_pipe_0;
  reg [11:0] dmem_dmem_read_data_MPORT_3_addr_pipe_0;
  reg [31:0] regfile [0:31]; // @[Core.scala 46:27]
  wire  regfile_alu_io_a_MPORT_en; // @[Core.scala 46:27]
  wire [4:0] regfile_alu_io_a_MPORT_addr; // @[Core.scala 46:27]
  wire [31:0] regfile_alu_io_a_MPORT_data; // @[Core.scala 46:27]
  wire  regfile_alu_io_a_MPORT_1_en; // @[Core.scala 46:27]
  wire [4:0] regfile_alu_io_a_MPORT_1_addr; // @[Core.scala 46:27]
  wire [31:0] regfile_alu_io_a_MPORT_1_data; // @[Core.scala 46:27]
  wire  regfile_alu_io_a_MPORT_2_en; // @[Core.scala 46:27]
  wire [4:0] regfile_alu_io_a_MPORT_2_addr; // @[Core.scala 46:27]
  wire [31:0] regfile_alu_io_a_MPORT_2_data; // @[Core.scala 46:27]
  wire  regfile_alu_io_a_MPORT_3_en; // @[Core.scala 46:27]
  wire [4:0] regfile_alu_io_a_MPORT_3_addr; // @[Core.scala 46:27]
  wire [31:0] regfile_alu_io_a_MPORT_3_data; // @[Core.scala 46:27]
  wire  regfile_alu_io_a_MPORT_4_en; // @[Core.scala 46:27]
  wire [4:0] regfile_alu_io_a_MPORT_4_addr; // @[Core.scala 46:27]
  wire [31:0] regfile_alu_io_a_MPORT_4_data; // @[Core.scala 46:27]
  wire  regfile_alu_io_a_MPORT_5_en; // @[Core.scala 46:27]
  wire [4:0] regfile_alu_io_a_MPORT_5_addr; // @[Core.scala 46:27]
  wire [31:0] regfile_alu_io_a_MPORT_5_data; // @[Core.scala 46:27]
  wire  regfile_alu_io_a_MPORT_6_en; // @[Core.scala 46:27]
  wire [4:0] regfile_alu_io_a_MPORT_6_addr; // @[Core.scala 46:27]
  wire [31:0] regfile_alu_io_a_MPORT_6_data; // @[Core.scala 46:27]
  wire  regfile_alu_io_a_MPORT_7_en; // @[Core.scala 46:27]
  wire [4:0] regfile_alu_io_a_MPORT_7_addr; // @[Core.scala 46:27]
  wire [31:0] regfile_alu_io_a_MPORT_7_data; // @[Core.scala 46:27]
  wire  regfile_alu_io_b_MPORT_en; // @[Core.scala 46:27]
  wire [4:0] regfile_alu_io_b_MPORT_addr; // @[Core.scala 46:27]
  wire [31:0] regfile_alu_io_b_MPORT_data; // @[Core.scala 46:27]
  wire  regfile_alu_io_b_MPORT_1_en; // @[Core.scala 46:27]
  wire [4:0] regfile_alu_io_b_MPORT_1_addr; // @[Core.scala 46:27]
  wire [31:0] regfile_alu_io_b_MPORT_1_data; // @[Core.scala 46:27]
  wire  regfile_alu_io_b_MPORT_2_en; // @[Core.scala 46:27]
  wire [4:0] regfile_alu_io_b_MPORT_2_addr; // @[Core.scala 46:27]
  wire [31:0] regfile_alu_io_b_MPORT_2_data; // @[Core.scala 46:27]
  wire  regfile_alu_io_b_MPORT_3_en; // @[Core.scala 46:27]
  wire [4:0] regfile_alu_io_b_MPORT_3_addr; // @[Core.scala 46:27]
  wire [31:0] regfile_alu_io_b_MPORT_3_data; // @[Core.scala 46:27]
  wire  regfile_alu_io_b_MPORT_4_en; // @[Core.scala 46:27]
  wire [4:0] regfile_alu_io_b_MPORT_4_addr; // @[Core.scala 46:27]
  wire [31:0] regfile_alu_io_b_MPORT_4_data; // @[Core.scala 46:27]
  wire  regfile_alu_io_b_MPORT_5_en; // @[Core.scala 46:27]
  wire [4:0] regfile_alu_io_b_MPORT_5_addr; // @[Core.scala 46:27]
  wire [31:0] regfile_alu_io_b_MPORT_5_data; // @[Core.scala 46:27]
  wire  regfile_MPORT_1_en; // @[Core.scala 46:27]
  wire [4:0] regfile_MPORT_1_addr; // @[Core.scala 46:27]
  wire [31:0] regfile_MPORT_1_data; // @[Core.scala 46:27]
  wire  regfile_MPORT_3_en; // @[Core.scala 46:27]
  wire [4:0] regfile_MPORT_3_addr; // @[Core.scala 46:27]
  wire [31:0] regfile_MPORT_3_data; // @[Core.scala 46:27]
  wire  regfile_MPORT_5_en; // @[Core.scala 46:27]
  wire [4:0] regfile_MPORT_5_addr; // @[Core.scala 46:27]
  wire [31:0] regfile_MPORT_5_data; // @[Core.scala 46:27]
  wire  regfile_MPORT_7_en; // @[Core.scala 46:27]
  wire [4:0] regfile_MPORT_7_addr; // @[Core.scala 46:27]
  wire [31:0] regfile_MPORT_7_data; // @[Core.scala 46:27]
  wire  regfile_MPORT_9_en; // @[Core.scala 46:27]
  wire [4:0] regfile_MPORT_9_addr; // @[Core.scala 46:27]
  wire [31:0] regfile_MPORT_9_data; // @[Core.scala 46:27]
  wire  regfile_MPORT_11_en; // @[Core.scala 46:27]
  wire [4:0] regfile_MPORT_11_addr; // @[Core.scala 46:27]
  wire [31:0] regfile_MPORT_11_data; // @[Core.scala 46:27]
  wire  regfile_MPORT_13_en; // @[Core.scala 46:27]
  wire [4:0] regfile_MPORT_13_addr; // @[Core.scala 46:27]
  wire [31:0] regfile_MPORT_13_data; // @[Core.scala 46:27]
  wire  regfile_MPORT_15_en; // @[Core.scala 46:27]
  wire [4:0] regfile_MPORT_15_addr; // @[Core.scala 46:27]
  wire [31:0] regfile_MPORT_15_data; // @[Core.scala 46:27]
  wire  regfile_MPORT_16_en; // @[Core.scala 46:27]
  wire [4:0] regfile_MPORT_16_addr; // @[Core.scala 46:27]
  wire [31:0] regfile_MPORT_16_data; // @[Core.scala 46:27]
  wire  regfile_MPORT_17_en; // @[Core.scala 46:27]
  wire [4:0] regfile_MPORT_17_addr; // @[Core.scala 46:27]
  wire [31:0] regfile_MPORT_17_data; // @[Core.scala 46:27]
  wire  regfile_ioBus_io_dout_bits_MPORT_en; // @[Core.scala 46:27]
  wire [4:0] regfile_ioBus_io_dout_bits_MPORT_addr; // @[Core.scala 46:27]
  wire [31:0] regfile_ioBus_io_dout_bits_MPORT_data; // @[Core.scala 46:27]
  wire [31:0] regfile_MPORT_14_data; // @[Core.scala 46:27]
  wire [4:0] regfile_MPORT_14_addr; // @[Core.scala 46:27]
  wire  regfile_MPORT_14_mask; // @[Core.scala 46:27]
  wire  regfile_MPORT_14_en; // @[Core.scala 46:27]
  reg  first_time; // @[Core.scala 42:31]
  reg [31:0] pc; // @[Core.scala 43:31]
  reg [31:0] pc_next_plus_6; // @[Core.scala 44:31]
  reg  load_ready; // @[Core.scala 62:31]
  wire [47:0] _instr_T_24 = {imem_instr_MPORT_5_data,imem_instr_MPORT_4_data,imem_instr_MPORT_3_data,
    imem_instr_MPORT_2_data,imem_instr_MPORT_1_data,imem_instr_MPORT_data}; // @[Cat.scala 33:92]
  wire [47:0] instr = first_time ? 48'h0 : _instr_T_24; // @[Core.scala 66:15]
  wire [4:0] opcode = instr[4:0]; // @[Core.scala 90:22]
  wire  _pc_next_T = opcode == 5'h3; // @[Core.scala 74:13]
  wire [2:0] opcode_sub = instr[7:5]; // @[Core.scala 91:22]
  wire  _pc_next_T_1 = opcode_sub == 3'h0; // @[Core.scala 74:40]
  wire  _pc_next_T_2 = opcode == 5'h3 & opcode_sub == 3'h0; // @[Core.scala 74:26]
  wire  _pc_next_T_3 = alu_io_zero; // @[Core.scala 74:68]
  wire  _pc_next_T_4 = opcode == 5'h3 & opcode_sub == 3'h0 & alu_io_zero; // @[Core.scala 74:53]
  wire [24:0] imm_b = instr[47:23]; // @[Core.scala 99:22]
  wire [6:0] _imm_b_sext_T_2 = imm_b[24] ? 7'h7f : 7'h0; // @[Bitwise.scala 77:12]
  wire [31:0] imm_b_sext = {_imm_b_sext_T_2,imm_b}; // @[Cat.scala 33:92]
  wire [31:0] _pc_next_T_6 = pc + imm_b_sext; // @[Core.scala 74:88]
  wire  _pc_next_T_8 = opcode_sub == 3'h1; // @[Core.scala 75:40]
  wire  _pc_next_T_9 = _pc_next_T & opcode_sub == 3'h1; // @[Core.scala 75:26]
  wire  _pc_next_T_11 = _pc_next_T & opcode_sub == 3'h1 & ~alu_io_zero; // @[Core.scala 75:53]
  wire  _pc_next_T_15 = opcode_sub == 3'h3; // @[Core.scala 76:40]
  wire  _pc_next_T_16 = _pc_next_T & opcode_sub == 3'h3; // @[Core.scala 76:26]
  wire  _pc_next_T_21 = _pc_next_T & opcode_sub == 3'h3 & (alu_io_out[31] | _pc_next_T_3); // @[Core.scala 76:53]
  wire  _pc_next_T_25 = opcode_sub == 3'h2; // @[Core.scala 77:40]
  wire  _pc_next_T_26 = _pc_next_T & opcode_sub == 3'h2; // @[Core.scala 77:26]
  wire  _pc_next_T_29 = _pc_next_T & opcode_sub == 3'h2 & alu_io_out[31]; // @[Core.scala 77:53]
  wire  _pc_next_T_33 = opcode_sub == 3'h4; // @[Core.scala 78:40]
  wire  _pc_next_T_34 = _pc_next_T & opcode_sub == 3'h4; // @[Core.scala 78:26]
  wire  _pc_next_T_35 = opcode == 5'h4; // @[Core.scala 80:13]
  wire  _pc_next_T_37 = opcode == 5'h4 & ~load_ready; // @[Core.scala 80:26]
  wire  _pc_next_T_38 = opcode == 5'h6; // @[Core.scala 82:13]
  wire  _pc_next_T_40 = opcode == 5'h6 & _pc_next_T_1; // @[Core.scala 82:26]
  wire  _pc_next_T_42 = opcode == 5'h6 & _pc_next_T_1 & ~ioBus_io_din_valid; // @[Core.scala 82:53]
  wire  _pc_next_T_45 = _pc_next_T_38 & _pc_next_T_8; // @[Core.scala 83:26]
  wire  _pc_next_T_47 = _pc_next_T_38 & _pc_next_T_8 & ~ioBus_io_dout_ready; // @[Core.scala 83:53]
  wire [31:0] _pc_next_T_48 = _pc_next_T_47 ? pc : pc_next_plus_6; // @[Mux.scala 101:16]
  wire [31:0] _pc_next_T_49 = _pc_next_T_42 ? pc : _pc_next_T_48; // @[Mux.scala 101:16]
  wire [31:0] _pc_next_T_50 = _pc_next_T_37 ? pc : _pc_next_T_49; // @[Mux.scala 101:16]
  wire [31:0] _pc_next_T_51 = _pc_next_T_34 ? alu_io_out : _pc_next_T_50; // @[Mux.scala 101:16]
  wire [31:0] _pc_next_T_52 = _pc_next_T_29 ? _pc_next_T_6 : _pc_next_T_51; // @[Mux.scala 101:16]
  wire [31:0] _pc_next_T_53 = _pc_next_T_21 ? _pc_next_T_6 : _pc_next_T_52; // @[Mux.scala 101:16]
  wire [31:0] _pc_next_T_54 = _pc_next_T_11 ? _pc_next_T_6 : _pc_next_T_53; // @[Mux.scala 101:16]
  wire [31:0] pc_next = _pc_next_T_4 ? _pc_next_T_6 : _pc_next_T_54; // @[Mux.scala 101:16]
  wire [32:0] _instr_T = {{1'd0}, pc_next}; // @[Core.scala 66:76]
  wire [31:0] _instr_T_5 = pc_next + 32'h1; // @[Core.scala 66:76]
  wire [31:0] _instr_T_9 = pc_next + 32'h2; // @[Core.scala 66:76]
  wire [31:0] _instr_T_13 = pc_next + 32'h3; // @[Core.scala 66:76]
  wire [31:0] _instr_T_17 = pc_next + 32'h4; // @[Core.scala 66:76]
  wire [31:0] _instr_T_21 = pc_next + 32'h5; // @[Core.scala 66:76]
  wire [31:0] _pc_next_plus_6_T_1 = pc_next + 32'h6; // @[Core.scala 69:29]
  wire [4:0] rd = instr[12:8]; // @[Core.scala 92:22]
  wire [31:0] imm = instr[47:16]; // @[Core.scala 98:22]
  wire  _command_T = opcode == 5'h1; // @[Core.scala 104:13]
  wire  _command_T_2 = opcode == 5'h1 & _pc_next_T_8; // @[Core.scala 104:26]
  wire  _command_T_5 = _command_T & _pc_next_T_25; // @[Core.scala 105:26]
  wire  _command_T_6 = opcode == 5'h2; // @[Core.scala 107:13]
  wire  _command_T_8 = opcode == 5'h2 & _pc_next_T_8; // @[Core.scala 107:26]
  wire  _command_T_11 = _command_T_6 & _pc_next_T_25; // @[Core.scala 108:26]
  wire  _command_T_29 = _pc_next_T_35 & _pc_next_T_1; // @[Core.scala 116:26]
  wire  _command_T_32 = _pc_next_T_35 & _pc_next_T_8; // @[Core.scala 117:26]
  wire  _command_T_35 = _pc_next_T_35 & _pc_next_T_25; // @[Core.scala 118:26]
  wire  _command_T_38 = _pc_next_T_35 & _pc_next_T_15; // @[Core.scala 119:26]
  wire  _command_T_41 = _pc_next_T_35 & _pc_next_T_33; // @[Core.scala 120:26]
  wire  _command_T_42 = opcode == 5'h5; // @[Core.scala 122:13]
  wire  _command_T_44 = opcode == 5'h5 & _pc_next_T_1; // @[Core.scala 122:26]
  wire  _command_T_47 = _command_T_42 & _pc_next_T_8; // @[Core.scala 123:26]
  wire  _command_T_50 = _command_T_42 & _pc_next_T_25; // @[Core.scala 124:26]
  wire  _command_T_57 = opcode == 5'h7; // @[Core.scala 129:13]
  wire  _command_T_59 = opcode == 5'h7 & _pc_next_T_1; // @[Core.scala 129:26]
  wire  _command_T_62 = _command_T_57 & _pc_next_T_8; // @[Core.scala 130:26]
  wire  _command_T_65 = _command_T_57 & _pc_next_T_25; // @[Core.scala 131:26]
  wire  _command_T_68 = _command_T_57 & _pc_next_T_15; // @[Core.scala 132:26]
  wire  _command_T_71 = _command_T_57 & _pc_next_T_33; // @[Core.scala 133:26]
  wire  _command_T_73 = opcode_sub == 3'h5; // @[Core.scala 134:40]
  wire  _command_T_74 = _command_T_57 & opcode_sub == 3'h5; // @[Core.scala 134:26]
  wire  _command_T_75 = opcode == 5'h8; // @[Core.scala 136:13]
  wire  _command_T_77 = opcode == 5'h8 & _pc_next_T_1; // @[Core.scala 136:26]
  wire  _command_T_80 = _command_T_75 & _pc_next_T_8; // @[Core.scala 137:26]
  wire  _command_T_83 = _command_T_75 & _pc_next_T_25; // @[Core.scala 138:26]
  wire  _command_T_86 = _command_T_75 & _pc_next_T_15; // @[Core.scala 139:26]
  wire  _command_T_89 = _command_T_75 & _pc_next_T_33; // @[Core.scala 140:26]
  wire  _command_T_92 = _command_T_75 & _command_T_73; // @[Core.scala 141:26]
  wire [7:0] _command_T_93 = _command_T_92 ? 8'h8 : 8'h0; // @[Mux.scala 101:16]
  wire [7:0] _command_T_94 = _command_T_89 ? 8'h7 : _command_T_93; // @[Mux.scala 101:16]
  wire [7:0] _command_T_95 = _command_T_86 ? 8'h6 : _command_T_94; // @[Mux.scala 101:16]
  wire [7:0] _command_T_96 = _command_T_83 ? 8'h5 : _command_T_95; // @[Mux.scala 101:16]
  wire [7:0] _command_T_97 = _command_T_80 ? 8'h4 : _command_T_96; // @[Mux.scala 101:16]
  wire [7:0] _command_T_98 = _command_T_77 ? 8'h3 : _command_T_97; // @[Mux.scala 101:16]
  wire [7:0] _command_T_99 = _command_T_74 ? 8'h8 : _command_T_98; // @[Mux.scala 101:16]
  wire [7:0] _command_T_100 = _command_T_71 ? 8'h7 : _command_T_99; // @[Mux.scala 101:16]
  wire [7:0] _command_T_101 = _command_T_68 ? 8'h6 : _command_T_100; // @[Mux.scala 101:16]
  wire [7:0] _command_T_102 = _command_T_65 ? 8'h5 : _command_T_101; // @[Mux.scala 101:16]
  wire [7:0] _command_T_103 = _command_T_62 ? 8'h4 : _command_T_102; // @[Mux.scala 101:16]
  wire [7:0] _command_T_104 = _command_T_59 ? 8'h3 : _command_T_103; // @[Mux.scala 101:16]
  wire [7:0] _command_T_105 = _pc_next_T_45 ? 8'h1 : _command_T_104; // @[Mux.scala 101:16]
  wire [7:0] _command_T_106 = _pc_next_T_40 ? 8'h1 : _command_T_105; // @[Mux.scala 101:16]
  wire [7:0] _command_T_107 = _command_T_50 ? 8'h1 : _command_T_106; // @[Mux.scala 101:16]
  wire [7:0] _command_T_108 = _command_T_47 ? 8'h1 : _command_T_107; // @[Mux.scala 101:16]
  wire [7:0] _command_T_109 = _command_T_44 ? 8'h1 : _command_T_108; // @[Mux.scala 101:16]
  wire [7:0] _command_T_110 = _command_T_41 ? 8'h1 : _command_T_109; // @[Mux.scala 101:16]
  wire [7:0] _command_T_111 = _command_T_38 ? 8'h1 : _command_T_110; // @[Mux.scala 101:16]
  wire [7:0] _command_T_112 = _command_T_35 ? 8'h1 : _command_T_111; // @[Mux.scala 101:16]
  wire [7:0] _command_T_113 = _command_T_32 ? 8'h1 : _command_T_112; // @[Mux.scala 101:16]
  wire [7:0] _command_T_114 = _command_T_29 ? 8'h1 : _command_T_113; // @[Mux.scala 101:16]
  wire [7:0] _command_T_115 = _pc_next_T_34 ? 8'h1 : _command_T_114; // @[Mux.scala 101:16]
  wire [7:0] _command_T_116 = _pc_next_T_16 ? 8'h2 : _command_T_115; // @[Mux.scala 101:16]
  wire [7:0] _command_T_117 = _pc_next_T_26 ? 8'h2 : _command_T_116; // @[Mux.scala 101:16]
  wire [7:0] _command_T_118 = _pc_next_T_9 ? 8'h2 : _command_T_117; // @[Mux.scala 101:16]
  wire [7:0] _command_T_119 = _pc_next_T_2 ? 8'h2 : _command_T_118; // @[Mux.scala 101:16]
  wire [7:0] _command_T_120 = _command_T_11 ? 8'h2 : _command_T_119; // @[Mux.scala 101:16]
  wire [7:0] _command_T_121 = _command_T_8 ? 8'h1 : _command_T_120; // @[Mux.scala 101:16]
  wire [7:0] _command_T_122 = _command_T_5 ? 8'h2 : _command_T_121; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_a_T_13 = _command_T_75 ? regfile_alu_io_a_MPORT_7_data : regfile_alu_io_a_MPORT_data; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_a_T_14 = _pc_next_T_45 ? regfile_alu_io_a_MPORT_6_data : _alu_io_a_T_13; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_a_T_15 = _pc_next_T_40 ? regfile_alu_io_a_MPORT_5_data : _alu_io_a_T_14; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_a_T_16 = _command_T_42 ? regfile_alu_io_a_MPORT_4_data : _alu_io_a_T_15; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_a_T_17 = _pc_next_T_35 ? regfile_alu_io_a_MPORT_3_data : _alu_io_a_T_16; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_a_T_18 = _pc_next_T_34 ? regfile_alu_io_a_MPORT_2_data : _alu_io_a_T_17; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_22 = _command_T_75 ? imm : 32'h0; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_23 = _command_T_57 ? regfile_alu_io_b_MPORT_5_data : _alu_io_b_T_22; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_24 = _pc_next_T_38 ? imm : _alu_io_b_T_23; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_25 = _command_T_42 ? imm : _alu_io_b_T_24; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_26 = _pc_next_T_35 ? imm : _alu_io_b_T_25; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_27 = _pc_next_T_34 ? imm : _alu_io_b_T_26; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_28 = _pc_next_T_16 ? regfile_alu_io_b_MPORT_4_data : _alu_io_b_T_27; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_29 = _pc_next_T_26 ? regfile_alu_io_b_MPORT_3_data : _alu_io_b_T_28; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_30 = _pc_next_T_9 ? regfile_alu_io_b_MPORT_2_data : _alu_io_b_T_29; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_31 = _pc_next_T_2 ? regfile_alu_io_b_MPORT_1_data : _alu_io_b_T_30; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_32 = _command_T_6 ? imm : _alu_io_b_T_31; // @[Mux.scala 101:16]
  wire [32:0] _T_3 = {{1'd0}, alu_io_out}; // @[Core.scala 174:23]
  wire [31:0] _T_8 = alu_io_out + 32'h1; // @[Core.scala 174:23]
  wire [31:0] _T_12 = alu_io_out + 32'h2; // @[Core.scala 174:23]
  wire [31:0] _T_16 = alu_io_out + 32'h3; // @[Core.scala 174:23]
  wire  _GEN_30 = _command_T_47 ? 1'h0 : _command_T_50; // @[Core.scala 176:66 38:32]
  wire [31:0] dmem_read_data = {dmem_dmem_read_data_MPORT_3_data,dmem_dmem_read_data_MPORT_2_data,
    dmem_dmem_read_data_MPORT_1_data,dmem_dmem_read_data_MPORT_data}; // @[Cat.scala 33:92]
  wire  _T_38 = rd == 5'h0; // @[Core.scala 197:9]
  wire [31:0] _T_43 = pc + 32'h6; // @[Core.scala 199:61]
  wire [15:0] _T_72 = dmem_read_data[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 77:12]
  wire [31:0] _T_74 = {_T_72,dmem_read_data[15:0]}; // @[Cat.scala 33:92]
  wire [23:0] _T_80 = dmem_read_data[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 77:12]
  wire [31:0] _T_82 = {_T_80,dmem_read_data[7:0]}; // @[Cat.scala 33:92]
  wire [31:0] _T_86 = 32'hffff & dmem_read_data; // @[Core.scala 208:67]
  wire [31:0] _T_90 = 32'hff & dmem_read_data; // @[Core.scala 209:65]
  wire  _T_95 = _pc_next_T_40 & ioBus_io_din_valid; // @[Core.scala 213:53]
  wire [31:0] _T_104 = _pc_next_T_45 ? regfile_MPORT_17_data : alu_io_out; // @[Mux.scala 101:16]
  wire [31:0] _T_105 = _pc_next_T_42 ? regfile_MPORT_16_data : _T_104; // @[Mux.scala 101:16]
  wire [31:0] _T_106 = _T_95 ? ioBus_io_din_bits : _T_105; // @[Mux.scala 101:16]
  wire [31:0] _T_107 = _command_T_42 ? regfile_MPORT_15_data : _T_106; // @[Mux.scala 101:16]
  wire [31:0] _T_108 = _command_T_35 ? _T_90 : _T_107; // @[Mux.scala 101:16]
  wire [31:0] _T_109 = _command_T_32 ? _T_86 : _T_108; // @[Mux.scala 101:16]
  wire [31:0] _T_110 = _command_T_32 ? _T_82 : _T_109; // @[Mux.scala 101:16]
  wire [31:0] _T_111 = _command_T_32 ? _T_74 : _T_110; // @[Mux.scala 101:16]
  wire [31:0] _T_112 = _command_T_29 ? dmem_read_data : _T_111; // @[Mux.scala 101:16]
  wire [31:0] _T_113 = _pc_next_T_34 ? _T_43 : _T_112; // @[Mux.scala 101:16]
  wire [31:0] _T_114 = _pc_next_T_16 ? _T_43 : _T_113; // @[Mux.scala 101:16]
  wire [31:0] _T_115 = _pc_next_T_26 ? _T_43 : _T_114; // @[Mux.scala 101:16]
  wire [31:0] _T_116 = _pc_next_T_9 ? _T_43 : _T_115; // @[Mux.scala 101:16]
  wire [31:0] _T_117 = _pc_next_T_2 ? _T_43 : _T_116; // @[Mux.scala 101:16]
  Alu alu ( // @[Core.scala 23:19]
    .io_command(alu_io_command),
    .io_a(alu_io_a),
    .io_b(alu_io_b),
    .io_zero(alu_io_zero),
    .io_out(alu_io_out)
  );
  IOBus ioBus ( // @[Core.scala 26:21]
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
    .io_rx(ioBus_io_rx),
    .io_sclk(ioBus_io_sclk),
    .io_mosi(ioBus_io_mosi),
    .io_miso(ioBus_io_miso),
    .io_gpout(ioBus_io_gpout)
  );
  assign imem_instr_MPORT_en = imem_instr_MPORT_en_pipe_0;
  assign imem_instr_MPORT_addr = imem_instr_MPORT_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_data = imem[imem_instr_MPORT_addr]; // @[Core.scala 36:32]
  `else
  assign imem_instr_MPORT_data = imem_instr_MPORT_addr >= 13'h1800 ? _RAND_1[7:0] : imem[imem_instr_MPORT_addr]; // @[Core.scala 36:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_1_en = imem_instr_MPORT_1_en_pipe_0;
  assign imem_instr_MPORT_1_addr = imem_instr_MPORT_1_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_1_data = imem[imem_instr_MPORT_1_addr]; // @[Core.scala 36:32]
  `else
  assign imem_instr_MPORT_1_data = imem_instr_MPORT_1_addr >= 13'h1800 ? _RAND_2[7:0] : imem[imem_instr_MPORT_1_addr]; // @[Core.scala 36:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_2_en = imem_instr_MPORT_2_en_pipe_0;
  assign imem_instr_MPORT_2_addr = imem_instr_MPORT_2_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_2_data = imem[imem_instr_MPORT_2_addr]; // @[Core.scala 36:32]
  `else
  assign imem_instr_MPORT_2_data = imem_instr_MPORT_2_addr >= 13'h1800 ? _RAND_3[7:0] : imem[imem_instr_MPORT_2_addr]; // @[Core.scala 36:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_3_en = imem_instr_MPORT_3_en_pipe_0;
  assign imem_instr_MPORT_3_addr = imem_instr_MPORT_3_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_3_data = imem[imem_instr_MPORT_3_addr]; // @[Core.scala 36:32]
  `else
  assign imem_instr_MPORT_3_data = imem_instr_MPORT_3_addr >= 13'h1800 ? _RAND_4[7:0] : imem[imem_instr_MPORT_3_addr]; // @[Core.scala 36:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_4_en = imem_instr_MPORT_4_en_pipe_0;
  assign imem_instr_MPORT_4_addr = imem_instr_MPORT_4_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_4_data = imem[imem_instr_MPORT_4_addr]; // @[Core.scala 36:32]
  `else
  assign imem_instr_MPORT_4_data = imem_instr_MPORT_4_addr >= 13'h1800 ? _RAND_5[7:0] : imem[imem_instr_MPORT_4_addr]; // @[Core.scala 36:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_5_en = imem_instr_MPORT_5_en_pipe_0;
  assign imem_instr_MPORT_5_addr = imem_instr_MPORT_5_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_5_data = imem[imem_instr_MPORT_5_addr]; // @[Core.scala 36:32]
  `else
  assign imem_instr_MPORT_5_data = imem_instr_MPORT_5_addr >= 13'h1800 ? _RAND_6[7:0] : imem[imem_instr_MPORT_5_addr]; // @[Core.scala 36:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign dmem_dmem_read_data_MPORT_en = dmem_dmem_read_data_MPORT_en_pipe_0;
  assign dmem_dmem_read_data_MPORT_addr = dmem_dmem_read_data_MPORT_addr_pipe_0;
  assign dmem_dmem_read_data_MPORT_data = dmem[dmem_dmem_read_data_MPORT_addr]; // @[Core.scala 38:32]
  assign dmem_dmem_read_data_MPORT_1_en = dmem_dmem_read_data_MPORT_1_en_pipe_0;
  assign dmem_dmem_read_data_MPORT_1_addr = dmem_dmem_read_data_MPORT_1_addr_pipe_0;
  assign dmem_dmem_read_data_MPORT_1_data = dmem[dmem_dmem_read_data_MPORT_1_addr]; // @[Core.scala 38:32]
  assign dmem_dmem_read_data_MPORT_2_en = dmem_dmem_read_data_MPORT_2_en_pipe_0;
  assign dmem_dmem_read_data_MPORT_2_addr = dmem_dmem_read_data_MPORT_2_addr_pipe_0;
  assign dmem_dmem_read_data_MPORT_2_data = dmem[dmem_dmem_read_data_MPORT_2_addr]; // @[Core.scala 38:32]
  assign dmem_dmem_read_data_MPORT_3_en = dmem_dmem_read_data_MPORT_3_en_pipe_0;
  assign dmem_dmem_read_data_MPORT_3_addr = dmem_dmem_read_data_MPORT_3_addr_pipe_0;
  assign dmem_dmem_read_data_MPORT_3_data = dmem[dmem_dmem_read_data_MPORT_3_addr]; // @[Core.scala 38:32]
  assign dmem_MPORT_data = regfile_MPORT_1_data[7:0];
  assign dmem_MPORT_addr = _T_3[11:0];
  assign dmem_MPORT_mask = 1'h1;
  assign dmem_MPORT_en = _command_T_42 & _pc_next_T_1;
  assign dmem_MPORT_2_data = regfile_MPORT_3_data[15:8];
  assign dmem_MPORT_2_addr = _T_8[11:0];
  assign dmem_MPORT_2_mask = 1'h1;
  assign dmem_MPORT_2_en = _command_T_42 & _pc_next_T_1;
  assign dmem_MPORT_4_data = regfile_MPORT_5_data[23:16];
  assign dmem_MPORT_4_addr = _T_12[11:0];
  assign dmem_MPORT_4_mask = 1'h1;
  assign dmem_MPORT_4_en = _command_T_42 & _pc_next_T_1;
  assign dmem_MPORT_6_data = regfile_MPORT_7_data[31:24];
  assign dmem_MPORT_6_addr = _T_16[11:0];
  assign dmem_MPORT_6_mask = 1'h1;
  assign dmem_MPORT_6_en = _command_T_42 & _pc_next_T_1;
  assign dmem_MPORT_8_data = regfile_MPORT_9_data[7:0];
  assign dmem_MPORT_8_addr = _T_3[11:0];
  assign dmem_MPORT_8_mask = 1'h1;
  assign dmem_MPORT_8_en = _command_T_44 ? 1'h0 : _command_T_47;
  assign dmem_MPORT_10_data = regfile_MPORT_11_data[15:8];
  assign dmem_MPORT_10_addr = _T_8[11:0];
  assign dmem_MPORT_10_mask = 1'h1;
  assign dmem_MPORT_10_en = _command_T_44 ? 1'h0 : _command_T_47;
  assign dmem_MPORT_12_data = regfile_MPORT_13_data[7:0];
  assign dmem_MPORT_12_addr = alu_io_out[11:0];
  assign dmem_MPORT_12_mask = 1'h1;
  assign dmem_MPORT_12_en = _command_T_44 ? 1'h0 : _GEN_30;
  assign regfile_alu_io_a_MPORT_en = 1'h1;
  assign regfile_alu_io_a_MPORT_addr = instr[17:13];
  assign regfile_alu_io_a_MPORT_data = regfile[regfile_alu_io_a_MPORT_addr]; // @[Core.scala 46:27]
  assign regfile_alu_io_a_MPORT_1_en = 1'h1;
  assign regfile_alu_io_a_MPORT_1_addr = {2'h0,instr[15:13]};
  assign regfile_alu_io_a_MPORT_1_data = regfile[regfile_alu_io_a_MPORT_1_addr]; // @[Core.scala 46:27]
  assign regfile_alu_io_a_MPORT_2_en = 1'h1;
  assign regfile_alu_io_a_MPORT_2_addr = {2'h0,instr[15:13]};
  assign regfile_alu_io_a_MPORT_2_data = regfile[regfile_alu_io_a_MPORT_2_addr]; // @[Core.scala 46:27]
  assign regfile_alu_io_a_MPORT_3_en = 1'h1;
  assign regfile_alu_io_a_MPORT_3_addr = {2'h0,instr[15:13]};
  assign regfile_alu_io_a_MPORT_3_data = regfile[regfile_alu_io_a_MPORT_3_addr]; // @[Core.scala 46:27]
  assign regfile_alu_io_a_MPORT_4_en = 1'h1;
  assign regfile_alu_io_a_MPORT_4_addr = {2'h0,instr[15:13]};
  assign regfile_alu_io_a_MPORT_4_data = regfile[regfile_alu_io_a_MPORT_4_addr]; // @[Core.scala 46:27]
  assign regfile_alu_io_a_MPORT_5_en = 1'h1;
  assign regfile_alu_io_a_MPORT_5_addr = {2'h0,instr[15:13]};
  assign regfile_alu_io_a_MPORT_5_data = regfile[regfile_alu_io_a_MPORT_5_addr]; // @[Core.scala 46:27]
  assign regfile_alu_io_a_MPORT_6_en = 1'h1;
  assign regfile_alu_io_a_MPORT_6_addr = {2'h0,instr[15:13]};
  assign regfile_alu_io_a_MPORT_6_data = regfile[regfile_alu_io_a_MPORT_6_addr]; // @[Core.scala 46:27]
  assign regfile_alu_io_a_MPORT_7_en = 1'h1;
  assign regfile_alu_io_a_MPORT_7_addr = {2'h0,instr[15:13]};
  assign regfile_alu_io_a_MPORT_7_data = regfile[regfile_alu_io_a_MPORT_7_addr]; // @[Core.scala 46:27]
  assign regfile_alu_io_b_MPORT_en = 1'h1;
  assign regfile_alu_io_b_MPORT_addr = instr[22:18];
  assign regfile_alu_io_b_MPORT_data = regfile[regfile_alu_io_b_MPORT_addr]; // @[Core.scala 46:27]
  assign regfile_alu_io_b_MPORT_1_en = 1'h1;
  assign regfile_alu_io_b_MPORT_1_addr = instr[22:18];
  assign regfile_alu_io_b_MPORT_1_data = regfile[regfile_alu_io_b_MPORT_1_addr]; // @[Core.scala 46:27]
  assign regfile_alu_io_b_MPORT_2_en = 1'h1;
  assign regfile_alu_io_b_MPORT_2_addr = instr[22:18];
  assign regfile_alu_io_b_MPORT_2_data = regfile[regfile_alu_io_b_MPORT_2_addr]; // @[Core.scala 46:27]
  assign regfile_alu_io_b_MPORT_3_en = 1'h1;
  assign regfile_alu_io_b_MPORT_3_addr = instr[22:18];
  assign regfile_alu_io_b_MPORT_3_data = regfile[regfile_alu_io_b_MPORT_3_addr]; // @[Core.scala 46:27]
  assign regfile_alu_io_b_MPORT_4_en = 1'h1;
  assign regfile_alu_io_b_MPORT_4_addr = instr[22:18];
  assign regfile_alu_io_b_MPORT_4_data = regfile[regfile_alu_io_b_MPORT_4_addr]; // @[Core.scala 46:27]
  assign regfile_alu_io_b_MPORT_5_en = 1'h1;
  assign regfile_alu_io_b_MPORT_5_addr = instr[22:18];
  assign regfile_alu_io_b_MPORT_5_data = regfile[regfile_alu_io_b_MPORT_5_addr]; // @[Core.scala 46:27]
  assign regfile_MPORT_1_en = _command_T_42 & _pc_next_T_1;
  assign regfile_MPORT_1_addr = instr[12:8];
  assign regfile_MPORT_1_data = regfile[regfile_MPORT_1_addr]; // @[Core.scala 46:27]
  assign regfile_MPORT_3_en = _command_T_42 & _pc_next_T_1;
  assign regfile_MPORT_3_addr = instr[12:8];
  assign regfile_MPORT_3_data = regfile[regfile_MPORT_3_addr]; // @[Core.scala 46:27]
  assign regfile_MPORT_5_en = _command_T_42 & _pc_next_T_1;
  assign regfile_MPORT_5_addr = instr[12:8];
  assign regfile_MPORT_5_data = regfile[regfile_MPORT_5_addr]; // @[Core.scala 46:27]
  assign regfile_MPORT_7_en = _command_T_42 & _pc_next_T_1;
  assign regfile_MPORT_7_addr = instr[12:8];
  assign regfile_MPORT_7_data = regfile[regfile_MPORT_7_addr]; // @[Core.scala 46:27]
  assign regfile_MPORT_9_en = _command_T_44 ? 1'h0 : _command_T_47;
  assign regfile_MPORT_9_addr = instr[12:8];
  assign regfile_MPORT_9_data = regfile[regfile_MPORT_9_addr]; // @[Core.scala 46:27]
  assign regfile_MPORT_11_en = _command_T_44 ? 1'h0 : _command_T_47;
  assign regfile_MPORT_11_addr = instr[12:8];
  assign regfile_MPORT_11_data = regfile[regfile_MPORT_11_addr]; // @[Core.scala 46:27]
  assign regfile_MPORT_13_en = _command_T_44 ? 1'h0 : _GEN_30;
  assign regfile_MPORT_13_addr = instr[12:8];
  assign regfile_MPORT_13_data = regfile[regfile_MPORT_13_addr]; // @[Core.scala 46:27]
  assign regfile_MPORT_15_en = 1'h1;
  assign regfile_MPORT_15_addr = instr[12:8];
  assign regfile_MPORT_15_data = regfile[regfile_MPORT_15_addr]; // @[Core.scala 46:27]
  assign regfile_MPORT_16_en = 1'h1;
  assign regfile_MPORT_16_addr = instr[12:8];
  assign regfile_MPORT_16_data = regfile[regfile_MPORT_16_addr]; // @[Core.scala 46:27]
  assign regfile_MPORT_17_en = 1'h1;
  assign regfile_MPORT_17_addr = instr[12:8];
  assign regfile_MPORT_17_data = regfile[regfile_MPORT_17_addr]; // @[Core.scala 46:27]
  assign regfile_ioBus_io_dout_bits_MPORT_en = 1'h1;
  assign regfile_ioBus_io_dout_bits_MPORT_addr = instr[12:8];
  assign regfile_ioBus_io_dout_bits_MPORT_data = regfile[regfile_ioBus_io_dout_bits_MPORT_addr]; // @[Core.scala 46:27]
  assign regfile_MPORT_14_data = _T_38 ? 32'h0 : _T_117;
  assign regfile_MPORT_14_addr = instr[12:8];
  assign regfile_MPORT_14_mask = 1'h1;
  assign regfile_MPORT_14_en = 1'h1;
  assign io_tx = ioBus_io_tx; // @[Core.scala 29:9]
  assign io_sclk = ioBus_io_sclk; // @[Core.scala 31:11]
  assign io_mosi = ioBus_io_mosi; // @[Core.scala 32:11]
  assign io_gpout = ioBus_io_gpout; // @[Core.scala 33:12]
  assign alu_io_command = _command_T_2 ? 8'h1 : _command_T_122; // @[Mux.scala 101:16]
  assign alu_io_a = _command_T_6 ? regfile_alu_io_a_MPORT_1_data : _alu_io_a_T_18; // @[Mux.scala 101:16]
  assign alu_io_b = _command_T ? regfile_alu_io_b_MPORT_data : _alu_io_b_T_32; // @[Mux.scala 101:16]
  assign ioBus_clock = clock;
  assign ioBus_reset = reset;
  assign ioBus_io_devId = alu_io_out; // @[Core.scala 220:18]
  assign ioBus_io_din_ready = _pc_next_T_38 & _pc_next_T_1; // @[Core.scala 222:46]
  assign ioBus_io_dout_valid = _pc_next_T_38 & _pc_next_T_8; // @[Core.scala 224:47]
  assign ioBus_io_dout_bits = regfile_ioBus_io_dout_bits_MPORT_data; // @[Core.scala 225:22]
  assign ioBus_io_rx = io_rx; // @[Core.scala 28:15]
  assign ioBus_io_miso = io_miso; // @[Core.scala 30:17]
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
      dmem[dmem_MPORT_addr] <= dmem_MPORT_data; // @[Core.scala 38:32]
    end
    if (dmem_MPORT_2_en & dmem_MPORT_2_mask) begin
      dmem[dmem_MPORT_2_addr] <= dmem_MPORT_2_data; // @[Core.scala 38:32]
    end
    if (dmem_MPORT_4_en & dmem_MPORT_4_mask) begin
      dmem[dmem_MPORT_4_addr] <= dmem_MPORT_4_data; // @[Core.scala 38:32]
    end
    if (dmem_MPORT_6_en & dmem_MPORT_6_mask) begin
      dmem[dmem_MPORT_6_addr] <= dmem_MPORT_6_data; // @[Core.scala 38:32]
    end
    if (dmem_MPORT_8_en & dmem_MPORT_8_mask) begin
      dmem[dmem_MPORT_8_addr] <= dmem_MPORT_8_data; // @[Core.scala 38:32]
    end
    if (dmem_MPORT_10_en & dmem_MPORT_10_mask) begin
      dmem[dmem_MPORT_10_addr] <= dmem_MPORT_10_data; // @[Core.scala 38:32]
    end
    if (dmem_MPORT_12_en & dmem_MPORT_12_mask) begin
      dmem[dmem_MPORT_12_addr] <= dmem_MPORT_12_data; // @[Core.scala 38:32]
    end
    dmem_dmem_read_data_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      dmem_dmem_read_data_MPORT_addr_pipe_0 <= _T_3[11:0];
    end
    dmem_dmem_read_data_MPORT_1_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      dmem_dmem_read_data_MPORT_1_addr_pipe_0 <= _T_8[11:0];
    end
    dmem_dmem_read_data_MPORT_2_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      dmem_dmem_read_data_MPORT_2_addr_pipe_0 <= _T_12[11:0];
    end
    dmem_dmem_read_data_MPORT_3_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      dmem_dmem_read_data_MPORT_3_addr_pipe_0 <= _T_16[11:0];
    end
    if (regfile_MPORT_14_en & regfile_MPORT_14_mask) begin
      regfile[regfile_MPORT_14_addr] <= regfile_MPORT_14_data; // @[Core.scala 46:27]
    end
    first_time <= reset; // @[Core.scala 42:{31,31} 67:14]
    if (reset) begin // @[Core.scala 43:31]
      pc <= 32'h0; // @[Core.scala 43:31]
    end else if (_pc_next_T_4) begin // @[Mux.scala 101:16]
      pc <= _pc_next_T_6;
    end else if (_pc_next_T_11) begin // @[Mux.scala 101:16]
      pc <= _pc_next_T_6;
    end else if (_pc_next_T_21) begin // @[Mux.scala 101:16]
      pc <= _pc_next_T_6;
    end else begin
      pc <= _pc_next_T_52;
    end
    if (reset) begin // @[Core.scala 44:31]
      pc_next_plus_6 <= 32'h0; // @[Core.scala 44:31]
    end else begin
      pc_next_plus_6 <= _pc_next_plus_6_T_1; // @[Core.scala 69:18]
    end
    if (reset) begin // @[Core.scala 62:31]
      load_ready <= 1'h0; // @[Core.scala 62:31]
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
  dmem_dmem_read_data_MPORT_en_pipe_0 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  dmem_dmem_read_data_MPORT_addr_pipe_0 = _RAND_21[11:0];
  _RAND_22 = {1{`RANDOM}};
  dmem_dmem_read_data_MPORT_1_en_pipe_0 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  dmem_dmem_read_data_MPORT_1_addr_pipe_0 = _RAND_23[11:0];
  _RAND_24 = {1{`RANDOM}};
  dmem_dmem_read_data_MPORT_2_en_pipe_0 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  dmem_dmem_read_data_MPORT_2_addr_pipe_0 = _RAND_25[11:0];
  _RAND_26 = {1{`RANDOM}};
  dmem_dmem_read_data_MPORT_3_en_pipe_0 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  dmem_dmem_read_data_MPORT_3_addr_pipe_0 = _RAND_27[11:0];
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
