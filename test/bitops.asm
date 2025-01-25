===
// r10: 結果(0: 正常終了, 1: 異常終了)
// r20: テストケース名
// andのテスト 
@test_and
    addi r10 = r0, 1

    // テスト1 : 即値
    addi r20 = r0, 1
    andi r10 = r0, 0    // 0 & 0 = 0

    addi r20 = r0, 2
    andi r10 = r0, 1    // 0 & 1 = 0

    addi r20 = r0, 3
    addi r4 = r0, 1
    andi r5 = r4, 1
    subi r10 = r5, 1    // 1 & 1 = 1

    // テスト2 : レジスタを使用
    addi r20 = r0, 4
    addi r4 = r0, 0
    and r10 = r0, r4    // 0 & 0 = 0

    addi r20 = r0, 5
    andi r4 = r0, 1
    and r10 = r0, r4    // 0 & 1 = 0

    addi r20 = r0, 6
    addi r4 = r0, 1
    addi r5 = r0, 1
    and r6 = r4, r5
    subi r10 = r6, 1    // 1 & 1 = 1

// orのテスト 
@test_or
    addi r10 = r0, 1

    // テスト1 : 即値
    addi r20 = r0, 1
    ori r10 = r0, 0    // 0 | 0 = 0

    addi r20 = r0, 2
    ori r4 = r0, 1    // 0 | 1 = 1
    subi r10 = r4, 1

    addi r20 = r0, 3
    addi r4 = r0, 1
    ori r5 = r4, 1
    subi r10 = r5, 1    // 1 | 1 = 1

    // テスト2 : レジスタを使用
    addi r20 = r0, 4
    addi r4 = r0, 0
    or r10 = r0, r4    // 0 | 0 = 0

    addi r20 = r0, 5
    addi r4 = r0, 1
    or r5 = r0, r4    // 0 | 1 = 1
    subi r10 = r5, 1

    addi r20 = r0, 6
    addi r4 = r0, 1
    addi r5 = r0, 1
    or r6 = r4, r5
    subi r10 = r6, 1    // 1 | 1 = 1

@test_xor
    addi r10 = r0, 1

    // テスト1 : 即値
    addi r20 = r0, 1
    xori r4 = r0, 2
    subi r10 = r4, 2    // b00 ^ b10 = b10

    addi r20 = r0, 2
    addi r4 = r0, 3
    xori r5 = r4, 2
    subi r10 = r5, 1    // b11 ^ b10 = b01

    // テスト2 : レジスタを使用
    addi r20 = r0, 3
    addi r4 = r0, 0
    addi r5 = r0, 2
    xor r6 = r4, r5
    subi r10 = r6, 2    // b00 ^ b10 = b10

    addi r20 = r0, 4
    addi r4 = r0, 3
    addi r5 = r0, 2
    xor r6 = r4, r5
    subi r10 = r6, 1    // b11 ^ b10 = b01

@test_srl
    addi r10 = r0, 1

    // テスト1 : 即値
    addi r20 = r0, 1
    addi r4 = r0, 8     // b1000
    srli r5 = r4, 1     // b1000 >> 1 = b0100
    subi r10 = r5, 4

    addi r20 = r0, 2
    addi r4 = r0, 16     // b10000
    srli r5 = r4, 2     // b10000 >> 2 = b00100
    subi r10 = r5, 4

    // テスト2 : 即値
    addi r20 = r0, 3
    addi r4 = r0, 32     // b100000
    addi r5 = r0, 2
    srl r6 = r4, r5     // b100000 >> 2 = b1000
    subi r10 = r6, 8

    addi r20 = r0, 4
    addi r4 = r0, 64     // b1000000
    addi r5 = r0, 3
    srl r6 = r4, r5     // b1000000 >> 3 = b01000
    subi r10 = r6, 8

// sraのテスト 
@test_sra
    addi r10 = r0, 1

    // テスト1 : 即値
    addi r20 = r0, 1
    srai r10 = r0, 0    // 0 >>> 0 = 0

    addi r20 = r0, 2
    srai r10 = r0, 1    // 0 >>> 1 = 0

    addi r20 = r0, 3
    addi r4 = r0, 16
    srai r4 = r4, 2
    subi r10 = r4, 4    // 16 >>> 2 = 4

    addi r20 = r0, 4
    subi r4 = r0, 1
    srai r4 = r4, 8
    subi r5 = r0, 1
    sub r10 = r5, r4    // 0xFFFFFFFF >>> 8 = 0xFFFFFFFF

    // テスト2 : レジスタを使用
    addi r20 = r0, 5
    addi r4 = r0, 0
    sra r10 = r0, r4    // 0 >>> 0 = 0

    addi r20 = r0, 6
    addi r4 = r0, 1
    sra r10 = r0, r4    // 0 >>> 1 = 0

    addi r20 = r0, 7
    addi r4 = r0, 16
    addi r5 = r0, 2
    sra r6 = r4, r5
    subi r10 = r6, 4    // 16 >>> 2 = 4

    addi r20 = r0, 8
    subi r4 = r0, 1
    addi r5 = r0, 8
    sra r6 = r4, r5
    subi r7 = r0, 1
    sub r10 = r6, r7    // 0xFFFFFFFF >>> 8 = 0xFFFFFFFF

// sllのテスト 
@test_sll
    addi r10 = r0, 1

    // テスト1 : 即値
    addi r20 = r0, 1
    addi r4 = r0, 1
    addi r5 = r0, 2
    sll r6 = r4, r5
    subi r10 = r6, 4    // b0001 << 2 = b0100

    addi r20 = r0, 2
    addi r4 = r0, 3
    addi r5 = r0, 31
    sll r6 = r4, r5
    subi r10 = r6, 0x80000000   // b0001 << 31 = 0b1000 0000 0000 0000 0000 0000 0000 0000

    // テスト2 : レジスタを使用
    addi r20 = r0, 3
    addi r4 = r0, 1
    slli r5 = r4, 2   //b0001 << 2 = b0100
    subi r10 = r5, 4

    addi r20 = r0, 4
    addi r4 = r0, 3
    slli r5 = r4, 31 // b0011 << 31 = 0b1000 0000 0000 0000 0000 0000 0000 0000
    subi r10 = r5, 0x80000000  
