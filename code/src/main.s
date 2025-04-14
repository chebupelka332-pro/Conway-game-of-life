### SECTION: .text
rsect ___src_main_c_41

memset: ext
CELL_ADR: ext
LINE_ADR: ext
VALUE: ext
UPDATE: ext
START_STOP: ext
CURR_CHAR: ext
BORN: ext
SURV: ext
ISTATE: ext


macro movens/2
push $1
pop $2
mend

qInit>                                  # -- Begin function qInit
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-2
	ldi	r0, 0
	ssw	r0, -2
	br	__LBB0_1
__LBB0_1:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	lsw	r0, -2
	ldi	r1, 31
	cmp	r0, r1
	bgt	__LBB0_4
	br	__LBB0_2
__LBB0_2:                               # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	lsw	r0, -2
	shl	r0, r1, 1
	ldi	r2, queue
	ldi	r0, 0
	stw	r1, r2, r0
	br	__LBB0_3
__LBB0_3:                               # %for.inc
                                        #   in Loop: Header=BB0_1 Depth=1
	lsw	r0, -2
	add	r0, 1
	ssw	r0, -2
	br	__LBB0_1
__LBB0_4:                               # %for.end
	ldi	r1, head
	ldi	r0, 0
	stw	r1, r0
	ldi	r1, end
	stw	r1, r0
	addsp	2
	pop	fp
	rts
                                        # -- End function
qPush>                                  # -- Begin function qPush
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-2
                                        # kill: def $r1 killed $r0
	ssb	r0, -1
	lssb	r1, -1
	ldi	r0, end
	ldw	r0, r2
	shl	r2, r2, 1
	ldi	r3, queue
	stw	r2, r3, r1
	ldw	r0, r1
	add	r1, 1
	shra	r1, r2, 8
	shra	r2, r2, 15-8
	shr	r2, r2, 8
	shr	r2, r2, 11-8
	add r1, r2, r2
	ldi	r3, -32
	and r2, r3, r2
	sub r1, r2, r1
	stw	r0, r1
	ldw	r0, r0
	ldi	r1, head
	ldw	r1, r1
	cmp	r0, r1
	bne	__LBB1_2
	br	__LBB1_1
__LBB1_1:                               # %if.then
	ldi	r1, head
	ldw	r1, r0
	add	r0, 1
	shra	r0, r2, 8
	shra	r2, r2, 15-8
	shr	r2, r2, 8
	shr	r2, r2, 11-8
	add r0, r2, r2
	ldi	r3, -32
	and r2, r3, r2
	sub r0, r2, r0
	stw	r1, r0
	br	__LBB1_2
__LBB1_2:                               # %if.end
	addsp	2
	pop	fp
	rts
                                        # -- End function
qPop>                                   # -- Begin function qPop
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-2
	ldi	r0, head
	ldw	r0, r0
	ldi	r1, end
	ldw	r1, r1
	cmp	r0, r1
	bne	__LBB2_2
	br	__LBB2_1
__LBB2_1:                               # %if.then
	ldi	r0, 0
	ssb	r0, -1
	br	__LBB2_3
__LBB2_2:                               # %if.end
	ldi	r1, head
	ldw	r1, r0
	shl	r0, r0, 1
	ldi	r2, queue
	ldw	r0, r2, r0
	ssb	r0, -2
	ldw	r1, r0
	add	r0, 1
	shra	r0, r2, 8
	shra	r2, r2, 15-8
	shr	r2, r2, 8
	shr	r2, r2, 11-8
	add r0, r2, r2
	ldi	r3, -32
	and r2, r3, r2
	sub r0, r2, r0
	stw	r1, r0
	lsb	r0, -2
	ssb	r0, -1
	br	__LBB2_3
__LBB2_3:                               # %return
	lssb	r0, -1
	addsp	2
	pop	fp
	rts
                                        # -- End function
isNum>                                  # -- Begin function isNum
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-4
                                        # kill: def $r1 killed $r0
	ssb	r0, -3
	lssb	r0, -3
	ldi	r1, 48
	cmp	r0, r1
	blt	__LBB3_3
	br	__LBB3_1
__LBB3_1:                               # %land.lhs.true
	lssb	r0, -3
	ldi	r1, 57
	cmp	r0, r1
	bgt	__LBB3_3
	br	__LBB3_2
__LBB3_2:                               # %if.then
	ldi	r0, 1
	ssw	r0, -2
	br	__LBB3_4
__LBB3_3:                               # %if.end
	ldi	r0, 0
	ssw	r0, -2
	br	__LBB3_4
__LBB3_4:                               # %return
	lsw	r0, -2
	addsp	4
	pop	fp
	rts
                                        # -- End function
