asect 0x00

main:ext

dc _start, 0

align 0x18
dc _kb_isr, 0

align 0x80

_start:
    ldi r0, 0xff00 
    stsp r0

    #Set interupt flag to 1
    ldi r0, ISTATE
    ldi r1, 1
    stw r0, r1

    ldi r0, 0
    ldi r1, 0

    ei
    jsr main
    halt

_kb_isr:
    push r0
    push r1
    push r2
    push r3
    push r4
    push r5
    push r6
    push fp

    ldi r0, 0x1488
    
    pop fp
    pop r6
    pop r5
    pop r4
    pop r3
    pop r2
    pop r1
    pop r0
    rti

asect 0xff00
ISTATE> ds 2
CURR_CHAR> ds 2
START_STOP> ds 2
UPDATE> ds 2
BORN> ds 2
SURV> ds 2
LINE_ADR> ds 2
CELL_ADR> ds 2
VALUE> ds 2


end.