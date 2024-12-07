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
        rateCounter <= 12'h926; // @[Uart.scala 110:19]
      end
    end else if (rateCounter == 12'h0) begin // @[Uart.scala 115:31]
      if (!(bitCounter == 4'h0)) begin // @[Uart.scala 119:32]
        rateCounter <= 12'h619; // @[Uart.scala 128:21]
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
