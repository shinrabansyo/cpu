===

// void main(void)
@func_main
    // 0. 起動確認
    // addi r4 = r0, 0xAA
    // out r0[4] = r4
    addi r10 = r0, 1
    addi r10 = r0, 1
    beq r1, (r0, r0) -> @func_gpio_write

    // 1. SDカードの初期化
    addi r10 = r0, 0  // cs
    addi r11 = r0, 4  // clk_shamt
    beq r1, (r0, r0) -> @func_sd_init

    // 2. 10 ブロック分読み取り
    addi r4 = r0, 0
    add r20 = r0, r4
    addi r5 = r0, 10
    add r21 = r0, r5
    @print_loop.func_main
    beq r0, (r20, r21) -> @inf_loop.func_main
        add r10 = r0, r20
        add r11 = r0, r0
        beq r1, (r0, r0) -> @func_single_block_print
        addi r4 = r0, 1
        add r20 = r20, r4
        beq r0, (r0, r0) -> @print_loop.func_main

    // 3. 無限ループ
    @inf_loop.func_main
    beq r0, (r0, r0) -> @inf_loop.func_main

// void func_single_block_print(uint32_t block_addr, uint8_t *buffer)
@func_single_block_print
// プロローグ
    // フレームポインタの退避
    subi r2 = r2, 4
    sw r2[0] = r3
    addi r3 = r2, 0

    // リターンアドレスの退避
    subi r2 = r2, 16
    sw r3[-4] = r1

    // 1. シングルブロックの読み取り
    beq r1, (r0, r0) -> @func_single_block_read

    // 2. 実行結果確認
    beq r0, (r10, r0) -> @uart.func_single_block_print
    beq r0, (r0, r0) -> @epilogue.func_single_block_print

    // 3. 512byte UART送信
    @uart.func_single_block_print
    addi r5 = r0, 0
    addi r7 = r0, 512
    @read_loop.func_single_block_print
    beq r0, (r5, r7) -> @epilogue.func_single_block_print
        lb r6 = r5[0]
        out r0[0] = r6
        addi r5 = r5, 1
        beq r0, (r0, r0) -> @read_loop.func_single_block_print

    // エピローグ
    @epilogue.func_single_block_print
    // 保存レジスタの復元
    lw r1 = r3[-4]
    addi r2 = r2, 16

    // フレームポインタの復元
    lw r3 = r3[0]
    addi r2 = r2, 4

    // return
    jal r0, r1[0]

