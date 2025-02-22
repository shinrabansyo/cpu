$hour
    byte4 0
$minute
    byte4 0
$second
    byte4 0

// w * h = 9 * 7
$char_width
    byte4 9
$char_height
    byte4 7

$space_num
    byte4 2

// フレームバッファの幅
// hh:mm:ss の場合
// char_width * 8 + space_num * 7 = 86 以上ならOK
// 実際のバイト数はnull文字を含めてframe_width+1
$frame_width
    byte4 86

// フレームバッファの高さ
$frame_height
    byte4 7

$zero
    string "#########"
    string "##     ##"
    string "##     ##"
    string "##     ##"
    string "##     ##"
    string "##     ##"
    string "#########"

$one
    string "       ##"
    string "       ##"
    string "       ##"
    string "       ##"
    string "       ##"
    string "       ##"
    string "       ##"

$two
    string "#########"
    string "       ##"
    string "       ##"
    string "#########"
    string "##       "
    string "##       "
    string "#########"

$three
    string "#########"
    string "       ##"
    string "       ##"
    string "#########"
    string "       ##"
    string "       ##"
    string "#########"

$four
    string "##     ##"
    string "##     ##"
    string "##     ##"
    string "#########"
    string "       ##"
    string "       ##"
    string "       ##"

$five
    string "#########"
    string "##       "
    string "##       "
    string "#########"
    string "       ##"
    string "       ##"
    string "#########"

$six
    string "#########"
    string "##       "
    string "##       "
    string "#########"
    string "##     ##"
    string "##     ##"
    string "#########"

$seven
    string "#########"
    string "##     ##"
    string "##     ##"
    string "##     ##"
    string "       ##"
    string "       ##"
    string "       ##"

$eight
    string "#########"
    string "##     ##"
    string "##     ##"
    string "#########"
    string "##     ##"
    string "##     ##"
    string "#########"

$nine
    string "#########"
    string "##     ##"
    string "##     ##"
    string "#########"
    string "       ##"
    string "       ##"
    string "#########"

$colon
    string "         "
    string "   ###   "
    string "   ###   "
    string "         "
    string "   ###   "
    string "   ###   "
    string "         "

$window_width_input
    string "Please input window width: "

$width_too_small
    string "Width is too small. Please input width >= 86."

$window_height_input
    string "Please input window height: "

$height_too_small
    string "Height is too small. Please input height >= 7."

$hour_input
    string "Please input hour: "

$hour_too_big
    string "Hour is too big. Please input hour < 24."

$minute_input
    string "Please input minute: "

$minute_too_big
    string "Minute is too big. Please input minute < 60."

$second_input
    string "Please input second: "

$second_too_big
    string "Second is too big. Please input second < 60."

// buffersize = 16
$input_buffer
    string "                "

$hex_table
    string "0123456789ABCDEF"

$frame_buffer
    byte4 0

===

