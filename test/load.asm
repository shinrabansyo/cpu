$number
    byte4 0xCAFEBABE    // 0xBE, 0xBA, 0xFE, 0xCA
===

// r10: 結果(0: 正常終了, 1: 異常終了)
// r20: テストケース名

@test_lw
    addi r20 = r0, 0
    addi r10 = r0, 1

    // テスト1 : 0番地 ~ 3番地
    addi r20 = r0, 1
    lw r11 = r0[0]
    addi r12 = r0, 0xCAFEBABE
    beq r1, (r0, r0) -> @assert

@test_lh
    addi r20 = r0, 0
    addi r10 = r0, 1

    // テスト1 : 0番地 ~ 1番地
    addi r20 = r0, 1
    lh r11 = r0[0]
    addi r12 = r0, 0xFFFFBABE
    beq r1, (r0, r0) -> @assert

    // テスト2 : 1番地 ~ 2番地
    addi r20 = r0, 2
    lh r11 = r0[1]
    addi r12 = r0, 0xFFFFFEBA
    beq r1, (r0, r0) -> @assert

    // テスト3 : 2番地 ~ 3番地
    addi r20 = r0, 3
    lh r11 = r0[2]
    addi r12 = r0, 0xFFFFCAFE
    beq r1, (r0, r0) -> @assert

@test_lhu
    addi r20 = r0, 0
    addi r10 = r0, 1

    // テスト1 : 0番地 ~ 1番地
    addi r20 = r0, 1
    lhu r11 = r0[0]
    addi r12 = r0, 0xBABE
    beq r1, (r0, r0) -> @assert

    // テスト2 : 1番地 ~ 2番地
    addi r20 = r0, 2
    lhu r11 = r0[1]
    addi r12 = r0, 0xFEBA
    beq r1, (r0, r0) -> @assert

    // テスト3 : 2番地 ~ 3番地
    addi r20 = r0, 3
    lhu r11 = r0[2]
    addi r12 = r0, 0xCAFE
    beq r1, (r0, r0) -> @assert

@test_lb
    addi r20 = r0, 0
    addi r10 = r0, 1

    // テスト1 : 0番地
    addi r20 = r0, 1
    lb r11 = r0[0]
    addi r12 = r0, 0xFFFFFFBE
    beq r1, (r0, r0) -> @assert

    // テスト2 : 1番地
    addi r20 = r0, 2
    lb r11 = r0[1]
    addi r12 = r0, 0xFFFFFFBA
    beq r1, (r0, r0) -> @assert

    // テスト3 : 2番地
    addi r20 = r0, 3
    lb r11 = r0[2]
    addi r12 = r0, 0xFFFFFFFE
    beq r1, (r0, r0) -> @assert

    // テスト4 : 3番地
    addi r20 = r0, 4
    lb r11 = r0[3]
    addi r12 = r0, 0xFFFFFFCA
    beq r1, (r0, r0) -> @assert

@test_lbu
    addi r20 = r0, 0
    addi r10 = r0, 1

    // テスト1 : 0番地
    addi r20 = r0, 1
    lbu r11 = r0[0]
    addi r12 = r0, 0xBE
    beq r1, (r0, r0) -> @assert

    // テスト2 : 1番地
    addi r20 = r0, 2
    lbu r11 = r0[1]
    addi r12 = r0, 0xBA
    beq r1, (r0, r0) -> @assert

    // テスト3 : 2番地
    addi r20 = r0, 3
    lbu r11 = r0[2]
    addi r12 = r0, 0xFE
    beq r1, (r0, r0) -> @assert

    // テスト4 : 3番地
    addi r20 = r0, 4
    lbu r11 = r0[3]
    addi r12 = r0, 0xCA
    beq r1, (r0, r0) -> @assert

@assert
    beq r0, (r11, r12) -> @assert.true
    @assert.false
        addi r10 = r0, 1
        jal r0, r1[0]
    @assert.true
        addi r10 = r0, 0
        jal r0, r1[0]
