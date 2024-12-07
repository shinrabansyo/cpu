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
