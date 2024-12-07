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
  wire  uartTx_clock; // @[IOBus.scala 25:23]
  wire  uartTx_reset; // @[IOBus.scala 25:23]
  wire  uartTx_io_tx; // @[IOBus.scala 25:23]
  wire  uartTx_io_din_ready; // @[IOBus.scala 25:23]
  wire  uartTx_io_din_valid; // @[IOBus.scala 25:23]
  wire [7:0] uartTx_io_din_bits; // @[IOBus.scala 25:23]
  wire  uartRx_clock; // @[IOBus.scala 26:23]
  wire  uartRx_reset; // @[IOBus.scala 26:23]
  wire  uartRx_io_dout_valid; // @[IOBus.scala 26:23]
  wire [7:0] uartRx_io_dout_bits; // @[IOBus.scala 26:23]
  wire  uartRx_io_rx; // @[IOBus.scala 26:23]
  wire  spi_clock; // @[IOBus.scala 27:23]
  wire  spi_reset; // @[IOBus.scala 27:23]
  wire  spi_io_mosi; // @[IOBus.scala 27:23]
  wire  spi_io_miso; // @[IOBus.scala 27:23]
  wire  spi_io_sclk; // @[IOBus.scala 27:23]
  wire  spi_io_din_ready; // @[IOBus.scala 27:23]
  wire  spi_io_din_valid; // @[IOBus.scala 27:23]
  wire [7:0] spi_io_din_bits; // @[IOBus.scala 27:23]
  wire  spi_io_dout_valid; // @[IOBus.scala 27:23]
  wire [7:0] spi_io_dout_bits; // @[IOBus.scala 27:23]
  wire  spi_io_clkshamt_ready; // @[IOBus.scala 27:23]
  wire  spi_io_clkshamt_valid; // @[IOBus.scala 27:23]
  wire [2:0] spi_io_clkshamt_bits; // @[IOBus.scala 27:23]
  wire [2:0] spi_io_clkshamtO; // @[IOBus.scala 27:23]
  wire  spi_io_spiMode_ready; // @[IOBus.scala 27:23]
  wire  spi_io_spiMode_valid; // @[IOBus.scala 27:23]
  wire [1:0] spi_io_spiMode_bits; // @[IOBus.scala 27:23]
  wire [1:0] spi_io_spiModeO; // @[IOBus.scala 27:23]
  wire  gpout_clock; // @[IOBus.scala 28:23]
  wire  gpout_reset; // @[IOBus.scala 28:23]
  wire  gpout_io_din_valid; // @[IOBus.scala 28:23]
  wire [7:0] gpout_io_din_bits; // @[IOBus.scala 28:23]
  wire [7:0] gpout_io_dout; // @[IOBus.scala 28:23]
  wire [7:0] gpout_io_pinOut; // @[IOBus.scala 28:23]
  wire  counter_clock; // @[IOBus.scala 29:23]
  wire  counter_reset; // @[IOBus.scala 29:23]
  wire [63:0] counter_io_clkCount; // @[IOBus.scala 29:23]
  wire [63:0] counter_io_msCount; // @[IOBus.scala 29:23]
  wire  isUart = io_devId == 32'h0; // @[IOBus.scala 45:29]
  wire  isSpiData = io_devId == 32'h1; // @[IOBus.scala 46:29]
  wire  isSpiMode = io_devId == 32'h2; // @[IOBus.scala 47:29]
  wire  isSpiCshamt = io_devId == 32'h3; // @[IOBus.scala 48:29]
  wire  isGpout = io_devId == 32'h4; // @[IOBus.scala 49:29]
  wire  isClkCountL = io_devId == 32'h1000; // @[IOBus.scala 50:29]
  wire  isClkCountU = io_devId == 32'h1001; // @[IOBus.scala 51:29]
  wire  isClkFreq = io_devId == 32'h1002; // @[IOBus.scala 52:29]
  wire  isMsCountL = io_devId == 32'h1003; // @[IOBus.scala 53:29]
  wire  isMsCountU = io_devId == 32'h1004; // @[IOBus.scala 54:29]
  wire  _io_din_valid_T = isSpiData ? spi_io_dout_valid : 1'h1; // @[Mux.scala 101:16]
  wire  _io_din_valid_T_1 = isUart ? uartRx_io_dout_valid : _io_din_valid_T; // @[Mux.scala 101:16]
  wire [31:0] _io_din_bits_T_4 = isMsCountU ? counter_io_msCount[63:32] : 32'h0; // @[Mux.scala 101:16]
  wire [31:0] _io_din_bits_T_5 = isMsCountL ? counter_io_msCount[31:0] : _io_din_bits_T_4; // @[Mux.scala 101:16]
  wire [31:0] _io_din_bits_T_6 = isClkFreq ? 32'he4e1c0 : _io_din_bits_T_5; // @[Mux.scala 101:16]
  wire [31:0] _io_din_bits_T_7 = isClkCountU ? counter_io_clkCount[63:32] : _io_din_bits_T_6; // @[Mux.scala 101:16]
  wire [31:0] _io_din_bits_T_8 = isClkCountL ? counter_io_clkCount[31:0] : _io_din_bits_T_7; // @[Mux.scala 101:16]
  wire [31:0] _io_din_bits_T_9 = isGpout ? {{24'd0}, gpout_io_dout} : _io_din_bits_T_8; // @[Mux.scala 101:16]
  wire [31:0] _io_din_bits_T_10 = isSpiCshamt ? {{29'd0}, spi_io_clkshamtO} : _io_din_bits_T_9; // @[Mux.scala 101:16]
  wire [31:0] _io_din_bits_T_11 = isSpiMode ? {{30'd0}, spi_io_spiModeO} : _io_din_bits_T_10; // @[Mux.scala 101:16]
  wire [31:0] _io_din_bits_T_12 = isSpiData ? {{24'd0}, spi_io_dout_bits} : _io_din_bits_T_11; // @[Mux.scala 101:16]
  wire [31:0] _io_din_bits_T_13 = isUart ? {{24'd0}, uartRx_io_dout_bits} : _io_din_bits_T_12; // @[Mux.scala 101:16]
  wire  _GEN_2 = isGpout & io_dout_valid; // @[IOBus.scala 115:25 136:27 137:30]
  wire [31:0] _GEN_3 = isGpout ? io_dout_bits : 32'h0; // @[IOBus.scala 121:25 136:27 138:30]
  wire  _GEN_4 = isSpiCshamt & io_dout_valid; // @[IOBus.scala 114:25 133:31 134:29]
  wire [31:0] _GEN_5 = isSpiCshamt ? io_dout_bits : 32'h0; // @[IOBus.scala 120:25 133:31 135:29]
  wire  _GEN_6 = isSpiCshamt ? 1'h0 : _GEN_2; // @[IOBus.scala 115:25 133:31]
  wire [31:0] _GEN_7 = isSpiCshamt ? 32'h0 : _GEN_3; // @[IOBus.scala 121:25 133:31]
  wire  _GEN_8 = isSpiMode & io_dout_valid; // @[IOBus.scala 113:25 130:29 131:28]
  wire [31:0] _GEN_9 = isSpiMode ? io_dout_bits : 32'h0; // @[IOBus.scala 119:25 130:29 132:28]
  wire  _GEN_10 = isSpiMode ? 1'h0 : _GEN_4; // @[IOBus.scala 114:25 130:29]
  wire [31:0] _GEN_11 = isSpiMode ? 32'h0 : _GEN_5; // @[IOBus.scala 120:25 130:29]
  wire  _GEN_12 = isSpiMode ? 1'h0 : _GEN_6; // @[IOBus.scala 115:25 130:29]
  wire [31:0] _GEN_13 = isSpiMode ? 32'h0 : _GEN_7; // @[IOBus.scala 121:25 130:29]
  wire  _GEN_14 = isSpiData & io_dout_valid; // @[IOBus.scala 127:29 128:24 112:25]
  wire [31:0] _GEN_15 = isSpiData ? io_dout_bits : 32'h0; // @[IOBus.scala 127:29 129:24 118:25]
  wire  _GEN_16 = isSpiData ? 1'h0 : _GEN_8; // @[IOBus.scala 113:25 127:29]
  wire [31:0] _GEN_17 = isSpiData ? 32'h0 : _GEN_9; // @[IOBus.scala 119:25 127:29]
  wire  _GEN_18 = isSpiData ? 1'h0 : _GEN_10; // @[IOBus.scala 114:25 127:29]
  wire [31:0] _GEN_19 = isSpiData ? 32'h0 : _GEN_11; // @[IOBus.scala 120:25 127:29]
  wire  _GEN_20 = isSpiData ? 1'h0 : _GEN_12; // @[IOBus.scala 115:25 127:29]
  wire [31:0] _GEN_21 = isSpiData ? 32'h0 : _GEN_13; // @[IOBus.scala 121:25 127:29]
  wire  _GEN_22 = isUart & io_dout_valid; // @[IOBus.scala 124:19 111:25 125:27]
  wire [31:0] _GEN_23 = isUart ? io_dout_bits : 32'h0; // @[IOBus.scala 124:19 117:25 126:27]
  wire  _GEN_24 = isUart ? 1'h0 : _GEN_14; // @[IOBus.scala 124:19 112:25]
  wire [31:0] _GEN_25 = isUart ? 32'h0 : _GEN_15; // @[IOBus.scala 124:19 118:25]
  wire  _GEN_26 = isUart ? 1'h0 : _GEN_16; // @[IOBus.scala 124:19 113:25]
  wire [31:0] _GEN_27 = isUart ? 32'h0 : _GEN_17; // @[IOBus.scala 124:19 119:25]
  wire  _GEN_28 = isUart ? 1'h0 : _GEN_18; // @[IOBus.scala 124:19 114:25]
  wire [31:0] _GEN_29 = isUart ? 32'h0 : _GEN_19; // @[IOBus.scala 124:19 120:25]
  wire  _GEN_30 = isUart ? 1'h0 : _GEN_20; // @[IOBus.scala 124:19 115:25]
  wire [31:0] _GEN_31 = isUart ? 32'h0 : _GEN_21; // @[IOBus.scala 124:19 121:25]
  wire  _io_dout_ready_T_1 = isSpiCshamt ? spi_io_clkshamt_ready : 1'h1; // @[Mux.scala 101:16]
  wire  _io_dout_ready_T_2 = isSpiMode ? spi_io_spiMode_ready : _io_dout_ready_T_1; // @[Mux.scala 101:16]
  wire  _io_dout_ready_T_3 = isSpiData ? spi_io_din_ready : _io_dout_ready_T_2; // @[Mux.scala 101:16]
  wire  _io_dout_ready_T_4 = isUart ? uartTx_io_din_ready : _io_dout_ready_T_3; // @[Mux.scala 101:16]
  wire [31:0] _GEN_33 = io_dout_valid ? _GEN_23 : 32'h0; // @[IOBus.scala 123:21 117:25]
  wire [31:0] _GEN_35 = io_dout_valid ? _GEN_25 : 32'h0; // @[IOBus.scala 123:21 118:25]
  wire [31:0] _GEN_37 = io_dout_valid ? _GEN_27 : 32'h0; // @[IOBus.scala 123:21 119:25]
  wire [31:0] _GEN_39 = io_dout_valid ? _GEN_29 : 32'h0; // @[IOBus.scala 123:21 120:25]
  wire [31:0] _GEN_41 = io_dout_valid ? _GEN_31 : 32'h0; // @[IOBus.scala 123:21 121:25]
  UartTx uartTx ( // @[IOBus.scala 25:23]
    .clock(uartTx_clock),
    .reset(uartTx_reset),
    .io_tx(uartTx_io_tx),
    .io_din_ready(uartTx_io_din_ready),
    .io_din_valid(uartTx_io_din_valid),
    .io_din_bits(uartTx_io_din_bits)
  );
  UartRx uartRx ( // @[IOBus.scala 26:23]
    .clock(uartRx_clock),
    .reset(uartRx_reset),
    .io_dout_valid(uartRx_io_dout_valid),
    .io_dout_bits(uartRx_io_dout_bits),
    .io_rx(uartRx_io_rx)
  );
  Spi spi ( // @[IOBus.scala 27:23]
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
  GeneralPurposeOutput gpout ( // @[IOBus.scala 28:23]
    .clock(gpout_clock),
    .reset(gpout_reset),
    .io_din_valid(gpout_io_din_valid),
    .io_din_bits(gpout_io_din_bits),
    .io_dout(gpout_io_dout),
    .io_pinOut(gpout_io_pinOut)
  );
  ClkCounter counter ( // @[IOBus.scala 29:23]
    .clock(counter_clock),
    .reset(counter_reset),
    .io_clkCount(counter_io_clkCount),
    .io_msCount(counter_io_msCount)
  );
  assign io_din_valid = io_din_ready & _io_din_valid_T_1; // @[IOBus.scala 67:20 69:18 93:18]
  assign io_din_bits = io_din_ready ? _io_din_bits_T_13 : 32'h0; // @[IOBus.scala 67:20 74:17 94:17]
  assign io_dout_ready = io_dout_valid & _io_dout_ready_T_4; // @[IOBus.scala 123:21 141:19 149:19]
  assign io_tx = uartTx_io_tx; // @[IOBus.scala 106:12]
  assign io_sclk = spi_io_sclk; // @[IOBus.scala 107:12]
  assign io_mosi = spi_io_mosi; // @[IOBus.scala 108:12]
  assign io_gpout = gpout_io_pinOut; // @[IOBus.scala 109:12]
  assign uartTx_clock = clock;
  assign uartTx_reset = reset;
  assign uartTx_io_din_valid = io_dout_valid & _GEN_22; // @[IOBus.scala 123:21 111:25]
  assign uartTx_io_din_bits = _GEN_33[7:0];
  assign uartRx_clock = clock;
  assign uartRx_reset = reset;
  assign uartRx_io_rx = io_rx; // @[IOBus.scala 64:16]
  assign spi_clock = clock;
  assign spi_reset = reset;
  assign spi_io_miso = io_miso; // @[IOBus.scala 65:16]
  assign spi_io_din_valid = io_dout_valid & _GEN_24; // @[IOBus.scala 123:21 112:25]
  assign spi_io_din_bits = _GEN_35[7:0];
  assign spi_io_clkshamt_valid = io_dout_valid & _GEN_28; // @[IOBus.scala 123:21 114:25]
  assign spi_io_clkshamt_bits = _GEN_39[2:0];
  assign spi_io_spiMode_valid = io_dout_valid & _GEN_26; // @[IOBus.scala 123:21 113:25]
  assign spi_io_spiMode_bits = _GEN_37[1:0];
  assign gpout_clock = clock;
  assign gpout_reset = reset;
  assign gpout_io_din_valid = io_dout_valid & _GEN_30; // @[IOBus.scala 123:21 115:25]
  assign gpout_io_din_bits = _GEN_41[7:0];
  assign counter_clock = clock;
  assign counter_reset = reset;
endmodule
