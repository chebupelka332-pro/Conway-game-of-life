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



asect 0xfff0
AWESOME_VARIABLE> ds 2

end.