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
  
    val sclk    = Output(Bool())
    val mosi    = Output(Bool())
    val miso    = Input(Bool())

    val gpio    = Output(UInt(8.W))                    // 暫定
  })

  val uartTx = Module(new UartTx(20250000, 9600))
  val uartRx = Module(new UartRx(20250000, 9600, 2))
  val spi    = Module(new Spi(20250000))
  val gpio   = Module(new GeneralPurposeOutput())       // 暫定

  val isUart       = Wire(Bool())
  val isSpiData    = Wire(Bool())
  val isSpiMode    = Wire(Bool())
  val isSpiCshamt  = Wire(Bool())
  val isGpio       = Wire(Bool())

  val isOutInstr   = Wire(Bool())
  val isInInstr    = Wire(Bool())


  isUart       := (io.devId === 0.U)
  isSpiData    := (io.devId === 1.U)
  isSpiMode    := (io.devId === 2.U)
  isSpiCshamt  := (io.devId === 3.U)
  isGpio       := (io.devId === 4.U)
  
  ///////////// in / out instr //////////////
  
  isOutInstr := io.dout.valid
  isInInstr  := io.din.ready
  
  ///////////////////////////////////////////

  /////////////////// din ///////////////////
  uartRx.io.rx := io.rx
  spi.io.miso  := io.miso

  when (isInInstr) {
    // in 命令の場合はデフォルトで valid かつ ready にする
    io.din.valid := MuxCase(true.B, Seq(
      (isUart)      -> uartRx.io.dout.valid,
      (isSpiData)   -> spi.io.dout.valid,
    ))
    io.din.bits := MuxCase(0.U, Seq(
      (isUart)    -> uartRx.io.dout.bits,
      (isSpiData) -> spi.io.dout.bits,
      (isSpiMode)   -> spi.io.spiModeO,
      (isSpiCshamt) -> spi.io.clkshamtO,
    ))

    when (isUart) {
      uartRx.io.dout.ready := io.din.ready
    } .elsewhen (isSpiData) {
      spi.io.dout.ready := io.din.ready
    }
  } .otherwise {
    io.din.valid := false.B
    io.din.bits := 0.U
  }

  // uartRx.io.rx := true.B
  // ↓何もしていない時のfalse?
  uartRx.io.dout.ready := false.B
  spi.io.dout.ready    := false.B

  ///////////////////////////////////////////


  ////////////////// dout ///////////////////
  io.tx   := uartTx.io.tx
  io.sclk := spi.io.sclk
  io.mosi := spi.io.mosi
  io.gpio := gpio.io.pinOut

  uartTx.io.din.valid   := false.B
  spi.io.din.valid      := false.B
  spi.io.spiMode.valid  := false.B
  spi.io.clkshamt.valid := false.B
  gpio.io.din.valid     := false.B

  uartTx.io.din.bits    := 0.U
  spi.io.din.bits       := 0.U
  spi.io.spiMode.bits   := 0.U
  spi.io.clkshamt.bits  := 0.U
  gpio.io.din.bits      := 0.U

  when (isOutInstr) {
    when (isUart) {
      uartTx.io.din.valid := io.dout.valid
      uartTx.io.din.bits  := io.dout.bits
    } .elsewhen (isSpiData) {
      spi.io.din.valid := io.dout.valid
      spi.io.din.bits  := io.dout.bits
    } .elsewhen (isSpiMode) {
      spi.io.spiMode.valid := io.dout.valid
      spi.io.spiMode.bits  := io.dout.bits
    } .elsewhen (isSpiCshamt) {
      spi.io.clkshamt.valid := io.dout.valid
      spi.io.clkshamt.bits  := io.dout.bits
    } .elsewhen (isGpio) {
      gpio.io.din.valid     := io.dout.valid
      gpio.io.din.bits      := io.dout.bits
    }

    io.dout.ready := MuxCase(true.B, Seq(
      (isUart)      -> uartTx.io.din.ready,
      (isSpiData)   -> spi.io.din.ready,
      (isSpiMode)   -> spi.io.spiMode.ready,
      (isSpiCshamt) -> spi.io.clkshamt.ready,
      (isGpio)      -> gpio.io.din.ready, 
    ))
  } .otherwise {
    io.dout.ready := false.B
  }
  ///////////////////////////////////////////
}
