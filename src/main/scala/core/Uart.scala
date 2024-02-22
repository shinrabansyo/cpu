///////////////////////////////////////////////////////////////////////////////
// セキュリティキャンプ 資料 を参照 (2024/2/8)
// https://github.com/ciniml/seccamp_riscv_cpu/blob/2023/doc/slide/slide_1.pdf
///////////////////////////////////////////////////////////////////////////////

package core

import chisel3._
import chisel3.util._

class UartTx(clockFrequency: Int, baudRate: Int) extends Module {
  val io = IO(new Bundle {
    val tx       = Output(Bool())
    val din      = Flipped(Decoupled(UInt(8.W)))  // 任意のデータを送るとき
  })
  // din.ready, din.valid, din.bits が使用可能
  // 送信側：din.valid をアサートすると din.bits が読み取り可能
  // 受信側：din.ready をアサートすると din.bits の読み取りが完了
  // Valid / Ready ハンドシェイク
  // din.ready が立っていれば Core 側が din.bits に書き込む → din.valid をアサートする
  // din.valid が立っていれば UartTx 側が din.bits を読み取る
  // (Core ←<din>→ UartTx) -<tx>→ 他の機器
  // (Core ←<dout>→ UartRx) ←<rx>- 他の機器
  // 27M / 115200 = 234.375 clk
  val baudDivider = clockFrequency/baudRate               // クロック周波数÷ボー‧レート
  val rateCounter = RegInit(0.U(log2Ceil(baudDivider).W)) // ボー‧レート周期⽣成⽤カウンタ
  val bitCounter  = RegInit(0.U(log2Ceil(8 + 2).W))       // 残り送信ビット数カウンタ
  val bits        = Reg(Vec(8 + 2, Bool()))               // 送信ビット‧バッファ

  io.tx := bitCounter === 0.U || bits(0) // 送信中ならbit0を出⼒。それ以外は'1'を出⼒
  val ready = bitCounter === 0.U // ビット‧カウンタ == 0なので、次の送信を開始できるか？
  io.din.ready := ready
  // sb          ↓| 2340 |     ↓
  // valid ______~____.._______~_
  // ready ~~~~~~~____..__~~~~~~_
  // bitCou_______~~~~..~~______~

  when(ready && io.din.valid) {
    bits := Cat(1.U, io.din.bits, 0.U).asBools // STOP(1), 'A', START(0)
    bitCounter := (8 + 2).U // 残送信ビット数 = 10bit (STOP + DATA + START)
    rateCounter := (baudDivider - 1).U // レートカウンタを初期化
  }
  when( bitCounter > 0.U ) {
    when(rateCounter === 0.U) { // 次のボーレート周期の送信タイミング
      // bits := Cat(bits(9), bits(9, 1))    // 全体を一つ下の桁にずらしただけ(最上位bitは保持)
      // bits := (bits.S >> 1.U).U
      (0 to 8).foreach(i => bits(i) := bits(i + 1)) // ビットバッファを右シフトする
      bitCounter := bitCounter - 1.U
      rateCounter := (baudDivider - 1).U
    } .otherwise {
      rateCounter := rateCounter - 1.U
    }
  }
}

class UartRx(clockFrequency: Int, baudRate: Int, rxSyncStages: Int) extends Module {
  val io = IO(new Bundle{
    val dout = Decoupled(UInt(8.W)) // 受信データを出⼒
    val rx = Input(Bool())          // UART信号⼊⼒
    val overrun = Output(Bool())    // UARTデータ取りこぼし発⽣？
  })
  val baudDivider = clockFrequency/baudRate               // クロック周波数÷ボー‧レート
  val rateCounter = RegInit(0.U(log2Ceil(baudDivider*3/2).W))
  // P.103 a～c を測るため 1.5倍
  val bitCounter = RegInit(0.U(log2Ceil(8 + 2).W))
  val bits = Reg(Vec(8 + 2, Bool()))
  // UARTから受け取るデータを入れる箱
  val rxRegs = RegInit(VecInit((0 to rxSyncStages + 1 - 1).map(_ => false.B)))
  // rxSyncStages : 同期に使うフリップフロップ回路の個数
  // if(0 to rxSyncStages + 1 - 1) <=> if(0 < rxSyncStages + 1)
  // [0, 1, ... ,rxSyncStages] を生成して [false, false, ... ,false] にしている
  val overrun = RegInit(false.B)        // CPU側に送信中にUART相手から受信させられそうな時のフラグ
  val running = RegInit(false.B)        // 受信中のフラグ

