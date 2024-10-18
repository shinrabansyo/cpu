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
        beq r1, (r0, r0) -> @func_get_freq

        // Loop
        beq r0, (r0, r0) -> @loop_func_main


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
