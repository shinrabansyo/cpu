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

    // Call:init
    addi r4 = r0, @func_init
    jal r1, r4[0]                   // func_init()

    // Loop:Setup
    @setup
    addi r5 = r0, $str              // r5 = $str

    // Call:send_spi
    @call
    add r10 = r5, r0
    addi r4 = r0, @func_spi_send
    jal r1, r4[0]                   // func_spi_send(r5)

    // Increment
    addi r5 = r5, 1                 // r5++

    // Check
    lb r6 = r5[0]
    bne r0, (r6, r0) -> @call       // if *r5 != 0 : jmp -> call
    beq r0, (r0, r0) -> @setup      // else        : jmp -> setup

// void init(void)
@func_init

    // Gpio:Init
    addi r4 = r0, 0
    out r0[4] = r4                  // CS = 0
  
    // Spi:Mode
    addi r4 = r0, 3
    out r0[2] = r4                  // Mode = 3

    // Spi:Clockshamt 
    addi r4 = r0, 4
    out r0[3] = r4                  // Clockshamt = 4

    // Return
    jal r0, r1[0]                   // return

// void spi_send(char *c)
@func_spi_send

    // Spi:CS
    addi r4 = r0, 1
    out r0[4] = r4                  // CS = 1

    // Spi:Send
    add r4 = r0, r10
    lb r4 = r4[0]
    out r0[1] = r4                  // Send = args[0]

    // Spi:CS
    addi r4 = r0, 0
    out r0[4] = r4                  // CS = 0

    // Return
    jal r0, r1[0]                   // return
