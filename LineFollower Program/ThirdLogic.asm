;Program jika sensor active high
$NOMOD51
$INCLUDE (8051.MCU)

    org   0000h

    jmp   Start

    org   0100h

Start:
    MOV P1, #00000000b
    MOV P2, #00000000b

Loop:
    CJNE P1, #10010000b, MotionMaju
    CJNE P1, #10110000b, MotionMaju
    CJNE P1, #11010000b, MotionMaju
    ;motion kiri
    CJNE P1, #00010000b, MotionKiri
    CJNE P1, #00110000b, MotionKiri
    CJNE P1, #01010000b, MotionKiri
    ;motion kanan
    CJNE P1, #10000000b, MotionKanan
    CJNE P1, #11000000b, MotionKanan
    CJNE P1, #10100000b, MotionKanan
    ;motion mundur
    CJNE P1, #11110000b, MotionMundur

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