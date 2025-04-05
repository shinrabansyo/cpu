===

@func_main
    // フレームポインタの設定
    addi r2 = r0, 0x100

    // 表示モード設定 (16色モード, 128 x 128)
    addi r4 = r0, 2
    out r0[6] = r4

    // パレット設定
    addi r4 = r0, 0x00ffffff      // rgb(255, 255, 255)
    out r0[7] = r4
    addi r4 = r0, 0x010000ff      // rgb(0, 0, 255)
    out r0[7] = r4
    addi r4 = r0, 0x02ff0000      // rgb(255, 0, 0)
    out r0[7] = r4
    addi r4 = r0, 0x0300ff00      // rgb(0, 255, 0)
    out r0[7] = r4
    addi r4 = r0, 0x04ffff00      // rgb(255, 255, 0)
    out r0[7] = r4
    addi r4 = r0, 0x05ff00ff      // rgb(255, 0, 255)
    out r0[7] = r4
    addi r4 = r0, 0x0600ffff      // rgb(0, 255, 255)
    out r0[7] = r4
    addi r4 = r0, 0x07ff8000      // rgb(255, 128, 0)
    out r0[7] = r4
    addi r4 = r0, 0x08ff0080      // rgb(255, 0, 128)
    out r0[7] = r4
    addi r4 = r0, 0x09ff80ff      // rgb(128, 0, 255)
    out r0[7] = r4
    addi r4 = r0, 0x0a80ff00      // rgb(0, 128, 255)
    out r0[7] = r4
    addi r4 = r0, 0x0bff0080      // rgb(0, 128, 255)
    out r0[7] = r4
    addi r4 = r0, 0x0cff8000      // rgb(128, 255, 0)
    out r0[7] = r4
    addi r4 = r0, 0x0dff80ff      // rgb(128, 255, 255)
    out r0[7] = r4
    addi r4 = r0, 0x0e80ff80      // rgb(128, 255, 128)
    out r0[7] = r4
    addi r4 = r0, 0x0f808080      // rgb(128, 128, 128)
    out r0[7] = r4

    // 乱数のシード
    addi r4 = r0, 0x12345678

    // Y 軸方向ループカウンタ
    addi r5 = r0, 0

    // Y 軸方向ループ開始
    @loop_h.func_main

        // X 字句方向ループカウンタ
        addi r6 = r0, 0

        // X 軸方向ループ開始
        @loop_w.func_main

            // アドレス計算
            add r7 = r0, r5
            slli r7 = r7, 6          // addr  = y * 64
            add r7 = r7, r6          // addr += x
            addi r7 = r7, 0x10000000 // addr += 0x10000000

            // xorshift 法による乱数生成
            slli r9 = r4, 13         // rand_a = rand << 13
            xor r4 = r4, r9          // rand = rand ^ rand_a
            srli r9 = r4, 7          // rand_a = rand >> 7
            xor r4 = r4, r9          // rand = rand ^ rand_a
            slli r9 = r4, 17         // rand_a = rand << 17
            xor r4 = r4, r9          // rand = rand ^ rand_a

            // ピクセル決定 (左)
            andi r9 = r4, 0x0000000f // p_l = rand & 0x0000000f
            addi r11 = r0, 16
            sll r10 = r9, r11        // pixel = p_l << 16

            // xorshift 法による乱数生成
            slli r9 = r4, 13         // rand_a = rand << 13
            xor r4 = r4, r9          // rand = rand ^ rand_a
            srli r9 = r4, 7          // rand_a = rand >> 7
            xor r4 = r4, r9          // rand = rand ^ rand_a
            slli r9 = r4, 17         // rand_a = rand << 17
            xor r4 = r4, r9          // rand = rand ^ rand_a

            // ピクセル決定 (右)
            andi r9 = r4, 0x0000000f // p_r = rand & 0x0000000f
            add r10 = r10, r9        // pixel += p_r

            // 書き込み
            out r7[0] = r10

            // カウンタ加算
            addi r6 = r6, 1

            // ループ終了判定
            addi r8 = r0, 64
            beq r0, (r6, r8) -> @loop_w.end.func_main
            beq r0, (r0, r0) -> @loop_w.func_main

        // X 軸方向ループ終了
        @loop_w.end.func_main

        // カウンタ加算
        addi r5 = r5, 1

        // ループ終了判定
        addi r8 = r0, 128
        beq r0, (r5, r8) -> @loop_h.end.func_main
        beq r0, (r0, r0) -> @loop_h.func_main

    // Y 軸方向ループ終了
    @loop_h.end.func_main
        addi r0 = r0, 0

    // 無限ループ
    @loop.func_main
        beq r0, (r0, r0) -> @loop.func_main
