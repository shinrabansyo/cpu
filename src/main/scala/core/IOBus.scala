package core

import chisel3._
import chisel3.util._

class IOBus extends Module {
  val io = IO(new Bundle {
    val devId   = Input(UInt(32.W))
    val din     = Decoupled(UInt(8.W))
    val dout    = Flipped(Decoupled(UInt(8.W)))

    val tx      = Output(Bool())
    val rx      = Input(Bool())
  })

  val uartTx = Module(new UartTx(27000000, 115200))
  val uartRx = Module(new UartRx(27000000, 115200, 2))

  val isUart = Wire(Bool())

  isUart := (io.devId === 0.U)

  /////////////////// din ///////////////////
  uartRx.io.rx := io.rx

  io.din.valid := MuxCase(true.B, Seq(
    (isUart) -> uartRx.io.dout.valid
  ))
  io.din.bits := MuxCase(0.U, Seq(
    (isUart) -> uartRx.io.dout.bits
  ))

  // uartRx.io.rx := true.B
  uartRx.io.dout.ready := false.B
  when (isUart) {
    uartRx.io.dout.ready := io.din.ready
  }
  ///////////////////////////////////////////


  ////////////////// dout ///////////////////
  io.tx := uartTx.io.tx

  uartTx.io.din.valid := false.B
  uartTx.io.din.bits := 0.U
  when (isUart) {
    uartTx.io.din.valid := io.dout.valid
    uartTx.io.din.bits := io.dout.bits
  }

  io.dout.ready := MuxCase(true.B, Seq(
    (isUart) -> uartTx.io.din.ready
  ))
  ///////////////////////////////////////////
}
