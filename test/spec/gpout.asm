===

// r10: 結果(0: 正常終了, 1: 異常終了)
// r20: テストケース名

@test_gpout
    addi r20 = r0, 0
    addi r10 = r0, 1

    // GPIOデバイスIDを設定
    addi r4 = r0, 0x00000004

    // テスト1: 全ビット1を出力して読み込み
    addi r20 = r0, 1
    addi r5 = r0, 0xFFFFFFFF
    out r4[0] = r5
    in r11 = r4[0]
    addi r12 = r0, 0x000000FF
    beq r1, (r0, r0) -> @assert

    // テスト2: 全ビット0を出力して読み込み
    addi r20 = r0, 2
    addi r5 = r0, 0x00000000
    out r4[0] = r5
    in r11 = r4[0]
    addi r12 = r0, 0x00000000
    beq r1, (r0, r0) -> @assert

    // テスト3: 交互パターンを出力して読み込み
    addi r20 = r0, 3
    addi r5 = r0, 0x55555555
    out r4[0] = r5
    in r11 = r4[0]
    addi r12 = r0, 0x00000055
    beq r1, (r0, r0) -> @assert

    // テスト4: 逆交互パターンを出力して読み込み
    addi r20 = r0, 4
    addi r5 = r0, 0xAAAAAAAA
    out r4[0] = r5
    in r11 = r4[0]
    addi r12 = r0, 0x000000AA
    beq r1, (r0, r0) -> @assert

@assert
    beq r0, (r11, r12) -> @assert.true
    @assert.false
        addi r10 = r0, 1
        jal r0, r1[0]
    @assert.true
        addi r10 = r0, 0
        jal r0, r1[0]
