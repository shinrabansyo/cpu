$number
    byte4 0xCAFEBABE    // 0xBE, 0xBA, 0xFE, 0xCA
$test_lw
    string "test_lw"
$test_lh
    string "test_lh"
$test_lhu
    string "test_lhu"
$test_lb
    string "test_lb"
$test_lbu
    string "test_lbu"
$expected
    string "Expected: "
$actual
    string "Actual: "
$hex_table
    string "0123456789ABCDEF"
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
    // addi r12 = r0, 0xDEADBEEF
    addi r13 = r0, $test_lw
    add r14 = r0, r20
    beq r1, (r0, r0) -> @assert

@test_lh
    addi r20 = r0, 0
    addi r10 = r0, 1

    // テスト1 : 0番地 ~ 1番地
    addi r20 = r0, 1
    lh r11 = r0[0]
    addi r12 = r0, 0xFFFFBABE
    addi r13 = r0, $test_lh
    add r14 = r0, r20
    beq r1, (r0, r0) -> @assert

    // テスト2 : 1番地 ~ 2番地
    addi r20 = r0, 2
    lh r11 = r0[1]
    addi r12 = r0, 0xFFFFFEBA
    addi r13 = r0, $test_lh
    add r14 = r0, r20
    beq r1, (r0, r0) -> @assert

    // テスト3 : 2番地 ~ 3番地
    addi r20 = r0, 3
    lh r11 = r0[2]
    addi r12 = r0, 0xFFFFCAFE
    addi r13 = r0, $test_lh
    add r14 = r0, r20
    beq r1, (r0, r0) -> @assert

@test_lhu
    addi r20 = r0, 0
    addi r10 = r0, 1
    addi r13 = r0, $test_lhu

    // テスト1 : 0番地 ~ 1番地
    addi r20 = r0, 1
    lhu r11 = r0[0]
    addi r12 = r0, 0xBABE
    addi r13 = r0, $test_lhu
    add r14 = r0, r20
    beq r1, (r0, r0) -> @assert

    // テスト2 : 1番地 ~ 2番地
    addi r20 = r0, 2
    lhu r11 = r0[1]
    addi r12 = r0, 0xFEBA
    addi r13 = r0, $test_lhu
    add r14 = r0, r20
    beq r1, (r0, r0) -> @assert

    // テスト3 : 2番地 ~ 3番地
    addi r20 = r0, 3
    lhu r11 = r0[2]
    addi r12 = r0, 0xCAFE
    addi r13 = r0, $test_lhu
    add r14 = r0, r20
    beq r1, (r0, r0) -> @assert

@test_lb
    addi r20 = r0, 0
    addi r10 = r0, 1
    addi r13 = r0, $test_lb

    // テスト1 : 0番地
    addi r20 = r0, 1
    lb r11 = r0[0]
    addi r12 = r0, 0xFFFFFFBE
    addi r13 = r0, $test_lb
    add r14 = r0, r20
    beq r1, (r0, r0) -> @assert

    // テスト2 : 1番地
    addi r20 = r0, 2
    lb r11 = r0[1]
    addi r12 = r0, 0xFFFFFFBA
    addi r13 = r0, $test_lb
    add r14 = r0, r20
    beq r1, (r0, r0) -> @assert

    // テスト3 : 2番地
    addi r20 = r0, 3
    lb r11 = r0[2]
    addi r12 = r0, 0xFFFFFFFE
    addi r13 = r0, $test_lb
    add r14 = r0, r20
    beq r1, (r0, r0) -> @assert

    // テスト4 : 3番地
    addi r20 = r0, 4
    lb r11 = r0[3]
    addi r12 = r0, 0xFFFFFFCA
    addi r13 = r0, $test_lb
    add r14 = r0, r20
    beq r1, (r0, r0) -> @assert

@test_lbu
    addi r20 = r0, 0
    addi r10 = r0, 1
    addi r13 = r0, $test_lbu

    // テスト1 : 0番地
    addi r20 = r0, 1
    lbu r11 = r0[0]
    addi r12 = r0, 0xBE
    addi r13 = r0, $test_lbu
    add r14 = r0, r20
    beq r1, (r0, r0) -> @assert

    // テスト2 : 1番地
    addi r20 = r0, 2
    lbu r11 = r0[1]
    addi r12 = r0, 0xBA
    addi r13 = r0, $test_lbu
    add r14 = r0, r20
    beq r1, (r0, r0) -> @assert

    // テスト3 : 2番地
    addi r20 = r0, 3
    lbu r11 = r0[2]
    addi r12 = r0, 0xFE
    addi r13 = r0, $test_lbu
    add r14 = r0, r20
    beq r1, (r0, r0) -> @assert

    // テスト4 : 3番地
    addi r20 = r0, 4
    lbu r11 = r0[3]
    addi r12 = r0, 0xCA
    addi r13 = r0, $test_lbu
    add r14 = r0, r20
    beq r1, (r0, r0) -> @assert