@main
    addi r2 = r0, 4096

    // 画面サイズの入力
    @main.width_input
    addi r10 = r0, $window_width_input
    beq r1, (r0, r0) -> @func_println

    addi r10 = r0, $input_buffer
    addi r11 = r0, 16
    beq r1, (r0, r0) -> @func_getstr

    addi r10 = r0, $input_buffer
    beq r1, (r0, r0) -> @func_to_int

    // width >= 86
    addi r4 = r0, 86
    ble r0, (r4, r10) -> @main.width_ok // 86 <= width 
    @main.width_too_small
        addi r10 = r0, $width_too_small
        beq r1, (r0, r0) -> @func_println
        beq r0, (r0, r0) -> @main.width_input

    @main.width_ok
    addi r4 = r0, $frame_width
    add r5 = r0, r10
    sw r4[0] = r5


    @main.height_input
    addi r10 = r0, $window_height_input
    beq r1, (r0, r0) -> @func_println

    addi r10 = r0, $input_buffer
    addi r11 = r0, 16
    beq r1, (r0, r0) -> @func_getstr

    addi r10 = r0, $input_buffer
    beq r1, (r0, r0) -> @func_to_int

    // height >= 7
    addi r4 = r0, 7
    ble r0, (r4, r10) -> @main.height_ok // 7 <= height
    @main.height_too_small
        addi r10 = r0, $height_too_small
        beq r1, (r0, r0) -> @func_println
        beq r0, (r0, r0) -> @main.height_input

    @main.height_ok
    addi r4 = r0, $frame_height
    add r5 = r0, r10
    sw r4[0] = r5

    // 現在時刻の入力
    @main.hour_input
    addi r10 = r0, $hour_input
    beq r1, (r0, r0) -> @func_println

    addi r10 = r0, $input_buffer
    addi r11 = r0, 16
    beq r1, (r0, r0) -> @func_getstr

    addi r10 = r0, $input_buffer
    beq r1, (r0, r0) -> @func_to_int

    // hour < 24
    addi r4 = r0, 24
    blt r0, (r10, r4) -> @main.hour_ok // hour < 24
    @main.hour_too_big
        addi r10 = r0, $hour_too_big
        beq r1, (r0, r0) -> @func_println
        beq r0, (r0, r0) -> @main.hour_input

    @main.hour_ok
    addi r4 = r0, $hour
    add r5 = r0, r10
    sw r4[0] = r5


    @main.minute_input
    addi r10 = r0, $minute_input
    beq r1, (r0, r0) -> @func_println

    addi r10 = r0, $input_buffer
    addi r11 = r0, 16
    beq r1, (r0, r0) -> @func_getstr

    addi r10 = r0, $input_buffer
    beq r1, (r0, r0) -> @func_to_int

    // minute < 60
    addi r4 = r0, 60
    blt r0, (r10, r4) -> @main.minute_ok // minute < 60
    @main.minute_too_big
        addi r10 = r0, $minute_too_big
        beq r1, (r0, r0) -> @func_println
        beq r0, (r0, r0) -> @main.minute_input

    @main.minute_ok
    addi r4 = r0, $minute
    add r5 = r0, r10
    sw r4[0] = r5

    @main.second_input
    addi r10 = r0, $second_input
    beq r1, (r0, r0) -> @func_println

    addi r10 = r0, $input_buffer
    addi r11 = r0, 16
    beq r1, (r0, r0) -> @func_getstr

    addi r10 = r0, $input_buffer
    beq r1, (r0, r0) -> @func_to_int

    // second < 60
    addi r4 = r0, 64
    blt r0, (r10, r4) -> @main.second_ok // second < 60
    @main.second_too_big
        addi r10 = r0, $second_too_big
        beq r1, (r0, r0) -> @func_println
        beq r0, (r0, r0) -> @main.second_input

    @main.second_ok
    addi r4 = r0, $second
    add r5 = r0, r10
    sw r4[0] = r5

    // フレームバッファのクリア
    beq r1, (r0, r0) -> @func_clear_frame_buffer

    // 時間の初期化
    in r24 = r0[0x1003]
    in r25 = r0[0x1004]

