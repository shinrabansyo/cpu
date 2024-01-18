package core

import chisel3._
import chisel3.util._

class UartTx extends Module {
  val io = IO(new Bundle {
    val tx       = Output(Bool())
    val din      = Decoupled(UInt(8.W))
  })
  // din.ready, din.valid, din.bits が使用可能
  // 送信側：din.valid をアサートすると din.bits が読み取り可能
  // 受信側：din.ready をアサートすると din.bits の読み取りが完了
  // Valid / Ready ハンドシェイク
  // din.ready が立っていれば Core 側が din.bits に書き込む → din.valid をアサートする
  // din.valid が立っていれば UartTx 側が din.bits を読み取る
  // (Core ←<din>→ UartTx) -<tx>→ 他の機器
  // (Core ←<dout>→ UartRx) ←<rx>- 他の機器
}

class UartRx extends Module {
  val io = IO(new Bundle {
    val rx       = Input(Bool())
    val dout     = Decoupled(UInt(8.W))
  })
}
