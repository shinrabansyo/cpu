package core

import chisel3._
import chisel3.util._
import chiseltest._
import chiseltest.simulator
import chisel3.iotesters._
import org.scalatest.flatspec.AnyFlatSpec

// val mosi     = Output(Bool())
// val miso     = Input(Bool())
// val sclk     = Output(Bool())
// val din      = Flipped(Decoupled(UInt(8.W)))  // 任意のデータを送るとき
// val dout     = Decoupled(UInt(8.W))           // データを読み取るとき
// val clkshamt = Flipped(Decoupled(UInt(8.W)))  // シフト量(shift amount) + 1
// val spiMode  = Flipped(Decoupled(UInt(2.W)))  // SPIモード
class SpiTest extends AnyFlatSpec with ChiselScalatestTester {
  it must "runs Spi" in { test(new Spi(1)).withAnnotations(Seq(WriteFstAnnotation, WriteVcdAnnotation)) { c =>
    c.reset.poke(true.B)
    c.io.miso.poke(false.B)

    c.io.din.bits.poke(0x00.U)
    c.io.din.valid.poke(false.B)

    c.io.dout.ready.poke(false.B)

    c.io.clkshamt.bits.poke(0.U)
    c.io.clkshamt.valid.poke(false.B)

    c.io.spiMode.bits.poke(0.U)
    c.io.spiMode.valid.poke(false.B)

    c.clock.step(4)
    c.reset.poke(false.B)

    // -----------
    
    c.io.clkshamt.bits.poke(0.U)
    c.io.clkshamt.valid.poke(true.B)
    
    c.io.spiMode.bits.poke(0.U)
    c.io.spiMode.valid.poke(true.B)
    
    c.io.din.bits.poke(0x41.U)
    c.io.din.valid.poke(true.B)

    c.clock.step(1)
    
    c.io.clkshamt.valid.poke(false.B)
    c.io.spiMode.valid.poke(false.B)
    c.io.din.valid.poke(false.B)

    c.clock.step(20)
  } }
}


