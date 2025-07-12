$number
    byte4 0x00000000
$test_sw
    string "test_sw"
$test_sh
    string "test_sh"
$test_sb
    string "test_sb"
$test_isb
    string "test_isb"
$expected
    string "Expected: "
$actual
    string "Actual: "
$hex_table
    string "0123456789ABCDEF"
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
    addi r13 = r0, $test_sw
    add r14 = r0, r20
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
    addi r13 = r0, $test_sh
    add r14 = r0, r20
    beq r1, (r0, r0) -> @assert

    // テスト2 : 1番地 ~ 2番地
    addi r20 = r0, 2
    addi r4 = r0, 0xFEBA
    sh r0[1] = r4
    lh r11 = r0[1]
    addi r12 = r0, 0xFFFFFEBA
    addi r13 = r0, $test_sh
    add r14 = r0, r20
    beq r1, (r0, r0) -> @assert

    // テスト3 : 2番地 ~ 3番地
    addi r20 = r0, 3
    addi r4 = r0, 0xCAFE
    sh r0[2] = r4
    lh r11 = r0[2]
    addi r12 = r0, 0xFFFFCAFE
    addi r13 = r0, $test_sh
    add r14 = r0, r20
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
    addi r13 = r0, $test_sb
    add r14 = r0, r20
    beq r1, (r0, r0) -> @assert

    // テスト2 : 1番地
    addi r20 = r0, 2
    addi r4 = r0, 0xBA
    sb r0[1] = r4
    lb r11 = r0[1]
    addi r12 = r0, 0xFFFFFFBA
    addi r13 = r0, $test_sb
    add r14 = r0, r20
    beq r1, (r0, r0) -> @assert

    // テスト3 : 2番地
    addi r20 = r0, 3
    addi r4 = r0, 0xFE
    sb r0[2] = r4
    lb r11 = r0[2]
    addi r12 = r0, 0xFFFFFFFE
    addi r13 = r0, $test_sb
    add r14 = r0, r20
    beq r1, (r0, r0) -> @assert

    // テスト4 : 3番地
    addi r20 = r0, 4
    addi r4 = r0, 0xCA
    sb r0[3] = r4
    lb r11 = r0[3]
    addi r12 = r0, 0xFFFFFFCA
    addi r13 = r0, $test_sb
    add r14 = r0, r20
    beq r1, (r0, r0) -> @assert

@test_isb
    addi r20 = r0, 0
    addi r10 = r0, 1

    // テスト1 : 0番地 ~ 11番地
    addi r20 = r0, 1
    // 命令書き込み (0x0000 : addi r7 = r0, 97)
    addi r5 = r0, 0x22
    isb r0[0x0000] = r5
    addi r5 = r0, 0x07
    isb r0[0x0001] = r5
    addi r5 = r0, 0x61
    isb r0[0x0002] = r5
    addi r5 = r0, 0x00
    isb r0[0x0003] = r5
    addi r5 = r0, 0x00
    isb r0[0x0004] = r5
    addi r5 = r0, 0x00
    isb r0[0x0005] = r5

    // 命令書き込み (0x0006 : out r0[0] = r7)
    addi r5 = r0, 0x26
    isb r0[0x0006] = r5
    addi r5 = r0, 0x07
    isb r0[0x0007] = r5
    addi r5 = r0, 0x00
    isb r0[0x0008] = r5
    addi r5 = r0, 0x00
    isb r0[0x0009] = r5
    addi r5 = r0, 0x00
    isb r0[0x000A] = r5
    addi r5 = r0, 0x00
    isb r0[0x000B] = r5

    // 命令書き込み (0x000C : addi r4 = r0, 1)
    addi r5 = r0, 0x22
    isb r0[0x000C] = r5
    addi r5 = r0, 0x04
    isb r0[0x000D] = r5
    addi r5 = r0, 0x01
    isb r0[0x000E] = r5
    addi r5 = r0, 0x00
    isb r0[0x000F] = r5
    addi r5 = r0, 0x00
    isb r0[0x0010] = r5
    addi r5 = r0, 0x00
    isb r0[0x0011] = r5

    // 命令書き込み (0x0012 : jal r0, r1[0]) 
    addi r5 = r0, 0x83
    isb r0[0x0012] = r5
    addi r5 = r0, 0x20
    isb r0[0x0013] = r5
    addi r5 = r0, 0x00
    isb r0[0x0014] = r5
    addi r5 = r0, 0x00
    isb r0[0x0015] = r5
    addi r5 = r0, 0x00
    isb r0[0x0016] = r5
    addi r5 = r0, 0x00
    isb r0[0x0017] = r5

    addi r4 = r0, 0
    // 書き込んだ命令へジャンプ
    jal r1, r0[0x0000]

    // テスト
    add r11 = r0, r4
    addi r12 = r0, 1
    addi r13 = r0, $test_isb
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
