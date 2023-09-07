// See README.md for license details.

package core

import chisel3._
import chisel3.util._

class Alu extends Module {
  val io = IO(new Bundle {
    val command  = Input(UInt(8.W))
    val a        = Input(UInt(32.W))
    val b        = Input(UInt(32.W))
    val out      = Output(UInt(32.W))
  })

  io.out := MuxCase(0.U(8.W), Seq(
    (io.command === 1.U(8.W)) -> (io.a + io.b),
  ))
}
