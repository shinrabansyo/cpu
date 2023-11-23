package core

import chisel3._
import chiseltest._
import chisel3.iotesters._
import org.scalatest.flatspec.AnyFlatSpec

class TopTest extends AnyFlatSpec with ChiselScalatestTester {
      it must "runs Top" in { test(new Core).withAnnotations(Seq(WriteFstAnnotation)) { c =>
        c.reset.poke(true.B)
        c.clock.step(4)
        c.reset.poke(false.B)
        c.clock.setTimeout(74)
        c.clock.step(70)
      } }
    
}
