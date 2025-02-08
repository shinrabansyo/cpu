===

// r10: 結果(0: 正常終了, 1: 異常終了)
// r20: テストケース名
@test_beq
    addi r20 = r0, 0
    addi r10 = r0, 1

    // テスト1 : 分岐成立
    addi r20 = r0, 1
    addi r5 = r0, 0
    beq r0, (r0, r0) -> @test_beq.1.true     // expected: true
    @test_beq.1.false
        addi r5 = r0, 1
    @test_beq.1.true
        add r10 = r0, r5
    
    // テスト2 : 分岐不成立
    addi r20 = r0, 2
    addi r4 = r0, 1
    beq r0, (r0, r4) -> @test_beq.2.true      // expected: false
    @test_beq.2.false
        // 分岐成立の場合はテスト済みなので，正常に実行できるはず
        addi r10 = r0, 0
        beq r0, (r0, r0) -> @test_beq.2.end
    @test_beq.2.true
        addi r10 = r0, 1
    @test_beq.2.end
        addi r0 = r0, 0

    // テスト3 : 戻りアドレスを使用する
    addi r20 = r0, 3
    addi r4 = r0, @test_beq.3
    addi r5 = r0, 0
    beq r1, (r0, r0) -> @test_beq.3
    @test_beq.3
        addi r0 = r0, 0
    beq r0, (r1, r4) -> @test_beq.3.true     // expected: true
    @test_beq.3.false
        addi r5 = r0, 1
    @test_beq.3.true
        add r10 = r0, r5

@test_bne
    addi r20 = r0, 0
    addi r10 = r0, 1

    // テスト1 : 分岐不成立
    addi r20 = r0, 1
    addi r5 = r0, 0
    bne r0, (r0, r0) -> @test_bne.1.true     // expected: false
    @test_bne.1.false
        addi r10 = r0, 0
        beq r0, (r0, r0) -> @test_bne.1.end
    @test_bne.1.true
        addi r10 = r0, 1
    @test_bne.1.end
        addi r0 = r0, 0
    
    // テスト2 : 分岐成立
    addi r20 = r0, 2
    addi r4 = r0, 1
    bne r0, (r0, r4) -> @test_bne.2.true      // expected: true
    @test_bne.2.false
        addi r5 = r0, 1
    @test_bne.2.true
        add r10 = r0, r5

    // テスト3 : 戻りアドレスを使用する
    addi r20 = r0, 3
    addi r4 = r0, @test_bne.3
    addi r5 = r0, 0
    bne r1, (r0, r4) -> @test_bne.3
    @test_bne.3
        addi r0 = r0, 0
    beq r0, (r1, r4) -> @test_bne.3.true     // expected: true
    @test_bne.3.false
        addi r5 = r0, 1
    @test_bne.3.true
        add r10 = r0, r5

@test_blt
    addi r20 = r0, 0
    addi r10 = r0, 1

    // テスト1 : 分岐成立
    addi r20 = r0, 1
    addi r4 = r0, 0
    addi r5 = r0, 1
    blt r0, (r0, r5) -> @test_blt.1.true     // expected: true
    @test_blt.1.false
        addi r4 = r0, 1
    @test_blt.1.true
        add r10 = r0, r4

    // テスト2 : 分岐不成立
    addi r20 = r0, 2
    addi r4 = r0, 0
    addi r5 = r0, 1
    blt r0, (r5, r0) -> @test_blt.2.true     // expected: false
    @test_blt.2.false
        addi r10 = r0, 0
        beq r0, (r0, r0) -> @test_blt.2.end
    @test_blt.2.true
        addi r10 = r0, 1
    @test_blt.2.end
        addi r0 = r0, 0

    // テスト3 : 戻りアドレスを使用する
    addi r20 = r0, 3
    addi r4 = r0, @test_blt.3
    addi r5 = r0, 0
    blt r1, (r0, r4) -> @test_blt.3
    @test_blt.3
        addi r0 = r0, 0
    beq r0, (r1, r4) -> @test_blt.3.true     // expected: true
    @test_blt.3.false
        addi r5 = r0, 1
    @test_blt.3.true
        add r10 = r0, r5
    
@test_ble
    addi r20 = r0, 0
    addi r10 = r0, 1

    // テスト1 : 分岐成立
    addi r20 = r0, 1
    addi r4 = r0, 0
    addi r5 = r0, 1
    ble r0, (r0, r5) -> @test_ble.1.true     // expected: true
    @test_ble.1.false
        addi r4 = r0, 1
    @test_ble.1.true
        add r10 = r0, r4

    // テスト2 : 分岐成立
    addi r20 = r0, 2
    addi r5 = r0, 0
    ble r0, (r0, r0) -> @test_ble.2.true     // expected: true
    @test_ble.2.false
        addi r5 = r0, 1
    @test_ble.2.true
        add r10 = r0, r5

    // テスト3 : 分岐不成立
    addi r20 = r0, 3
    addi r4 = r0, 0
    addi r5 = r0, 1
    ble r0, (r5, r0) -> @test_ble.3.true     // expected: false
    @test_ble.3.false
        addi r10 = r0, 0
        beq r0, (r0, r0) -> @test_ble.3.end
    @test_ble.3.true
        addi r10 = r0, 1
    @test_ble.3.end
        addi r0 = r0, 0

    // テスト4 : 戻りアドレスを使用する
    addi r20 = r0, 4
    addi r4 = r0, @test_ble.4
    addi r5 = r0, 0
    ble r1, (r0, r4) -> @test_ble.4
    @test_ble.4
        addi r0 = r0, 0
    beq r0, (r1, r4) -> @test_ble.4.true     // expected: true
    @test_ble.4.false
        addi r5 = r0, 1
    @test_ble.4.true
        add r10 = r0, r5

@test_jal
    addi r20 = r0, 0
    addi r10 = r0, 1

    // テスト1 : 一方通行
    addi r20 = r0, 1
    addi r4 = r0, @test_jal.1.end
    jal r0 = r4[0]
    @test_jal.1.begin
        addi r10 = r0, 1
    @test_jal.1.end
        addi r10 = r0, 0

    // テスト2 : 関数呼び出し
    addi r20 = r0, 2
    addi r10 = r0, 1
    addi r4 = r0, @test_jal_sub
    jal r1 = r4[0]
    addi r10 = r0, 0

    // ストップ
    @inf_loop
        beq r0, (r0, r0) -> @inf_loop

@test_jal_sub
    addi r0 = r0, 0
    jal r0 = r1[0]

// beq, bne, blt, ble, jal
