package core

import chisel3._
import chisel3.util._

class GeneralPurposeOutput extends Module {
  val io = IO(new Bundle {
    // core.dout.valid -> GPO.io.din.valid
    // core.dout.ready <- GPO.io.din.ready
    val din    = Flipped(Decoupled(UInt(8.W)))
    val dout   = Output(UInt(8.W))
    val pinOut = Output(UInt(8.W))
  })

  val pinOutReg = RegInit(0.U(8.W))
  
  io.pinOut := pinOutReg
  io.din.ready := true.B  // いつでもデータを受け付ける
  io.dout := pinOutReg

  when (io.din.valid) {
    pinOutReg := io.din.bits
  }
}