// uint8_t func_sd_init(uint8_t cs, uint8_t clk_shamt)
@func_sd_init
    // プロローグ
    // フレームポインタの退避
    subi r2 = r2, 4
    sw r2[0] = r3
    addi r3 = r2, 0

    // リターンアドレスの退避
    subi r2 = r2, 16
    sw r3[-4] = r1
    sw r3[-8] = r20
    sw r3[-12] = r21
    sw r3[-16] = r22

    //////////////////////////////////////////////////////////////
    
    // 引数の保存
    add r20 = r0, r10   // cs
    add r21 = r0, r11   // clk_shamt

    //////////////////////////////////////////////////////////////
    
    // GPIO: io空間の0x04番地 32bit の値が入る
    // 0bit: GPIO0
    // 31: GPIO31
    
    // Gpio:Init
    add r10 = r0, r20
    addi r11 = r0, 1
    beq r1, (r0, r0) -> @func_gpio_write

    // Spi:Mode
    addi r4 = r0, 0
    out r0[2] = r4                  // Mode = 0

    // Spi:Clockshamt
    add r4 = r0, r11
    out r0[3] = r4                  // Clockshamt = 4
    // spiモードの初期化
    // チップセレクト

    //////////////////////////////////////////////////////////////

    // 1. 1ms待機
    addi r10 = r0, 0x01
    beq r1, (r0, r0) -> @func_wait_ms

    // 2. CS = High
    add r10 = r0, r20
    addi r11 = r0, 1
    beq r1, (r0, r0) -> @func_gpio_write

    // 3. DI = High & 74 クロック待機
    addi r4 = r0, 0
    @dummy_clk_loop.func_sd_init
        beq r0, (r4, 10) -> @dummy_clk_loop_end.func_sd_init
        addi r4 = r4, 1

        add r22 = r0, r4
        addi r10 = r0, 0xff
        beq r1, (r0, r0) -> @func_spi_transfer
        add r4 = r0, r22
    @dummy_clk_loop_end.func_sd_init

    // 4. CS = Low
    add r10 = r0, r20
    addi r11 = r0, 0
    beq r1, (r0, r0) -> @func_gpio_write

    //////////////////////////////////////////////////////////////

    // CMD0
    // arg: 0x00000000
    addi r10 = r0, 0x00 // cmd0
    addi r11 = r0, 0x00 // arg
    addi r12 = r0, 0x95 // crc
    beq r1, (r0, r0) -> @func_spi_sd_command
    // R1 resp が 0x01 であることを確認、それまでpolling
    beq r1, (r0, r0) -> @func_polling_r1_response
    addi r4 = r0, 0x01
    add r5 = r0, r10
    andi r10 = r5, 0xFF // 下位8bitをマスク
    beq r0, (r10, r4) -> @cmd8.func_sd_init

    // 失敗ならエラーコード1
    addi r10 = r0, 0x01
    beq r0, (r0, r0) -> @epilogue.func_sd_init

    //////////////////////////////////////////////////////////////

    // CMD8
    // arg: 0x000001aa
    @cmd8.func_sd_init

    addi r10 = r0, 8    // cmd8
    addi r11 = r0, 0x000001aa // arg
    addi r12 = r0, 0x87 // crc
    beq r1, (r0, r0) -> @func_spi_sd_command
    
    // R7 resp の下位12bit が 0x1aa であることを確認
    beq r1, (r0, r0) -> @func_polling_r3_r7_response
    addi r4 = r0, 0x1aa
    add r5 = r0, 10
    andi r10 = r5, 0xFFF // 下位12bitをマスク
    beq r0, (r10, r4) -> @acmd41.func_sd_init

    // 失敗ならエラーコード2
    addi r10 = r0, 0x02
    beq r0, (r0, r0) -> @epilogue.func_sd_init

    //////////////////////////////////////////////////////////////

    // TODO: このループが1秒以上続いた場合、エラー(エラーコード5)とする処理を書く

    // ACMD41            // ACMD<n> は CMD55 と CMD<n> のコマンドシーケンス
    // arg: 0x40000000
    @acmd41.func_sd_init

    // cmd55
    addi r10 = r0, 55     // cmd55
    addi r11 = r0, 0      // arg
    addi r12 = r0, 0      // crc は cmd8までなのでテキトーで大丈夫
    beq r1, (r0, r0) -> @func_spi_sd_command

    // cmd55 の R1 レスポンス
    beq r1, (r0, r0) -> @func_polling_r1_response
    addi r4 = r0, 0x01                                  // REVIEW: 00かもしれねぇぞ
    add r5 = r0, r10
    andi r10 = r5, 0xFF // 下位8bitをマスク
    beq r0, (r10, r4) -> @cmd41.func_sd_init

    // 失敗ならエラーコード3
    addi r10 = r0, 0x03
    beq r0, (r0, r0) -> @epilogue.func_sd_init

    // cmd41
    @cmd41.func_sd_init
    addi r10 = r0, 41            // cmd41
    addi r11 = r0, 0x40000000    // arg
    addi r12 = r0, 0             // crc は cmd8までなのでテキトーで大丈夫
    beq r1, (r0, r0) -> @func_spi_sd_command

    // cmd41 の R1 レスポンス
    beq r1, (r0, r0) -> @func_polling_r1_response

    // if (R1 resp) == 0x01 : もう一度 ACMD41 を送信 (0x01 なら初期化中)
    addi r4 = r0, 0x01
    add r5 = r0, r10
    andi r10 = r5, 0xFF // 下位8bitをマスク
    beq r0, (r10, r4) -> @acmd41.func_sd_init

    // if (R1 resp) == 0x00 : 次に進む (0x00 は「初期化完了合図」)
    addi r4 = r0, 0x00
    add r5 = r0, r10
    andi r10 = r5, 0xFF // 下位8bitをマスク
    beq r0, (r10, r4) -> @cmd58.func_sd_init

    // 失敗ならエラーコード4
    addi r10 = r0, 0x04
    beq r0, (r0, r0) -> @epilogue.func_sd_init

    //////////////////////////////////////////////////////////////

    // CMD58 
    // arg: 0x00000000
    @cmd58.func_sd_init
    addi r10 = r0, 58            // cmd58
    addi r11 = r0, 0             // arg
    addi r12 = r0, 0             // crc は cmd8までなのでテキトーで大丈夫
    beq r1, (r0, r0) -> @func_spi_sd_command

    // CMD58 の R3 レスポンス
    beq r1, (r0, r0) -> @func_polling_r3_r7_response
    
    // R3 resp の 30bit 目が 1 であることを確認（SDHC/SDXC）
    addi r4 = r0, 0x40000000
    add r5 = r0, r10
    andi r10 = r5, 0xFF // 下位8bitをマスク
    beq r0, (r10, r4) -> @success.func_sd_init

    // 失敗ならエラーコード6
    addi r10 = r0, 0x06
    beq r0, (r0, r0) -> @epilogue.func_sd_init
    
    // SUCCESS (return 0)
    // SD Ver.2+ (Block address) であることが確定
    // 512 bytes/block
    @success.func_sd_init
    addi r10 = r0, 0
    beq r0, (r0, r0) -> @epilogue.func_sd_init

    //////////////////////////////////////////////////////////////

    // エピローグ
    @epilogue.func_sd_init
    // 保存レジスタの復元
    lw r1 = r3[-4]
    lw r20 = r3[-8]
    lw r21 = r3[-12]
    lw r22 = r3[-16]
    addi r2 = r2, 16

    // フレームポインタの復元
    lw r3 = r3[0]
    addi r2 = r2, 4

    // return
    jal r0, r1[0]

