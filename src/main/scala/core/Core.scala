package core

import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile

class Core extends Module {
  val io = IO(new Bundle {
    // UART
    val tx      = Output(Bool())
    val rx      = Input(Bool())

    // SPI
    val sclk    = Output(Bool())
    val mosi    = Output(Bool())
    val miso    = Input(Bool())

    // GPIO
    val gpout   = Output(UInt(8.W))
  })

  // ALUモジュール作成
  val alu = Module(new Alu)

  // IOBusモジュール作成 & 接続
  val ioBus = Module(new IOBus)

  ioBus.io.rx := io.rx
  io.tx := ioBus.io.tx
  ioBus.io.miso := io.miso
  io.sclk := ioBus.io.sclk
  io.mosi := ioBus.io.mosi
  io.gpout := ioBus.io.gpout

  // メモリモジュール作成（命令 / データ）
  val imem        = SyncReadMem(1024 * 6, UInt(8.W))
  loadMemoryFromFile(imem, "src/main/resources/tmp_inst.hex")
  val dmem        = SyncReadMem(1024 * 4, UInt(8.W))
  loadMemoryFromFile(dmem, "src/main/resources/tmp_data.hex")

  // レジスタやワイヤの宣言
  val first_time     = RegInit(true.B)
  val pc             = RegInit(0.U(32.W))
  val pc_next_plus_6 = RegInit(0.U(32.W))
  val pc_next        = Wire(UInt(32.W))
  val regfile        = Mem(32, UInt(32.W))

  val instr          = Wire(UInt(48.W))
  val opcode         = Wire(UInt(5.W))
  val opcode_sub     = Wire(UInt(3.W))
  val rd             = Wire(UInt(5.W))
  val rs1            = Wire(UInt(5.W))
  val rs1_i          = Wire(UInt(5.W))
  val rs1_s          = Wire(UInt(5.W))
  val rs2            = Wire(UInt(5.W))
  val rs2_s          = Wire(UInt(5.W))
  val imm            = Wire(UInt(32.W))
  val imm_b          = Wire(UInt(25.W))
  val imm_b_sext     = Wire(UInt(32.W))

  val dmem_read_data = Wire(UInt(32.W))
  val load_ready     = RegInit(false.B)

  // Fetch部（命令読み出し，PC管理）
  pc := pc_next
  instr := Mux(first_time, 0.U, Cat((0 until 6).map(i => imem.read(pc_next + i.U)).reverse))
  first_time := false.B

  pc_next_plus_6 := pc_next + 6.U
  
  // ↓↓↓ クリティカルパスはここ ↓↓↓↓
  // 命令読み出し -> pc との加算 -> 次のpcの選択
  pc_next := MuxCase(pc_next_plus_6, Seq(
    (opcode === 3.U(5.W) && opcode_sub === 0.U(3.W) && alu.io.zero === true.B)  -> (pc + imm_b_sext),                                 // beq
    (opcode === 3.U(5.W) && opcode_sub === 1.U(3.W) && alu.io.zero === false.B) -> (pc + imm_b_sext),                                 // bne
    (opcode === 3.U(5.W) && opcode_sub === 3.U(3.W) && (alu.io.out(31) === 1.U(1.W) || alu.io.zero === true.B)) -> (pc + imm_b_sext), // ble
    (opcode === 3.U(5.W) && opcode_sub === 2.U(3.W) && alu.io.out(31) === 1.U(1.W))  -> (pc + imm_b_sext),                            // blt
    (opcode === 3.U(5.W) && opcode_sub === 4.U(3.W)) -> (alu.io.out),                                                                 // jal
    
    (opcode === 4.U(5.W) && !load_ready) -> (pc),                                                                                     // load命令は同期読み出しのために1サイクル待つ

    (opcode === 6.U(5.W) && opcode_sub === 0.U(3.W) && !ioBus.io.din.valid)  -> (pc),                                                 // in命令でデータ準備が出来ていない場合はストール
    (opcode === 6.U(5.W) && opcode_sub === 1.U(3.W) && !ioBus.io.dout.ready) -> (pc),                                                 // out命令で相手が受信完了していなければストール
  ))
  // ↑↑↑ クリティカルパスはここ ↑↑↑↑

  // Decode部（命令デコード，ALU実行準備）
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
  imm_b      := instr(47, 23)
  imm_b_sext := Cat(Fill(7, imm_b(24)), imm_b)

