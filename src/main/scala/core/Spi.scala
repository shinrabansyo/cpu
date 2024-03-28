package core

import chisel3._
import chisel3.util._

class Spi(clockFrequency: Int) extends Module {
  val io = IO(new Bundle {
    val mosi     = Output(Bool())
    val miso     = Input(Bool())
    val misoBuf  = Output(Bool())                 // DEBUG
    val posedge  = Output(Bool())                 // DEBUG
    val negedge  = Output(Bool())                 // DEBUG
    val sclk     = Output(Bool())
    val din      = Flipped(Decoupled(UInt(8.W)))  // 任意のデータを送るとき
    val dout     = Decoupled(UInt(8.W))           // データを読み取るとき
    val clkshamt = Flipped(Decoupled(UInt(3.W)))  // シフト量(shift amount) + 1
    val spiMode  = Flipped(Decoupled(UInt(2.W)))  // SPIモード
    // SCLK クロックの速度 = clockFrequency >> (clkshamt+1)
  })

  // クロックの分周用信号
  val sclk = RegInit(false.B)
  val sclkCounter = RegInit(0.U(8.W))
  val clkshamt = RegInit(0.U(3.W))
  val posedge = Wire(Bool())
  val negedge = Wire(Bool())

  // データの送受信用信号
  val shiftReg = RegInit(0.U(8.W))
  val bitCounter = RegInit(0.U(4.W))
  val busy = RegInit(false.B)
  val misoBuf = RegInit(false.B)
  val inReady = RegInit(true.B)
  val spiModeReady = RegInit(true.B)
  val clkshamtReady = RegInit(true.B)
  val outValid = RegInit(false.B)
  val cpol = RegInit(false.B)        // アイドル状態でのクロックのHIGH/LOW (clock polarity)
  val cpha = RegInit(false.B)        // サンプリングの極性 posedge/negedge (clock phase)
  val mode_1_2 = Wire(Bool())

  // DEBUG
  io.misoBuf := misoBuf
  io.posedge := posedge
  io.negedge := negedge

  posedge := false.B
  negedge := false.B

  // クロックの分周
  io.sclk := sclk
  when(busy) {
    when(sclkCounter === 0.U) {
      sclk := ~sclk
      sclkCounter := (1.U << io.clkshamt.bits) - 1.U
      posedge := ~sclk
      negedge := sclk
    } .otherwise {
      sclkCounter := sclkCounter - 1.U
    }
  }.elsewhen(!(io.spiMode.valid && io.spiMode.ready)) {
    sclk := cpol
  }

  // データの送受信
  // mode 0: cpol = 0, cpha = 0 (データをposedgeでサンプリング / negedgeでシフト)
  // mode 1: cpol = 0, cpha = 1 (データをnegedgeでサンプリング / posedgeでシフト)
  // mode 2: cpol = 1, cpha = 0 (データをnegedgeでサンプリング / posedgeでシフト)
  // mode 3: cpol = 1, cpha = 1 (データをposedgeでサンプリング / negedgeでシフト)
  mode_1_2 := (cpol ^ cpha)

  io.din.ready := inReady
  when(io.din.valid && io.din.ready) {
    shiftReg := io.din.bits
    inReady := false.B
    busy := true.B
    bitCounter := 8.U
  }

  io.dout.bits := shiftReg
  io.dout.valid := outValid
  when(io.dout.valid && io.dout.ready) {
    outValid := false.B
  }

  io.clkshamt.ready := clkshamtReady
  when(io.clkshamt.valid && io.clkshamt.ready) {
    clkshamtReady := false.B
    clkshamt := io.clkshamt.bits
  }

  io.spiMode.ready := spiModeReady
  when(io.spiMode.valid && io.spiMode.ready) {
    cpol := io.spiMode.bits(1)
    cpha := io.spiMode.bits(0)
    spiModeReady := false.B
    sclk := Cat(io.spiMode.bits(1), io.spiMode.bits(1))
  }

  io.mosi := shiftReg(7)

  when(busy) {
    when(bitCounter === 0.U) {
      busy := false.B
      outValid := true.B
      inReady := true.B
      clkshamtReady := true.B
      spiModeReady := true.B
    } .otherwise {
      // mode 1/2: posedge でシフト
      // mode 0/3: negedge でシフト
      when(mode_1_2) {
        when(posedge) {
          // シフト
          shiftReg := (shiftReg << 1) | misoBuf
          bitCounter := bitCounter - 1.U
        }
        when(negedge) {
          // サンプリング
          misoBuf := io.miso
        }
      }.otherwise {
        when(negedge) {
          // シフト
          shiftReg := (shiftReg << 1) | misoBuf
          bitCounter := bitCounter - 1.U
        }
        when(posedge) {
          // サンプリング
          misoBuf := io.miso
        }
      }
    }
  }


}

/*
UART →  最初に転送速度を受信側送信側で仮定して
        通信の開始と終了のタイミングを教えて通信していた
SPI  →  マスター側(CPU側)がクロックを出して通信の制御をする。
        マスター側 ←→ スレイブ側(SDカード側)。

(http://elm-chan.org/docs/mmc/mmc.html)
> SPIの説明 <
        信号線：
        > データのやり取りは送信1本、受信に1本、クロック用に1本
        > MOSI：Master out slave in
        > MISO：Master in  slave out
        > SCLK：送受信のためのクロック信号
        > GPIO：チップセレクト(USBハブみたいな感じに出来て、デバイスごとの認識に使う)
                スレイブ側の CS を LOW に落として認識させる (https://www.rohm.co.jp/electronics-basics/micon/mi_what8)

        ・スレイブ側はチップセレクトで自分が選ばれていることを認識

データの送受信
        MS ：送受信用のシフトレジスタにデータを載せる
        M  ：チップセレクトで CS を LOW にし、スレイブを選択
        MS ：送受信用のシフトレジスタを SCLK のクロックに合わせて
            シフトレジスタの内容を交換
            マスター側とスレイブ側のレジスタを一つに捉えて、半周させる
            ex> M,S ともに8bitずつ持ってるとして、16bitを8bitシフト

            master_reg = 10001011
            slave_reg  = 00000000
            for _ 0..8:
                mosi = master_reg.msb
                miso = slave_reg.msb
                master_reg = master_reg << 1 | miso

                                slave_reg = slave_reg << 1 | mosi
            -----------------------------
            M 00000001        11111110 S
            ----↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓----
            M 0000001
            MOSI  → 0 →     (Mのレジスタからはみ出た分)
            MISO  ← 1 ←     (Sのレジスタからはみ出た分) // MISO,MOSI で交換
                           1111110 S
            ----↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓----
            M 00000011        11111100 S
            -------8-------------------
            を四回
*/