// uint8_t spi_transfer(uint8_t data)
@func_spi_transfer

    // Spi:Send
    add r4 = r0, r10
    out r0[1] = r4

    // Spi:Receive
    in r10 = r0[1]

    // Return
    jal r0, r1[0]


// uint8_t spi_sd_command(uint8_t cmd, uint32_t arg, uint8_t crc)
@func_spi_sd_command

    // フレームポインタの退避
    subi r2 = r2, 4
    sw r2[0] = r3
    addi r3 = r2, 0

    // リターンアドレスの退避
    subi r2 = r2, 4
    sw r3[-4] = r1
 

    // Setup
    addi r5 = r0, @func_spi_transfer
    add  r6 = r0, r11
    add  r7 = r0, r12

    // cmd
    add r4 = r0, r10
    ori r4 = r4, 0x40
    andi r4 = r4, 0x7F
    add r10 = r0, r4
    jal r1, r5[0]

    // arg3
    srli r4 = r6, 24
    add r10 = r0, r4
    jal r1, r5[0]

    // arg2
    srli r4 = r6, 16
    add r10 = r0, r4
    jal r1, r5[0]

    // arg1
    srli r4 = r6, 8
    add r10 = r0, r4
    jal r1, r5[0]

    // arg0
    add r10 = r0, r6
    jal r1, r5[0]

    // crc
    ori r4 = r7, 0x01
    add r10 = r0, r4
    jal r1, r5[0]


    // 保存レジスタの復元
    lw r1 = r3[-4]
    addi r2 = r2, 4

    // フレームポインタの復元
    lw r3 = r3[0]
    addi r2 = r2, 4

    // return
    jal r0, r1[0]



@func_polling_r1_response
    // フレームポインタの退避
    subi r2 = r2, 4
    sw r2[0] = r3
    addi r3 = r2, 0

    // リターンアドレスの退避
    subi r2 = r2, 4
    sw r3[-4] = r1


    @loop.func_polling_r1_response
        // spi_transfer
        addi r10 = r0, 0xFF
        beq r1, (r0, r0) -> @func_spi_transfer

        // loop check
        add r4 = r0, r10
        andi r4 = r4, 0x80
        bne r0, (r4, r0) -> @loop.func_polling_r1_response


    // 保存レジスタの復元
    lw r1 = r3[-4]
    addi r2 = r2, 4

    // フレームポインタの復元
    lw r3 = r3[0]
    addi r2 = r2, 4

    // return
    jal r0, r1[0]



