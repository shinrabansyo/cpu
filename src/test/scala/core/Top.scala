package core

import chisel3._
import chisel3.iotesters._

class TopTest(dut: Adder) extends PeekPokeTester(dut) {
    poke(dut.io.a, 3.U)
    poke(dut.io.b, 5.U)
    step(1)
    println("Result is: " + peek(dut.io.out).toString)
    poke(dut.io.a, 250.U)
    poke(dut.io.b, 10.U)
    step(1)
    println("Result is: " + peek(dut.io.out).toString)
}

object TopTest extends App {
    chisel3.iotesters.Driver(() => new Adder()) { c =>
        new TopTest(c)
    }
}
