===
// 足し算・引き算系命令のテスト 
@test_add
    addi r20 = r0, 0
    addi r10 = r0, 1

    // テスト1 : 即値
    addi r20 = r0, 1
    addi r4 = r0, 10
    subi r10 = r4, 10

    addi r20 = r0, 2
    addi r4 = r0, 20
    subi r10 = r4, 20

    addi r20 = r0, 3
    addi r4 = 0, 30
    subi r10 = r4, 30

    // テスト2 : レジスタを使用した足し算
    addi r20 = r0, 4
    addi r4 = r0, 10
    addi r5 = r0, 20
    add r6 = r4, r5    // 10 + 20
    subi r10 = r6, 30

    addi r20 = r0, 5
    addi r4 = r0, 50
    subi r5 = r0, 40
    add r6 = r4, r5    // 50 + (-40)
    subi r10 = r6, 10

    addi r20 = r0, 6
    subi r4 = r0, 50
    subi r5 = r0, 40
    add r6 = r4, r5    // -50 + (-40)
    addi r10 = r6, 90
