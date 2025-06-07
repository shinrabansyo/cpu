===

// r10: 結果(0: 正常終了, 1: 異常終了)
// r20: テストケース名

@test_sw
    addi r20 = r0, 0
    addi r10 = r0, 1

    // テスト1 : 0番地 ~ 3番地
    addi r20 = r0, 1
    addi r4 = r0, 0xCAFEBABE
    sw r0[0] = r4
    lw r11 = r0[0]
    addi r12 = r0, 0xCAFEBABE
    beq r1, (r0, r0) -> @assert

@test_sh
    addi r20 = r0, 0
    addi r10 = r0, 1

    // テスト1 : 0番地 ~ 1番地
    addi r20 = r0, 1
    addi r4 = r0, 0xBABE
    sh r0[0] = r4
    lh r11 = r0[0]
    addi r12 = r0, 0xFFFFBABE
    beq r1, (r0, r0) -> @assert

    // テスト2 : 1番地 ~ 2番地
    addi r20 = r0, 2
    addi r4 = r0, 0xFEBA
    sh r0[1] = r4
    lh r11 = r0[1]
    addi r12 = r0, 0xFFFFFEBA
    beq r1, (r0, r0) -> @assert

    // テスト3 : 2番地 ~ 3番地
    addi r20 = r0, 3
    addi r4 = r0, 0xCAFE
    sh r0[2] = r4
    lh r11 = r0[2]
    addi r12 = r0, 0xFFFFCAFE
    beq r1, (r0, r0) -> @assert

@test_sb
    addi r20 = r0, 0
    addi r10 = r0, 1

    // テスト1 : 0番地
    addi r20 = r0, 1
    addi r4 = r0, 0xBE
    sb r0[0] = r4
    lb r11 = r0[0]
    addi r12 = r0, 0xFFFFFFBE
    beq r1, (r0, r0) -> @assert

    // テスト2 : 1番地
    addi r20 = r0, 2
    addi r4 = r0, 0xBA
    sb r0[1] = r4
    lb r11 = r0[1]
    addi r12 = r0, 0xFFFFFFBA
    beq r1, (r0, r0) -> @assert

    // テスト3 : 2番地
    addi r20 = r0, 3
    addi r4 = r0, 0xFE
    sb r0[2] = r4
    lb r11 = r0[2]
    addi r12 = r0, 0xFFFFFFFE
    beq r1, (r0, r0) -> @assert

    // テスト4 : 3番地
    addi r20 = r0, 4
    addi r4 = r0, 0xCA
    sb r0[3] = r4
    lb r11 = r0[3]
    addi r12 = r0, 0xFFFFFFCA
    beq r1, (r0, r0) -> @assert

@test_isb
    addi r20 = r0, 0
    addi r10 = r0, 1

    // テスト1 : 0番地 ~ 11番地
    addi r20 = r0, 1

    // 命令書き込み (0x1000 : addi r4 = r0, 1)
    addi r5 = r0, 0x22
    isb r0[0x1000] = r5
    addi r5 = r0, 0x04
    isb r0[0x1001] = r5
    addi r5 = r0, 0x01
    isb r0[0x1002] = r5
    addi r5 = r0, 0x00
    isb r0[0x1003] = r5
    addi r5 = r0, 0x00
    isb r0[0x1004] = r5
    addi r5 = r0, 0x00
    isb r0[0x1005] = r5
    
    // 命令書き込み (0x1006 : jal r0, r1[0]) 
    addi r5 = r0, 0x83
    isb r0[0x1006] = r5
    addi r5 = r0, 0x20
    isb r0[0x1007] = r5
    addi r5 = r0, 0x00
    isb r0[0x1008] = r5
    addi r5 = r0, 0x00
    isb r0[0x1009] = r5
    addi r5 = r0, 0x00
    isb r0[0x100A] = r5
    addi r5 = r0, 0x00
    isb r0[0x100B] = r5

    // 書き込んだ命令へジャンプ
    jal r1, r0[0x1000]

    // テスト
    add r11 = r0, r4
    addi r12 = r0, 1
    beq r1, (r0, r0) -> @assert

@assert
    beq r0, (r11, r12) -> @assert.true
    @assert.false
        addi r10 = r0, 1
        jal r0, r1[0]
    @assert.true
        addi r10 = r0, 0
        jal r0, r1[0]
