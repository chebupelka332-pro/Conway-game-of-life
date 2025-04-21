macro save/0
push r0
push r1
push r2
push r3
push r4
push r5
push r6
push fp
mend

macro restore/0
pop fp
pop r6
pop r5
pop r4
pop r3
pop r2
pop r1
pop r0
mend

asect 0x00

parse:ext
main:ext
qInit:ext
queue:ext
head:ext
end:ext

dc _start, 0

align 0x14
dc _kb_isr, 0

align 0x80

_start:
    ldi r0, 0xff00 
    stsp r0

    ldi r0, ISTATE
    ldi r1, 1
    stw r0, r1

    ldi r0, in_msg
    jsr _print

    clr r0
    clr r1

    ei
    jsr _main
    halt

_main:
    if  
        ldi r0, cmdFlag
        ldw r0, r0
        tst r0
    is nz
        clr r0
        jsr main

        ldi r0, in_msg
        jsr _print

        ldi r0, cmdFlag
        ldi r1, 0
        stw r0, r1
        clr r0
        clr r1
    fi
    jsr _main

_kb_isr:
    save

    ldi r6, CURR_CHAR
    ldw r6, r2

    if
        ldi r1, end
        ldw r1, r1

        inc r1
        ldi r3, 31
        and r3, r1

        ldi r4, head
        ldw r4, r4

        cmp r1, r4
    is ne
        dec r1
        and r3, r1

        stw r6, r2
        if
           ldi r0, 0x0a
           cmp r2, r0 # end of command
        is eq
            ldi r0, cmdFlag
            ldi r5, 1
            stw r0, r5 
            clr r2
        fi
        ldi r5, queue
        stw r5, r1, r2

        inc r1
        and  r3, r1 

        ldi r0, end
        st r0, r1
    else
        # print "Too long!" error
        ldi r0, len_error
        jsr _print
        jsr qInit
    fi

    restore
    rti

_print:
    push r1
    ldi r1, CURR_CHAR
    while
        ldc r0, r2
        inc r0
        tst r2
    stays nz 
        st r1, r2
    wend
    pop r1
    rts

len_error: dc "Your command is too long!",0x0a,0
in_msg: dc "> ",0

cmdFlag: dc 0

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