FIRRTL version 1.1.0
circuit UartTx :
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