isAlpha>                                # -- Begin function isAlpha
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-4
                                        # kill: def $r1 killed $r0
	ssb	r0, -3
	lssb	r0, -3
	ldi	r1, 97
	cmp	r0, r1
	blt	__LBB4_3
	br	__LBB4_1
__LBB4_1:                               # %land.lhs.true
	lssb	r0, -3
	ldi	r1, 122
	cmp	r0, r1
	bgt	__LBB4_3
	br	__LBB4_2
__LBB4_2:                               # %if.then
	ldi	r0, 1
	ssw	r0, -2
	br	__LBB4_4
__LBB4_3:                               # %if.end
	ldi	r0, 0
	ssw	r0, -2
	br	__LBB4_4
__LBB4_4:                               # %return
	lsw	r0, -2
	addsp	4
	pop	fp
	rts
                                        # -- End function
setCommand>                             # -- Begin function setCommand
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-6
	ssw	r0, -2
	ssw	r1, -4
	ssw	r2, -6
	lsw	r0, -2
	ldi	r1, CELL_ADR
	stw	r1, r0
	lsw	r0, -4
	ldi	r1, LINE_ADR
	stw	r1, r0
	lsw	r0, -6
	ldi	r1, VALUE
	stw	r1, r0
	ldi	r1, UPDATE
	ldi	r0, 1
	stw	r1, r0
	ldi	r0, 0
	stw	r1, r0
	addsp	6
	pop	fp
	rts
                                        # -- End function
startCommand>                           # -- Begin function startCommand
# %bb.0:                                # %entry
	ldi	r1, START_STOP
	ldi	r0, 1
	stw	r1, r0
	rts
                                        # -- End function
stopCommand>                            # -- Begin function stopCommand
# %bb.0:                                # %entry
	ldi	r1, START_STOP
	ldi	r0, 0
	stw	r1, r0
	rts
                                        # -- End function
fillCommand>                            # -- Begin function fillCommand
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-14
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	movens	r1, r3
	movens	r0, r4
	shr	r4, r5, 8
	ldi	r0, -6
	add	r0, fp, r0
	ldi	r1, 1
	stb	r0, r1, r5
	ssb	r4, -6
	shr	r3, r4, 8
	ldi	r5, -8
	add	r5, fp, r5
	stb	r5, r1, r4
	ssb	r3, -8
	ssw	r2, -10
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -6
	or r0, r1, r0
	ldw	r0, r0
	ssw	r0, -12
	br	__LBB8_1
__LBB8_1:                               # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB8_3 Depth 2
	lsw	r0, -12
	ldi	r1, -8
	add	r1, fp, r1
	ldi	r2, 1
	ldb	r1, r2, r1
	shl	r1, r1, 8
	lsb	r2, -8
	or r1, r2, r1
	ldw	r1, r1
	cmp	r0, r1
	bge	__LBB8_8
	br	__LBB8_2
__LBB8_2:                               # %for.body
                                        #   in Loop: Header=BB8_1 Depth=1
	ldi	r0, -6
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -6
	or r0, r1, r0
	ldi	r1, 2
	ldw	r0, r1, r0
	ssw	r0, -14
	br	__LBB8_3
__LBB8_3:                               # %for.cond3
                                        #   Parent Loop BB8_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lsw	r0, -14
	ldi	r1, -8
	add	r1, fp, r1
	ldi	r2, 1
	ldb	r1, r2, r1
	shl	r1, r1, 8
	lsb	r2, -8
	or r1, r2, r1
	ldi	r2, 2
	ldw	r1, r2, r1
	cmp	r0, r1
	bge	__LBB8_6
	br	__LBB8_4
__LBB8_4:                               # %for.body6
                                        #   in Loop: Header=BB8_3 Depth=2
	lsw	r0, -12
	lsw	r1, -14
	lsw	r2, -10
	jsr	setCommand
	br	__LBB8_5
__LBB8_5:                               # %for.inc
                                        #   in Loop: Header=BB8_3 Depth=2
	lsw	r0, -14
	add	r0, 1
	ssw	r0, -14
	br	__LBB8_3
__LBB8_6:                               # %for.end
                                        #   in Loop: Header=BB8_1 Depth=1
	br	__LBB8_7
__LBB8_7:                               # %for.inc7
                                        #   in Loop: Header=BB8_1 Depth=1
	lsw	r0, -12
	add	r0, 1
	ssw	r0, -12
	br	__LBB8_1
__LBB8_8:                               # %for.end9
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	14
	pop	fp
	rts
                                        # -- End function
cleanCommand>                           # -- Begin function cleanCommand
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-10
	ssw	r4, -2                          # 2-byte Folded Spill
	ldi	r0, -6
	add	r0, fp, r0
	ldi	r4, 2
	ldi	r2, 0
	stw	r0, r4, r2
	ssw	r2, -6
	ldi	r1, __L__const.cleanCommand.end+2
	ldw	r1, r3
	ldi	r1, -10
	add	r1, fp, r1
	stw	r1, r4, r3
	ldi	r3, __L__const.cleanCommand.end
	ldw	r3, r3
	ssw	r3, -10
	jsr	fillCommand
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	10
	pop	fp
	rts
                                        # -- End function