@inf_loop
    add r10 = r0, r24
    add r11 = r0, r25
    addi r12 = r0, 1000
    beq r1, (r0, r0) -> @func_is_elapsed
    beq r0, (r10, r0) -> @inf_loop

    in r24 = r0[0x1003]
    in r25 = r0[0x1004]
    
    // x 方向のカーソル位置 = (frame_width - 86) / 2
    addi r4 = r0, $frame_width
    lw r4 = r4[0]
    subi r4 = r4, 86
    srai r20 = r4, 1
    // y 方向のカーソル位置 = (frame_height - 7) / 2
    addi r4 = r0, $frame_height
    lw r4 = r4[0]
    subi r4 = r4, 7
    srai r23 = r4, 1
    addi r4 = r0, $char_width
    lw r21 = r4[0]
    addi r4 = r0, $space_num
    lw r22 = r4[0]

    addi r4 = r0, $hour
    lw r10 = r4[0]
    add r11 = r0, r20
    add r12 = r0, r23
    beq r1, (r0, r0) -> @func_write_two_digits
    add r20 = r20, r21
    add r20 = r20, r21
    add r20 = r20, r22

    add r20 = r20, r22
    addi r10 = r0, 10 // ':'
    add r11 = r0, r20
    add r12 = r0, r23
    beq r1, (r0, r0) -> @func_write_number
    add r20 = r20, r21

    add r20 = r20, r22
    addi r4 = r0, $minute
    lw r10 = r4[0]
    add r11 = r0, r20
    add r12 = r0, r23
    beq r1, (r0, r0) -> @func_write_two_digits
    add r20 = r20, r21
    add r20 = r20, r21
    add r20 = r20, r22

    add r20 = r20, r22
    addi r10 = r0, 10 // ':'
    add r11 = r0, r20
    add r12 = r0, r23
    beq r1, (r0, r0) -> @func_write_number
    add r20 = r20, r21

    add r20 = r20, r22
    addi r4 = r0, $second
    lw r10 = r4[0]
    add r11 = r0, r20
    add r12 = r0, r23
    beq r1, (r0, r0) -> @func_write_two_digits
    add r20 = r20, r21
    add r20 = r20, r21
    add r20 = r20, r22

    beq r1, (r0, r0) -> @func_print_frame_buffer

    addi r10 = r0, 0
    addi r11 = r0, 0
    addi r12 = r0, 1
    beq r1, (r0, r0) -> @func_add_time

    beq r0, (r0, r0) -> @inf_loop

// void write_two_digits(uint32_t n, uint32_t x, uint32_t y);
@func_write_two_digits
    // プロローグ
    // フレームポインタの退避
    subi r2 = r2, 4
    sw r2[0] = r3
    addi r3 = r2, 0

    // リターンアドレスの退避
    subi r2 = r2, 16
    sw r3[-4] = r1
    sw r3[-8] = r20
    sw r3[-12] = r21
    sw r3[-16] = r22

    // n / 10
    add r4 = r0, r10
    addi r5 = r0, 10
    addi r6 = r0, 0
    @func_write_two_digits.div_loop
    blt r0, (r4, r5) -> @func_write_two_digits.div_done
        sub r4 = r4, r5
        addi r6 = r6, 1
        beq r0, (r0, r0) -> @func_write_two_digits.div_loop
    @func_write_two_digits.div_done

    add r20 = r0, r4
    add r21 = r0, r11
    add r22 = r0, r12

    // r6: 商, r20: 余り
    add r10 = r0, r6
    add r11 = r0, r11
    add r12 = r0, r12
    beq r1, (r0, r0) -> @func_write_number

    add r10 = r0, r20
    addi r4 = r0, $space_num
    lw r4 = r4[0]
    add r11 = r4, r21 // x += space_num
    addi r4 = r0, $char_width
    lw r4 = r4[0]
    add r11 = r11, r4 // x += char_width
    add r12 = r0, r22
    beq r1, (r0, r0) -> @func_write_number

    // エピローグ
    @func_print_frame_buffer.epilogue
    // 保存レジスタの復元
    lw r1 = r3[-4]
    lw r20 = r3[-8]
    lw r21 = r3[-12]
    lw r22 = r3[-16]
    addi r2 = r2, 16

    // フレームポインタの復元
    lw r3 = r3[0]
    addi r2 = r2, 4

    // return
    jal r0, r1[0]

