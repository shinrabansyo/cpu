FIRRTL version 1.1.0
circuit UartEchoback :
  module UartTx :
    input clock : Clock
    input reset : UInt<1>
    output io_tx : UInt<1>
    output io_din_ready : UInt<1>
    input io_din_valid : UInt<1>
    input io_din_bits : UInt<8>

    reg rateCounter : UInt<3>, clock with :
      reset => (UInt<1>("h0"), rateCounter) @[Uart.scala 26:28]
    reg bitCounter : UInt<4>, clock with :
      reset => (UInt<1>("h0"), bitCounter) @[Uart.scala 27:28]
    reg bits_0 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), bits_0) @[Uart.scala 28:24]
    reg bits_1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), bits_1) @[Uart.scala 28:24]
    reg bits_2 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), bits_2) @[Uart.scala 28:24]
    reg bits_3 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), bits_3) @[Uart.scala 28:24]
    reg bits_4 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), bits_4) @[Uart.scala 28:24]
    reg bits_5 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), bits_5) @[Uart.scala 28:24]
    reg bits_6 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), bits_6) @[Uart.scala 28:24]
    reg bits_7 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), bits_7) @[Uart.scala 28:24]
    reg bits_8 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), bits_8) @[Uart.scala 28:24]
    reg bits_9 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), bits_9) @[Uart.scala 28:24]
    node _io_tx_T = eq(bitCounter, UInt<1>("h0")) @[Uart.scala 30:23]
    node _io_tx_T_1 = or(_io_tx_T, bits_0) @[Uart.scala 30:31]
    node ready = eq(bitCounter, UInt<1>("h0")) @[Uart.scala 31:26]
    node _T = and(ready, io_din_valid) @[Uart.scala 38:14]
    node hi = cat(UInt<1>("h1"), io_din_bits) @[Cat.scala 33:92]
    node _T_1 = cat(hi, UInt<1>("h0")) @[Cat.scala 33:92]
    node _T_2 = bits(_T_1, 0, 0) @[Uart.scala 39:40]
    node _T_3 = bits(_T_1, 1, 1) @[Uart.scala 39:40]
    node _T_4 = bits(_T_1, 2, 2) @[Uart.scala 39:40]
    node _T_5 = bits(_T_1, 3, 3) @[Uart.scala 39:40]
    node _T_6 = bits(_T_1, 4, 4) @[Uart.scala 39:40]
    node _T_7 = bits(_T_1, 5, 5) @[Uart.scala 39:40]
    node _T_8 = bits(_T_1, 6, 6) @[Uart.scala 39:40]
    node _T_9 = bits(_T_1, 7, 7) @[Uart.scala 39:40]
    node _T_10 = bits(_T_1, 8, 8) @[Uart.scala 39:40]
    node _T_11 = bits(_T_1, 9, 9) @[Uart.scala 39:40]
    node _GEN_0 = mux(_T, _T_2, bits_0) @[Uart.scala 38:31 39:10 28:24]
    node _GEN_1 = mux(_T, _T_3, bits_1) @[Uart.scala 38:31 39:10 28:24]
    node _GEN_2 = mux(_T, _T_4, bits_2) @[Uart.scala 38:31 39:10 28:24]
    node _GEN_3 = mux(_T, _T_5, bits_3) @[Uart.scala 38:31 39:10 28:24]
    node _GEN_4 = mux(_T, _T_6, bits_4) @[Uart.scala 38:31 39:10 28:24]
    node _GEN_5 = mux(_T, _T_7, bits_5) @[Uart.scala 38:31 39:10 28:24]
    node _GEN_6 = mux(_T, _T_8, bits_6) @[Uart.scala 38:31 39:10 28:24]
    node _GEN_7 = mux(_T, _T_9, bits_7) @[Uart.scala 38:31 39:10 28:24]
    node _GEN_8 = mux(_T, _T_10, bits_8) @[Uart.scala 38:31 39:10 28:24]
    node _GEN_9 = mux(_T, _T_11, bits_9) @[Uart.scala 38:31 39:10 28:24]
    node _GEN_10 = mux(_T, UInt<4>("ha"), bitCounter) @[Uart.scala 38:31 40:16 27:28]
    node _GEN_11 = mux(_T, UInt<3>("h7"), rateCounter) @[Uart.scala 38:31 41:17 26:28]
    node _T_12 = gt(bitCounter, UInt<1>("h0")) @[Uart.scala 43:20]
    node _T_13 = eq(rateCounter, UInt<1>("h0")) @[Uart.scala 44:22]
    node _bitCounter_T = sub(bitCounter, UInt<1>("h1")) @[Uart.scala 48:32]
    node _bitCounter_T_1 = tail(_bitCounter_T, 1) @[Uart.scala 48:32]
    node _rateCounter_T = sub(rateCounter, UInt<1>("h1")) @[Uart.scala 51:34]
    node _rateCounter_T_1 = tail(_rateCounter_T, 1) @[Uart.scala 51:34]
    node _GEN_12 = mux(_T_13, bits_1, _GEN_0) @[Uart.scala 44:31 47:37]
    node _GEN_13 = mux(_T_13, bits_2, _GEN_1) @[Uart.scala 44:31 47:37]
    node _GEN_14 = mux(_T_13, bits_3, _GEN_2) @[Uart.scala 44:31 47:37]
    node _GEN_15 = mux(_T_13, bits_4, _GEN_3) @[Uart.scala 44:31 47:37]
    node _GEN_16 = mux(_T_13, bits_5, _GEN_4) @[Uart.scala 44:31 47:37]
    node _GEN_17 = mux(_T_13, bits_6, _GEN_5) @[Uart.scala 44:31 47:37]
    node _GEN_18 = mux(_T_13, bits_7, _GEN_6) @[Uart.scala 44:31 47:37]
    node _GEN_19 = mux(_T_13, bits_8, _GEN_7) @[Uart.scala 44:31 47:37]
    node _GEN_20 = mux(_T_13, bits_9, _GEN_8) @[Uart.scala 44:31 47:37]
    node _GEN_21 = mux(_T_13, _bitCounter_T_1, _GEN_10) @[Uart.scala 44:31 48:18]
    node _GEN_22 = mux(_T_13, UInt<3>("h7"), _rateCounter_T_1) @[Uart.scala 44:31 49:19 51:19]
    node _GEN_23 = mux(_T_12, _GEN_12, _GEN_0) @[Uart.scala 43:28]
    node _GEN_24 = mux(_T_12, _GEN_13, _GEN_1) @[Uart.scala 43:28]
    node _GEN_25 = mux(_T_12, _GEN_14, _GEN_2) @[Uart.scala 43:28]
    node _GEN_26 = mux(_T_12, _GEN_15, _GEN_3) @[Uart.scala 43:28]
    node _GEN_27 = mux(_T_12, _GEN_16, _GEN_4) @[Uart.scala 43:28]
    node _GEN_28 = mux(_T_12, _GEN_17, _GEN_5) @[Uart.scala 43:28]
    node _GEN_29 = mux(_T_12, _GEN_18, _GEN_6) @[Uart.scala 43:28]
    node _GEN_30 = mux(_T_12, _GEN_19, _GEN_7) @[Uart.scala 43:28]
    node _GEN_31 = mux(_T_12, _GEN_20, _GEN_8) @[Uart.scala 43:28]
    node _GEN_32 = mux(_T_12, _GEN_21, _GEN_10) @[Uart.scala 43:28]
    node _GEN_33 = mux(_T_12, _GEN_22, _GEN_11) @[Uart.scala 43:28]
    io_tx <= _io_tx_T_1 @[Uart.scala 30:9]
    io_din_ready <= ready @[Uart.scala 32:16]
    rateCounter <= mux(reset, UInt<3>("h0"), _GEN_33) @[Uart.scala 26:{28,28}]
    bitCounter <= mux(reset, UInt<4>("h0"), _GEN_32) @[Uart.scala 27:{28,28}]
    bits_0 <= _GEN_23
    bits_1 <= _GEN_24
    bits_2 <= _GEN_25
    bits_3 <= _GEN_26
    bits_4 <= _GEN_27
    bits_5 <= _GEN_28
    bits_6 <= _GEN_29
    bits_7 <= _GEN_30
    bits_8 <= _GEN_31
    bits_9 <= _GEN_9

  module UartRx :
    input clock : Clock
    input reset : UInt<1>
    input io_dout_ready : UInt<1>
    output io_dout_valid : UInt<1>
    output io_dout_bits : UInt<8>
    input io_rx : UInt<1>
    output io_overrun : UInt<1>

    reg rateCounter : UInt<4>, clock with :
      reset => (UInt<1>("h0"), rateCounter) @[Uart.scala 63:28]
    reg bitCounter : UInt<4>, clock with :
      reset => (UInt<1>("h0"), bitCounter) @[Uart.scala 65:27]
    reg bits_0 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), bits_0) @[Uart.scala 66:17]
    reg bits_1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), bits_1) @[Uart.scala 66:17]
    reg bits_2 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), bits_2) @[Uart.scala 66:17]
    reg bits_3 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), bits_3) @[Uart.scala 66:17]
    reg bits_4 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), bits_4) @[Uart.scala 66:17]
    reg bits_5 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), bits_5) @[Uart.scala 66:17]
    reg bits_6 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), bits_6) @[Uart.scala 66:17]
    reg bits_7 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), bits_7) @[Uart.scala 66:17]
    reg bits_8 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), bits_8) @[Uart.scala 66:17]
    reg bits_9 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), bits_9) @[Uart.scala 66:17]
    reg rxRegs_0 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), rxRegs_0) @[Uart.scala 68:23]
    reg rxRegs_1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), rxRegs_1) @[Uart.scala 68:23]
    reg rxRegs_2 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), rxRegs_2) @[Uart.scala 68:23]
    reg overrun : UInt<1>, clock with :
      reset => (UInt<1>("h0"), overrun) @[Uart.scala 72:24]
    reg running : UInt<1>, clock with :
      reset => (UInt<1>("h0"), running) @[Uart.scala 73:24]
    reg outValid : UInt<1>, clock with :
      reset => (UInt<1>("h0"), outValid) @[Uart.scala 76:25]
    reg outBits : UInt<8>, clock with :
      reset => (UInt<1>("h0"), outBits) @[Uart.scala 77:20]
    node outReady = io_dout_ready @[Uart.scala 78:{29,29}]
    node _T = and(outValid, outReady) @[Uart.scala 83:17]
    node _GEN_0 = mux(_T, UInt<1>("h0"), outValid) @[Uart.scala 83:30 84:14 76:25]
    node _T_1 = eq(running, UInt<1>("h0")) @[Uart.scala 107:8]
    node _T_2 = eq(rxRegs_1, UInt<1>("h0")) @[Uart.scala 108:10]
    node _T_3 = and(_T_2, rxRegs_0) @[Uart.scala 108:21]
    node _GEN_1 = mux(_T_3, UInt<4>("hb"), rateCounter) @[Uart.scala 108:35 110:19 63:28]
    node _GEN_2 = mux(_T_3, UInt<4>("h9"), bitCounter) @[Uart.scala 108:35 111:18 65:27]
    node _GEN_3 = mux(_T_3, UInt<1>("h1"), running) @[Uart.scala 108:35 112:15 73:24]
    node _T_4 = eq(rateCounter, UInt<1>("h0")) @[Uart.scala 115:22]
    node _T_5 = eq(bitCounter, UInt<1>("h0")) @[Uart.scala 119:23]
    node outBits_lo_lo = cat(bits_2, bits_1) @[Cat.scala 33:92]
    node outBits_lo_hi = cat(bits_4, bits_3) @[Cat.scala 33:92]
    node outBits_lo = cat(outBits_lo_hi, outBits_lo_lo) @[Cat.scala 33:92]
    node outBits_hi_lo = cat(bits_6, bits_5) @[Cat.scala 33:92]
    node outBits_hi_hi = cat(bits_8, bits_7) @[Cat.scala 33:92]
    node outBits_hi = cat(outBits_hi_hi, outBits_hi_lo) @[Cat.scala 33:92]
    node _outBits_T = cat(outBits_hi, outBits_lo) @[Cat.scala 33:92]
    node _bitCounter_T = sub(bitCounter, UInt<1>("h1")) @[Uart.scala 129:34]
    node _bitCounter_T_1 = tail(_bitCounter_T, 1) @[Uart.scala 129:34]
    node _GEN_4 = mux(_T_5, UInt<1>("h1"), _GEN_0) @[Uart.scala 119:32 120:18]
    node _GEN_5 = mux(_T_5, _outBits_T, outBits) @[Uart.scala 119:32 121:17 77:20]
    node _GEN_6 = mux(_T_5, outValid, overrun) @[Uart.scala 119:32 122:17 72:24]
    node _GEN_7 = mux(_T_5, UInt<1>("h0"), running) @[Uart.scala 119:32 126:17 73:24]
    node _GEN_8 = mux(_T_5, rateCounter, UInt<3>("h7")) @[Uart.scala 119:32 128:21 63:28]
    node _GEN_9 = mux(_T_5, bitCounter, _bitCounter_T_1) @[Uart.scala 119:32 129:20 65:27]
    node _rateCounter_T = sub(rateCounter, UInt<1>("h1")) @[Uart.scala 132:34]
    node _rateCounter_T_1 = tail(_rateCounter_T, 1) @[Uart.scala 132:34]
    node _GEN_10 = mux(_T_4, rxRegs_0, bits_9) @[Uart.scala 115:31 116:22 66:17]
    node _GEN_11 = mux(_T_4, bits_1, bits_0) @[Uart.scala 115:31 117:45 66:17]
    node _GEN_12 = mux(_T_4, bits_2, bits_1) @[Uart.scala 115:31 117:45 66:17]
    node _GEN_13 = mux(_T_4, bits_3, bits_2) @[Uart.scala 115:31 117:45 66:17]
    node _GEN_14 = mux(_T_4, bits_4, bits_3) @[Uart.scala 115:31 117:45 66:17]
    node _GEN_15 = mux(_T_4, bits_5, bits_4) @[Uart.scala 115:31 117:45 66:17]
    node _GEN_16 = mux(_T_4, bits_6, bits_5) @[Uart.scala 115:31 117:45 66:17]
    node _GEN_17 = mux(_T_4, bits_7, bits_6) @[Uart.scala 115:31 117:45 66:17]
    node _GEN_18 = mux(_T_4, bits_8, bits_7) @[Uart.scala 115:31 117:45 66:17]
    node _GEN_19 = mux(_T_4, bits_9, bits_8) @[Uart.scala 115:31 117:45 66:17]
    node _GEN_20 = mux(_T_4, _GEN_4, _GEN_0) @[Uart.scala 115:31]
    node _GEN_21 = mux(_T_4, _GEN_5, outBits) @[Uart.scala 115:31 77:20]
    node _GEN_22 = mux(_T_4, _GEN_6, overrun) @[Uart.scala 115:31 72:24]
    node _GEN_23 = mux(_T_4, _GEN_7, running) @[Uart.scala 115:31 73:24]
    node _GEN_24 = mux(_T_4, _GEN_8, _rateCounter_T_1) @[Uart.scala 115:31 132:19]
    node _GEN_25 = mux(_T_4, _GEN_9, bitCounter) @[Uart.scala 115:31 65:27]
    node _GEN_26 = mux(_T_1, _GEN_1, _GEN_24) @[Uart.scala 107:18]
    node _GEN_27 = mux(_T_1, _GEN_2, _GEN_25) @[Uart.scala 107:18]
    node _GEN_28 = mux(_T_1, _GEN_3, _GEN_23) @[Uart.scala 107:18]
    node _GEN_29 = mux(_T_1, bits_9, _GEN_10) @[Uart.scala 107:18 66:17]
    node _GEN_30 = mux(_T_1, bits_0, _GEN_11) @[Uart.scala 107:18 66:17]
    node _GEN_31 = mux(_T_1, bits_1, _GEN_12) @[Uart.scala 107:18 66:17]
    node _GEN_32 = mux(_T_1, bits_2, _GEN_13) @[Uart.scala 107:18 66:17]
    node _GEN_33 = mux(_T_1, bits_3, _GEN_14) @[Uart.scala 107:18 66:17]
    node _GEN_34 = mux(_T_1, bits_4, _GEN_15) @[Uart.scala 107:18 66:17]
    node _GEN_35 = mux(_T_1, bits_5, _GEN_16) @[Uart.scala 107:18 66:17]
    node _GEN_36 = mux(_T_1, bits_6, _GEN_17) @[Uart.scala 107:18 66:17]
    node _GEN_37 = mux(_T_1, bits_7, _GEN_18) @[Uart.scala 107:18 66:17]
    node _GEN_38 = mux(_T_1, bits_8, _GEN_19) @[Uart.scala 107:18 66:17]
    node _GEN_39 = mux(_T_1, _GEN_0, _GEN_20) @[Uart.scala 107:18]
    node _GEN_40 = mux(_T_1, outBits, _GEN_21) @[Uart.scala 107:18 77:20]
    node _GEN_41 = mux(_T_1, overrun, _GEN_22) @[Uart.scala 107:18 72:24]
    node _rxRegs_WIRE_0 = UInt<1>("h0") @[Uart.scala 68:{31,31}]
    node _rxRegs_WIRE_1 = UInt<1>("h0") @[Uart.scala 68:{31,31}]
    node _rxRegs_WIRE_2 = UInt<1>("h0") @[Uart.scala 68:{31,31}]
    io_dout_valid <= outValid @[Uart.scala 79:17]
    io_dout_bits <= outBits @[Uart.scala 80:16]
    io_overrun <= overrun @[Uart.scala 104:14]
    rateCounter <= mux(reset, UInt<4>("h0"), _GEN_26) @[Uart.scala 63:{28,28}]
    bitCounter <= mux(reset, UInt<4>("h0"), _GEN_27) @[Uart.scala 65:{27,27}]
    bits_0 <= _GEN_30
    bits_1 <= _GEN_31
    bits_2 <= _GEN_32
    bits_3 <= _GEN_33
    bits_4 <= _GEN_34
    bits_5 <= _GEN_35
    bits_6 <= _GEN_36
    bits_7 <= _GEN_37
    bits_8 <= _GEN_38
    bits_9 <= _GEN_29
    rxRegs_0 <= mux(reset, _rxRegs_WIRE_0, rxRegs_1) @[Uart.scala 68:{23,23} 98:50]
    rxRegs_1 <= mux(reset, _rxRegs_WIRE_1, rxRegs_2) @[Uart.scala 68:{23,23} 98:50]
    rxRegs_2 <= mux(reset, _rxRegs_WIRE_2, io_rx) @[Uart.scala 68:{23,23} 97:24]
    overrun <= mux(reset, UInt<1>("h0"), _GEN_41) @[Uart.scala 72:{24,24}]
    running <= mux(reset, UInt<1>("h0"), _GEN_28) @[Uart.scala 73:{24,24}]
    outValid <= mux(reset, UInt<1>("h0"), _GEN_39) @[Uart.scala 76:{25,25}]
    outBits <= _GEN_40

  module UartEchoback :
    input clock : Clock
    input reset : UInt<1>
    output io_din_ready : UInt<1>
    input io_din_valid : UInt<1>
    input io_din_bits : UInt<8>
    input io_dout_ready : UInt<1>
    output io_dout_valid : UInt<1>
    output io_dout_bits : UInt<8>
    output io_overrun : UInt<1>

    inst tx of UartTx @[UartTest.scala 30:20]
    inst rx of UartRx @[UartTest.scala 31:20]
    io_din_ready <= tx.io_din_ready @[UartTest.scala 35:15]
    io_dout_valid <= rx.io_dout_valid @[UartTest.scala 36:16]
    io_dout_bits <= rx.io_dout_bits @[UartTest.scala 36:16]
    io_overrun <= rx.io_overrun @[UartTest.scala 37:16]
    tx.clock <= clock
    tx.reset <= reset
    tx.io_din_valid <= io_din_valid @[UartTest.scala 35:15]
    tx.io_din_bits <= io_din_bits @[UartTest.scala 35:15]
    rx.clock <= clock
    rx.reset <= reset
    rx.io_dout_ready <= io_dout_ready @[UartTest.scala 36:16]
    rx.io_rx <= tx.io_tx @[UartTest.scala 33:14]