help>                                   # -- Begin function help
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-18
	ldi	r0, __L__const.help.someTetx+14
	ldb	r0, r1
	ldi	r0, __L__const.help.someTetx+15
	ldb	r0, r0
	shl	r0, r0, 8
	or r0, r1, r0
	ldi	r1, -16
	add	r1, fp, r1
	ldi	r2, 14
	stw	r1, r2, r0
	ldi	r0, __L__const.help.someTetx+12
	ldb	r0, r2
	ldi	r0, __L__const.help.someTetx+13
	ldb	r0, r0
	shl	r0, r0, 8
	or r0, r2, r0
	ldi	r2, 12
	stw	r1, r2, r0
	ldi	r0, __L__const.help.someTetx+10
	ldb	r0, r2
	ldi	r0, __L__const.help.someTetx+11
	ldb	r0, r0
	shl	r0, r0, 8
	or r0, r2, r0
	ldi	r2, 10
	stw	r1, r2, r0
	ldi	r0, __L__const.help.someTetx+8
	ldb	r0, r2
	ldi	r0, __L__const.help.someTetx+9
	ldb	r0, r0
	shl	r0, r0, 8
	or r0, r2, r0
	ldi	r2, 8
	stw	r1, r2, r0
	ldi	r0, __L__const.help.someTetx+6
	ldb	r0, r2
	ldi	r0, __L__const.help.someTetx+7
	ldb	r0, r0
	shl	r0, r0, 8
	or r0, r2, r0
	ldi	r2, 6
	stw	r1, r2, r0
	ldi	r0, __L__const.help.someTetx+4
	ldb	r0, r2
	ldi	r0, __L__const.help.someTetx+5
	ldb	r0, r0
	shl	r0, r0, 8
	or r0, r2, r0
	ldi	r2, 4
	stw	r1, r2, r0
	ldi	r0, __L__const.help.someTetx+2
	ldb	r0, r2
	ldi	r0, __L__const.help.someTetx+3
	ldb	r0, r0
	shl	r0, r0, 8
	or r0, r2, r0
	ldi	r2, 2
	stw	r1, r2, r0
	ldi	r0, __L__const.help.someTetx
	ldb	r0, r1
	ldi	r0, __L__const.help.someTetx+1
	ldb	r0, r0
	shl	r0, r0, 8
	or r0, r1, r0
	ssw	r0, -16
	ldi	r0, 0
	ssw	r0, -18
	br	__LBB10_1
__LBB10_1:                              # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	lsw	r1, -18
	ldi	r0, -16
	add	r0, fp, r0
	ldb	r0, r1, r0
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB10_3
	br	__LBB10_2
__LBB10_2:                              # %while.body
                                        #   in Loop: Header=BB10_1 Depth=1
	lsw	r1, -18
	movens	r1, r0
	add	r0, 1
	ssw	r0, -18
	ldi	r0, -16
	add	r0, fp, r0
	ldsb	r0, r1, r0
	ldi	r1, CURR_CHAR
	stw	r1, r0
	br	__LBB10_1
__LBB10_3:                              # %while.end
	addsp	18
	pop	fp
	rts
                                        # -- End function
ruleCommand>                            # -- Begin function ruleCommand
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-4
	ssw	r0, -2
	ssw	r1, -4
	lsw	r0, -2
	ldi	r1, BORN
	stw	r1, r0
	lsw	r0, -4
	ldi	r1, SURV
	stw	r1, r0
	addsp	4
	pop	fp
	rts
                                        # -- End function
main>                                   # -- Begin function main
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-2
	ldi	r0, 0
	ssw	r0, -2
	jsr	qInit
	ldi	r1, ISTATE
	ldi	r0, 1
	stw	r1, r0
	br	__LBB12_1
__LBB12_1:                              # %while.body
                                        # =>This Inner Loop Header: Depth=1
	br	__LBB12_1
                                        # -- End function
### SECTION: .bss
queue>                                  # @queue
	ds	64

head>                                   # @head
	dc	0                               # 0x0

end>                                    # @end
	dc	0                               # 0x0

### SECTION: .rodata.cst4
__L__const.cleanCommand.end:            # @__const.cleanCommand.end
	dc	32                              # 0x20
	dc	32                              # 0x20

### SECTION: .rodata.cst16
__L__const.help.someTetx:               # @__const.help.someTetx
	db	72
	db	101
	db	108
	db	112
	db	32
	db	116
	db	101
	db	120
	db	116
	db	32
	db	41
	db	41
	db	41
	db	10
	db	0
	db	0

end.
