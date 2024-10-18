package core

import chisel3._
import chisel3.util._

class ClkCounter(clockFrequency: Int) extends Module {
  val io = IO(new Bundle {
    val clkCount = Output(UInt(64.W))
    val clkFreq  = Output(UInt(32.W))
  })

  val counter = RegInit(0.U(64.W))
  counter := counter + 1.U

  io.clkCount := counter
  io.clkFreq := clockFrequency.U
}
