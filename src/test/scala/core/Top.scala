package core

import chisel3._
import chiseltest._
import chiseltest.simulator
import chisel3.iotesters._
import chisel3.stage.ChiselStage
import org.scalatest.flatspec.AnyFlatSpec

class TopTest extends AnyFlatSpec with ChiselScalatestTester {
      it must "runs Top" in { test(new Core).withAnnotations(Seq(WriteFstAnnotation, WriteVcdAnnotation)) { c =>
        var timeout = 174
        c.reset.poke(true.B)
        c.io.rx.poke(true.B)
        c.clock.step(4)
        c.reset.poke(false.B)
        c.clock.setTimeout(timeout+4)
        for(i <- 0 until timeout) {
          c.io.rx.poke(c.io.tx.peek().litToBoolean)
          c.clock.step(1)
        }
      } }
      (new ChiselStage).emitVerilog(new Core, Array(
        "-o", "core.v",
        "--target-dir", "rtl/",
      ))
}
