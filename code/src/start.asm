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

        di
        jsr main
        ei

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
    ldb r6, r2

    ldi r7, 31             # маска для кольцевого буфера (размер 32)
    ldi r5, head
    ldw r5, r4             # r4 = head
    ldi r5, end
    ldw r5, r1             # r1 = end

    if
        # проверка на backspace
        ldi r0, 0x08
        cmp r2, r0
    is eq
        cmp r1, r4
        if
        is ne
            dec r1
            and r7, r1
            ldi r0, end
            st r0, r1
            stb r6, r2             # echo обратно на консоль
        fi
        restore
        rti
    fi

    stb r6, r2             # echo обратно на консоль

    # не backspace
    inc r1
    and r7, r1

    if
        cmp r1, r4        
    is ne
        dec r1
        and r7, r1

        ldi r5, queue

        if
            # проверка на enter
            ldi r0, 0x0a
            cmp r2, r0
        is eq
            ldi r2, 0         # заменяем r2 на 0 (терминатор строки)
            ldi r0, cmdFlag
            ldi r3, 1
            stw r0, r3
        fi

        stb r5, r1, r2        # кладем либо символ, либо 0

        inc r1
        and r7, r1
        ldi r0, end
        st r0, r1
    else
        ldi r0, len_error
        jsr _print
        jsr qInit
    fi

    restore
    rti






_print:
    push r1
    push r2
    ldi r1, CURR_CHAR
    while
        ldc r0, r2
        inc r0
        tst r2
    stays nz 
        st r1, r2
    wend
    pop r2
    pop r1
    rts

len_error: dc 0x0a,"Your command is too long!",0x0a,"> ",0
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