$hello
    string "Hello，森羅万象!"
===
@main
    addi r2 = r0, 4096

    addi r10 = r0, $hello
    beq r1, (r0, r0) -> @func_println

    // '> ' を表示
    addi r4 = r0, 0x3e
    out r0[0] = r4
    addi r4 = r0, 0x20
    out r0[0] = r4

@main.loop
    // 入力を受け取る
    addi r10 = r0, 0x100
    addi r11 = r0, 64    // 0x100 番地に 64 バイトの領域を確保
    beq r1, (r0, r0) -> @func_getstr

    // 入力を表示
    addi r10 = r0, 0x100
    beq r1, (r0, r0) -> @func_println

    beq r0, (r0, r0) -> @main.loop

// void println(const char *s);
@func_println
    add r4 = r0, r10
    lbu r4 = r4[0]
    beq r0, (r4, r0) -> @func_println.end
    out r0[0] = r4
    add r4 = r0, r10
    addi r10 = r4, 1
    beq r0, (r0, r0) -> @func_println

    @func_println.end
        addi r4 = r0, 0x0a
        out r0[0] = r4
        jal r0, r1[0]

// uint32_t getstr(char *buf, uint32_t size);
// char *cur = buf;
// char *end = buf + size;
// while (cur < end) {
//     char c = getchar();
//     if (c == '\n') {
//         break;
//     }
//     *cur = c;
//     cur++;
// }
// *cur = '\0';
// return cur - buf;
@func_getstr
    add r4 = r0, r10
    add r5 = r4, r11
    addi r7 = r0, 0x0a

    @func_getstr.loop
        ble r0, (r5, r4) -> @func_getstr.end

        in r6 = r0[0]
        out r0[0] = r6
        beq r0, (r6, r7) -> @func_getstr.end
        sb r4[0] = r6
        addi r4 = r4, 1

        beq r0, (r0, r0) -> @func_getstr.loop
    
    @func_getstr.end
        addi r6 = r0, 0x00
        sb r4[0] = r6
        sub r10 = r4, r10
        jal r0, r1[0]
