package core

import chisel3._
import chisel3.util._

class UartTx(clockFrequency: Int, baudRate: Int) extends Module {
  val io = IO(new Bundle {
    val tx       = Output(Bool())
    val din      = Decoupled(UInt(8.W))  // 任意のデータを送るとき
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
      bits := Cat(bits(9), bits(9, 1))    // 全体を一つ下の桁にずらしただけ(最上位bitは保持)
      // bits := (bits.S >> 1.U).U
      // (0 to 8).foreach(i => bits(i) := bits(i + 1)) // ビットバッファを右シフトする
      bitCounter := bitCounter - 1.U
      rateCounter := (baudDivider - 1).U
    } .otherwise {
      rateCounter := rateCounter - 1.U
    }
  }
}

// val uart9600bps = Module(new UartTx(10_000_000, 9600))
// val uart115200bps = Module(new UartTx(10_000_000, 115200))
// std::vector<int> v = {1, 99, 4};
// std::vector<string> s = {"a", "b", "c"};
///////////////////////////////////////////////////////////////////////////////
// セキュリティキャンプ 資料より引用
// https://github.com/ciniml/seccamp_riscv_cpu/blob/2023/doc/slide/slide_1.pdf
///////////////////////////////////////////////////////////////////////////////
// class UartTx(clockFrequency: Int, baudRate: Int) extends Module {
//   val io = IO(new Bundle{
//   val tx = Output(Bool())
//   })
//   val baudDivider = clockFrequency/baudRate // クロック周波数/ボー‧レート
//   val rateCounter = RegInit(0.U(log2Ceil(baudDivider).W)) // ボー‧レート周期⽣成⽤カウンタ
//   val bitCounter = RegInit(0.U(log2Ceil(8 + 2).W)) // 残り送信ビット数カウンタ
//   val bits = Reg(Vec(8 + 2, Bool())) // 送信ビット‧バッファ
// 
//   io.tx := bitCounter === 0.U || bits(0) // 送信中ならbit0を出⼒。それ以外は'1'を出⼒
//   val ready = bitCounter === 0.U // ビット‧カウンタ == 0なので、次の送信を開始できるか？
//   when(ready) {
//     bits := Cat(1.U, 0x41.U(8.W), 0.U).asBools // STOP(1), 'A', START(0)
//     bitCounter := (8 + 2).U // 残送信ビット数 = 10bit (STOP + DATA + START)
//     rateCounter := (baudDivider - 1).U // レートカウンタを初期化
//   }
//   when( bitCounter > 0.U ) {
//     when(rateCounter === 0.U) { // 次のボーレート周期の送信タイミング
//       (0 to 8).foreach(i => bits(i) := bits(i + 1)) // ビットバッファを右シフトする
//       bitCounter := bitCounter - 1.U
//       rateCounter := (baudDivider - 1).U
//     } .otherwise {
//       rateCounter := rateCounter - 1.U
//     }
//   }
// }
///////////////////////////////////////////////////////////////////////////////

class UartRx extends Module {
  val io = IO(new Bundle {
    val rx       = Input(Bool())
    val dout     = Decoupled(UInt(8.W))
  })
}