// void add_time(uint32_t h, uint32_t m, uint32_t s);
@func_add_time
    addi r4 = r0, $hour
    lw r13 = r4[0]
    addi r4 = r0, $minute
    lw r14 = r4[0]
    addi r4 = r0, $second
    lw r15 = r4[0]

    add r12 = r12, r15
    addi r4 = r0, 60
    // sec < 60 -> no carry
    blt r0, (r12, r4) -> @func_add_time.sec_no_carry
    @func_add_time.sec_carry
        sub r12 = r12, r4
        addi r4 = r0, 1
        add r11 = r11, r4
    @func_add_time.sec_no_carry

    add r11 = r11, r14
    addi r4 = r0, 60
    // min < 60 -> no carry
    blt r0, (r11, r4) -> @func_add_time.min_no_carry
    @func_add_time.min_carry
        sub r11 = r11, r4
        addi r4 = r0, 1
        add r10 = r10, r4
    @func_add_time.min_no_carry

    add r10 = r10, r13
    addi r4 = r0, 24
    // hour < 24 -> no carry
    blt r0, (r10, r4) -> @func_add_time.hour_no_carry
    @func_add_time.hour_carry
        sub r10 = r10, r4
    @func_add_time.hour_no_carry

    addi r4 = r0, $hour
    add r5 = r0, r10
    sw r4[0] = r5
    addi r4 = r0, $minute
    add r5 = r0, r11
    sw r4[0] = r5
    addi r4 = r0, $second
    add r5 = r0, r12
    sw r4[0] = r5

    jal r0, r1[0]

// void print(const char *s);
@func_print
    add r4 = r0, r10
    lbu r4 = r4[0]
    beq r0, (r4, r0) -> @func_print.end
    out r0[0] = r4
    add r4 = r0, r10
    addi r10 = r4, 1
    beq r0, (r0, r0) -> @func_print

    @func_print.end
        jal r0, r1[0]

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

// void clear_frame_buffer();
@func_clear_frame_buffer

    // for (y = frame_height; y > 0; y--) {
    //     for (x = frame_width; x > 0; x--) {
    //         *frame_buffer = ' ';
    //         frame_buffer++;
    //     }
    //     *frame_buffer = 0;
    //     frame_buffer++;
    // }

    // r4 = $frame_buffer
    // r10 = frame_width
    // r11 = frame_height
    // r12 = y 
    // r13 = x
    addi r4 = r0, $frame_buffer
    addi r5 = r0, $frame_width
    lw r10 = r5[0]
    addi r6 = r0, $frame_height
    lw r11 = r6[0]

    
    add r12 = r0, r11
    @func_clear_frame_buffer.loop_y
        beq r0, (r12, r0) -> @func_clear_frame_buffer.end_y
        add r13 = r0, r10 // r13 = frame_width
        @func_clear_frame_buffer.loop_x
            beq r0, (r13, r0) -> @func_clear_frame_buffer.end_x
            addi r5 = r0, 0x20
            sb r4[0] = r5   // *frame_buffer = ' '
            addi r4 = r4, 1 // frame_buffer++
            add r5 = r0, r13
            subi r13 = r5, 1 // x--
            beq r0, (r0, r0) -> @func_clear_frame_buffer.loop_x
        @func_clear_frame_buffer.end_x

        sb r4[0] = r0   // *frame_buffer = 0
        addi r4 = r4, 1 // frame_buffer++
        add r5 = r0, r12
        subi r12 = r5, 1 // y--
        beq r0, (r0, r0) -> @func_clear_frame_buffer.loop_y
    @func_clear_frame_buffer.end_y

    jal r0, r1[0]


