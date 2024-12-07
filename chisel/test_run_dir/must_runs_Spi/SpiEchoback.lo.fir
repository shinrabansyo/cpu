FIRRTL version 1.1.0
circuit SpiEchoback :
  module Spi :
    input clock : Clock
    input reset : UInt<1>
    output io_mosi : UInt<1>
    input io_miso : UInt<1>
    output io_sclk : UInt<1>
    output io_din_ready : UInt<1>
    input io_din_valid : UInt<1>
    input io_din_bits : UInt<8>
    input io_dout_ready : UInt<1>
    output io_dout_valid : UInt<1>
    output io_dout_bits : UInt<8>
    output io_clkshamt_ready : UInt<1>
    input io_clkshamt_valid : UInt<1>
    input io_clkshamt_bits : UInt<3>
    output io_clkshamtO : UInt<3>
    output io_spiMode_ready : UInt<1>
    input io_spiMode_valid : UInt<1>
    input io_spiMode_bits : UInt<2>
    output io_spiModeO : UInt<2>

    reg sclk : UInt<1>, clock with :
      reset => (UInt<1>("h0"), sclk) @[Spi.scala 24:21]
    reg sclkCounter : UInt<9>, clock with :
      reset => (UInt<1>("h0"), sclkCounter) @[Spi.scala 25:28]
    reg clkshamt : UInt<3>, clock with :
      reset => (UInt<1>("h0"), clkshamt) @[Spi.scala 26:25]
    reg shiftReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), shiftReg) @[Spi.scala 31:25]
    reg bitCounter : UInt<4>, clock with :
      reset => (UInt<1>("h0"), bitCounter) @[Spi.scala 32:27]
    reg busy : UInt<1>, clock with :
      reset => (UInt<1>("h0"), busy) @[Spi.scala 33:21]
    reg misoBuf : UInt<1>, clock with :
      reset => (UInt<1>("h0"), misoBuf) @[Spi.scala 34:24]
    reg spiModeReady : UInt<1>, clock with :
      reset => (UInt<1>("h0"), spiModeReady) @[Spi.scala 35:29]
    reg clkshamtReady : UInt<1>, clock with :
      reset => (UInt<1>("h0"), clkshamtReady) @[Spi.scala 36:30]
    reg outValid : UInt<1>, clock with :
      reset => (UInt<1>("h0"), outValid) @[Spi.scala 37:25]
    reg cpol : UInt<1>, clock with :
      reset => (UInt<1>("h0"), cpol) @[Spi.scala 38:21]
    reg cpha : UInt<1>, clock with :
      reset => (UInt<1>("h0"), cpha) @[Spi.scala 39:21]
    reg isFirstSclk : UInt<1>, clock with :
      reset => (UInt<1>("h0"), isFirstSclk) @[Spi.scala 41:28]
    node _io_spiModeO_T = cat(cpol, cpha) @[Cat.scala 33:92]
    node _T = eq(sclkCounter, UInt<1>("h0")) @[Spi.scala 57:22]
    node _posedge_T = not(sclk) @[Spi.scala 59:18]
    node _sclkCounter_T = dshl(UInt<1>("h1"), clkshamt) @[Spi.scala 61:27]
    node _sclkCounter_T_1 = sub(_sclkCounter_T, UInt<1>("h1")) @[Spi.scala 61:40]
    node _sclkCounter_T_2 = tail(_sclkCounter_T_1, 1) @[Spi.scala 61:40]
    node _T_1 = eq(bitCounter, UInt<1>("h1")) @[Spi.scala 62:25]
    node _T_2 = eq(sclk, cpol) @[Spi.scala 62:41]
    node _T_3 = and(_T_1, _T_2) @[Spi.scala 62:33]
    node _T_4 = and(_T_3, cpha) @[Spi.scala 62:50]
    node _T_5 = eq(_T_4, UInt<1>("h0")) @[Spi.scala 62:12]
    node _sclk_T = not(sclk) @[Spi.scala 63:17]
    node _GEN_0 = mux(_T_5, _sclk_T, sclk) @[Spi.scala 62:60 63:14 24:21]
    node _sclkCounter_T_3 = sub(sclkCounter, UInt<1>("h1")) @[Spi.scala 66:34]
    node _sclkCounter_T_4 = tail(_sclkCounter_T_3, 1) @[Spi.scala 66:34]
    node _GEN_1 = mux(_T, UInt<1>("h0"), isFirstSclk) @[Spi.scala 57:31 58:19 41:28]
    node _GEN_2 = mux(_T, _posedge_T, UInt<1>("h0")) @[Spi.scala 51:11 57:31 59:15]
    node _GEN_3 = mux(_T, sclk, UInt<1>("h0")) @[Spi.scala 52:11 57:31 60:15]
    node _GEN_4 = mux(_T, _sclkCounter_T_2, _sclkCounter_T_4) @[Spi.scala 57:31 61:19 66:19]
    node _GEN_5 = mux(_T, _GEN_0, sclk) @[Spi.scala 24:21 57:31]
    node _T_6 = and(io_spiMode_valid, io_spiMode_ready) @[Spi.scala 68:33]
    node _T_7 = eq(_T_6, UInt<1>("h0")) @[Spi.scala 68:14]
    node _GEN_6 = mux(_T_7, cpol, sclk) @[Spi.scala 68:55 69:10 24:21]
    node _GEN_7 = mux(busy, _GEN_1, isFirstSclk) @[Spi.scala 56:14 41:28]
    node _GEN_8 = mux(busy, _GEN_2, UInt<1>("h0")) @[Spi.scala 51:11 56:14]
    node _GEN_9 = mux(busy, _GEN_3, UInt<1>("h0")) @[Spi.scala 52:11 56:14]
    node _GEN_10 = mux(busy, _GEN_4, sclkCounter) @[Spi.scala 56:14 25:28]
    node _GEN_11 = mux(busy, _GEN_5, _GEN_6) @[Spi.scala 56:14]
    node _mode_1_2_T = xor(cpol, cpha) @[Spi.scala 77:21]
    node _io_din_ready_T = and(io_din_valid, busy) @[Spi.scala 79:32]
    node _io_din_ready_T_1 = eq(bitCounter, UInt<1>("h0")) @[Spi.scala 79:54]
    node _io_din_ready_T_2 = and(_io_din_ready_T, _io_din_ready_T_1) @[Spi.scala 79:40]
    node _T_8 = eq(busy, UInt<1>("h0")) @[Spi.scala 81:24]
    node _T_9 = and(io_din_valid, _T_8) @[Spi.scala 81:21]
    node _T_10 = and(io_clkshamt_valid, io_clkshamt_ready) @[Spi.scala 87:28]
    node _sclkCounter_T_5 = add(io_clkshamt_bits, UInt<1>("h1")) @[Spi.scala 88:48]
    node _sclkCounter_T_6 = tail(_sclkCounter_T_5, 1) @[Spi.scala 88:48]
    node _sclkCounter_T_7 = dshl(UInt<1>("h1"), _sclkCounter_T_6) @[Spi.scala 88:27]
    node _sclkCounter_T_8 = sub(_sclkCounter_T_7, UInt<1>("h1")) @[Spi.scala 88:56]
    node _sclkCounter_T_9 = tail(_sclkCounter_T_8, 1) @[Spi.scala 88:56]
    node _sclkCounter_T_10 = add(clkshamt, UInt<1>("h1")) @[Spi.scala 90:40]
    node _sclkCounter_T_11 = tail(_sclkCounter_T_10, 1) @[Spi.scala 90:40]
    node _sclkCounter_T_12 = dshl(UInt<1>("h1"), _sclkCounter_T_11) @[Spi.scala 90:27]
    node _sclkCounter_T_13 = sub(_sclkCounter_T_12, UInt<1>("h1")) @[Spi.scala 90:48]
    node _sclkCounter_T_14 = tail(_sclkCounter_T_13, 1) @[Spi.scala 90:48]
    node _GEN_12 = mux(_T_10, _sclkCounter_T_9, _sclkCounter_T_14) @[Spi.scala 87:50 88:19 90:19]
    node _GEN_13 = mux(_T_9, io_din_bits, shiftReg) @[Spi.scala 81:31 82:14 31:25]
    node _GEN_14 = mux(_T_9, UInt<1>("h1"), busy) @[Spi.scala 81:31 83:10 33:21]
    node _GEN_15 = mux(_T_9, UInt<4>("h8"), bitCounter) @[Spi.scala 81:31 84:16 32:27]
    node _GEN_16 = mux(_T_9, _GEN_12, _GEN_10) @[Spi.scala 81:31]
    node _T_11 = and(io_dout_valid, io_dout_ready) @[Spi.scala 96:22]
    node _GEN_17 = mux(_T_11, UInt<1>("h0"), outValid) @[Spi.scala 96:40 97:14 37:25]
    node _T_12 = and(io_clkshamt_valid, io_clkshamt_ready) @[Spi.scala 101:26]
    node _GEN_18 = mux(_T_12, UInt<1>("h0"), clkshamtReady) @[Spi.scala 101:48 102:19 36:30]
    node _GEN_19 = mux(_T_12, io_clkshamt_bits, clkshamt) @[Spi.scala 101:48 103:14 26:25]
    node _T_13 = and(io_spiMode_valid, io_spiMode_ready) @[Spi.scala 107:25]
    node _cpol_T = bits(io_spiMode_bits, 1, 1) @[Spi.scala 108:28]
    node _cpha_T = bits(io_spiMode_bits, 0, 0) @[Spi.scala 109:28]
    node _sclk_T_1 = bits(io_spiMode_bits, 1, 1) @[Spi.scala 111:32]
    node _sclk_T_2 = bits(io_spiMode_bits, 1, 1) @[Spi.scala 111:52]
    node _sclk_T_3 = cat(_sclk_T_1, _sclk_T_2) @[Cat.scala 33:92]
    node _GEN_20 = mux(_T_13, _cpol_T, cpol) @[Spi.scala 107:46 108:10 38:21]
    node _GEN_21 = mux(_T_13, _cpha_T, cpha) @[Spi.scala 107:46 109:10 39:21]
    node _GEN_22 = mux(_T_13, UInt<1>("h0"), spiModeReady) @[Spi.scala 107:46 110:18 35:29]
    node _GEN_23 = mux(_T_13, _sclk_T_3, _GEN_11) @[Spi.scala 107:46 111:10]
    node _io_mosi_T = bits(shiftReg, 7, 7) @[Spi.scala 114:22]
    node _T_14 = eq(bitCounter, UInt<1>("h0")) @[Spi.scala 118:21]
    node _T_15 = and(cpha, isFirstSclk) @[Spi.scala 129:32]
    node _T_16 = eq(_T_15, UInt<1>("h0")) @[Spi.scala 129:25]
    node posedge = _GEN_8 @[Spi.scala 27:21]
    node _T_17 = and(posedge, _T_16) @[Spi.scala 129:22]
    node _shiftReg_T = shl(shiftReg, 1) @[Spi.scala 131:33]
    node _shiftReg_T_1 = or(_shiftReg_T, misoBuf) @[Spi.scala 131:39]
    node _bitCounter_T = sub(bitCounter, UInt<1>("h1")) @[Spi.scala 132:36]
    node _bitCounter_T_1 = tail(_bitCounter_T, 1) @[Spi.scala 132:36]
    node _GEN_24 = mux(_T_17, _shiftReg_T_1, _GEN_13) @[Spi.scala 129:49 131:20]
    node _GEN_25 = mux(_T_17, _bitCounter_T_1, _GEN_15) @[Spi.scala 129:49 132:22]
    node negedge = _GEN_9 @[Spi.scala 28:21]
    node _GEN_26 = mux(negedge, io_miso, misoBuf) @[Spi.scala 134:23 136:19 34:24]
    node _T_18 = and(cpol, isFirstSclk) @[Spi.scala 140:32]
    node _T_19 = eq(_T_18, UInt<1>("h0")) @[Spi.scala 140:25]
    node _T_20 = and(negedge, _T_19) @[Spi.scala 140:22]
    node _shiftReg_T_2 = shl(shiftReg, 1) @[Spi.scala 142:33]
    node _shiftReg_T_3 = or(_shiftReg_T_2, misoBuf) @[Spi.scala 142:39]
    node _bitCounter_T_2 = sub(bitCounter, UInt<1>("h1")) @[Spi.scala 143:36]
    node _bitCounter_T_3 = tail(_bitCounter_T_2, 1) @[Spi.scala 143:36]
    node _GEN_27 = mux(_T_20, _shiftReg_T_3, _GEN_13) @[Spi.scala 140:49 142:20]
    node _GEN_28 = mux(_T_20, _bitCounter_T_3, _GEN_15) @[Spi.scala 140:49 143:22]
    node _GEN_29 = mux(posedge, io_miso, misoBuf) @[Spi.scala 145:23 147:19 34:24]
    node mode_1_2 = _mode_1_2_T @[Spi.scala 40:22 77:12]
    node _GEN_30 = mux(mode_1_2, _GEN_24, _GEN_27) @[Spi.scala 127:22]
    node _GEN_31 = mux(mode_1_2, _GEN_25, _GEN_28) @[Spi.scala 127:22]
    node _GEN_32 = mux(mode_1_2, _GEN_26, _GEN_29) @[Spi.scala 127:22]
    node _GEN_33 = mux(_T_14, UInt<1>("h1"), _GEN_7) @[Spi.scala 118:30 119:19]
    node _GEN_34 = mux(_T_14, UInt<1>("h0"), _GEN_14) @[Spi.scala 118:30 120:12]
    node _GEN_35 = mux(_T_14, UInt<1>("h1"), _GEN_17) @[Spi.scala 118:30 121:16]
    node _GEN_36 = mux(_T_14, UInt<1>("h1"), _GEN_18) @[Spi.scala 118:30 122:21]
    node _GEN_37 = mux(_T_14, UInt<1>("h1"), _GEN_22) @[Spi.scala 118:30 123:20]
    node _GEN_38 = mux(_T_14, _GEN_13, _GEN_30) @[Spi.scala 118:30]
    node _GEN_39 = mux(_T_14, _GEN_15, _GEN_31) @[Spi.scala 118:30]
    node _GEN_40 = mux(_T_14, misoBuf, _GEN_32) @[Spi.scala 118:30 34:24]
    node _GEN_41 = mux(busy, _GEN_33, _GEN_7) @[Spi.scala 117:14]
    node _GEN_42 = mux(busy, _GEN_34, _GEN_14) @[Spi.scala 117:14]
    node _GEN_43 = mux(busy, _GEN_35, _GEN_17) @[Spi.scala 117:14]
    node _GEN_44 = mux(busy, _GEN_36, _GEN_18) @[Spi.scala 117:14]
    node _GEN_45 = mux(busy, _GEN_37, _GEN_22) @[Spi.scala 117:14]
    node _GEN_46 = mux(busy, _GEN_38, _GEN_13) @[Spi.scala 117:14]
    node _GEN_47 = mux(busy, _GEN_39, _GEN_15) @[Spi.scala 117:14]
    node _GEN_48 = mux(busy, _GEN_40, misoBuf) @[Spi.scala 117:14 34:24]
    io_mosi <= _io_mosi_T @[Spi.scala 114:11]
    io_sclk <= sclk @[Spi.scala 55:11]
    io_din_ready <= _io_din_ready_T_2 @[Spi.scala 79:16]
    io_dout_valid <= outValid @[Spi.scala 95:17]
    io_dout_bits <= shiftReg @[Spi.scala 94:16]
    io_clkshamt_ready <= clkshamtReady @[Spi.scala 100:21]
    io_clkshamtO <= clkshamt @[Spi.scala 48:16]
    io_spiMode_ready <= spiModeReady @[Spi.scala 106:20]
    io_spiModeO <= _io_spiModeO_T @[Spi.scala 49:15]
    sclk <= bits(mux(reset, UInt<1>("h0"), _GEN_23), 0, 0) @[Spi.scala 24:{21,21}]
    sclkCounter <= mux(reset, UInt<9>("h0"), _GEN_16) @[Spi.scala 25:{28,28}]
    clkshamt <= mux(reset, UInt<3>("h0"), _GEN_19) @[Spi.scala 26:{25,25}]
    shiftReg <= bits(mux(reset, UInt<8>("h0"), _GEN_46), 7, 0) @[Spi.scala 31:{25,25}]
    bitCounter <= mux(reset, UInt<4>("h0"), _GEN_47) @[Spi.scala 32:{27,27}]
    busy <= mux(reset, UInt<1>("h0"), _GEN_42) @[Spi.scala 33:{21,21}]
    misoBuf <= mux(reset, UInt<1>("h0"), _GEN_48) @[Spi.scala 34:{24,24}]
    spiModeReady <= mux(reset, UInt<1>("h1"), _GEN_45) @[Spi.scala 35:{29,29}]
    clkshamtReady <= mux(reset, UInt<1>("h1"), _GEN_44) @[Spi.scala 36:{30,30}]
    outValid <= mux(reset, UInt<1>("h0"), _GEN_43) @[Spi.scala 37:{25,25}]
    cpol <= mux(reset, UInt<1>("h0"), _GEN_20) @[Spi.scala 38:{21,21}]
    cpha <= mux(reset, UInt<1>("h0"), _GEN_21) @[Spi.scala 39:{21,21}]
    isFirstSclk <= mux(reset, UInt<1>("h1"), _GEN_41) @[Spi.scala 41:{28,28}]

  module SpiEchoback :
    input clock : Clock
    input reset : UInt<1>
    output io_sclk : UInt<1>
    output io_mosi : UInt<1>
    output io_miso : UInt<1>
    output io_din_ready : UInt<1>
    input io_din_valid : UInt<1>
    input io_din_bits : UInt<8>
    input io_dout_ready : UInt<1>
    output io_dout_valid : UInt<1>
    output io_dout_bits : UInt<8>
    output io_clkshamt_ready : UInt<1>
    input io_clkshamt_valid : UInt<1>
    input io_clkshamt_bits : UInt<3>
    output io_spiMode_ready : UInt<1>
    input io_spiMode_valid : UInt<1>
    input io_spiMode_bits : UInt<2>

    inst spi of Spi @[SpiTest.scala 75:21]
    io_sclk <= spi.io_sclk @[SpiTest.scala 77:13]
    io_mosi <= spi.io_mosi @[SpiTest.scala 78:13]
    io_miso <= spi.io_miso @[SpiTest.scala 79:13]
    io_din_ready <= spi.io_din_ready @[SpiTest.scala 87:16]
    io_dout_valid <= spi.io_dout_valid @[SpiTest.scala 88:17]
    io_dout_bits <= spi.io_dout_bits @[SpiTest.scala 88:17]
    io_clkshamt_ready <= spi.io_clkshamt_ready @[SpiTest.scala 89:21]
    io_spiMode_ready <= spi.io_spiMode_ready @[SpiTest.scala 90:20]
    spi.clock <= clock
    spi.reset <= reset
    spi.io_miso <= spi.io_mosi @[SpiTest.scala 85:17]
    spi.io_din_valid <= io_din_valid @[SpiTest.scala 87:16]
    spi.io_din_bits <= io_din_bits @[SpiTest.scala 87:16]
    spi.io_dout_ready <= io_dout_ready @[SpiTest.scala 88:17]
    spi.io_clkshamt_valid <= io_clkshamt_valid @[SpiTest.scala 89:21]
    spi.io_clkshamt_bits <= io_clkshamt_bits @[SpiTest.scala 89:21]
    spi.io_spiMode_valid <= io_spiMode_valid @[SpiTest.scala 90:20]
    spi.io_spiMode_bits <= io_spiMode_bits @[SpiTest.scala 90:20]