@func_polling_r3_r7_response
    // フレームポインタの退避
    subi r2 = r2, 4
    sw r2[0] = r3
    addi r3 = r2, 0

    // リターンアドレスの退避
    subi r2 = r2, 12
    sw r3[-4] = r1
    sw r3[-8] = r20
    sw r3[-12] = r21
    

    @loop.func_polling_r3_r7_response
        // spi_transfer
        addi r10 = r0, 0xFF
        beq r1, (r0, r0) -> @func_spi_transfer

        // loop check
        add r4 = r0, r10
        andi r4 = r4, 0x80
        bne r0, (r4, r0) -> @loop.func_polling_r3_r7_response
        
    add r20 = r0, r10


    addi r10 = r0, 0xFF
    beq r1, (r0, r0) -> @func_spi_transfer
    add r21 = r0, r10

    addi r10 = r0, 0xFF
    beq r1, (r0, r0) -> @func_spi_transfer
    add r4 = r0, r21
    slli r4 = r4, 8
    add r5 = r0, r10
    andi r10 = r5, 0xFF
    or r21 = r4, r10

    addi r10 = r0, 0xFF
    beq r1, (r0, r0) -> @func_spi_transfer
    add r4 = r0, r21
    slli r4 = r4, 8
    add r5 = r0, r10
    andi r10 = r5, 0xFF
    or r21 = r4, r10

    addi r10 = r0, 0xFF
    beq r1, (r0, r0) -> @func_spi_transfer
    add r4 = r0, r21
    slli r4 = r4, 8
    add r5 = r0, r10
    andi r10 = r5, 0xFF
    or r21 = r4, r10

    // r20: r1 resp.
    // r21: r7 resp.(4byte)
    // r10 <- 戻り値レジスタ1
    // r11 <- 戻り値レジスタ2
    // | r19 | ... | r11 | r10 |
    // 39                      0
    add r10 = r0, r21
    add r11 = r0, r20
    

    // 保存レジスタの復元
    lw r1 = r3[-4]
    lw r20 = r3[-8]
    lw r21 = r3[-12]
    addi r2 = r2, 12

    // フレームポインタの復元
    lw r3 = r3[0]
    addi r2 = r2, 4

    // return
    jal r0, r1[0]

@func_polling_data_token_for_cmd17_18_24
    // フレームポインタの退避
    subi r2 = r2, 4
    sw r2[0] = r3
    addi r3 = r2, 0

    // リターンアドレスの退避
    subi r2 = r2, 4
    sw r3[-4] = r1

    @loop.func_polling_data_token_for_cmd17_18_24
        // spi_transfer
        addi r10 = r0, 0xFF
        beq r1, (r0, r0) -> @func_spi_transfer

        // loop check
        add r4 = r0, r10
        andi r4 = r4, 0xfe // data token for CMD17/18/24
        beq r0, (r4, r0) -> @loop.func_polling_data_token_for_cmd17_18_24

    // 保存レジスタの復元
    lw r1 = r3[-4]
    addi r2 = r2, 4

    // フレームポインタの復元
    lw r3 = r3[0]
    addi r2 = r2, 4

    // return
    jal r0, r1[0]

// uint32_t single_block_read(uint32_t block_addr, uint8_t *buffer)
// success: return 0
// fail: return 1
@func_single_block_read

    // プロローグ
    // フレームポインタの退避
    subi r2 = r2, 4
    sw r2[0] = r3
    addi r3 = r2, 0

    // リターンアドレスの退避
    subi r2 = r2, 16
    sw r3[-4] = r1
    sw r3[-8] = r20
    sw r3[-12] = r21
    sw r3[-16] = r22
    
    add r20 = r0, r10
    add r21 = r0, r11
    
    addi r10 = r0, 17  // cmd17
    add r11 = r0, r20  // arg = block_addr
    addi r12 = r0, 0   // crc テキトー
    
    beq r1, (r0, r0) -> @func_spi_sd_command
    beq r1, (r0, r0) -> @func_polling_r1_response
    
    addi r4 = r0, 5
    srl r4 = r10, r4   // Address Error フィールドを取得
    andi r4 = r4, 1
    bne r0, (r4, r0) -> @address_error.func_single_block_read
    
    // data token を待つ
    beq r1, (r0, r0) -> @func_polling_data_token_for_cmd17_18_24

    // バッファに書き込み (0 ~ 510 番目)
    add r22 = r0, r0
    @store_loop.func_single_block_read
    addi r4 = r0, 512
    beq r0, (r22, r4) -> @store_loop_end.func_single_block_read
    
    addi r10 = r0, 0xFF
    beq r1, (r0, r0) -> @func_spi_transfer

    beq r0, (r0, r22) -> @store_loop_inc.func_single_block_read
    add r5 = r0, r21
    sb r5[0] = r10

    @store_loop_inc.func_single_block_read
    addi r4 = r0, 1
    add r21 = r21, r4
    add r22 = r22, r4
    
    beq r0, (r0, r0) -> @store_loop.func_single_block_read
    @store_loop_end.func_single_block_read
    
    // バッファに書き込み (511 番目)
    addi r10 = r0, 0xFF
    beq r1, (r0, r0) -> @func_spi_transfer
    add r5 = r0, r21
    sb r5[0] = r10

    // CRC 読み出し（無視）
    addi r10 = r0, 0xFF
    beq r1, (r0, r0) -> @func_spi_transfer
    addi r10 = r0, 0xFF
    beq r1, (r0, r0) -> @func_spi_transfer

    // 正常終了コードの設定
    addi r10 = r0, 0
    beq r0, (r0, r0) -> @epilogue.func_single_block_read
    
    // エラーコードの設定
    @address_error.func_single_block_read
    addi r10 = r0, 1
    beq r0, (r0, r0) -> @epilogue.func_single_block_read

    @epilogue.func_single_block_read
    // エピローグ
    // 保存レジスタの復元
    lw r1 = r3[-4]
    lw r20 = r3[-8]
    lw r21 = r3[-12]
    lw r22 = r3[-16]
    addi r2 = r2, 16

    // フレームポインタの復元
    lw r3 = r3[0]
    addi r2 = r2, 4

    // return
    jal r0, r1[0]

