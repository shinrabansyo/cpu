package core

import chisel3._
import chisel3.util._
import chiseltest._
import chiseltest.simulator
import chisel3.iotesters._
import org.scalatest.flatspec.AnyFlatSpec

class UartTxTest extends AnyFlatSpec with ChiselScalatestTester {
      it must "runs UartTx" in { test(new UartTx(1000000, 115200)).withAnnotations(Seq(WriteFstAnnotation, WriteVcdAnnotation)) { c =>
        c.reset.poke(true.B)
        c.clock.step(4)
        c.reset.poke(false.B)
        c.io.din.bits.poke(0x41.U)
        c.io.din.valid.poke(true.B)
        c.clock.step(1)
        c.io.din.valid.poke(false.B)
        c.clock.step(200)
      } }
}

class UartEchoback(clockFrequency: Int, baudRate: Int, rxSyncStages: Int) extends Module {
    val io = IO(new Bundle {
      val din      = Flipped(Decoupled(UInt(8.W)))
      val dout     = Decoupled(UInt(8.W))
      val overrun  = Output(Bool())
    })

    var tx = Module(new UartTx(clockFrequency, baudRate))
    var rx = Module(new UartRx(clockFrequency, baudRate, rxSyncStages))

    rx.io.rx := tx.io.tx

    tx.io.din <> io.din
    rx.io.dout <> io.dout
    io.overrun := rx.io.overrun
}

class UartRxTest extends AnyFlatSpec with ChiselScalatestTester {
    it must "runs UartRx" in {
        test(new UartEchoback(1000000, 115200, 2)).withAnnotations(Seq(WriteFstAnnotation, WriteVcdAnnotation)) { c =>
            var abc = 0x41
            c.reset.poke(true.B)
            c.clock.step(4)
            c.reset.poke(false.B)
            c.io.din.bits.poke(abc.U)
            c.io.din.valid.poke(true.B)
            c.io.dout.ready.poke(false.B)
            for (x <- 1 to 5) {
                c.clock.step(1)
                // 送信データが読み取られるまで待つ
                while(!(c.io.din.ready.peek().litToBoolean && c.io.din.valid.peek().litToBoolean)) {
                    c.clock.step(1)
                }
                // 送信データが読み取られたので、送信データを無効化
                c.io.din.valid.poke(false.B) //
                // 受信完了まで待つ
                while(!c.io.dout.valid.peek().litToBoolean) {
                    c.clock.step(1)
                }
                // 受信データを読み取る
                c.io.dout.ready.poke(true.B)
                c.clock.step(1)
                // 受信データ読み取り終了
                // 送信データ準備完了
                c.io.dout.ready.poke(false.B)
                c.io.din.valid.poke(true.B)  //
                abc += 1
                c.io.din.bits.poke(abc.U)
            }
        }
    }
}