// void print_frame_buffer();
@func_print_frame_buffer
    // プロローグ
    // フレームポインタの退避
    subi r2 = r2, 4
    sw r2[0] = r3
    addi r3 = r2, 0

    // リターンアドレスの退避
    subi r2 = r2, 16
    sw r3[-4] = r1
    sw r3[-8] = r20
    sw r3[-12] = r21
    sw r3[-16] = r22

    // フレームバッファ領域の大きさを取得
    addi r5 = r0, $frame_width
    lw r5 = r5[0]
    addi r20 = r5, 1 // r20 = frame_width + 1
    addi r5 = r0, $frame_height
    lw r5 = r5[0]
    add r21 = r0, r5 // r21 = frame_height

    // フレームバッファの表示
    addi r4 = r0, $frame_buffer
    add r22 = r0, r4 // r22 = $frame_buffer

    addi r6 = r0, 0x0a
    out r0[0] = r6    // 改行は先頭で行い，
    add r6 = r0, r21
    subi r21 = r6, 1  // 最後の行は改行しない
    @func_print_frame_buffer.loop
        beq r0, (r21, r0) -> @func_print_frame_buffer.end
        add r10 = r0, r22
        beq r1, (r0, r0) -> @func_println

        add r22 = r22, r20
        add r4 = r0, r21
        subi r21 = r4, 1
        beq r0, (r0, r0) -> @func_print_frame_buffer.loop
    
    @func_print_frame_buffer.end
    add r10 = r0, r22
    beq r1, (r0, r0) -> @func_print

    // エピローグ
    @func_print_frame_buffer.epilogue
    // 保存レジスタの復元
    lw r1 = r3[-4]
    lw r20 = r3[-8]
    lw r21 = r3[-12]
    lw r22 = r3[-16]
    addi r2 = r2, 16

    // フレームポインタの復元
    lw r3 = r3[0]
    addi r2 = r2, 4

    // return
    jal r0, r1[0]

// uint32_t calc_address(uint32_t x, uint32_t y);
// return $frame_buffer + x + (y * (frame_width + 1))
@func_calc_address
    // プロローグ
    // フレームポインタの退避
    subi r2 = r2, 4
    sw r2[0] = r3
    addi r3 = r2, 0

    // リターンアドレスの退避
    subi r2 = r2, 12
    sw r3[-4] = r1
    sw r3[-8] = r20
    sw r3[-12] = r21

    add r20 = r0, r10
    add r21 = r0, r11
    // r5 = y * (frame_width + 1)
    addi r4 = r0, $frame_width
    lw r4 = r4[0]
    addi r11 = r4, 1
    add r10 = r0, r21
    beq r1, (r0, r0) -> @func_mul // r10 = y * (frame_width + 1)

    add r10 = r10, r20 // r10 = x + (y * (frame_width + 1))
    addi r4 = r0, $frame_buffer
    add r10 = r10, r4 // r10 = $frame_buffer + x + (y * (frame_width + 1))

    // エピローグ
    @func_print_frame_buffer.epilogue
    // 保存レジスタの復元
    lw r1 = r3[-4]
    lw r20 = r3[-8]
    lw r21 = r3[-12]
    addi r2 = r2, 12

    // フレームポインタの復元
    lw r3 = r3[0]
    addi r2 = r2, 4

    // return
    jal r0, r1[0]

// void write_frame_buffer(const char *s, uint32_t x, uint32_t y);
// 先頭アドレス: $frame_buffer + x + (y * (frame_width + 1))
@func_write_frame_buffer
    // プロローグ
    // フレームポインタの退避
    subi r2 = r2, 4
    sw r2[0] = r3
    addi r3 = r2, 0

    // リターンアドレスの退避
    subi r2 = r2, 12
    sw r3[-4] = r1
    sw r3[-8] = r20
    sw r3[-12] = r21

    add r21 = r0, r11

    add r20 = r0, r10
    add r10 = r0, r11
    add r11 = r0, r12
    beq r1, (r0, r0) -> @func_calc_address // r10 = 書き込み始める先頭アドレス


    // null文字が出現するか，x < frame_widthを超えるまで文字列をコピー
    add r4 = r0, r20 // r4 = source
    add r5 = r0, r10 // r5 = dest
    addi r7 = r0, $frame_width
    lw r11 = r7[0]
    @func_write_frame_buffer.loop
        blt r0, (r11, r21) -> @func_write_frame_buffer.end
        lbu r6 = r4[0]
        beq r0, (r6, r0) -> @func_write_frame_buffer.end
        sb r5[0] = r6
        addi r4 = r4, 1
        addi r5 = r5, 1
        addi r6 = r0, 1
        add r21 = r21, r6
        beq r0, (r0, r0) -> @func_write_frame_buffer.loop
    
    @func_write_frame_buffer.end
    add r0 = r0, r0

    // エピローグ
    @func_write_frame_buffer.epilogue
    // 保存レジスタの復元
    lw r1 = r3[-4]
    lw r20 = r3[-8]
    lw r21 = r3[-12]
    addi r2 = r2, 12

    // フレームポインタの復元
    lw r3 = r3[0]
    addi r2 = r2, 4

    // return
    jal r0, r1[0]

