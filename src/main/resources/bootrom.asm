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
string "cba"

===

@func_main

    // Call:init
    addi r4 = r0, @func_init        // 0x00
    jal r5, r4[0]                   // 0x06

    // Loop:Setup
    @setup
    addi r2 = r0, $str              // 0x0c

    // Call:send_spi
    @call
    addi r4 = r0, @func_spi_send    // 0x12
    jal r5, r4[0]                   // 0x18

    // Increment
    addi r2 = r2, 1                 // 0x1e

    // Check
    lb r3 = r2[0]                   // 0x24
    bne r0, (r3, r0) -> @call       // 0x2a if r3 != 0 : jmp -> call
    beq r0, (r0, r0) -> @setup      // 0x30 else       : jmp -> setup

@func_init

    // Gpio:Init
    addi r1 = r0, 0                 // 0x36
    out r0[4] = r1                  // 0x3c
  
    // Spi:Mode
    addi r1 = r0, 3                 // 0x42
    out r0[2] = r1                  // 0x48

    // Spi:Clockshamt 
    addi r1 = r0, 4                 // 0x4e
    out r0[3] = r1                  // 0x54

    // Return
    jal r0, r5[0]                   // 0x5a

@func_spi_send

    // Spi:CS
    addi r1 = r0, 1                 // 0x60
    out r0[4] = r1                  // 0x66

    // Spi:Send
    lb r3 = r2[0]                   // 0x6c
    out r0[1] = r3                  // 0x72

    // Spi:CS
    addi r1 = r0, 0                 // 0x78
    out r0[4] = r1                  // 0x7c

    // Return
    jal r0, r5[0]                   // 0x84
