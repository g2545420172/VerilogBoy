;; Contains tests for:
;; LD A, [BC];
;; LD A, [DE];
;; LD [BC], A;
;; LD [DE], A;
;; LD r, [HL]
;;
SECTION "rom", ROM0[$0000]

jp code_area
my_array:
    ; Starts at 0x0003
    nop                 ; 00            03
    ld BC, $0302        ; 01, 02, 03    04
    inc b               ; 04            07
    dec b               ; 05            08
    ld b, $07           ; 06, 07        09
    ld [$0a09], SP      ; 08, 09, 0a    0b
    dec BC              ; 0b            0e
    inc C               ; 0c            0f
    dec C               ; 0d            10
    ld C, $0f           ; 0e, 0f        11
    rst $38             ; ff            13
    stop                ; 10, 00        14
    jr NZ, $30          ; 20, 30        16
    ld B, B             ; 40            18
    ld D, B             ; 50            19
    ld H, B             ; 60            1a
    ld [HL], B          ; 70            1b
    add A, B            ; 80            1c
    sub B               ; 90            1d
    and B               ; a0            1e
    or B                ; b0            1f
    ret NZ              ; c0            20
    ret NC              ; d0            21
    ldh [$00f0], A      ; e0, f0, 00    22
    ; Last element at 0x0024
    
code_area:
    ld BC, $0004
    ld A, [BC]
    ld BC, $C010
    ld [BC], A
    ld B, A
    
    ld DE, $0005
    ld A, [DE]
    ld DE, $C011
    ld [DE], A
    ld C, A
    
    ld HL, $C010
    ld D, [HL]
    ld HL, $C011
    ld E, [HL]
    halt