  // ALUに発行するコマンド
  command := MuxCase(0.U(8.W), Seq(
    (opcode === 1.U(5.W) && opcode_sub === 1.U(3.W)) -> (1.U(8.W)), // add
    (opcode === 1.U(5.W) && opcode_sub === 2.U(3.W)) -> (2.U(8.W)), // sub

    (opcode === 2.U(5.W) && opcode_sub === 1.U(3.W)) -> (1.U(8.W)), // addi
    (opcode === 2.U(5.W) && opcode_sub === 2.U(3.W)) -> (2.U(8.W)), // subi

    (opcode === 3.U(5.W) && opcode_sub === 0.U(3.W)) -> (2.U(8.W)), // beq
    (opcode === 3.U(5.W) && opcode_sub === 1.U(3.W)) -> (2.U(8.W)), // bne
    (opcode === 3.U(5.W) && opcode_sub === 2.U(3.W)) -> (2.U(8.W)), // blt
    (opcode === 3.U(5.W) && opcode_sub === 3.U(3.W)) -> (2.U(8.W)), // ble
    (opcode === 3.U(5.W) && opcode_sub === 4.U(3.W)) -> (1.U(8.W)), // jal

    (opcode === 4.U(5.W) && opcode_sub === 0.U(3.W)) -> (1.U(8.W)), // lw
    (opcode === 4.U(5.W) && opcode_sub === 1.U(3.W)) -> (1.U(8.W)), // lh
    (opcode === 4.U(5.W) && opcode_sub === 2.U(3.W)) -> (1.U(8.W)), // lb
    (opcode === 4.U(5.W) && opcode_sub === 3.U(3.W)) -> (1.U(8.W)), // lhu
    (opcode === 4.U(5.W) && opcode_sub === 4.U(3.W)) -> (1.U(8.W)), // lbu

    (opcode === 5.U(5.W) && opcode_sub === 0.U(3.W)) -> (1.U(8.W)), // sw
    (opcode === 5.U(5.W) && opcode_sub === 1.U(3.W)) -> (1.U(8.W)), // sh
    (opcode === 5.U(5.W) && opcode_sub === 2.U(3.W)) -> (1.U(8.W)), // sb

    (opcode === 6.U(5.W) && opcode_sub === 0.U(3.W)) -> (1.U(8.W)), // in
    (opcode === 6.U(5.W) && opcode_sub === 1.U(3.W)) -> (1.U(8.W)), // out

    (opcode === 7.U(5.W) && opcode_sub === 0.U(3.W)) -> (3.U(8.W)), // and
    (opcode === 7.U(5.W) && opcode_sub === 1.U(3.W)) -> (4.U(8.W)), // or
    (opcode === 7.U(5.W) && opcode_sub === 2.U(3.W)) -> (5.U(8.W)), // xor
    (opcode === 7.U(5.W) && opcode_sub === 3.U(3.W)) -> (6.U(8.W)), // srl
    (opcode === 7.U(5.W) && opcode_sub === 4.U(3.W)) -> (7.U(8.W)), // sra
    (opcode === 7.U(5.W) && opcode_sub === 5.U(3.W)) -> (8.U(8.W)), // sll

    (opcode === 8.U(5.W) && opcode_sub === 0.U(3.W)) -> (3.U(8.W)), // andi
    (opcode === 8.U(5.W) && opcode_sub === 1.U(3.W)) -> (4.U(8.W)), // ori
    (opcode === 8.U(5.W) && opcode_sub === 2.U(3.W)) -> (5.U(8.W)), // xori
    (opcode === 8.U(5.W) && opcode_sub === 3.U(3.W)) -> (6.U(8.W)), // srli
    (opcode === 8.U(5.W) && opcode_sub === 4.U(3.W)) -> (7.U(8.W)), // srai
    (opcode === 8.U(5.W) && opcode_sub === 5.U(3.W)) -> (8.U(8.W)), // slli
  ))

  // Execute部（計算実行）
  alu.io.command := command
  alu.io.a       := MuxCase(regfile(rs1), Seq(
    (opcode === 2.U(5.W)) -> (regfile(rs1_i)),                            // addi, subi
    (opcode === 3.U(5.W) && opcode_sub === 4.U(3.W)) -> (regfile(rs1_i)), // jal
    (opcode === 4.U(5.W)) -> (regfile(rs1_i)),                            // lw, lh, lb, lhu, lbu
    (opcode === 5.U(5.W)) -> (regfile(rs1_s)),                            // sw, sh, sb
    (opcode === 6.U(5.W) && opcode_sub === 0.U(3.W)) -> (regfile(rs1_i)), // in
    (opcode === 6.U(5.W) && opcode_sub === 1.U(3.W)) -> (regfile(rs1_s)), // out
    (opcode === 8.U(5.W)) -> (regfile(rs1_i)),                            // andi, ori, xori, srli, srai, slli
  ))
  alu.io.b       := MuxCase(0.U(32.W), Seq(
    (opcode === 1.U(5.W)) -> (regfile(rs2)),                              // add, sub
    (opcode === 2.U(5.W)) -> (imm),                                       // addi, subi
    (opcode === 3.U(5.W) && opcode_sub === 0.U(3.W)) -> (regfile(rs2)),   // beq
    (opcode === 3.U(5.W) && opcode_sub === 1.U(3.W)) -> (regfile(rs2)),   // bne
    (opcode === 3.U(5.W) && opcode_sub === 2.U(3.W)) -> (regfile(rs2)),   // blt
    (opcode === 3.U(5.W) && opcode_sub === 3.U(3.W)) -> (regfile(rs2)),   // ble
    (opcode === 3.U(5.W) && opcode_sub === 4.U(3.W)) -> (imm),            // jal
    (opcode === 4.U(5.W)) -> (imm),                                       // lw, lh, lb, lhu, lbu
    (opcode === 5.U(5.W)) -> (imm),                                       // sw, sh, sb
    (opcode === 6.U(5.W)) -> (imm),                                       // in, out
    (opcode === 7.U(5.W)) -> (regfile(rs2)),                              // and, or, xor, srl, sra, sll
    (opcode === 8.U(5.W)) -> (imm),                                       // andi, ori, xori, srli, srai, slli
  )) 