// uint32_t mul(uint32_t a, uint32_t b);
@func_mul
    add r4 = r0, r10
    add r10 = r0, r0

    @func_mul.loop
        beq r0, (r11, r0) -> @func_mul.end
        add r10 = r10, r4
        add r5 = r0, r11
        subi r11 = r5, 1
        beq r0, (r0, r0) -> @func_mul.loop
    
    @func_mul.end
        add r10 = r0, r10
        jal r0, r1[0]

// void write_number(uint32_t n, uint32_t x, uint32_t y);
@func_write_number
// $w[0] * $h[0] * n + $zero
    // プロローグ
    // フレームポインタの退避
    subi r2 = r2, 4
    sw r2[0] = r3
    addi r3 = r2, 0

    // リターンアドレスの退避
    subi r2 = r2, 24
    sw r3[-4] = r1
    sw r3[-8] = r20
    sw r3[-12] = r21
    sw r3[-16] = r22
    sw r3[-20] = r23
    sw r3[-24] = r24

    // パラメータの取得
    add r20 = r0, r10 // r20 = n
    add r23 = r0, r11 // r23 = x
    add r24 = r0, r12 // r24 = y
    addi r4 = r0, $char_width
    addi r5 = r0, $char_height
    lw r4 = r4[0]
    addi r10 = r4, 1
    lw r11 = r5[0]
    add r21 = r0, r10 // r21 = char_width + 1 (文字幅+null文字)
    add r22 = r0, r11 // r22 = char_height

    // 数字AAの先頭アドレスの計算
    beq r1, (r0, r0) -> @func_mul // r10 = (char_width + 1) * char_height

    add r11 = r0, r20
    beq r1, (r0, r0) -> @func_mul // r10 = (char_width + 1) * char_height * n

    add r4 = r0, r10
    addi r20 = r4, $zero // r20: 数字AAの先頭アドレス

    // 数字AAの表示
    @func_write_number.loop
        beq r0, (r22, r0) -> @func_write_number.end
        add r10 = r0, r20
        add r11 = r0, r23
        add r12 = r0, r24
        beq r1, (r0, r0) -> @func_write_frame_buffer

        add r20 = r20, r21 // r20 次の行の先頭アドレス
        add r4 = r0, r22
        subi r22 = r4, 1 
        add r4 = r0, r24
        addi r24 = r4, 1
        beq r0, (r0, r0) -> @func_write_number.loop
    
    @func_write_number.end
    add r0 = r0, r0

    // エピローグ
    @func_write_number.epilogue
    // 保存レジスタの復元
    lw r1 = r3[-4]
    lw r20 = r3[-8]
    lw r21 = r3[-12]
    lw r22 = r3[-16]
    lw r23 = r3[-20]
    lw r24 = r3[-24]
    addi r2 = r2, 24

    // フレームポインタの復元
    lw r3 = r3[0]
    addi r2 = r2, 4

    // return
    jal r0, r1[0]

// (uint32_t, uint32_t) sub64(uint64_t ah, uint64_t al, uint64_t bh, uint64_t bl)
@func_sub64
    // return a - b
    // r10 = al, r11 = ah, r12 = bl, r13 = bh
    
    // 繰り下がりが発生したかを確認
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

