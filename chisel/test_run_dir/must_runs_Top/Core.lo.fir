FIRRTL version 1.1.0
circuit Core :
  module Alu :
    input clock : Clock
    input reset : UInt<1>
    input io_command : UInt<8>
    input io_a : UInt<32>
    input io_b : UInt<32>
    output io_zero : UInt<1>
    output io_out : UInt<32>

    node _io_zero_T = eq(io_out, UInt<32>("h0")) @[Alu.scala 17:22]
    node _io_out_T = eq(io_command, UInt<8>("h1")) @[Alu.scala 20:17]
    node _io_out_T_1 = add(io_a, io_b) @[Alu.scala 20:40]
    node _io_out_T_2 = tail(_io_out_T_1, 1) @[Alu.scala 20:40]
    node _io_out_T_3 = eq(io_command, UInt<8>("h2")) @[Alu.scala 21:17]
    node _io_out_T_4 = sub(io_a, io_b) @[Alu.scala 21:40]
    node _io_out_T_5 = tail(_io_out_T_4, 1) @[Alu.scala 21:40]
    node _io_out_T_6 = eq(io_command, UInt<8>("h3")) @[Alu.scala 22:17]
    node _io_out_T_7 = and(io_a, io_b) @[Alu.scala 22:40]
    node _io_out_T_8 = eq(io_command, UInt<8>("h4")) @[Alu.scala 23:17]
    node _io_out_T_9 = or(io_a, io_b) @[Alu.scala 23:40]
    node _io_out_T_10 = eq(io_command, UInt<8>("h5")) @[Alu.scala 24:17]
    node _io_out_T_11 = xor(io_a, io_b) @[Alu.scala 24:40]
    node _io_out_T_12 = eq(io_command, UInt<8>("h6")) @[Alu.scala 25:17]
    node _io_out_T_13 = bits(io_b, 4, 0) @[Alu.scala 25:47]
    node _io_out_T_14 = dshr(io_a, _io_out_T_13) @[Alu.scala 25:40]
    node _io_out_T_15 = eq(io_command, UInt<8>("h7")) @[Alu.scala 26:17]
    node _io_out_T_16 = asSInt(io_a) @[Alu.scala 26:40]
    node _io_out_T_17 = bits(io_b, 4, 0) @[Alu.scala 26:54]
    node _io_out_T_18 = dshr(_io_out_T_16, _io_out_T_17) @[Alu.scala 26:47]
    node _io_out_T_19 = asUInt(_io_out_T_18) @[Alu.scala 26:62]
    node _io_out_T_20 = eq(io_command, UInt<8>("h8")) @[Alu.scala 27:17]
    node _io_out_T_21 = bits(io_b, 4, 0) @[Alu.scala 27:47]
    node _io_out_T_22 = dshl(io_a, _io_out_T_21) @[Alu.scala 27:40]
    node _io_out_T_23 = mux(_io_out_T_20, _io_out_T_22, UInt<32>("h0")) @[Mux.scala 101:16]
    node _io_out_T_24 = mux(_io_out_T_15, _io_out_T_19, _io_out_T_23) @[Mux.scala 101:16]
    node _io_out_T_25 = mux(_io_out_T_12, _io_out_T_14, _io_out_T_24) @[Mux.scala 101:16]
    node _io_out_T_26 = mux(_io_out_T_10, _io_out_T_11, _io_out_T_25) @[Mux.scala 101:16]
    node _io_out_T_27 = mux(_io_out_T_8, _io_out_T_9, _io_out_T_26) @[Mux.scala 101:16]
    node _io_out_T_28 = mux(_io_out_T_6, _io_out_T_7, _io_out_T_27) @[Mux.scala 101:16]
    node _io_out_T_29 = mux(_io_out_T_3, _io_out_T_5, _io_out_T_28) @[Mux.scala 101:16]
    node _io_out_T_30 = mux(_io_out_T, _io_out_T_2, _io_out_T_29) @[Mux.scala 101:16]
    io_zero <= _io_zero_T @[Alu.scala 17:11]
    io_out <= bits(_io_out_T_30, 31, 0) @[Alu.scala 19:10]

  module UartTx :
    input clock : Clock
    input reset : UInt<1>
    output io_tx : UInt<1>
    output io_din_ready : UInt<1>
    input io_din_valid : UInt<1>
    input io_din_bits : UInt<8>

    reg rateCounter : UInt<11>, clock with :
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
    node _GEN_11 = mux(_T, UInt<11>("h619"), rateCounter) @[Uart.scala 38:31 41:17 26:28]
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
    node _GEN_22 = mux(_T_13, UInt<11>("h619"), _rateCounter_T_1) @[Uart.scala 44:31 49:19 51:19]
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
    rateCounter <= mux(reset, UInt<11>("h0"), _GEN_33) @[Uart.scala 26:{28,28}]
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

    reg rateCounter : UInt<12>, clock with :
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
    node _GEN_1 = mux(_T_3, UInt<12>("h926"), rateCounter) @[Uart.scala 108:35 110:19 63:28]
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
    node _GEN_8 = mux(_T_5, rateCounter, UInt<11>("h619")) @[Uart.scala 119:32 128:21 63:28]
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
    rateCounter <= mux(reset, UInt<12>("h0"), _GEN_26) @[Uart.scala 63:{28,28}]
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

  module GeneralPurposeOutput :
    input clock : Clock
    input reset : UInt<1>
    output io_din_ready : UInt<1>
    input io_din_valid : UInt<1>
    input io_din_bits : UInt<8>
    output io_dout : UInt<8>
    output io_pinOut : UInt<8>

    reg pinOutReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), pinOutReg) @[Gpio.scala 15:26]
    node _GEN_0 = mux(io_din_valid, io_din_bits, pinOutReg) @[Gpio.scala 21:23 22:15 15:26]
    io_din_ready <= UInt<1>("h1") @[Gpio.scala 18:16]
    io_dout <= pinOutReg @[Gpio.scala 19:11]
    io_pinOut <= pinOutReg @[Gpio.scala 17:13]
    pinOutReg <= mux(reset, UInt<8>("h0"), _GEN_0) @[Gpio.scala 15:{26,26}]

  module ClkCounter :
    input clock : Clock
    input reset : UInt<1>
    output io_clkCount : UInt<64>
    output io_clkFreq : UInt<32>
    output io_msCount : UInt<64>

    reg counter : UInt<64>, clock with :
      reset => (UInt<1>("h0"), counter) @[ClkCounter.scala 17:24]
    node _counter_T = add(counter, UInt<1>("h1")) @[ClkCounter.scala 18:22]
    node _counter_T_1 = tail(_counter_T, 1) @[ClkCounter.scala 18:22]
    reg msCount : UInt<64>, clock with :
      reset => (UInt<1>("h0"), msCount) @[ClkCounter.scala 24:24]
    reg msCounter : UInt<32>, clock with :
      reset => (UInt<1>("h0"), msCounter) @[ClkCounter.scala 25:26]
    node _T = geq(msCounter, UInt<14>("h3a98")) @[ClkCounter.scala 30:19]
    node _msCount_T = add(msCount, UInt<1>("h1")) @[ClkCounter.scala 32:24]
    node _msCount_T_1 = tail(_msCount_T, 1) @[ClkCounter.scala 32:24]
    node _msCounter_T = add(msCounter, UInt<1>("h1")) @[ClkCounter.scala 34:28]
    node _msCounter_T_1 = tail(_msCounter_T, 1) @[ClkCounter.scala 34:28]
    node _GEN_0 = mux(_T, UInt<1>("h0"), _msCounter_T_1) @[ClkCounter.scala 30:37 31:15 34:15]
    node _GEN_1 = mux(_T, _msCount_T_1, msCount) @[ClkCounter.scala 30:37 32:13 24:24]
    io_clkCount <= counter @[ClkCounter.scala 20:15]
    io_clkFreq <= UInt<32>("he4e1c0") @[ClkCounter.scala 21:14]
    io_msCount <= msCount @[ClkCounter.scala 28:14]
    counter <= mux(reset, UInt<64>("h0"), _counter_T_1) @[ClkCounter.scala 17:{24,24} 18:11]
    msCount <= mux(reset, UInt<64>("h0"), _GEN_1) @[ClkCounter.scala 24:{24,24}]
    msCounter <= mux(reset, UInt<32>("h0"), _GEN_0) @[ClkCounter.scala 25:{26,26}]

  module IOBus :
    input clock : Clock
    input reset : UInt<1>
    input io_devId : UInt<32>
    input io_din_ready : UInt<1>
    output io_din_valid : UInt<1>
    output io_din_bits : UInt<32>
    output io_dout_ready : UInt<1>
    input io_dout_valid : UInt<1>
    input io_dout_bits : UInt<32>
    output io_tx : UInt<1>
    input io_rx : UInt<1>
    output io_sclk : UInt<1>
    output io_mosi : UInt<1>
    input io_miso : UInt<1>
    output io_gpout : UInt<8>

    inst uartTx of UartTx @[IOBus.scala 25:23]
    inst uartRx of UartRx @[IOBus.scala 26:23]
    inst spi of Spi @[IOBus.scala 27:23]
    inst gpout of GeneralPurposeOutput @[IOBus.scala 28:23]
    inst counter of ClkCounter @[IOBus.scala 29:23]
    node _isUart_T = eq(io_devId, UInt<1>("h0")) @[IOBus.scala 45:29]
    node _isSpiData_T = eq(io_devId, UInt<1>("h1")) @[IOBus.scala 46:29]
    node _isSpiMode_T = eq(io_devId, UInt<2>("h2")) @[IOBus.scala 47:29]
    node _isSpiCshamt_T = eq(io_devId, UInt<2>("h3")) @[IOBus.scala 48:29]
    node _isGpout_T = eq(io_devId, UInt<3>("h4")) @[IOBus.scala 49:29]
    node _isClkCountL_T = eq(io_devId, UInt<13>("h1000")) @[IOBus.scala 50:29]
    node _isClkCountU_T = eq(io_devId, UInt<13>("h1001")) @[IOBus.scala 51:29]
    node _isClkFreq_T = eq(io_devId, UInt<13>("h1002")) @[IOBus.scala 52:29]
    node _isMsCountL_T = eq(io_devId, UInt<13>("h1003")) @[IOBus.scala 53:29]
    node _isMsCountU_T = eq(io_devId, UInt<13>("h1004")) @[IOBus.scala 54:29]
    node isSpiData = _isSpiData_T @[IOBus.scala 32:26 46:16]
    node _io_din_valid_T = mux(isSpiData, spi.io_dout_valid, UInt<1>("h1")) @[Mux.scala 101:16]
    node isUart = _isUart_T @[IOBus.scala 31:26 45:16]
    node _io_din_valid_T_1 = mux(isUart, uartRx.io_dout_valid, _io_din_valid_T) @[Mux.scala 101:16]
    node _io_din_bits_T = bits(counter.io_clkCount, 31, 0) @[IOBus.scala 80:43]
    node _io_din_bits_T_1 = bits(counter.io_clkCount, 63, 32) @[IOBus.scala 81:43]
    node _io_din_bits_T_2 = bits(counter.io_msCount, 31, 0) @[IOBus.scala 83:42]
    node _io_din_bits_T_3 = bits(counter.io_msCount, 63, 32) @[IOBus.scala 84:42]
    node isMsCountU = _isMsCountU_T @[IOBus.scala 40:26 54:16]
    node _io_din_bits_T_4 = mux(isMsCountU, _io_din_bits_T_3, UInt<1>("h0")) @[Mux.scala 101:16]
    node isMsCountL = _isMsCountL_T @[IOBus.scala 39:26 53:16]
    node _io_din_bits_T_5 = mux(isMsCountL, _io_din_bits_T_2, _io_din_bits_T_4) @[Mux.scala 101:16]
    node isClkFreq = _isClkFreq_T @[IOBus.scala 38:26 52:16]
    node _io_din_bits_T_6 = mux(isClkFreq, counter.io_clkFreq, _io_din_bits_T_5) @[Mux.scala 101:16]
    node isClkCountU = _isClkCountU_T @[IOBus.scala 37:26 51:16]
    node _io_din_bits_T_7 = mux(isClkCountU, _io_din_bits_T_1, _io_din_bits_T_6) @[Mux.scala 101:16]
    node isClkCountL = _isClkCountL_T @[IOBus.scala 36:26 50:16]
    node _io_din_bits_T_8 = mux(isClkCountL, _io_din_bits_T, _io_din_bits_T_7) @[Mux.scala 101:16]
    node isGpout = _isGpout_T @[IOBus.scala 35:26 49:16]
    node _io_din_bits_T_9 = mux(isGpout, gpout.io_dout, _io_din_bits_T_8) @[Mux.scala 101:16]
    node isSpiCshamt = _isSpiCshamt_T @[IOBus.scala 34:26 48:16]
    node _io_din_bits_T_10 = mux(isSpiCshamt, spi.io_clkshamtO, _io_din_bits_T_9) @[Mux.scala 101:16]
    node isSpiMode = _isSpiMode_T @[IOBus.scala 33:26 47:16]
    node _io_din_bits_T_11 = mux(isSpiMode, spi.io_spiModeO, _io_din_bits_T_10) @[Mux.scala 101:16]
    node _io_din_bits_T_12 = mux(isSpiData, spi.io_dout_bits, _io_din_bits_T_11) @[Mux.scala 101:16]
    node _io_din_bits_T_13 = mux(isUart, uartRx.io_dout_bits, _io_din_bits_T_12) @[Mux.scala 101:16]
    node isInInstr = io_din_ready @[IOBus.scala 43:26 59:14]
    node _GEN_0 = mux(isInInstr, _io_din_valid_T_1, UInt<1>("h0")) @[IOBus.scala 67:20 69:18 93:18]
    node _GEN_1 = mux(isInInstr, _io_din_bits_T_13, UInt<1>("h0")) @[IOBus.scala 67:20 74:17 94:17]
    node _GEN_2 = mux(isGpout, io_dout_valid, UInt<1>("h0")) @[IOBus.scala 115:25 136:27 137:30]
    node _GEN_3 = mux(isGpout, io_dout_bits, UInt<1>("h0")) @[IOBus.scala 121:25 136:27 138:30]
    node _GEN_4 = mux(isSpiCshamt, io_dout_valid, UInt<1>("h0")) @[IOBus.scala 114:25 133:31 134:29]
    node _GEN_5 = mux(isSpiCshamt, io_dout_bits, UInt<1>("h0")) @[IOBus.scala 120:25 133:31 135:29]
    node _GEN_6 = mux(isSpiCshamt, UInt<1>("h0"), _GEN_2) @[IOBus.scala 115:25 133:31]
    node _GEN_7 = mux(isSpiCshamt, UInt<1>("h0"), _GEN_3) @[IOBus.scala 121:25 133:31]
    node _GEN_8 = mux(isSpiMode, io_dout_valid, UInt<1>("h0")) @[IOBus.scala 113:25 130:29 131:28]
    node _GEN_9 = mux(isSpiMode, io_dout_bits, UInt<1>("h0")) @[IOBus.scala 119:25 130:29 132:28]
    node _GEN_10 = mux(isSpiMode, UInt<1>("h0"), _GEN_4) @[IOBus.scala 114:25 130:29]
    node _GEN_11 = mux(isSpiMode, UInt<1>("h0"), _GEN_5) @[IOBus.scala 120:25 130:29]
    node _GEN_12 = mux(isSpiMode, UInt<1>("h0"), _GEN_6) @[IOBus.scala 115:25 130:29]
    node _GEN_13 = mux(isSpiMode, UInt<1>("h0"), _GEN_7) @[IOBus.scala 121:25 130:29]
    node _GEN_14 = mux(isSpiData, io_dout_valid, UInt<1>("h0")) @[IOBus.scala 127:29 128:24 112:25]
    node _GEN_15 = mux(isSpiData, io_dout_bits, UInt<1>("h0")) @[IOBus.scala 127:29 129:24 118:25]
    node _GEN_16 = mux(isSpiData, UInt<1>("h0"), _GEN_8) @[IOBus.scala 113:25 127:29]
    node _GEN_17 = mux(isSpiData, UInt<1>("h0"), _GEN_9) @[IOBus.scala 119:25 127:29]
    node _GEN_18 = mux(isSpiData, UInt<1>("h0"), _GEN_10) @[IOBus.scala 114:25 127:29]
    node _GEN_19 = mux(isSpiData, UInt<1>("h0"), _GEN_11) @[IOBus.scala 120:25 127:29]
    node _GEN_20 = mux(isSpiData, UInt<1>("h0"), _GEN_12) @[IOBus.scala 115:25 127:29]
    node _GEN_21 = mux(isSpiData, UInt<1>("h0"), _GEN_13) @[IOBus.scala 121:25 127:29]
    node _GEN_22 = mux(isUart, io_dout_valid, UInt<1>("h0")) @[IOBus.scala 124:19 111:25 125:27]
    node _GEN_23 = mux(isUart, io_dout_bits, UInt<1>("h0")) @[IOBus.scala 124:19 117:25 126:27]
    node _GEN_24 = mux(isUart, UInt<1>("h0"), _GEN_14) @[IOBus.scala 124:19 112:25]
    node _GEN_25 = mux(isUart, UInt<1>("h0"), _GEN_15) @[IOBus.scala 124:19 118:25]
    node _GEN_26 = mux(isUart, UInt<1>("h0"), _GEN_16) @[IOBus.scala 124:19 113:25]
    node _GEN_27 = mux(isUart, UInt<1>("h0"), _GEN_17) @[IOBus.scala 124:19 119:25]
    node _GEN_28 = mux(isUart, UInt<1>("h0"), _GEN_18) @[IOBus.scala 124:19 114:25]
    node _GEN_29 = mux(isUart, UInt<1>("h0"), _GEN_19) @[IOBus.scala 124:19 120:25]
    node _GEN_30 = mux(isUart, UInt<1>("h0"), _GEN_20) @[IOBus.scala 124:19 115:25]
    node _GEN_31 = mux(isUart, UInt<1>("h0"), _GEN_21) @[IOBus.scala 124:19 121:25]
    node _io_dout_ready_T = mux(isGpout, gpout.io_din_ready, UInt<1>("h1")) @[Mux.scala 101:16]
    node _io_dout_ready_T_1 = mux(isSpiCshamt, spi.io_clkshamt_ready, _io_dout_ready_T) @[Mux.scala 101:16]
    node _io_dout_ready_T_2 = mux(isSpiMode, spi.io_spiMode_ready, _io_dout_ready_T_1) @[Mux.scala 101:16]
    node _io_dout_ready_T_3 = mux(isSpiData, spi.io_din_ready, _io_dout_ready_T_2) @[Mux.scala 101:16]
    node _io_dout_ready_T_4 = mux(isUart, uartTx.io_din_ready, _io_dout_ready_T_3) @[Mux.scala 101:16]
    node isOutInstr = io_dout_valid @[IOBus.scala 42:26 58:14]
    node _GEN_32 = mux(isOutInstr, _GEN_22, UInt<1>("h0")) @[IOBus.scala 123:21 111:25]
    node _GEN_33 = mux(isOutInstr, _GEN_23, UInt<1>("h0")) @[IOBus.scala 123:21 117:25]
    node _GEN_34 = mux(isOutInstr, _GEN_24, UInt<1>("h0")) @[IOBus.scala 123:21 112:25]
    node _GEN_35 = mux(isOutInstr, _GEN_25, UInt<1>("h0")) @[IOBus.scala 123:21 118:25]
    node _GEN_36 = mux(isOutInstr, _GEN_26, UInt<1>("h0")) @[IOBus.scala 123:21 113:25]
    node _GEN_37 = mux(isOutInstr, _GEN_27, UInt<1>("h0")) @[IOBus.scala 123:21 119:25]
    node _GEN_38 = mux(isOutInstr, _GEN_28, UInt<1>("h0")) @[IOBus.scala 123:21 114:25]
    node _GEN_39 = mux(isOutInstr, _GEN_29, UInt<1>("h0")) @[IOBus.scala 123:21 120:25]
    node _GEN_40 = mux(isOutInstr, _GEN_30, UInt<1>("h0")) @[IOBus.scala 123:21 115:25]
    node _GEN_41 = mux(isOutInstr, _GEN_31, UInt<1>("h0")) @[IOBus.scala 123:21 121:25]
    node _GEN_42 = mux(isOutInstr, _io_dout_ready_T_4, UInt<1>("h0")) @[IOBus.scala 123:21 141:19 149:19]
    io_din_valid <= _GEN_0
    io_din_bits <= _GEN_1
    io_dout_ready <= _GEN_42
    io_tx <= uartTx.io_tx @[IOBus.scala 106:12]
    io_sclk <= spi.io_sclk @[IOBus.scala 107:12]
    io_mosi <= spi.io_mosi @[IOBus.scala 108:12]
    io_gpout <= gpout.io_pinOut @[IOBus.scala 109:12]
    uartTx.clock <= clock
    uartTx.reset <= reset
    uartTx.io_din_valid <= _GEN_32
    uartTx.io_din_bits <= bits(_GEN_33, 7, 0)
    uartRx.clock <= clock
    uartRx.reset <= reset
    uartRx.io_dout_ready <= UInt<1>("h0") @[IOBus.scala 99:24]
    uartRx.io_rx <= io_rx @[IOBus.scala 64:16]
    spi.clock <= clock
    spi.reset <= reset
    spi.io_miso <= io_miso @[IOBus.scala 65:16]
    spi.io_din_valid <= _GEN_34
    spi.io_din_bits <= bits(_GEN_35, 7, 0)
    spi.io_dout_ready <= UInt<1>("h0") @[IOBus.scala 100:24]
    spi.io_clkshamt_valid <= _GEN_38
    spi.io_clkshamt_bits <= bits(_GEN_39, 2, 0)
    spi.io_spiMode_valid <= _GEN_36
    spi.io_spiMode_bits <= bits(_GEN_37, 1, 0)
    gpout.clock <= clock
    gpout.reset <= reset
    gpout.io_din_valid <= _GEN_40
    gpout.io_din_bits <= bits(_GEN_41, 7, 0)
    counter.clock <= clock
    counter.reset <= reset

  module Core :
    input clock : Clock
    input reset : UInt<1>
    output io_tx : UInt<1>
    input io_rx : UInt<1>
    output io_sclk : UInt<1>
    output io_mosi : UInt<1>
    input io_miso : UInt<1>
    output io_gpout : UInt<8>

    inst alu of Alu @[Core.scala 23:19]
    inst ioBus of IOBus @[Core.scala 26:21]
    mem imem : @[Core.scala 36:32]
      data-type => UInt<8>
      depth => 6144
      read-latency => 1
      write-latency => 1
      reader => instr_MPORT
      reader => instr_MPORT_1
      reader => instr_MPORT_2
      reader => instr_MPORT_3
      reader => instr_MPORT_4
      reader => instr_MPORT_5
      read-under-write => undefined
    mem dmem : @[Core.scala 38:32]
      data-type => UInt<8>
      depth => 4096
      read-latency => 1
      write-latency => 1
      reader => dmem_read_data_MPORT
      reader => dmem_read_data_MPORT_1
      reader => dmem_read_data_MPORT_2
      reader => dmem_read_data_MPORT_3
      writer => MPORT
      writer => MPORT_2
      writer => MPORT_4
      writer => MPORT_6
      writer => MPORT_8
      writer => MPORT_10
      writer => MPORT_12
      read-under-write => undefined
    mem regfile : @[Core.scala 47:27]
      data-type => UInt<32>
      depth => 32
      read-latency => 0
      write-latency => 1
      reader => alu_io_a_MPORT
      reader => alu_io_a_MPORT_1
      reader => alu_io_a_MPORT_2
      reader => alu_io_a_MPORT_3
      reader => alu_io_a_MPORT_4
      reader => alu_io_a_MPORT_5
      reader => alu_io_a_MPORT_6
      reader => alu_io_a_MPORT_7
      reader => alu_io_b_MPORT
      reader => alu_io_b_MPORT_1
      reader => alu_io_b_MPORT_2
      reader => alu_io_b_MPORT_3
      reader => alu_io_b_MPORT_4
      reader => alu_io_b_MPORT_5
      reader => MPORT_1
      reader => MPORT_3
      reader => MPORT_5
      reader => MPORT_7
      reader => MPORT_9
      reader => MPORT_11
      reader => MPORT_13
      reader => MPORT_15
      reader => MPORT_16
      reader => MPORT_17
      reader => ioBus_io_dout_bits_MPORT
      writer => MPORT_14
      read-under-write => undefined
    reg first_time : UInt<1>, clock with :
      reset => (UInt<1>("h0"), first_time) @[Core.scala 42:31]
    reg pc : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pc) @[Core.scala 43:31]
    reg pc_next_plus_6 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pc_next_plus_6) @[Core.scala 44:31]
    reg load_ready : UInt<1>, clock with :
      reset => (UInt<1>("h0"), load_ready) @[Core.scala 63:31]
    node instr_hi_hi = cat(imem.instr_MPORT_5.data, imem.instr_MPORT_4.data) @[Cat.scala 33:92]
    node instr_hi = cat(instr_hi_hi, imem.instr_MPORT_3.data) @[Cat.scala 33:92]
    node instr_lo_hi = cat(imem.instr_MPORT_2.data, imem.instr_MPORT_1.data) @[Cat.scala 33:92]
    node instr_lo = cat(instr_lo_hi, imem.instr_MPORT.data) @[Cat.scala 33:92]
    node _instr_T_24 = cat(instr_hi, instr_lo) @[Cat.scala 33:92]
    node _instr_T_25 = mux(first_time, UInt<1>("h0"), _instr_T_24) @[Core.scala 67:15]
    node instr = _instr_T_25 @[Core.scala 49:28 67:9]
    node _opcode_T = bits(instr, 4, 0) @[Core.scala 91:22]
    node opcode = _opcode_T @[Core.scala 50:28 91:14]
    node _pc_next_T = eq(opcode, UInt<5>("h3")) @[Core.scala 75:13]
    node _opcode_sub_T = bits(instr, 7, 5) @[Core.scala 92:22]
    node opcode_sub = _opcode_sub_T @[Core.scala 51:28 92:14]
    node _pc_next_T_1 = eq(opcode_sub, UInt<3>("h0")) @[Core.scala 75:40]
    node _pc_next_T_2 = and(_pc_next_T, _pc_next_T_1) @[Core.scala 75:26]
    node _pc_next_T_3 = eq(alu.io_zero, UInt<1>("h1")) @[Core.scala 75:68]
    node _pc_next_T_4 = and(_pc_next_T_2, _pc_next_T_3) @[Core.scala 75:53]
    node _imm_b_T = bits(instr, 47, 23) @[Core.scala 100:22]
    node imm_b = _imm_b_T @[Core.scala 100:14 59:28]
    node _imm_b_sext_T = bits(imm_b, 24, 24) @[Core.scala 101:34]
    node _imm_b_sext_T_1 = bits(_imm_b_sext_T, 0, 0) @[Bitwise.scala 77:15]
    node _imm_b_sext_T_2 = mux(_imm_b_sext_T_1, UInt<7>("h7f"), UInt<7>("h0")) @[Bitwise.scala 77:12]
    node _imm_b_sext_T_3 = cat(_imm_b_sext_T_2, imm_b) @[Cat.scala 33:92]
    node imm_b_sext = _imm_b_sext_T_3 @[Core.scala 101:14 60:28]
    node _pc_next_T_5 = add(pc, imm_b_sext) @[Core.scala 75:88]
    node _pc_next_T_6 = tail(_pc_next_T_5, 1) @[Core.scala 75:88]
    node _pc_next_T_7 = eq(opcode, UInt<5>("h3")) @[Core.scala 76:13]
    node _pc_next_T_8 = eq(opcode_sub, UInt<3>("h1")) @[Core.scala 76:40]
    node _pc_next_T_9 = and(_pc_next_T_7, _pc_next_T_8) @[Core.scala 76:26]
    node _pc_next_T_10 = eq(alu.io_zero, UInt<1>("h0")) @[Core.scala 76:68]
    node _pc_next_T_11 = and(_pc_next_T_9, _pc_next_T_10) @[Core.scala 76:53]
    node _pc_next_T_12 = add(pc, imm_b_sext) @[Core.scala 76:88]
    node _pc_next_T_13 = tail(_pc_next_T_12, 1) @[Core.scala 76:88]
    node _pc_next_T_14 = eq(opcode, UInt<5>("h3")) @[Core.scala 77:13]
    node _pc_next_T_15 = eq(opcode_sub, UInt<3>("h3")) @[Core.scala 77:40]
    node _pc_next_T_16 = and(_pc_next_T_14, _pc_next_T_15) @[Core.scala 77:26]
    node _pc_next_T_17 = bits(alu.io_out, 31, 31) @[Core.scala 77:67]
    node _pc_next_T_18 = eq(_pc_next_T_17, UInt<1>("h1")) @[Core.scala 77:72]
    node _pc_next_T_19 = eq(alu.io_zero, UInt<1>("h1")) @[Core.scala 77:100]
    node _pc_next_T_20 = or(_pc_next_T_18, _pc_next_T_19) @[Core.scala 77:85]
    node _pc_next_T_21 = and(_pc_next_T_16, _pc_next_T_20) @[Core.scala 77:53]
    node _pc_next_T_22 = add(pc, imm_b_sext) @[Core.scala 77:120]
    node _pc_next_T_23 = tail(_pc_next_T_22, 1) @[Core.scala 77:120]
    node _pc_next_T_24 = eq(opcode, UInt<5>("h3")) @[Core.scala 78:13]
    node _pc_next_T_25 = eq(opcode_sub, UInt<3>("h2")) @[Core.scala 78:40]
    node _pc_next_T_26 = and(_pc_next_T_24, _pc_next_T_25) @[Core.scala 78:26]
    node _pc_next_T_27 = bits(alu.io_out, 31, 31) @[Core.scala 78:66]
    node _pc_next_T_28 = eq(_pc_next_T_27, UInt<1>("h1")) @[Core.scala 78:71]
    node _pc_next_T_29 = and(_pc_next_T_26, _pc_next_T_28) @[Core.scala 78:53]
    node _pc_next_T_30 = add(pc, imm_b_sext) @[Core.scala 78:93]
    node _pc_next_T_31 = tail(_pc_next_T_30, 1) @[Core.scala 78:93]
    node _pc_next_T_32 = eq(opcode, UInt<5>("h3")) @[Core.scala 79:13]
    node _pc_next_T_33 = eq(opcode_sub, UInt<3>("h4")) @[Core.scala 79:40]
    node _pc_next_T_34 = and(_pc_next_T_32, _pc_next_T_33) @[Core.scala 79:26]
    node _pc_next_T_35 = eq(opcode, UInt<5>("h4")) @[Core.scala 81:13]
    node _pc_next_T_36 = eq(load_ready, UInt<1>("h0")) @[Core.scala 81:29]
    node _pc_next_T_37 = and(_pc_next_T_35, _pc_next_T_36) @[Core.scala 81:26]
    node _pc_next_T_38 = eq(opcode, UInt<5>("h6")) @[Core.scala 83:13]
    node _pc_next_T_39 = eq(opcode_sub, UInt<3>("h0")) @[Core.scala 83:40]
    node _pc_next_T_40 = and(_pc_next_T_38, _pc_next_T_39) @[Core.scala 83:26]
    node _pc_next_T_41 = eq(ioBus.io_din_valid, UInt<1>("h0")) @[Core.scala 83:56]
    node _pc_next_T_42 = and(_pc_next_T_40, _pc_next_T_41) @[Core.scala 83:53]
    node _pc_next_T_43 = eq(opcode, UInt<5>("h6")) @[Core.scala 84:13]
    node _pc_next_T_44 = eq(opcode_sub, UInt<3>("h1")) @[Core.scala 84:40]
    node _pc_next_T_45 = and(_pc_next_T_43, _pc_next_T_44) @[Core.scala 84:26]
    node _pc_next_T_46 = eq(ioBus.io_dout_ready, UInt<1>("h0")) @[Core.scala 84:56]
    node _pc_next_T_47 = and(_pc_next_T_45, _pc_next_T_46) @[Core.scala 84:53]
    node _pc_next_T_48 = mux(_pc_next_T_47, pc, pc_next_plus_6) @[Mux.scala 101:16]
    node _pc_next_T_49 = mux(_pc_next_T_42, pc, _pc_next_T_48) @[Mux.scala 101:16]
    node _pc_next_T_50 = mux(_pc_next_T_37, pc, _pc_next_T_49) @[Mux.scala 101:16]
    node _pc_next_T_51 = mux(_pc_next_T_34, alu.io_out, _pc_next_T_50) @[Mux.scala 101:16]
    node _pc_next_T_52 = mux(_pc_next_T_29, _pc_next_T_31, _pc_next_T_51) @[Mux.scala 101:16]
    node _pc_next_T_53 = mux(_pc_next_T_21, _pc_next_T_23, _pc_next_T_52) @[Mux.scala 101:16]
    node _pc_next_T_54 = mux(_pc_next_T_11, _pc_next_T_13, _pc_next_T_53) @[Mux.scala 101:16]
    node _pc_next_T_55 = mux(_pc_next_T_4, _pc_next_T_6, _pc_next_T_54) @[Mux.scala 101:16]
    node pc_next = _pc_next_T_55 @[Core.scala 45:28 74:11]
    node _instr_T = add(pc_next, UInt<1>("h0")) @[Core.scala 67:76]
    node _instr_T_1 = tail(_instr_T, 1) @[Core.scala 67:76]
    node _GEN_0 = validif(UInt<1>("h1"), _instr_T_1) @[Core.scala 67:{67,67}]
    node _instr_WIRE = _GEN_0 @[Core.scala 67:67]
    node _instr_T_2 = or(_instr_WIRE, UInt<13>("h0")) @[Core.scala 67:67]
    node _instr_T_3 = bits(_instr_T_2, 12, 0) @[Core.scala 67:67]
    node _GEN_1 = mux(UInt<1>("h1"), UInt<1>("h1"), UInt<1>("h0")) @[Core.scala 36:32 67:{67,67}]
    node _GEN_2 = validif(UInt<1>("h1"), _instr_T_3) @[Core.scala 67:{67,67}]
    node _GEN_3 = validif(UInt<1>("h1"), clock) @[Core.scala 67:{67,67}]
    node _instr_T_4 = add(pc_next, UInt<1>("h1")) @[Core.scala 67:76]
    node _instr_T_5 = tail(_instr_T_4, 1) @[Core.scala 67:76]
    node _GEN_4 = validif(UInt<1>("h1"), _instr_T_5) @[Core.scala 67:{67,67}]
    node _instr_WIRE_1 = _GEN_4 @[Core.scala 67:67]
    node _instr_T_6 = or(_instr_WIRE_1, UInt<13>("h0")) @[Core.scala 67:67]
    node _instr_T_7 = bits(_instr_T_6, 12, 0) @[Core.scala 67:67]
    node _GEN_5 = validif(UInt<1>("h1"), _instr_T_7) @[Core.scala 67:{67,67}]
    node _instr_T_8 = add(pc_next, UInt<2>("h2")) @[Core.scala 67:76]
    node _instr_T_9 = tail(_instr_T_8, 1) @[Core.scala 67:76]
    node _GEN_6 = validif(UInt<1>("h1"), _instr_T_9) @[Core.scala 67:{67,67}]
    node _instr_WIRE_2 = _GEN_6 @[Core.scala 67:67]
    node _instr_T_10 = or(_instr_WIRE_2, UInt<13>("h0")) @[Core.scala 67:67]
    node _instr_T_11 = bits(_instr_T_10, 12, 0) @[Core.scala 67:67]
    node _GEN_7 = validif(UInt<1>("h1"), _instr_T_11) @[Core.scala 67:{67,67}]
    node _instr_T_12 = add(pc_next, UInt<2>("h3")) @[Core.scala 67:76]
    node _instr_T_13 = tail(_instr_T_12, 1) @[Core.scala 67:76]
    node _GEN_8 = validif(UInt<1>("h1"), _instr_T_13) @[Core.scala 67:{67,67}]
    node _instr_WIRE_3 = _GEN_8 @[Core.scala 67:67]
    node _instr_T_14 = or(_instr_WIRE_3, UInt<13>("h0")) @[Core.scala 67:67]
    node _instr_T_15 = bits(_instr_T_14, 12, 0) @[Core.scala 67:67]
    node _GEN_9 = validif(UInt<1>("h1"), _instr_T_15) @[Core.scala 67:{67,67}]
    node _instr_T_16 = add(pc_next, UInt<3>("h4")) @[Core.scala 67:76]
    node _instr_T_17 = tail(_instr_T_16, 1) @[Core.scala 67:76]
    node _GEN_10 = validif(UInt<1>("h1"), _instr_T_17) @[Core.scala 67:{67,67}]
    node _instr_WIRE_4 = _GEN_10 @[Core.scala 67:67]
    node _instr_T_18 = or(_instr_WIRE_4, UInt<13>("h0")) @[Core.scala 67:67]
    node _instr_T_19 = bits(_instr_T_18, 12, 0) @[Core.scala 67:67]
    node _GEN_11 = validif(UInt<1>("h1"), _instr_T_19) @[Core.scala 67:{67,67}]
    node _instr_T_20 = add(pc_next, UInt<3>("h5")) @[Core.scala 67:76]
    node _instr_T_21 = tail(_instr_T_20, 1) @[Core.scala 67:76]
    node _GEN_12 = validif(UInt<1>("h1"), _instr_T_21) @[Core.scala 67:{67,67}]
    node _instr_WIRE_5 = _GEN_12 @[Core.scala 67:67]
    node _instr_T_22 = or(_instr_WIRE_5, UInt<13>("h0")) @[Core.scala 67:67]
    node _instr_T_23 = bits(_instr_T_22, 12, 0) @[Core.scala 67:67]
    node _GEN_13 = validif(UInt<1>("h1"), _instr_T_23) @[Core.scala 67:{67,67}]
    node _pc_next_plus_6_T = add(pc_next, UInt<3>("h6")) @[Core.scala 70:29]
    node _pc_next_plus_6_T_1 = tail(_pc_next_plus_6_T, 1) @[Core.scala 70:29]
    node _rd_T = bits(instr, 12, 8) @[Core.scala 93:22]
    node _rs1_T = bits(instr, 17, 13) @[Core.scala 94:22]
    node _rs1_i_T = bits(instr, 15, 13) @[Core.scala 95:36]
    node _rs1_i_T_1 = cat(UInt<2>("h0"), _rs1_i_T) @[Cat.scala 33:92]
    node _rs1_s_T = bits(instr, 15, 13) @[Core.scala 96:36]
    node _rs1_s_T_1 = cat(UInt<2>("h0"), _rs1_s_T) @[Cat.scala 33:92]
    node _rs2_T = bits(instr, 22, 18) @[Core.scala 97:22]
    node _rs2_s_T = bits(instr, 12, 8) @[Core.scala 98:22]
    node _imm_T = bits(instr, 47, 16) @[Core.scala 99:22]
    node _command_T = eq(opcode, UInt<5>("h1")) @[Core.scala 105:13]
    node _command_T_1 = eq(opcode_sub, UInt<3>("h1")) @[Core.scala 105:40]
    node _command_T_2 = and(_command_T, _command_T_1) @[Core.scala 105:26]
    node _command_T_3 = eq(opcode, UInt<5>("h1")) @[Core.scala 106:13]
    node _command_T_4 = eq(opcode_sub, UInt<3>("h2")) @[Core.scala 106:40]
    node _command_T_5 = and(_command_T_3, _command_T_4) @[Core.scala 106:26]
    node _command_T_6 = eq(opcode, UInt<5>("h2")) @[Core.scala 108:13]
    node _command_T_7 = eq(opcode_sub, UInt<3>("h1")) @[Core.scala 108:40]
    node _command_T_8 = and(_command_T_6, _command_T_7) @[Core.scala 108:26]
    node _command_T_9 = eq(opcode, UInt<5>("h2")) @[Core.scala 109:13]
    node _command_T_10 = eq(opcode_sub, UInt<3>("h2")) @[Core.scala 109:40]
    node _command_T_11 = and(_command_T_9, _command_T_10) @[Core.scala 109:26]
    node _command_T_12 = eq(opcode, UInt<5>("h3")) @[Core.scala 111:13]
    node _command_T_13 = eq(opcode_sub, UInt<3>("h0")) @[Core.scala 111:40]
    node _command_T_14 = and(_command_T_12, _command_T_13) @[Core.scala 111:26]
    node _command_T_15 = eq(opcode, UInt<5>("h3")) @[Core.scala 112:13]
    node _command_T_16 = eq(opcode_sub, UInt<3>("h1")) @[Core.scala 112:40]
    node _command_T_17 = and(_command_T_15, _command_T_16) @[Core.scala 112:26]
    node _command_T_18 = eq(opcode, UInt<5>("h3")) @[Core.scala 113:13]
    node _command_T_19 = eq(opcode_sub, UInt<3>("h2")) @[Core.scala 113:40]
    node _command_T_20 = and(_command_T_18, _command_T_19) @[Core.scala 113:26]
    node _command_T_21 = eq(opcode, UInt<5>("h3")) @[Core.scala 114:13]
    node _command_T_22 = eq(opcode_sub, UInt<3>("h3")) @[Core.scala 114:40]
    node _command_T_23 = and(_command_T_21, _command_T_22) @[Core.scala 114:26]
    node _command_T_24 = eq(opcode, UInt<5>("h3")) @[Core.scala 115:13]
    node _command_T_25 = eq(opcode_sub, UInt<3>("h4")) @[Core.scala 115:40]
    node _command_T_26 = and(_command_T_24, _command_T_25) @[Core.scala 115:26]
    node _command_T_27 = eq(opcode, UInt<5>("h4")) @[Core.scala 117:13]
    node _command_T_28 = eq(opcode_sub, UInt<3>("h0")) @[Core.scala 117:40]
    node _command_T_29 = and(_command_T_27, _command_T_28) @[Core.scala 117:26]
    node _command_T_30 = eq(opcode, UInt<5>("h4")) @[Core.scala 118:13]
    node _command_T_31 = eq(opcode_sub, UInt<3>("h1")) @[Core.scala 118:40]
    node _command_T_32 = and(_command_T_30, _command_T_31) @[Core.scala 118:26]
    node _command_T_33 = eq(opcode, UInt<5>("h4")) @[Core.scala 119:13]
    node _command_T_34 = eq(opcode_sub, UInt<3>("h2")) @[Core.scala 119:40]
    node _command_T_35 = and(_command_T_33, _command_T_34) @[Core.scala 119:26]
    node _command_T_36 = eq(opcode, UInt<5>("h4")) @[Core.scala 120:13]
    node _command_T_37 = eq(opcode_sub, UInt<3>("h3")) @[Core.scala 120:40]
    node _command_T_38 = and(_command_T_36, _command_T_37) @[Core.scala 120:26]
    node _command_T_39 = eq(opcode, UInt<5>("h4")) @[Core.scala 121:13]
    node _command_T_40 = eq(opcode_sub, UInt<3>("h4")) @[Core.scala 121:40]
    node _command_T_41 = and(_command_T_39, _command_T_40) @[Core.scala 121:26]
    node _command_T_42 = eq(opcode, UInt<5>("h5")) @[Core.scala 123:13]
    node _command_T_43 = eq(opcode_sub, UInt<3>("h0")) @[Core.scala 123:40]
    node _command_T_44 = and(_command_T_42, _command_T_43) @[Core.scala 123:26]
    node _command_T_45 = eq(opcode, UInt<5>("h5")) @[Core.scala 124:13]
    node _command_T_46 = eq(opcode_sub, UInt<3>("h1")) @[Core.scala 124:40]
    node _command_T_47 = and(_command_T_45, _command_T_46) @[Core.scala 124:26]
    node _command_T_48 = eq(opcode, UInt<5>("h5")) @[Core.scala 125:13]
    node _command_T_49 = eq(opcode_sub, UInt<3>("h2")) @[Core.scala 125:40]
    node _command_T_50 = and(_command_T_48, _command_T_49) @[Core.scala 125:26]
    node _command_T_51 = eq(opcode, UInt<5>("h6")) @[Core.scala 127:13]
    node _command_T_52 = eq(opcode_sub, UInt<3>("h0")) @[Core.scala 127:40]
    node _command_T_53 = and(_command_T_51, _command_T_52) @[Core.scala 127:26]
    node _command_T_54 = eq(opcode, UInt<5>("h6")) @[Core.scala 128:13]
    node _command_T_55 = eq(opcode_sub, UInt<3>("h1")) @[Core.scala 128:40]
    node _command_T_56 = and(_command_T_54, _command_T_55) @[Core.scala 128:26]
    node _command_T_57 = eq(opcode, UInt<5>("h7")) @[Core.scala 130:13]
    node _command_T_58 = eq(opcode_sub, UInt<3>("h0")) @[Core.scala 130:40]
    node _command_T_59 = and(_command_T_57, _command_T_58) @[Core.scala 130:26]
    node _command_T_60 = eq(opcode, UInt<5>("h7")) @[Core.scala 131:13]
    node _command_T_61 = eq(opcode_sub, UInt<3>("h1")) @[Core.scala 131:40]
    node _command_T_62 = and(_command_T_60, _command_T_61) @[Core.scala 131:26]
    node _command_T_63 = eq(opcode, UInt<5>("h7")) @[Core.scala 132:13]
    node _command_T_64 = eq(opcode_sub, UInt<3>("h2")) @[Core.scala 132:40]
    node _command_T_65 = and(_command_T_63, _command_T_64) @[Core.scala 132:26]
    node _command_T_66 = eq(opcode, UInt<5>("h7")) @[Core.scala 133:13]
    node _command_T_67 = eq(opcode_sub, UInt<3>("h3")) @[Core.scala 133:40]
    node _command_T_68 = and(_command_T_66, _command_T_67) @[Core.scala 133:26]
    node _command_T_69 = eq(opcode, UInt<5>("h7")) @[Core.scala 134:13]
    node _command_T_70 = eq(opcode_sub, UInt<3>("h4")) @[Core.scala 134:40]
    node _command_T_71 = and(_command_T_69, _command_T_70) @[Core.scala 134:26]
    node _command_T_72 = eq(opcode, UInt<5>("h7")) @[Core.scala 135:13]
    node _command_T_73 = eq(opcode_sub, UInt<3>("h5")) @[Core.scala 135:40]
    node _command_T_74 = and(_command_T_72, _command_T_73) @[Core.scala 135:26]
    node _command_T_75 = eq(opcode, UInt<5>("h8")) @[Core.scala 137:13]
    node _command_T_76 = eq(opcode_sub, UInt<3>("h0")) @[Core.scala 137:40]
    node _command_T_77 = and(_command_T_75, _command_T_76) @[Core.scala 137:26]
    node _command_T_78 = eq(opcode, UInt<5>("h8")) @[Core.scala 138:13]
    node _command_T_79 = eq(opcode_sub, UInt<3>("h1")) @[Core.scala 138:40]
    node _command_T_80 = and(_command_T_78, _command_T_79) @[Core.scala 138:26]
    node _command_T_81 = eq(opcode, UInt<5>("h8")) @[Core.scala 139:13]
    node _command_T_82 = eq(opcode_sub, UInt<3>("h2")) @[Core.scala 139:40]
    node _command_T_83 = and(_command_T_81, _command_T_82) @[Core.scala 139:26]
    node _command_T_84 = eq(opcode, UInt<5>("h8")) @[Core.scala 140:13]
    node _command_T_85 = eq(opcode_sub, UInt<3>("h3")) @[Core.scala 140:40]
    node _command_T_86 = and(_command_T_84, _command_T_85) @[Core.scala 140:26]
    node _command_T_87 = eq(opcode, UInt<5>("h8")) @[Core.scala 141:13]
    node _command_T_88 = eq(opcode_sub, UInt<3>("h4")) @[Core.scala 141:40]
    node _command_T_89 = and(_command_T_87, _command_T_88) @[Core.scala 141:26]
    node _command_T_90 = eq(opcode, UInt<5>("h8")) @[Core.scala 142:13]
    node _command_T_91 = eq(opcode_sub, UInt<3>("h5")) @[Core.scala 142:40]
    node _command_T_92 = and(_command_T_90, _command_T_91) @[Core.scala 142:26]
    node _command_T_93 = mux(_command_T_92, UInt<8>("h8"), UInt<8>("h0")) @[Mux.scala 101:16]
    node _command_T_94 = mux(_command_T_89, UInt<8>("h7"), _command_T_93) @[Mux.scala 101:16]
    node _command_T_95 = mux(_command_T_86, UInt<8>("h6"), _command_T_94) @[Mux.scala 101:16]
    node _command_T_96 = mux(_command_T_83, UInt<8>("h5"), _command_T_95) @[Mux.scala 101:16]
    node _command_T_97 = mux(_command_T_80, UInt<8>("h4"), _command_T_96) @[Mux.scala 101:16]
    node _command_T_98 = mux(_command_T_77, UInt<8>("h3"), _command_T_97) @[Mux.scala 101:16]
    node _command_T_99 = mux(_command_T_74, UInt<8>("h8"), _command_T_98) @[Mux.scala 101:16]
    node _command_T_100 = mux(_command_T_71, UInt<8>("h7"), _command_T_99) @[Mux.scala 101:16]
    node _command_T_101 = mux(_command_T_68, UInt<8>("h6"), _command_T_100) @[Mux.scala 101:16]
    node _command_T_102 = mux(_command_T_65, UInt<8>("h5"), _command_T_101) @[Mux.scala 101:16]
    node _command_T_103 = mux(_command_T_62, UInt<8>("h4"), _command_T_102) @[Mux.scala 101:16]
    node _command_T_104 = mux(_command_T_59, UInt<8>("h3"), _command_T_103) @[Mux.scala 101:16]
    node _command_T_105 = mux(_command_T_56, UInt<8>("h1"), _command_T_104) @[Mux.scala 101:16]
    node _command_T_106 = mux(_command_T_53, UInt<8>("h1"), _command_T_105) @[Mux.scala 101:16]
    node _command_T_107 = mux(_command_T_50, UInt<8>("h1"), _command_T_106) @[Mux.scala 101:16]
    node _command_T_108 = mux(_command_T_47, UInt<8>("h1"), _command_T_107) @[Mux.scala 101:16]
    node _command_T_109 = mux(_command_T_44, UInt<8>("h1"), _command_T_108) @[Mux.scala 101:16]
    node _command_T_110 = mux(_command_T_41, UInt<8>("h1"), _command_T_109) @[Mux.scala 101:16]
    node _command_T_111 = mux(_command_T_38, UInt<8>("h1"), _command_T_110) @[Mux.scala 101:16]
    node _command_T_112 = mux(_command_T_35, UInt<8>("h1"), _command_T_111) @[Mux.scala 101:16]
    node _command_T_113 = mux(_command_T_32, UInt<8>("h1"), _command_T_112) @[Mux.scala 101:16]
    node _command_T_114 = mux(_command_T_29, UInt<8>("h1"), _command_T_113) @[Mux.scala 101:16]
    node _command_T_115 = mux(_command_T_26, UInt<8>("h1"), _command_T_114) @[Mux.scala 101:16]
    node _command_T_116 = mux(_command_T_23, UInt<8>("h2"), _command_T_115) @[Mux.scala 101:16]
    node _command_T_117 = mux(_command_T_20, UInt<8>("h2"), _command_T_116) @[Mux.scala 101:16]
    node _command_T_118 = mux(_command_T_17, UInt<8>("h2"), _command_T_117) @[Mux.scala 101:16]
    node _command_T_119 = mux(_command_T_14, UInt<8>("h2"), _command_T_118) @[Mux.scala 101:16]
    node _command_T_120 = mux(_command_T_11, UInt<8>("h2"), _command_T_119) @[Mux.scala 101:16]
    node _command_T_121 = mux(_command_T_8, UInt<8>("h1"), _command_T_120) @[Mux.scala 101:16]
    node _command_T_122 = mux(_command_T_5, UInt<8>("h2"), _command_T_121) @[Mux.scala 101:16]
    node _command_T_123 = mux(_command_T_2, UInt<8>("h1"), _command_T_122) @[Mux.scala 101:16]
    node _alu_io_a_T = eq(opcode, UInt<5>("h2")) @[Core.scala 148:13]
    node _alu_io_a_T_1 = eq(opcode, UInt<5>("h3")) @[Core.scala 149:13]
    node _alu_io_a_T_2 = eq(opcode_sub, UInt<3>("h4")) @[Core.scala 149:40]
    node _alu_io_a_T_3 = and(_alu_io_a_T_1, _alu_io_a_T_2) @[Core.scala 149:26]
    node _alu_io_a_T_4 = eq(opcode, UInt<5>("h4")) @[Core.scala 150:13]
    node _alu_io_a_T_5 = eq(opcode, UInt<5>("h5")) @[Core.scala 151:13]
    node _alu_io_a_T_6 = eq(opcode, UInt<5>("h6")) @[Core.scala 152:13]
    node _alu_io_a_T_7 = eq(opcode_sub, UInt<3>("h0")) @[Core.scala 152:40]
    node _alu_io_a_T_8 = and(_alu_io_a_T_6, _alu_io_a_T_7) @[Core.scala 152:26]
    node _alu_io_a_T_9 = eq(opcode, UInt<5>("h6")) @[Core.scala 153:13]
    node _alu_io_a_T_10 = eq(opcode_sub, UInt<3>("h1")) @[Core.scala 153:40]
    node _alu_io_a_T_11 = and(_alu_io_a_T_9, _alu_io_a_T_10) @[Core.scala 153:26]
    node _alu_io_a_T_12 = eq(opcode, UInt<5>("h8")) @[Core.scala 154:13]
    node _alu_io_a_T_13 = mux(_alu_io_a_T_12, regfile.alu_io_a_MPORT_7.data, regfile.alu_io_a_MPORT.data) @[Mux.scala 101:16]
    node _alu_io_a_T_14 = mux(_alu_io_a_T_11, regfile.alu_io_a_MPORT_6.data, _alu_io_a_T_13) @[Mux.scala 101:16]
    node _alu_io_a_T_15 = mux(_alu_io_a_T_8, regfile.alu_io_a_MPORT_5.data, _alu_io_a_T_14) @[Mux.scala 101:16]
    node _alu_io_a_T_16 = mux(_alu_io_a_T_5, regfile.alu_io_a_MPORT_4.data, _alu_io_a_T_15) @[Mux.scala 101:16]
    node _alu_io_a_T_17 = mux(_alu_io_a_T_4, regfile.alu_io_a_MPORT_3.data, _alu_io_a_T_16) @[Mux.scala 101:16]
    node _alu_io_a_T_18 = mux(_alu_io_a_T_3, regfile.alu_io_a_MPORT_2.data, _alu_io_a_T_17) @[Mux.scala 101:16]
    node _alu_io_a_T_19 = mux(_alu_io_a_T, regfile.alu_io_a_MPORT_1.data, _alu_io_a_T_18) @[Mux.scala 101:16]
    node _alu_io_b_T = eq(opcode, UInt<5>("h1")) @[Core.scala 157:13]
    node _alu_io_b_T_1 = eq(opcode, UInt<5>("h2")) @[Core.scala 158:13]
    node _alu_io_b_T_2 = eq(opcode, UInt<5>("h3")) @[Core.scala 159:13]
    node _alu_io_b_T_3 = eq(opcode_sub, UInt<3>("h0")) @[Core.scala 159:40]
    node _alu_io_b_T_4 = and(_alu_io_b_T_2, _alu_io_b_T_3) @[Core.scala 159:26]
    node _alu_io_b_T_5 = eq(opcode, UInt<5>("h3")) @[Core.scala 160:13]
    node _alu_io_b_T_6 = eq(opcode_sub, UInt<3>("h1")) @[Core.scala 160:40]
    node _alu_io_b_T_7 = and(_alu_io_b_T_5, _alu_io_b_T_6) @[Core.scala 160:26]
    node _alu_io_b_T_8 = eq(opcode, UInt<5>("h3")) @[Core.scala 161:13]
    node _alu_io_b_T_9 = eq(opcode_sub, UInt<3>("h2")) @[Core.scala 161:40]
    node _alu_io_b_T_10 = and(_alu_io_b_T_8, _alu_io_b_T_9) @[Core.scala 161:26]
    node _alu_io_b_T_11 = eq(opcode, UInt<5>("h3")) @[Core.scala 162:13]
    node _alu_io_b_T_12 = eq(opcode_sub, UInt<3>("h3")) @[Core.scala 162:40]
    node _alu_io_b_T_13 = and(_alu_io_b_T_11, _alu_io_b_T_12) @[Core.scala 162:26]
    node _alu_io_b_T_14 = eq(opcode, UInt<5>("h3")) @[Core.scala 163:13]
    node _alu_io_b_T_15 = eq(opcode_sub, UInt<3>("h4")) @[Core.scala 163:40]
    node _alu_io_b_T_16 = and(_alu_io_b_T_14, _alu_io_b_T_15) @[Core.scala 163:26]
    node _alu_io_b_T_17 = eq(opcode, UInt<5>("h4")) @[Core.scala 164:13]
    node _alu_io_b_T_18 = eq(opcode, UInt<5>("h5")) @[Core.scala 165:13]
    node _alu_io_b_T_19 = eq(opcode, UInt<5>("h6")) @[Core.scala 166:13]
    node _alu_io_b_T_20 = eq(opcode, UInt<5>("h7")) @[Core.scala 167:13]
    node _alu_io_b_T_21 = eq(opcode, UInt<5>("h8")) @[Core.scala 168:13]
    node imm = _imm_T @[Core.scala 58:28 99:14]
    node _alu_io_b_T_22 = mux(_alu_io_b_T_21, imm, UInt<32>("h0")) @[Mux.scala 101:16]
    node _alu_io_b_T_23 = mux(_alu_io_b_T_20, regfile.alu_io_b_MPORT_5.data, _alu_io_b_T_22) @[Mux.scala 101:16]
    node _alu_io_b_T_24 = mux(_alu_io_b_T_19, imm, _alu_io_b_T_23) @[Mux.scala 101:16]
    node _alu_io_b_T_25 = mux(_alu_io_b_T_18, imm, _alu_io_b_T_24) @[Mux.scala 101:16]
    node _alu_io_b_T_26 = mux(_alu_io_b_T_17, imm, _alu_io_b_T_25) @[Mux.scala 101:16]
    node _alu_io_b_T_27 = mux(_alu_io_b_T_16, imm, _alu_io_b_T_26) @[Mux.scala 101:16]
    node _alu_io_b_T_28 = mux(_alu_io_b_T_13, regfile.alu_io_b_MPORT_4.data, _alu_io_b_T_27) @[Mux.scala 101:16]
    node _alu_io_b_T_29 = mux(_alu_io_b_T_10, regfile.alu_io_b_MPORT_3.data, _alu_io_b_T_28) @[Mux.scala 101:16]
    node _alu_io_b_T_30 = mux(_alu_io_b_T_7, regfile.alu_io_b_MPORT_2.data, _alu_io_b_T_29) @[Mux.scala 101:16]
    node _alu_io_b_T_31 = mux(_alu_io_b_T_4, regfile.alu_io_b_MPORT_1.data, _alu_io_b_T_30) @[Mux.scala 101:16]
    node _alu_io_b_T_32 = mux(_alu_io_b_T_1, imm, _alu_io_b_T_31) @[Mux.scala 101:16]
    node _alu_io_b_T_33 = mux(_alu_io_b_T, regfile.alu_io_b_MPORT.data, _alu_io_b_T_32) @[Mux.scala 101:16]
    node _T = eq(opcode, UInt<5>("h5")) @[Core.scala 173:16]
    node _T_1 = eq(opcode_sub, UInt<3>("h0")) @[Core.scala 173:45]
    node _T_2 = and(_T, _T_1) @[Core.scala 173:30]
    node _T_3 = add(alu.io_out, UInt<1>("h0")) @[Core.scala 175:23]
    node _T_4 = tail(_T_3, 1) @[Core.scala 175:23]
    node _T_5 = bits(_T_4, 11, 0) @[Core.scala 175:11]
    node _T_6 = bits(regfile.MPORT_1.data, 7, 0) @[Core.scala 175:47]
    node _T_7 = add(alu.io_out, UInt<1>("h1")) @[Core.scala 175:23]
    node _T_8 = tail(_T_7, 1) @[Core.scala 175:23]
    node _T_9 = bits(_T_8, 11, 0) @[Core.scala 175:11]
    node _T_10 = bits(regfile.MPORT_3.data, 15, 8) @[Core.scala 175:47]
    node _T_11 = add(alu.io_out, UInt<2>("h2")) @[Core.scala 175:23]
    node _T_12 = tail(_T_11, 1) @[Core.scala 175:23]
    node _T_13 = bits(_T_12, 11, 0) @[Core.scala 175:11]
    node _T_14 = bits(regfile.MPORT_5.data, 23, 16) @[Core.scala 175:47]
    node _T_15 = add(alu.io_out, UInt<2>("h3")) @[Core.scala 175:23]
    node _T_16 = tail(_T_15, 1) @[Core.scala 175:23]
    node _T_17 = bits(_T_16, 11, 0) @[Core.scala 175:11]
    node _T_18 = bits(regfile.MPORT_7.data, 31, 24) @[Core.scala 175:47]
    node _T_19 = eq(opcode, UInt<5>("h5")) @[Core.scala 177:22]
    node _T_20 = eq(opcode_sub, UInt<3>("h1")) @[Core.scala 177:51]
    node _T_21 = and(_T_19, _T_20) @[Core.scala 177:36]
    node _T_22 = add(alu.io_out, UInt<1>("h0")) @[Core.scala 179:23]
    node _T_23 = tail(_T_22, 1) @[Core.scala 179:23]
    node _T_24 = bits(_T_23, 11, 0) @[Core.scala 179:11]
    node _T_25 = bits(regfile.MPORT_9.data, 7, 0) @[Core.scala 179:47]
    node _T_26 = add(alu.io_out, UInt<1>("h1")) @[Core.scala 179:23]
    node _T_27 = tail(_T_26, 1) @[Core.scala 179:23]
    node _T_28 = bits(_T_27, 11, 0) @[Core.scala 179:11]
    node _T_29 = bits(regfile.MPORT_11.data, 15, 8) @[Core.scala 179:47]
    node _T_30 = eq(opcode, UInt<5>("h5")) @[Core.scala 181:22]
    node _T_31 = eq(opcode_sub, UInt<3>("h2")) @[Core.scala 181:51]
    node _T_32 = and(_T_30, _T_31) @[Core.scala 181:36]
    node _T_33 = bits(alu.io_out, 11, 0) @[Core.scala 182:9]
    node _T_34 = bits(regfile.MPORT_13.data, 7, 0) @[Core.scala 182:39]
    node _GEN_14 = validif(_T_32, _T_33) @[Core.scala 181:66 182:9]
    node _GEN_15 = validif(_T_32, clock) @[Core.scala 181:66 182:9]
    node _GEN_16 = mux(_T_32, UInt<1>("h1"), UInt<1>("h0")) @[Core.scala 181:66 182:9 38:32]
    node _GEN_17 = validif(_T_32, UInt<1>("h1")) @[Core.scala 181:66 182:22]
    node rs2_s = _rs2_s_T @[Core.scala 57:28 98:14]
    node _GEN_18 = validif(_T_32, rs2_s) @[Core.scala 181:66 182:32]
    node _GEN_19 = validif(_T_32, _T_34) @[Core.scala 181:66 182:22]
    node _GEN_20 = validif(_T_21, _T_24) @[Core.scala 177:66 179:11]
    node _GEN_21 = validif(_T_21, clock) @[Core.scala 177:66 179:11]
    node _GEN_22 = mux(_T_21, UInt<1>("h1"), UInt<1>("h0")) @[Core.scala 177:66 179:11 38:32]
    node _GEN_23 = validif(_T_21, UInt<1>("h1")) @[Core.scala 177:66 179:30]
    node _GEN_24 = validif(_T_21, rs2_s) @[Core.scala 177:66 179:40]
    node _GEN_25 = validif(_T_21, _T_25) @[Core.scala 177:66 179:30]
    node _GEN_26 = validif(_T_21, _T_28) @[Core.scala 177:66 179:11]
    node _GEN_27 = validif(_T_21, _T_29) @[Core.scala 177:66 179:30]
    node _GEN_28 = validif(eq(_T_21, UInt<1>("h0")), _GEN_14) @[Core.scala 177:66]
    node _GEN_29 = validif(eq(_T_21, UInt<1>("h0")), _GEN_15) @[Core.scala 177:66]
    node _GEN_30 = mux(_T_21, UInt<1>("h0"), _GEN_16) @[Core.scala 177:66 38:32]
    node _GEN_31 = validif(eq(_T_21, UInt<1>("h0")), _GEN_17) @[Core.scala 177:66]
    node _GEN_32 = validif(eq(_T_21, UInt<1>("h0")), _GEN_18) @[Core.scala 177:66]
    node _GEN_33 = validif(eq(_T_21, UInt<1>("h0")), _GEN_19) @[Core.scala 177:66]
    node _GEN_34 = validif(_T_2, _T_5) @[Core.scala 173:60 175:11]
    node _GEN_35 = validif(_T_2, clock) @[Core.scala 173:60 175:11]
    node _GEN_36 = mux(_T_2, UInt<1>("h1"), UInt<1>("h0")) @[Core.scala 173:60 175:11 38:32]
    node _GEN_37 = validif(_T_2, UInt<1>("h1")) @[Core.scala 173:60 175:30]
    node _GEN_38 = validif(_T_2, rs2_s) @[Core.scala 173:60 175:40]
    node _GEN_39 = validif(_T_2, _T_6) @[Core.scala 173:60 175:30]
    node _GEN_40 = validif(_T_2, _T_9) @[Core.scala 173:60 175:11]
    node _GEN_41 = validif(_T_2, _T_10) @[Core.scala 173:60 175:30]
    node _GEN_42 = validif(_T_2, _T_13) @[Core.scala 173:60 175:11]
    node _GEN_43 = validif(_T_2, _T_14) @[Core.scala 173:60 175:30]
    node _GEN_44 = validif(_T_2, _T_17) @[Core.scala 173:60 175:11]
    node _GEN_45 = validif(_T_2, _T_18) @[Core.scala 173:60 175:30]
    node _GEN_46 = validif(eq(_T_2, UInt<1>("h0")), _GEN_20) @[Core.scala 173:60]
    node _GEN_47 = validif(eq(_T_2, UInt<1>("h0")), _GEN_21) @[Core.scala 173:60]
    node _GEN_48 = mux(_T_2, UInt<1>("h0"), _GEN_22) @[Core.scala 173:60 38:32]
    node _GEN_49 = validif(eq(_T_2, UInt<1>("h0")), _GEN_23) @[Core.scala 173:60]
    node _GEN_50 = validif(eq(_T_2, UInt<1>("h0")), _GEN_24) @[Core.scala 173:60]
    node _GEN_51 = validif(eq(_T_2, UInt<1>("h0")), _GEN_25) @[Core.scala 173:60]
    node _GEN_52 = validif(eq(_T_2, UInt<1>("h0")), _GEN_26) @[Core.scala 173:60]
    node _GEN_53 = validif(eq(_T_2, UInt<1>("h0")), _GEN_27) @[Core.scala 173:60]
    node _GEN_54 = validif(eq(_T_2, UInt<1>("h0")), _GEN_28) @[Core.scala 173:60]
    node _GEN_55 = validif(eq(_T_2, UInt<1>("h0")), _GEN_29) @[Core.scala 173:60]
    node _GEN_56 = mux(_T_2, UInt<1>("h0"), _GEN_30) @[Core.scala 173:60 38:32]
    node _GEN_57 = validif(eq(_T_2, UInt<1>("h0")), _GEN_31) @[Core.scala 173:60]
    node _GEN_58 = validif(eq(_T_2, UInt<1>("h0")), _GEN_32) @[Core.scala 173:60]
    node _GEN_59 = validif(eq(_T_2, UInt<1>("h0")), _GEN_33) @[Core.scala 173:60]
    node _dmem_read_data_T = add(alu.io_out, UInt<1>("h0")) @[Core.scala 187:47]
    node _dmem_read_data_T_1 = tail(_dmem_read_data_T, 1) @[Core.scala 187:47]
    node _GEN_60 = validif(UInt<1>("h1"), _dmem_read_data_T_1) @[Core.scala 187:{35,35}]
    node _dmem_read_data_WIRE = _GEN_60 @[Core.scala 187:35]
    node _dmem_read_data_T_2 = or(_dmem_read_data_WIRE, UInt<12>("h0")) @[Core.scala 187:35]
    node _dmem_read_data_T_3 = bits(_dmem_read_data_T_2, 11, 0) @[Core.scala 187:35]
    node _GEN_61 = validif(UInt<1>("h1"), _dmem_read_data_T_3) @[Core.scala 187:{35,35}]
    node _dmem_read_data_T_4 = add(alu.io_out, UInt<1>("h1")) @[Core.scala 187:47]
    node _dmem_read_data_T_5 = tail(_dmem_read_data_T_4, 1) @[Core.scala 187:47]
    node _GEN_62 = validif(UInt<1>("h1"), _dmem_read_data_T_5) @[Core.scala 187:{35,35}]
    node _dmem_read_data_WIRE_1 = _GEN_62 @[Core.scala 187:35]
    node _dmem_read_data_T_6 = or(_dmem_read_data_WIRE_1, UInt<12>("h0")) @[Core.scala 187:35]
    node _dmem_read_data_T_7 = bits(_dmem_read_data_T_6, 11, 0) @[Core.scala 187:35]
    node _GEN_63 = validif(UInt<1>("h1"), _dmem_read_data_T_7) @[Core.scala 187:{35,35}]
    node _dmem_read_data_T_8 = add(alu.io_out, UInt<2>("h2")) @[Core.scala 187:47]
    node _dmem_read_data_T_9 = tail(_dmem_read_data_T_8, 1) @[Core.scala 187:47]
    node _GEN_64 = validif(UInt<1>("h1"), _dmem_read_data_T_9) @[Core.scala 187:{35,35}]
    node _dmem_read_data_WIRE_2 = _GEN_64 @[Core.scala 187:35]
    node _dmem_read_data_T_10 = or(_dmem_read_data_WIRE_2, UInt<12>("h0")) @[Core.scala 187:35]
    node _dmem_read_data_T_11 = bits(_dmem_read_data_T_10, 11, 0) @[Core.scala 187:35]
    node _GEN_65 = validif(UInt<1>("h1"), _dmem_read_data_T_11) @[Core.scala 187:{35,35}]
    node _dmem_read_data_T_12 = add(alu.io_out, UInt<2>("h3")) @[Core.scala 187:47]
    node _dmem_read_data_T_13 = tail(_dmem_read_data_T_12, 1) @[Core.scala 187:47]
    node _GEN_66 = validif(UInt<1>("h1"), _dmem_read_data_T_13) @[Core.scala 187:{35,35}]
    node _dmem_read_data_WIRE_3 = _GEN_66 @[Core.scala 187:35]
    node _dmem_read_data_T_14 = or(_dmem_read_data_WIRE_3, UInt<12>("h0")) @[Core.scala 187:35]
    node _dmem_read_data_T_15 = bits(_dmem_read_data_T_14, 11, 0) @[Core.scala 187:35]
    node _GEN_67 = validif(UInt<1>("h1"), _dmem_read_data_T_15) @[Core.scala 187:{35,35}]
    node dmem_read_data_lo = cat(dmem.dmem_read_data_MPORT_1.data, dmem.dmem_read_data_MPORT.data) @[Cat.scala 33:92]
    node dmem_read_data_hi = cat(dmem.dmem_read_data_MPORT_3.data, dmem.dmem_read_data_MPORT_2.data) @[Cat.scala 33:92]
    node _dmem_read_data_T_16 = cat(dmem_read_data_hi, dmem_read_data_lo) @[Cat.scala 33:92]
    node _T_35 = eq(opcode, UInt<5>("h4")) @[Core.scala 192:16]
    node _T_36 = eq(load_ready, UInt<1>("h0")) @[Core.scala 192:33]
    node _T_37 = and(_T_35, _T_36) @[Core.scala 192:30]
    node _GEN_68 = mux(_T_37, UInt<1>("h1"), UInt<1>("h0")) @[Core.scala 191:14 192:46 193:16]
    node rd = _rd_T @[Core.scala 52:28 93:14]
    node _T_38 = eq(rd, UInt<1>("h0")) @[Core.scala 198:9]
    node _T_39 = eq(opcode, UInt<5>("h3")) @[Core.scala 200:13]
    node _T_40 = eq(opcode_sub, UInt<3>("h0")) @[Core.scala 200:40]
    node _T_41 = and(_T_39, _T_40) @[Core.scala 200:26]
    node _T_42 = add(pc, UInt<3>("h6")) @[Core.scala 200:61]
    node _T_43 = tail(_T_42, 1) @[Core.scala 200:61]
    node _T_44 = eq(opcode, UInt<5>("h3")) @[Core.scala 201:13]
    node _T_45 = eq(opcode_sub, UInt<3>("h1")) @[Core.scala 201:40]
    node _T_46 = and(_T_44, _T_45) @[Core.scala 201:26]
    node _T_47 = add(pc, UInt<3>("h6")) @[Core.scala 201:61]
    node _T_48 = tail(_T_47, 1) @[Core.scala 201:61]
    node _T_49 = eq(opcode, UInt<5>("h3")) @[Core.scala 202:13]
    node _T_50 = eq(opcode_sub, UInt<3>("h2")) @[Core.scala 202:40]
    node _T_51 = and(_T_49, _T_50) @[Core.scala 202:26]
    node _T_52 = add(pc, UInt<3>("h6")) @[Core.scala 202:61]
    node _T_53 = tail(_T_52, 1) @[Core.scala 202:61]
    node _T_54 = eq(opcode, UInt<5>("h3")) @[Core.scala 203:13]
    node _T_55 = eq(opcode_sub, UInt<3>("h3")) @[Core.scala 203:40]
    node _T_56 = and(_T_54, _T_55) @[Core.scala 203:26]
    node _T_57 = add(pc, UInt<3>("h6")) @[Core.scala 203:61]
    node _T_58 = tail(_T_57, 1) @[Core.scala 203:61]
    node _T_59 = eq(opcode, UInt<5>("h3")) @[Core.scala 204:13]
    node _T_60 = eq(opcode_sub, UInt<3>("h4")) @[Core.scala 204:40]
    node _T_61 = and(_T_59, _T_60) @[Core.scala 204:26]
    node _T_62 = add(pc, UInt<3>("h6")) @[Core.scala 204:61]
    node _T_63 = tail(_T_62, 1) @[Core.scala 204:61]
    node _T_64 = eq(opcode, UInt<5>("h4")) @[Core.scala 206:13]
    node _T_65 = eq(opcode_sub, UInt<3>("h0")) @[Core.scala 206:40]
    node _T_66 = and(_T_64, _T_65) @[Core.scala 206:26]
    node _T_67 = eq(opcode, UInt<5>("h4")) @[Core.scala 207:13]
    node _T_68 = eq(opcode_sub, UInt<3>("h1")) @[Core.scala 207:40]
    node _T_69 = and(_T_67, _T_68) @[Core.scala 207:26]
    node dmem_read_data = _dmem_read_data_T_16 @[Core.scala 186:18 62:28]
    node _T_70 = bits(dmem_read_data, 15, 15) @[Core.scala 207:84]
    node _T_71 = bits(_T_70, 0, 0) @[Bitwise.scala 77:15]
    node _T_72 = mux(_T_71, UInt<16>("hffff"), UInt<16>("h0")) @[Bitwise.scala 77:12]
    node _T_73 = bits(dmem_read_data, 15, 0) @[Core.scala 207:105]
    node _T_74 = cat(_T_72, _T_73) @[Cat.scala 33:92]
    node _T_75 = eq(opcode, UInt<5>("h4")) @[Core.scala 208:13]
    node _T_76 = eq(opcode_sub, UInt<3>("h1")) @[Core.scala 208:40]
    node _T_77 = and(_T_75, _T_76) @[Core.scala 208:26]
    node _T_78 = bits(dmem_read_data, 7, 7) @[Core.scala 208:84]
    node _T_79 = bits(_T_78, 0, 0) @[Bitwise.scala 77:15]
    node _T_80 = mux(_T_79, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 77:12]
    node _T_81 = bits(dmem_read_data, 7, 0) @[Core.scala 208:104]
    node _T_82 = cat(_T_80, _T_81) @[Cat.scala 33:92]
    node _T_83 = eq(opcode, UInt<5>("h4")) @[Core.scala 209:13]
    node _T_84 = eq(opcode_sub, UInt<3>("h1")) @[Core.scala 209:40]
    node _T_85 = and(_T_83, _T_84) @[Core.scala 209:26]
    node _T_86 = and(UInt<16>("hffff"), dmem_read_data) @[Core.scala 209:67]
    node _T_87 = eq(opcode, UInt<5>("h4")) @[Core.scala 210:13]
    node _T_88 = eq(opcode_sub, UInt<3>("h2")) @[Core.scala 210:40]
    node _T_89 = and(_T_87, _T_88) @[Core.scala 210:26]
    node _T_90 = and(UInt<8>("hff"), dmem_read_data) @[Core.scala 210:65]
    node _T_91 = eq(opcode, UInt<5>("h5")) @[Core.scala 212:13]
    node _T_92 = eq(opcode, UInt<5>("h6")) @[Core.scala 214:13]
    node _T_93 = eq(opcode_sub, UInt<3>("h0")) @[Core.scala 214:40]
    node _T_94 = and(_T_92, _T_93) @[Core.scala 214:26]
    node _T_95 = and(_T_94, ioBus.io_din_valid) @[Core.scala 214:53]
    node _T_96 = eq(opcode, UInt<5>("h6")) @[Core.scala 215:13]
    node _T_97 = eq(opcode_sub, UInt<3>("h0")) @[Core.scala 215:40]
    node _T_98 = and(_T_96, _T_97) @[Core.scala 215:26]
    node _T_99 = eq(ioBus.io_din_valid, UInt<1>("h0")) @[Core.scala 215:56]
    node _T_100 = and(_T_98, _T_99) @[Core.scala 215:53]
    node _T_101 = eq(opcode, UInt<5>("h6")) @[Core.scala 216:13]
    node _T_102 = eq(opcode_sub, UInt<3>("h1")) @[Core.scala 216:40]
    node _T_103 = and(_T_101, _T_102) @[Core.scala 216:26]
    node _T_104 = mux(_T_103, regfile.MPORT_17.data, alu.io_out) @[Mux.scala 101:16]
    node _T_105 = mux(_T_100, regfile.MPORT_16.data, _T_104) @[Mux.scala 101:16]
    node _T_106 = mux(_T_95, ioBus.io_din_bits, _T_105) @[Mux.scala 101:16]
    node _T_107 = mux(_T_91, regfile.MPORT_15.data, _T_106) @[Mux.scala 101:16]
    node _T_108 = mux(_T_89, _T_90, _T_107) @[Mux.scala 101:16]
    node _T_109 = mux(_T_85, _T_86, _T_108) @[Mux.scala 101:16]
    node _T_110 = mux(_T_77, _T_82, _T_109) @[Mux.scala 101:16]
    node _T_111 = mux(_T_69, _T_74, _T_110) @[Mux.scala 101:16]
    node _T_112 = mux(_T_66, dmem_read_data, _T_111) @[Mux.scala 101:16]
    node _T_113 = mux(_T_61, _T_63, _T_112) @[Mux.scala 101:16]
    node _T_114 = mux(_T_56, _T_58, _T_113) @[Mux.scala 101:16]
    node _T_115 = mux(_T_51, _T_53, _T_114) @[Mux.scala 101:16]
    node _T_116 = mux(_T_46, _T_48, _T_115) @[Mux.scala 101:16]
    node _T_117 = mux(_T_41, _T_43, _T_116) @[Mux.scala 101:16]
    node _T_118 = mux(_T_38, UInt<32>("h0"), _T_117) @[Mux.scala 101:16]
    node _ioBus_io_din_ready_T = eq(opcode, UInt<5>("h6")) @[Core.scala 223:33]
    node _ioBus_io_din_ready_T_1 = eq(opcode_sub, UInt<3>("h0")) @[Core.scala 223:60]
    node _ioBus_io_din_ready_T_2 = and(_ioBus_io_din_ready_T, _ioBus_io_din_ready_T_1) @[Core.scala 223:46]
    node _ioBus_io_dout_valid_T = eq(opcode, UInt<5>("h6")) @[Core.scala 225:34]
    node _ioBus_io_dout_valid_T_1 = eq(opcode_sub, UInt<3>("h1")) @[Core.scala 225:61]
    node _ioBus_io_dout_valid_T_2 = and(_ioBus_io_dout_valid_T, _ioBus_io_dout_valid_T_1) @[Core.scala 225:47]
    node rs1 = _rs1_T @[Core.scala 53:28 94:14]
    node rs1_i = _rs1_i_T_1 @[Core.scala 54:28 95:14]
    node rs1_s = _rs1_s_T_1 @[Core.scala 55:28 96:14]
    node rs2 = _rs2_T @[Core.scala 56:28 97:14]
    node command = _command_T_123 @[Core.scala 104:11 89:24]
    io_tx <= ioBus.io_tx @[Core.scala 29:9]
    io_sclk <= ioBus.io_sclk @[Core.scala 31:11]
    io_mosi <= ioBus.io_mosi @[Core.scala 32:11]
    io_gpout <= ioBus.io_gpout @[Core.scala 33:12]
    alu.clock <= clock
    alu.reset <= reset
    alu.io_command <= command @[Core.scala 146:18]
    alu.io_a <= _alu_io_a_T_19 @[Core.scala 147:18]
    alu.io_b <= _alu_io_b_T_33 @[Core.scala 156:18]
    ioBus.clock <= clock
    ioBus.reset <= reset
    ioBus.io_devId <= alu.io_out @[Core.scala 221:18]
    ioBus.io_din_ready <= _ioBus_io_din_ready_T_2 @[Core.scala 223:22]
    ioBus.io_dout_valid <= _ioBus_io_dout_valid_T_2 @[Core.scala 225:23]
    ioBus.io_dout_bits <= regfile.ioBus_io_dout_bits_MPORT.data @[Core.scala 226:22]
    ioBus.io_rx <= io_rx @[Core.scala 28:15]
    ioBus.io_miso <= io_miso @[Core.scala 30:17]
    imem.instr_MPORT.addr <= _GEN_2
    imem.instr_MPORT.en <= _GEN_1
    imem.instr_MPORT.clk <= _GEN_3
    imem.instr_MPORT_1.addr <= _GEN_5
    imem.instr_MPORT_1.en <= _GEN_1
    imem.instr_MPORT_1.clk <= _GEN_3
    imem.instr_MPORT_2.addr <= _GEN_7
    imem.instr_MPORT_2.en <= _GEN_1
    imem.instr_MPORT_2.clk <= _GEN_3
    imem.instr_MPORT_3.addr <= _GEN_9
    imem.instr_MPORT_3.en <= _GEN_1
    imem.instr_MPORT_3.clk <= _GEN_3
    imem.instr_MPORT_4.addr <= _GEN_11
    imem.instr_MPORT_4.en <= _GEN_1
    imem.instr_MPORT_4.clk <= _GEN_3
    imem.instr_MPORT_5.addr <= _GEN_13
    imem.instr_MPORT_5.en <= _GEN_1
    imem.instr_MPORT_5.clk <= _GEN_3
    dmem.dmem_read_data_MPORT.addr <= _GEN_61
    dmem.dmem_read_data_MPORT.en <= _GEN_1
    dmem.dmem_read_data_MPORT.clk <= _GEN_3
    dmem.dmem_read_data_MPORT_1.addr <= _GEN_63
    dmem.dmem_read_data_MPORT_1.en <= _GEN_1
    dmem.dmem_read_data_MPORT_1.clk <= _GEN_3
    dmem.dmem_read_data_MPORT_2.addr <= _GEN_65
    dmem.dmem_read_data_MPORT_2.en <= _GEN_1
    dmem.dmem_read_data_MPORT_2.clk <= _GEN_3
    dmem.dmem_read_data_MPORT_3.addr <= _GEN_67
    dmem.dmem_read_data_MPORT_3.en <= _GEN_1
    dmem.dmem_read_data_MPORT_3.clk <= _GEN_3
    dmem.MPORT.addr <= _GEN_34
    dmem.MPORT.en <= _GEN_36
    dmem.MPORT.clk <= _GEN_35
    dmem.MPORT.data <= _GEN_39
    dmem.MPORT.mask <= _GEN_37
    dmem.MPORT_2.addr <= _GEN_40
    dmem.MPORT_2.en <= _GEN_36
    dmem.MPORT_2.clk <= _GEN_35
    dmem.MPORT_2.data <= _GEN_41
    dmem.MPORT_2.mask <= _GEN_37
    dmem.MPORT_4.addr <= _GEN_42
    dmem.MPORT_4.en <= _GEN_36
    dmem.MPORT_4.clk <= _GEN_35
    dmem.MPORT_4.data <= _GEN_43
    dmem.MPORT_4.mask <= _GEN_37
    dmem.MPORT_6.addr <= _GEN_44
    dmem.MPORT_6.en <= _GEN_36
    dmem.MPORT_6.clk <= _GEN_35
    dmem.MPORT_6.data <= _GEN_45
    dmem.MPORT_6.mask <= _GEN_37
    dmem.MPORT_8.addr <= _GEN_46
    dmem.MPORT_8.en <= _GEN_48
    dmem.MPORT_8.clk <= _GEN_47
    dmem.MPORT_8.data <= _GEN_51
    dmem.MPORT_8.mask <= _GEN_49
    dmem.MPORT_10.addr <= _GEN_52
    dmem.MPORT_10.en <= _GEN_48
    dmem.MPORT_10.clk <= _GEN_47
    dmem.MPORT_10.data <= _GEN_53
    dmem.MPORT_10.mask <= _GEN_49
    dmem.MPORT_12.addr <= _GEN_54
    dmem.MPORT_12.en <= _GEN_56
    dmem.MPORT_12.clk <= _GEN_55
    dmem.MPORT_12.data <= _GEN_59
    dmem.MPORT_12.mask <= _GEN_57
    first_time <= mux(reset, UInt<1>("h1"), UInt<1>("h0")) @[Core.scala 42:{31,31} 68:14]
    pc <= mux(reset, UInt<32>("h0"), pc_next) @[Core.scala 43:{31,31} 66:6]
    pc_next_plus_6 <= mux(reset, UInt<32>("h0"), _pc_next_plus_6_T_1) @[Core.scala 44:{31,31} 70:18]
    regfile.alu_io_a_MPORT.addr <= rs1 @[Core.scala 147:36]
    regfile.alu_io_a_MPORT.en <= UInt<1>("h1") @[Core.scala 147:36]
    regfile.alu_io_a_MPORT.clk <= clock @[Core.scala 147:36]
    regfile.alu_io_a_MPORT_1.addr <= rs1_i @[Core.scala 148:38]
    regfile.alu_io_a_MPORT_1.en <= UInt<1>("h1") @[Core.scala 148:38]
    regfile.alu_io_a_MPORT_1.clk <= clock @[Core.scala 148:38]
    regfile.alu_io_a_MPORT_2.addr <= rs1_i @[Core.scala 149:65]
    regfile.alu_io_a_MPORT_2.en <= UInt<1>("h1") @[Core.scala 149:65]
    regfile.alu_io_a_MPORT_2.clk <= clock @[Core.scala 149:65]
    regfile.alu_io_a_MPORT_3.addr <= rs1_i @[Core.scala 150:38]
    regfile.alu_io_a_MPORT_3.en <= UInt<1>("h1") @[Core.scala 150:38]
    regfile.alu_io_a_MPORT_3.clk <= clock @[Core.scala 150:38]
    regfile.alu_io_a_MPORT_4.addr <= rs1_s @[Core.scala 151:38]
    regfile.alu_io_a_MPORT_4.en <= UInt<1>("h1") @[Core.scala 151:38]
    regfile.alu_io_a_MPORT_4.clk <= clock @[Core.scala 151:38]
    regfile.alu_io_a_MPORT_5.addr <= rs1_i @[Core.scala 152:65]
    regfile.alu_io_a_MPORT_5.en <= UInt<1>("h1") @[Core.scala 152:65]
    regfile.alu_io_a_MPORT_5.clk <= clock @[Core.scala 152:65]
    regfile.alu_io_a_MPORT_6.addr <= rs1_s @[Core.scala 153:65]
    regfile.alu_io_a_MPORT_6.en <= UInt<1>("h1") @[Core.scala 153:65]
    regfile.alu_io_a_MPORT_6.clk <= clock @[Core.scala 153:65]
    regfile.alu_io_a_MPORT_7.addr <= rs1_i @[Core.scala 154:38]
    regfile.alu_io_a_MPORT_7.en <= UInt<1>("h1") @[Core.scala 154:38]
    regfile.alu_io_a_MPORT_7.clk <= clock @[Core.scala 154:38]
    regfile.alu_io_b_MPORT.addr <= rs2 @[Core.scala 157:38]
    regfile.alu_io_b_MPORT.en <= UInt<1>("h1") @[Core.scala 157:38]
    regfile.alu_io_b_MPORT.clk <= clock @[Core.scala 157:38]
    regfile.alu_io_b_MPORT_1.addr <= rs2 @[Core.scala 159:65]
    regfile.alu_io_b_MPORT_1.en <= UInt<1>("h1") @[Core.scala 159:65]
    regfile.alu_io_b_MPORT_1.clk <= clock @[Core.scala 159:65]
    regfile.alu_io_b_MPORT_2.addr <= rs2 @[Core.scala 160:65]
    regfile.alu_io_b_MPORT_2.en <= UInt<1>("h1") @[Core.scala 160:65]
    regfile.alu_io_b_MPORT_2.clk <= clock @[Core.scala 160:65]
    regfile.alu_io_b_MPORT_3.addr <= rs2 @[Core.scala 161:65]
    regfile.alu_io_b_MPORT_3.en <= UInt<1>("h1") @[Core.scala 161:65]
    regfile.alu_io_b_MPORT_3.clk <= clock @[Core.scala 161:65]
    regfile.alu_io_b_MPORT_4.addr <= rs2 @[Core.scala 162:65]
    regfile.alu_io_b_MPORT_4.en <= UInt<1>("h1") @[Core.scala 162:65]
    regfile.alu_io_b_MPORT_4.clk <= clock @[Core.scala 162:65]
    regfile.alu_io_b_MPORT_5.addr <= rs2 @[Core.scala 167:38]
    regfile.alu_io_b_MPORT_5.en <= UInt<1>("h1") @[Core.scala 167:38]
    regfile.alu_io_b_MPORT_5.clk <= clock @[Core.scala 167:38]
    regfile.MPORT_1.addr <= _GEN_38
    regfile.MPORT_1.en <= _GEN_36
    regfile.MPORT_1.clk <= _GEN_35
    regfile.MPORT_3.addr <= _GEN_38
    regfile.MPORT_3.en <= _GEN_36
    regfile.MPORT_3.clk <= _GEN_35
    regfile.MPORT_5.addr <= _GEN_38
    regfile.MPORT_5.en <= _GEN_36
    regfile.MPORT_5.clk <= _GEN_35
    regfile.MPORT_7.addr <= _GEN_38
    regfile.MPORT_7.en <= _GEN_36
    regfile.MPORT_7.clk <= _GEN_35
    regfile.MPORT_9.addr <= _GEN_50
    regfile.MPORT_9.en <= _GEN_48
    regfile.MPORT_9.clk <= _GEN_47
    regfile.MPORT_11.addr <= _GEN_50
    regfile.MPORT_11.en <= _GEN_48
    regfile.MPORT_11.clk <= _GEN_47
    regfile.MPORT_13.addr <= _GEN_58
    regfile.MPORT_13.en <= _GEN_56
    regfile.MPORT_13.clk <= _GEN_55
    regfile.MPORT_15.addr <= rd @[Core.scala 212:38]
    regfile.MPORT_15.en <= UInt<1>("h1") @[Core.scala 212:38]
    regfile.MPORT_15.clk <= clock @[Core.scala 212:38]
    regfile.MPORT_16.addr <= rd @[Core.scala 215:88]
    regfile.MPORT_16.en <= UInt<1>("h1") @[Core.scala 215:88]
    regfile.MPORT_16.clk <= clock @[Core.scala 215:88]
    regfile.MPORT_17.addr <= rd @[Core.scala 216:65]
    regfile.MPORT_17.en <= UInt<1>("h1") @[Core.scala 216:65]
    regfile.MPORT_17.clk <= clock @[Core.scala 216:65]
    regfile.ioBus_io_dout_bits_MPORT.addr <= rs2_s @[Core.scala 226:32]
    regfile.ioBus_io_dout_bits_MPORT.en <= UInt<1>("h1") @[Core.scala 226:32]
    regfile.ioBus_io_dout_bits_MPORT.clk <= clock @[Core.scala 226:32]
    regfile.MPORT_14.addr <= rd @[Core.scala 197:10]
    regfile.MPORT_14.en <= UInt<1>("h1") @[Core.scala 197:10]
    regfile.MPORT_14.clk <= clock @[Core.scala 197:10]
    regfile.MPORT_14.data <= _T_118 @[Core.scala 197:18]
    regfile.MPORT_14.mask <= UInt<1>("h1") @[Core.scala 197:18]
    load_ready <= mux(reset, UInt<1>("h0"), _GEN_68) @[Core.scala 63:{31,31}]