  // Memory部（データメモリ読み書き）
  // 書き
  when((opcode === 5.U(5.W)) && (opcode_sub === 0.U(3.W))) {       // sw
    for (i <- 0 to 3) {
      dmem(alu.io.out + i.U) := regfile(rs2_s)(i*8 + 7, i*8)
    }
  }.elsewhen((opcode === 5.U(5.W)) && (opcode_sub === 1.U(3.W))) { // sh
    for (i <- 0 to 1) {
      dmem(alu.io.out + i.U) := regfile(rs2_s)(i*8 + 7, i*8)
    }
  }.elsewhen((opcode === 5.U(5.W)) && (opcode_sub === 2.U(3.W))) { // sb
    dmem(alu.io.out) := regfile(rs2_s)(7, 0)
  }

  // 読み
  dmem_read_data := Cat(
    (0 until 4).map(i => dmem.read(alu.io.out + i.U)).reverse
  ) 

  // ※load 命令は同期読み出しのために1サイクル待つ
  load_ready := false.B
  when((opcode === 4.U(5.W)) && !load_ready) {  
    load_ready := true.B
  }

  // Register部（レジスタアクセス）
  regfile(rd)    := MuxCase((alu.io.out), Seq(
    (rd === 0.U) -> (0.U(32.W)),

    (opcode === 3.U(5.W) && opcode_sub === 0.U(3.W)) -> (pc + 6.U),  // beq
    (opcode === 3.U(5.W) && opcode_sub === 1.U(3.W)) -> (pc + 6.U),  // bne
    (opcode === 3.U(5.W) && opcode_sub === 2.U(3.W)) -> (pc + 6.U),  // blt
    (opcode === 3.U(5.W) && opcode_sub === 3.U(3.W)) -> (pc + 6.U),  // ble
    (opcode === 3.U(5.W) && opcode_sub === 4.U(3.W)) -> (pc + 6.U),  // jal

    (opcode === 4.U(5.W) && opcode_sub === 0.U(3.W)) -> (dmem_read_data),                                         // lw
    (opcode === 4.U(5.W) && opcode_sub === 1.U(3.W)) -> Cat(Fill(16, dmem_read_data(15)), dmem_read_data(15, 0)), // lh
    (opcode === 4.U(5.W) && opcode_sub === 1.U(3.W)) -> Cat(Fill(24, dmem_read_data(7)), dmem_read_data(7, 0)),   // lb
    (opcode === 4.U(5.W) && opcode_sub === 1.U(3.W)) -> (0xFFFF.U & dmem_read_data),                              // lhu
    (opcode === 4.U(5.W) && opcode_sub === 2.U(3.W)) -> (0xFF.U & dmem_read_data),                                // lbu

    (opcode === 5.U(5.W)) -> (regfile(rd)),   // sw, sh, sb (regfileは書き換えない)

    (opcode === 6.U(5.W) && opcode_sub === 0.U(3.W) &&  ioBus.io.din.valid) -> (ioBus.io.din.bits), // in (読み取りデータが準備できていた場合は書き込み)
    (opcode === 6.U(5.W) && opcode_sub === 0.U(3.W) && !ioBus.io.din.valid) -> (regfile(rd)),       // in（準備未完了の場合は書き込まない）
    (opcode === 6.U(5.W) && opcode_sub === 1.U(3.W)) -> (regfile(rd)),                              // out (regfileは書き換えない)
  ))

  // IO部（デバイスIO）
  // in out デバイスID
  ioBus.io.devId := alu.io.out
  // データ受取準備完了 in 命令であれば受取準備完了フラグを立てる
  ioBus.io.din.ready := (opcode === 6.U(5.W) && opcode_sub === 0.U(3.W))
  // 送信データ準備完了 out 命令であればフラグを立てる
  ioBus.io.dout.valid := (opcode === 6.U(5.W) && opcode_sub === 1.U(3.W))
  ioBus.io.dout.bits := regfile(rs2_s)
}