// void is_elapsed(uint32_t ref_l, uint32_t ref_h, uint32_t ms)
// return (ref + ms >= now)
@func_is_elapsed
    // プロローグ
    // フレームポインタの退避
    subi r2 = r2, 4
    sw r2[0] = r3
    addi r3 = r2, 0

    // リターンアドレスの退避
    subi r2 = r2, 16
    sw r3[-4] = r1
    sw r3[-8] = r20
    sw r3[-12] = r21
    sw r3[-16] = r22

    // 引数の保存
    add r22 = r0, r12

    // 初期時間
    add r20 = r0, r10
    add r21 = r0, r11
    
    // -> 差が r10 より大きければ1を返す
    in r10 = r0[0x1003]
    in r11 = r0[0x1004]

    add r12 = r20, r0
    add r13 = r21, r0

    beq r1, (r0, r0) -> @func_sub64

    // 上位32bit が 1 以上なら経過済み
    blt r0, (r0, r11) -> @yes.func_is_elapsed
    // 上位32bit が 0 なら下位32bit の比較を行う
    // 現在時間 - 初期時間 < r22 なら未経過
    blt r0, (r10, r22) -> @no.func_is_elapsed
    // 現在時間 - 初期時間 >= r22 なら経過済み
    beq r0, (r0, r0) -> @yes.func_is_elapsed
        
    @yes.func_is_elapsed
    addi r10 = r0, 1
    beq r0, (r0, r0) -> @epilogue.func_is_elapsed

    @no.func_is_elapsed
    addi r10 = r0, 0

    // エピローグ
    // 保存レジスタの復元
    @epilogue.func_is_elapsed
    lw r1 = r3[-4]
    lw r20 = r3[-8]
    lw r21 = r3[-12]
    lw r22 = r3[-16]
    addi r2 = r2, 16

    // フレームポインタの復元
    lw r3 = r3[0]
    addi r2 = r2, 4

    // return
    jal r0, r1[0]

// 引数
// void print_hex(uint32_t n);
@func_print_hex
    addi r5 = r0, 32

    @func_print_hex.loop
        beq r0, (r5, r0) -> @func_print_hex.end
        add r4 = r0, r10
        subi r5 = r5, 4
        srl r4 = r4, r5
        andi r4 = r4, 0xf
        addi r4 = r4, $hex_table
        lbu r4 = r4[0]
        out r0[0] = r4
        beq r0, (r0, r0) -> @func_print_hex.loop
    @func_print_hex.end

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

// uint32_t to_int(const char *s);
// while (*s != '\0') {
//     if ('0' <= *s && *s <= '9') {
//         n = n * 10 + (*s - '0');
//     } else {
//         break;
//     }
//     s++;
// }
@func_to_int
    add r4 = r0, r10
    addi r10 = r0, 0

    @func_to_int.loop
        lbu r7 = r4[0]
        beq r0, (r7, r0) -> @func_to_int.end // *s == '\0'
        addi r6 = r0, 10
        subi r7 = r7, 0x30 // '0'
        ble r0, (r6, r7) -> @func_to_int.end // '9' < *s
        blt r0, (r7, r0) -> @func_to_int.end // *s < '0'
            // r10 = r10 * 10
            add r5 = r0, r0
            addi r6 = r0, 10
            @func_to_int.mul_loop
                beq r0, (r6, r0) -> @func_to_int.mul_end
                add r5 = r5, r10
                subi r6 = r6, 1
                beq r0, (r0, r0) -> @func_to_int.mul_loop
            @func_to_int.mul_end
            add r10 = r0, r5

            // r10 = r10 + (*s - '0')
            add r10 = r10, r7

            addi r4 = r4, 1 // s++
        beq r0, (r0, r0) -> @func_to_int.loop

    @func_to_int.end
        jal r0, r1[0]
