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
  reg [10:0] rateCounter; // @[Uart.scala 26:28]
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
  wire [10:0] _rateCounter_T_1 = rateCounter - 11'h1; // @[Uart.scala 51:34]
  assign io_tx = bitCounter == 4'h0 | bits_0; // @[Uart.scala 30:31]
  assign io_din_ready = bitCounter == 4'h0; // @[Uart.scala 31:26]
  always @(posedge clock) begin
    if (reset) begin // @[Uart.scala 26:28]
      rateCounter <= 11'h0; // @[Uart.scala 26:28]
    end else if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 11'h0) begin // @[Uart.scala 44:31]
        rateCounter <= 11'h619; // @[Uart.scala 49:19]
      end else begin
        rateCounter <= _rateCounter_T_1; // @[Uart.scala 51:19]
      end
    end else if (_io_tx_T & io_din_valid) begin // @[Uart.scala 38:31]
      rateCounter <= 11'h619; // @[Uart.scala 41:17]
    end
    if (reset) begin // @[Uart.scala 27:28]
      bitCounter <= 4'h0; // @[Uart.scala 27:28]
    end else if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 11'h0) begin // @[Uart.scala 44:31]
        bitCounter <= _bitCounter_T_1; // @[Uart.scala 48:18]
      end else begin
        bitCounter <= _GEN_10;
      end
    end else begin
      bitCounter <= _GEN_10;
    end
    if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 11'h0) begin // @[Uart.scala 44:31]
        bits_0 <= bits_1; // @[Uart.scala 47:37]
      end else begin
        bits_0 <= _GEN_0;
      end
    end else begin
      bits_0 <= _GEN_0;
    end
    if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 11'h0) begin // @[Uart.scala 44:31]
        bits_1 <= bits_2; // @[Uart.scala 47:37]
      end else begin
        bits_1 <= _GEN_1;
      end
    end else begin
      bits_1 <= _GEN_1;
    end
    if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 11'h0) begin // @[Uart.scala 44:31]
        bits_2 <= bits_3; // @[Uart.scala 47:37]
      end else begin
        bits_2 <= _GEN_2;
      end
    end else begin
      bits_2 <= _GEN_2;
    end
    if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 11'h0) begin // @[Uart.scala 44:31]
        bits_3 <= bits_4; // @[Uart.scala 47:37]
      end else begin
        bits_3 <= _GEN_3;
      end
    end else begin
      bits_3 <= _GEN_3;
    end
    if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 11'h0) begin // @[Uart.scala 44:31]
        bits_4 <= bits_5; // @[Uart.scala 47:37]
      end else begin
        bits_4 <= _GEN_4;
      end
    end else begin
      bits_4 <= _GEN_4;
    end
    if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 11'h0) begin // @[Uart.scala 44:31]
        bits_5 <= bits_6; // @[Uart.scala 47:37]
      end else begin
        bits_5 <= _GEN_5;
      end
    end else begin
      bits_5 <= _GEN_5;
    end
    if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 11'h0) begin // @[Uart.scala 44:31]
        bits_6 <= bits_7; // @[Uart.scala 47:37]
      end else begin
        bits_6 <= _GEN_6;
      end
    end else begin
      bits_6 <= _GEN_6;
    end
    if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 11'h0) begin // @[Uart.scala 44:31]
        bits_7 <= bits_8; // @[Uart.scala 47:37]
      end else begin
        bits_7 <= _GEN_7;
      end
    end else begin
      bits_7 <= _GEN_7;
    end
    if (bitCounter > 4'h0) begin // @[Uart.scala 43:28]
      if (rateCounter == 11'h0) begin // @[Uart.scala 44:31]
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
  rateCounter = _RAND_0[10:0];
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