  // 受信データの出⼒信号 (VALID/READYハンドシェーク)
  val outValid = RegInit(false.B)            // UART相手からの受信完了で立つ
  val outBits = Reg(UInt(8.W))    // CPUに送信するデータ
  val outReady = WireDefault(io.dout.ready)   // CPU側から読み取られたら(送信完了で)立つ
  io.dout.valid := outValid
  io.dout.bits := outBits

  // やるべきタスクが終わったら
  when(outValid && outReady) {
    outValid := false.B // VALID&READY成⽴したのでVALIDを落とす
  }

  // RX信号をクロックに同期
  //    10kHz
  // 生のrx:   1 1 01 1  1   1   1 1  1 0 0   0  0
  //         ~~~~~~~~~~~~~~~~~~~~~~~~~~~____________
  //    cpu:   |  |  |  |  |  |  |  |  |  |  |  |  |
  //         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~________________________~~~~~~~~
  //  sample                              *            *
  //         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~________________________~~~~~~~
  //    10MHz
  // ↓の信号:  1  1  1  1  1  1  1  1  1  0  0  0  0
  rxRegs(rxSyncStages) := io.rx
  (0 to rxSyncStages - 1).foreach(i => rxRegs(i) := rxRegs(i + 1))
  // 相手は相手自身のクロックに合わせて送信してくるけど、自分側のクロックとそのクロックは
  // 同期していないので合わせる必要がある
  // UARTからの入力　=> [ rxRegs ] => 受信
  //                       ↑ こいつを挟んで同期してる

  io.overrun := overrun

  // 受信中じゃない時
  when(!running) {
    when(!rxRegs(1) && rxRegs(0)) {  // aの検出をしたとき
      // スタートビット検出(立ち下がり検出)、rxRegs(0)が1(平常電位)、rxRegs(1)がゼロ(start信号)
      rateCounter := (baudDivider * 3 / 2 - 1).U // Wait until the center of LSB.
      bitCounter := (8 + 2 - 1).U
      running := true.B   // 下の処理にcの時移る
    }
  }.otherwise {
    when(rateCounter === 0.U) { // 1ビット周期ごとに処理
      bits(8 + 2 -1) := rxRegs(0) // つぎのビットを出⼒
      (0 to 8 + 2 - 2).foreach(i => bits(i) := bits(i + 1)) // 1ビット右シフト
      //                  ↑ -2 なのは、                     ↑ ここで配列の要素数を越えないため
      when(bitCounter === 0.U) { // ストップビットまで出⼒し終わったら
        outValid := true.B  // データ受信完了→CPUが読み取れる状態になる
        outBits := Cat(bits.slice(1, 8 + 2 - 1).reverse)
        overrun := outValid // 前のデータが処理される前に次のデータの受信完了した
        // 上のoutValid := true.Bと同時に入れられるので、普段はoverrunにはfalseが入るが
        // やるべきタスクが終わっていない(outValid := false.Bがされていない)状態で来ると
        // overrun が true になる
        running := false.B
      } .otherwise {
        rateCounter := (baudDivider - 1).U
        bitCounter := bitCounter - 1.U
      }
    } .otherwise {
      rateCounter := rateCounter - 1.U
    }
  }
}
