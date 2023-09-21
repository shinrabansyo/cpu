package core

import chisel3._
import chisel3.util._

class Core extends Module {
  val io = IO(new Bundle {
    val a        = Input(UInt(8.W))
    val b        = Input(UInt(8.W))
    val out      = Output(UInt(8.W))
  })

  val mem        = Mem(1024 * 6, UInt(8.W))
  val pc         = RegInit(0.U(32.W))
  val regfile    = Mem(32, UInt(32.W))
  
  val instr      = Wire(UInt(48.W))
  val opcode     = Wire(UInt(5.W))
  val opcode_sub = Wire(UInt(3.W))
  val rd         = Wire(UInt(5.W))
  val rs1        = Wire(UInt(5.W))
  val rs2        = Wire(UInt(5.W))
  val imm        = Wire(UInt(32.W))

  // Fetch
  instr := Cat(
    (0 until 6).map(i => mem.read(pc + i.U)).reverse
  )
  
  // Decode

  val command    = Wire(UInt(8.W))

  opcode     := instr( 4,  0)
  opcode_sub := instr( 7,  5)
  rd         := instr(12,  8)
  rs1        := instr(17, 13)
  rs2        := instr(22, 18)
  imm        := instr(47, 16)

  command := MuxCase(0.U(8.W), Seq(
    (opcode === 1.U(5.W) && opcode_sub === 1.U(3.W)) -> (1.U(8.W)),
  ))
  
  // Execute
  val alu = Module(new Alu)
  
  alu.io.command := command
  alu.io.a       := regfile(rs1)
  alu.io.b       := regfile(rs2)
  regfile(rd)    := alu.io.out

}