@infloop
    beq r0, (r0, r0) -> @infloop

// 出力：関数名, テストケース番号, テスト結果（OK / NG）
// "func_name" 0 : 

// (inline)
// assert_eq
// r11 : 比較する値 1
// r12 : 比較する値 2
// r13 : 関数名を表す文字列へのポインタ
// r14 : テストケース番号
// 破壊するレジスタ
// r2, r3
@assert
    // 関数名を表示
    beq r2, (r0, r0) -> @print
    
    // テストケース番号を表示
    addi r3 = r0, 0x30
    add r3 = r3, r14
    out r0[0] = r3

    // スペース, コロンを表示
    addi r3 = r0, 0x20 // ' '
    out r0[0] = r3
    addi r3 = r0, 0x3a // ':'
    out r0[0] = r3
    addi r3 = r0, 0x20 // ' '
    out r0[0] = r3

    beq r0, (r11, r12) -> @assert.true
    @assert.false
        addi r3 = r0, 0x58 // 'X'
        out r0[0] = r3
        addi r3 = r0, 0x0a // '\n'
        out r0[0] = r3
        addi r13 = r0, $expected
        beq r2, (r0, r0) -> @print
        add r13 = r0, r11
        beq r2, (r0, r0) -> @print_hex
        addi r3 = r0, 0x2c // ','
        out r0[0] = r3
        addi r3 = r0, 0x20 // ' '
        out r0[0] = r3
        addi r13 = r0, $actual
        beq r2, (r0, r0) -> @print
        add r13 = r0, r12
        beq r2, (r0, r0) -> @print_hex
        addi r3 = r0, 0x0a // '\n'
        out r0[0] = r3
        addi r10 = r0, 1
        jal r0, r1[0]
    @assert.true
        addi r3 = r0, 0x4f // 'O'
        out r0[0] = r3
        addi r3 = r0, 0x0a // '\n'
        out r0[0] = r3
        addi r10 = r0, 0
        jal r0, r1[0]


// (inline)
// 引数
// r13 : 関数名を表す文字列へのポインタ
// 破壊するレジスタ
// r2 : 一時戻り番地レジスタ
// r3 : 文字列を読み込むレジスタ
@print
    add r3 = r0, r13
    lbu r3 = r3[0]
    beq r0, (r3, r0) -> @print.end
    out r0[0] = r3
    add r3 = r0, r13
    addi r13 = r3, 1
    beq r0, (r0, r0) -> @print

    @print.end
        addi r3 = r0, 0x20
        out r0[0] = r3
        jal r0, r2[0]

// (inline)
// 引数
// r13 : 出力する値
// 破壊するレジスタ
// r2 : 一時戻り番地レジスタ
// r3 : 出力する値を読み込むレジスタ
@print_hex
    add r3 = r0, r13
    srli r3 = r3, 28
    andi r3 = r3, 0xf
    addi r3 = r3, $hex_table
    lbu r3 = r3[0]
    out r0[0] = r3

    add r3 = r0, r13
    srli r3 = r3, 24
    andi r3 = r3, 0xf
    addi r3 = r3, $hex_table
    lbu r3 = r3[0]
    out r0[0] = r3

    add r3 = r0, r13
    srli r3 = r3, 20
    andi r3 = r3, 0xf
    addi r3 = r3, $hex_table
    lbu r3 = r3[0]
    out r0[0] = r3

    add r3 = r0, r13
    srli r3 = r3, 16
    andi r3 = r3, 0xf
    addi r3 = r3, $hex_table
    lbu r3 = r3[0]
    out r0[0] = r3

    add r3 = r0, r13
    srli r3 = r3, 12
    andi r3 = r3, 0xf
    addi r3 = r3, $hex_table
    lbu r3 = r3[0]
    out r0[0] = r3

    add r3 = r0, r13
    srli r3 = r3, 8
    andi r3 = r3, 0xf
    addi r3 = r3, $hex_table
    lbu r3 = r3[0]
    out r0[0] = r3

    add r3 = r0, r13
    srli r3 = r3, 4
    andi r3 = r3, 0xf
    addi r3 = r3, $hex_table
    lbu r3 = r3[0]
    out r0[0] = r3

    add r3 = r0, r13
    andi r3 = r3, 0xf
    addi r3 = r3, $hex_table
    lbu r3 = r3[0]
    out r0[0] = r3

    jal r0, r2[0]