// void wait_ms(uint32_t ms)
// ms ミリ秒待つ
@func_wait_ms
    // プロローグ
    // フレームポインタの退避
    subi r2 = r2, 4
    sw r2[0] = r3
    addi r3 = r2, 0

    // リターンアドレスの退避
    subi r2 = r2, 16
    sw r3[-4] = r1
    sw r3[-8] = r20
    sw r3[-12] = r21
    sw r3[-16] = r22

    // 引数の保存
    add r22 = r0, r10

    // 初期時間
    in r20 = r0[0x1003]
    in r21 = r0[0x1004]
    
    // 毎ループ時間を取得して差を取る
    // -> 差が r10 より大きければループを終了
    // -> そうでなければ継続
    @loop.func_wait_ms
        in r10 = r0[0x1003]
        in r11 = r0[0x1004]
    
        add r12 = r20, r0
        add r13 = r21, r0
    
        beq r1, (r0, r0) -> @func_sub64

        // 上位32bit が 1 以上ならループ終了
        ble r0, (r0, r11) -> @end.func_wait_ms
        // 上位32bit が 0 なら下位32bit の比較を行う
        // 現在時間 - 初期時間 < r22 ならループ継続
        blt r0, (r6, r22) -> @loop.func_wait_ms
        // 現在時間 - 初期時間 >= r22 ならループ終了
        beq r0, (r0, r0) -> @end.func_wait_ms
        
    @end.func_wait_ms
    
    // エピローグ
    // 保存レジスタの復元
    lw r1 = r3[-4]
    lw r20 = r3[-8]
    lw r21 = r3[-12]
    lw r22 = r3[-16]
    addi r2 = r2, 16

    // フレームポインタの復元
    lw r3 = r3[0]
    addi r2 = r2, 4

    // return
    jal r0, r1[0]

// (uint32_t, uint32_t) sub64(uint64_t ah, uint64_t al, uint64_t bh, uint64_t bl)
@func_sub64
    // return a - b
    // r10 = al, r11 = ah, r12 = bl, r13 = bh
    
    // 繰り下がりが発生したかを確認
    blt r0, (r10, r12) -> @borrow.func_sub64

    // 繰り下がりが発生しないならそのまま引き算
    sub r10 = r10, r12
    sub r11 = r11, r13
    
    // 早期リターン
    jal r0, r1[0]

    // 繰り下がりが発生
    @borrow.func_sub64
    // 下位はそのまま引き算
    sub r10 = r10, r12
    // 上位はそのまま引き算ののち -1
    sub r11 = r11, r13
    addi r4 = r0, 1
    sub r11 = r11, r4

    // return 
    jal r0, r1[0]



// void  gpio_write(uint32_t pin, uint32_t value)
@func_gpio_write
    // r5 = 0x10: 0001_0000
    // gpio =     0000_0000
    // -------------------- or
    //            0001_0000
    
    // r5 = 0xef: 1110_1111
    // gpio =     0001_0000
    // -------------------- and
    //            0000_0000
    
    // r4 = シフト量
    add r4 = r0, r10
    addi r5 = r0, 1


    // 書き込む値を決定
    beq r0, (r11, r0) -> @low.func_gpio_write
    beq r0, (r0, r0) -> @high.func_gpio_write
    // lowを書き込む処理
    @low.func_gpio_write
        // マスク準備
        sll r4 = r5, r4
        xori r5 = r4, 0xFFFFFFFF

        // GPIOの現在状態を取得
        in r6 = r0[4]
        
        // 現在状態にマスクをかける
        and r7 = r5, r6

        // GPIOの現在状態を更新
        out r0[4] = r7

        // return
        jal r0, r1[0]

    // highを書き込む処理
    @high.func_gpio_write
        // マスク準備
        sll r4 = r5, r4

        // GPIOの現在状態を取得
        in r6 = r0[4]
        
        // 現在状態にマスクをかける
        or r7 = r4, r6

        // GPIOの現在状態を更新
        out r0[4] = r7
    
        // return
        jal r0, r1[0]
