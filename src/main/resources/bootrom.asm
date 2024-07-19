// Data None

===

// Gpio:Init
addi r1 = r0, 0
out r0[4] = r1

// Spi:Mode
addi r1 = r0, 3
out r0[2] = r1

// Spi:Clockshamt
addi r1 = r0, 4
out r0[3] = r1

// Loop:Setup
@setup
addi r2 = r0, 97
addi r3 = r0, 123

// Spi:CS
@loop
addi r1 = r0, 1
out r0[4] = r1

// Spi:Send
out r0[1] = r2

// Spi:CS
addi r1 = r0, 0
out r0[4] = r1

// Loop
addi r2 = r2, 1
beq r0, (r2, r3) -> @setup
beq r0, (r0, r0) -> @loop
