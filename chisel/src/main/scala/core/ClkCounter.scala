package core

import chisel3._
import chisel3.util._

class ClkCounter(clockFrequency: Int) extends Module {
  val io = IO(new Bundle {
    // クロック関連
    val clkCount = Output(UInt(64.W))
    val clkFreq  = Output(UInt(32.W))

    // タイマー関連
    val msCount = Output(UInt(64.W))
  })

  // クロックカウンタ
  val counter = RegInit(0.U(64.W))
  counter := counter + 1.U

  io.clkCount := counter
  io.clkFreq := clockFrequency.U

  // タイマ
  val msCount = RegInit(0.U(64.W))
  val msCounter = RegInit(0.U(32.W))
  final val msThreshold = clockFrequency / 1000

  io.msCount := msCount

  when (msCounter >= msThreshold.U) {
    msCounter := 0.U
    msCount := msCount + 1.U
  } .otherwise {
    msCounter := msCounter + 1.U
  }
}
