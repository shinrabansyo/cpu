package core

import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile

class Core extends Module {
  /*
  val io = IO(new Bundle {
    val a        = Input(UInt(8.W))
    val b        = Input(UInt(8.W))
    val out      = Output(UInt(8.W))
  })
  */

  val alu = Module(new Alu)

  val imem       = Mem(1024 * 6, UInt(8.W))
  loadMemoryFromFile(imem, "src/main/resources/bootrom.hex")
  val dmem       = Mem(1024 * 4, UInt(8.W))
  loadMemoryFromFile(dmem, "src/main/resources/dmem.hex")

  val old_pc     = RegInit(0.U(32.W))
  val pc         = RegInit(0.U(32.W))
  val regfile    = Mem(32, UInt(32.W))
  
  val instr      = RegInit(0.U(48.W))
  val opcode     = Wire(UInt(5.W))
  val opcode_sub = Wire(UInt(3.W))
  val rd         = Wire(UInt(5.W))
  val rs1        = Wire(UInt(5.W))
  val rs1_i      = Wire(UInt(5.W))
  val rs1_s      = Wire(UInt(5.W))
  val rs2        = Wire(UInt(5.W))
  val rs2_s      = Wire(UInt(5.W))
  val imm        = Wire(UInt(32.W))
  val imm_r      = Wire(UInt(25.W))
  val imm_r_sext = Wire(UInt(32.W))
  
  val dmem_raw   = Wire(UInt(32.W))

  // Fetch
  old_pc := pc
  instr := Cat(
    (0 until 6).map(i => imem.read(pc + i.U)).reverse
  )
  pc := MuxCase((pc + 6.U), Seq(
    (opcode === 3.U(5.W) && opcode_sub === 0.U(3.W) && alu.io.zero === true.B) -> (pc + imm_r_sext)
  ))

  // Decode
  val command    = Wire(UInt(8.W))

  opcode     := instr( 4,  0)
  opcode_sub := instr( 7,  5)
  rd         := instr(12,  8)
  rs1        := instr(17, 13)
  rs1_i      := Cat(0.U(2.W), instr(15, 13))
  rs1_s      := Cat(0.U(2.W), instr(15, 13))
  rs2        := instr(22, 18)
  rs2_s      := instr(12,  8)
  imm        := instr(47, 16)
  imm_r      := instr(47, 23)
  imm_r_sext := Cat(Fill(7, imm_r(24)), imm_r)

  // ALUに発行するコマンド
  command := MuxCase(0.U(8.W), Seq(
    // opcode_subをそのままaluのコマンドにできそう。
    (opcode === 1.U(5.W) && opcode_sub === 1.U(3.W)) -> (1.U(8.W)), // add
    (opcode === 2.U(5.W) && opcode_sub === 1.U(3.W)) -> (1.U(8.W)), // addi

    (opcode === 3.U(5.W) && opcode_sub === 0.U(3.W)) -> (2.U(8.W)), // beq

    (opcode === 4.U(5.W) && opcode_sub === 0.U(3.W)) -> (1.U(8.W)), // lw

    (opcode === 5.U(5.W) && opcode_sub === 0.U(3.W)) -> (1.U(8.W)), // sw
  ))


  // Execute
  
  alu.io.command := command
  alu.io.a       := MuxCase(regfile(rs1), Seq(
    // addi命令
    (opcode === 2.U(5.W) && opcode_sub === 1.U(3.W)) -> (regfile(rs1_i)),

    // lw命令
    (opcode === 4.U(5.W) && opcode_sub === 0.U(3.W)) -> (regfile(rs1_i)),

    // sw命令
    (opcode === 5.U(5.W) && opcode_sub === 0.U(3.W)) -> (regfile(rs1_s)),
  ))
  alu.io.b       := MuxCase(0.U(32.W), Seq(
  // add命令
    (opcode === 1.U(5.W) && opcode_sub === 1.U(3.W)) -> (regfile(rs2)),
  // addi命令
    (opcode === 2.U(5.W) && opcode_sub === 1.U(3.W)) -> (imm),
  
  // beq命令
    (opcode === 3.U(5.W) && opcode_sub === 0.U(3.W)) -> (regfile(rs2)),

  // lw命令
    (opcode === 4.U(5.W) && opcode_sub === 0.U(3.W)) -> (imm),

  // sw命令
    (opcode === 5.U(5.W) && opcode_sub === 0.U(3.W)) -> (imm),
  ))
  
  dmem_raw := Cat(
    (0 until 4).map(i => dmem.read(alu.io.out + i.U)).reverse
  )

  when((opcode === 5.U(5.W)) && (opcode_sub === 0.U(3.W))) {
    for (i <- 0 to 3) {
      dmem(alu.io.out + i.U) := regfile(rs2_s)(i*8 + 7, i*8)
    }
  }

  regfile(rd)    := MuxCase((alu.io.out), Seq(
    (rd === 0.U) -> (0.U(32.W)),
    (opcode === 3.U(5.W) && opcode_sub === 0.U(3.W)) -> (pc + 6.U), // beq
    (opcode === 4.U(5.W) && opcode_sub === 0.U(3.W)) -> (dmem_raw), // lw
    (opcode === 5.U(5.W) && opcode_sub === 0.U(3.W)) -> (regfile(rd)), // sw (regfileは書き換えない)
  ))
  
  // # swでregfileを書き込むと以下のようなことが起きる
  // addi x3, x0, 16
  // sw x3, 4(x0) # mem[4] = x3(= 16), x3 = 4
  // sw x3, 8(x0) # mem[8] = x3(=  4)

  // Debug output
  printf(p"pc          : 0x${Hexadecimal(old_pc)}\n")
  printf(p"instr       : 0x${Hexadecimal(instr)}\n")
  printf(p"opcode      : 0x${Hexadecimal(opcode)}\n")
  printf(p"opcode_sub  : 0x${Hexadecimal(opcode_sub)}\n")
  printf(p"rs1         : 0x${Hexadecimal(rs1)}\n")
  printf(p"rs1_i       : 0x${Hexadecimal(rs1_i)}\n")
  printf(p"regfile(rs1): 0x${Hexadecimal(regfile(rs1))}\n")
  printf(p"regfile(rs2): 0x${Hexadecimal(regfile(rs2))}\n")
  printf(p"imm         : 0x${Hexadecimal(imm)}\n")
  printf(p"imm_r_sext  : 0x${Hexadecimal(imm_r_sext)}\n")
  printf(p"command     : 0x${Hexadecimal(command)}\n")
  printf(p"alu.io.a    : 0x${Hexadecimal(alu.io.a)}\n")
  printf(p"alu.io.b    : 0x${Hexadecimal(alu.io.b)}\n")
  printf(p"alu.io.out  : 0x${Hexadecimal(alu.io.out)}\n")
  printf(p"pc+sext(imm): 0x${Hexadecimal(pc+imm_r_sext)}\n")
  printf(p"zero        : 0x${Hexadecimal(alu.io.zero)}\n")
  for (i <- 0 to 31) {
    printf(p"regfile($i)  : 0x${Hexadecimal(regfile(i.U))}\n")
  }
  printf(p"----------------------\n")
  
}

  