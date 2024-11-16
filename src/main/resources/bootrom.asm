// byte1 0x41, 0x42, 0x43, 0x44, 0x45, 0x46
// byte2 0x0102, 0x0304
// byte4 0xdeadbeef
// byte6 0xc0ffee

// byte1 1, 2, 3, 4, 5
// byte2 11, 12, 13, 14, 15
// byte4 21, 22, 23, 24, 25
// byte6 31, 32, 33, 34, 35
// char 'g', 'h'
// string "hello", "world"

$str
string "abc"

===

// void main(void)
@func_main

    @loop_func_main

        // Call:init
        // beq r1, (r0, r0) -> @func_get_freq
    
        // 0xdeadbeefcafebabe - 0xbeefdeadbabecafe
        addi r10 = r0, 0xcafebabe
        addi r11 = r0, 0xdeadbeef
        addi r12 = r0, 0xbabecafe
        addi r13 = r0, 0xbeefdead

        // 0x0000000400000000 - 0x0000000000000001
        addi r10 = r0, 0x00000000
        addi r11 = r0, 0x00000004
        addi r12 = r0, 0x00000001
        addi r13 = r0, 0x00000000
 
    
        // Call:sub64
        beq r1, (r0, r0) -> @func_sub64

        // Loop
    @loop
        add r0 = r10, r0
        add r0 = r11, r0
        beq r0, (r0, r0) -> @loop


// uint_32 get_count(void)
@func_get_count

    // In:Device(0x1000)
    addi r4 = r0, 0x1000
    in r5 = r4[0]

    // Return
    add r10 = r0, r5
    jal r0, r1[0]


// uint32 get_freq(void)
@func_get_freq
// In:Device(0x1002)
    addi r4 = r0, 0x1002
    in r5 = r4[0]

    // Return
    add r10 = r0, r5
    jal r0, r1[0]

// (uint32_t, uint32_t) sub64(uint64_t ah, uint64_t al, uint64_t bh, uint64_t bl)
@func_sub64
    // return a - b
    // r10 = al, r11 = ah, r12 = bl, r13 = bh
    
    // 繰り下がりが発生したかを確認
    // al < bl
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

