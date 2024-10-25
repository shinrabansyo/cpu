package core

import chisel3._
import chisel3.util._

class IOBus extends Module {
  val io = IO(new Bundle {
    val devId   = Input(UInt(32.W))
    val din     = Decoupled(UInt(32.W))           // CPUに対してin（=IOBusからの出力）
    val dout    = Flipped(Decoupled(UInt(32.W)))  // CPUに対してout（=IOBusへの入力）

    val tx      = Output(Bool())
    val rx      = Input(Bool())
  
    val sclk    = Output(Bool())
    val mosi    = Output(Bool())
    val miso    = Input(Bool())

    val gpout   = Output(UInt(8.W))                     // 暫定
  })

  val CLOCK_FREQ = 20250000

  val uartTx  = Module(new UartTx(CLOCK_FREQ, 9600))
  val uartRx  = Module(new UartRx(CLOCK_FREQ, 9600, 2))
  val spi     = Module(new Spi(CLOCK_FREQ))
  val gpout   = Module(new GeneralPurposeOutput())       // 暫定
  val counter = Module(new ClkCounter(CLOCK_FREQ))

  val isUart       = Wire(Bool())
  val isSpiData    = Wire(Bool())
  val isSpiMode    = Wire(Bool())
  val isSpiCshamt  = Wire(Bool())
  val isGpout      = Wire(Bool())
  val isClkCountL  = Wire(Bool())
  val isClkCountU  = Wire(Bool())
  val isClkFreq    = Wire(Bool()) 

  val isOutInstr   = Wire(Bool())
  val isInInstr    = Wire(Bool())

  isUart       := (io.devId === 0x0000.U)
  isSpiData    := (io.devId === 0x0001.U)
  isSpiMode    := (io.devId === 0x0002.U)
  isSpiCshamt  := (io.devId === 0x0003.U)
  isGpout      := (io.devId === 0x0004.U)
  isClkCountL  := (io.devId === 0x1000.U)
  isClkCountU  := (io.devId === 0x1001.U)
  isClkFreq    := (io.devId === 0x1002.U)
  
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
    // ※ 8bit 幅の値は 32bit 幅に拡張する
    io.din.bits := MuxCase(0.U, Seq(
      (isUart)    -> uartRx.io.dout.bits,
      (isSpiData) -> spi.io.dout.bits,
      (isSpiMode)   -> spi.io.spiModeO,
      (isSpiCshamt) -> spi.io.clkshamtO,
      (isGpout)     -> gpout.io.dout,
      (isClkCountL) -> counter.io.clkCount(31, 0),
      (isClkCountU) -> counter.io.clkCount(63, 32),
      (isClkFreq)   -> counter.io.clkFreq,
      
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
  io.tx    := uartTx.io.tx
  io.sclk  := spi.io.sclk
  io.mosi  := spi.io.mosi
  io.gpout := gpout.io.pinOut

  uartTx.io.din.valid   := false.B
  spi.io.din.valid      := false.B
  spi.io.spiMode.valid  := false.B
  spi.io.clkshamt.valid := false.B
  gpout.io.din.valid    := false.B

  uartTx.io.din.bits    := 0.U
  spi.io.din.bits       := 0.U
  spi.io.spiMode.bits   := 0.U
  spi.io.clkshamt.bits  := 0.U
  gpout.io.din.bits     := 0.U

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
    } .elsewhen (isGpout) {
      gpout.io.din.valid     := io.dout.valid
      gpout.io.din.bits      := io.dout.bits
    }

    io.dout.ready := MuxCase(true.B, Seq(
      (isUart)      -> uartTx.io.din.ready,
      (isSpiData)   -> spi.io.din.ready,
      (isSpiMode)   -> spi.io.spiMode.ready,
      (isSpiCshamt) -> spi.io.clkshamt.ready,
      (isGpout)     -> gpout.io.din.ready, 
    ))
  } .otherwise {
    io.dout.ready := false.B
  }
  ///////////////////////////////////////////
}
