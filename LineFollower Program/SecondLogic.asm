;Program jika sensor active low
$NOMOD51
$INCLUDE (8051.MCU)

    org   0000h

    jmp   Start

    org   0100h

Start:
    MOV P1, #00000000b
    MOV P2, #00000000b

Loop:
    CJNE P1, #01100000b, MotionMaju
    CJNE P1, #01000000b, MotionMaju
    CJNE P1, #00100000b, MotionMaju
    ;motion kiri
    CJNE P1, #11100000b, MotionKiri
    CJNE P1, #11000000b, MotionKiri
    CJNE P1, #10100000b, MotionKiri
    ;motion kanan
    CJNE P1, #01110000b, MotionKanan
    CJNE P1, #00110000b, MotionKanan
    CJNE P1, #01010000b, MotionKanan
    ;motion mundur
    CJNE P1, #00000000b, MotionMundur

MotionMaju:
    MOV P2, #00000101b
    SJMP Loop

MotionKiri:
    MOV P2, #00000001b
    SJMP Loop

MotionKanan:
    MOV P2, #00000100b
    SJMP Loop

MotionMundur:
    MOV P2, #00001010b
    SJMP Loop

    end