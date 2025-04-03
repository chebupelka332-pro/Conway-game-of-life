asect 0x00

main:ext

dc _start, 0
align 0x80

_start:
    ldi r0, 0xff00 
    stsp r0
    ldi r0, 0

    jsr main
    halt



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