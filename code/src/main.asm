### SECTION: .text
rsect ___src_test_c_41

CURR_CHAR: ext
CELL_ADR: ext
LINE_ADR: ext
VALUE: ext
UPDATE: ext
START_STOP: ext
BORN: ext
SURV: ext


macro movens/2
push $1
pop $2
mend

qInit>                                  # -- Begin function qInit
# %bb.0:                                # %entry
	ldi	r1, queue
	ldi	r0, 0
	stw	r1, r0
	ldi	r1, queue+2
	stw	r1, r0
	ldi	r1, queue+4
	stw	r1, r0
	ldi	r1, queue+6
	stw	r1, r0
	ldi	r1, queue+8
	stw	r1, r0
	ldi	r1, queue+10
	stw	r1, r0
	ldi	r1, queue+12
	stw	r1, r0
	ldi	r1, queue+14
	stw	r1, r0
	ldi	r1, queue+16
	stw	r1, r0
	ldi	r1, queue+18
	stw	r1, r0
	ldi	r1, queue+20
	stw	r1, r0
	ldi	r1, queue+22
	stw	r1, r0
	ldi	r1, queue+24
	stw	r1, r0
	ldi	r1, queue+26
	stw	r1, r0
	ldi	r1, queue+28
	stw	r1, r0
	ldi	r1, queue+30
	stw	r1, r0
	ldi	r1, queue+32
	stw	r1, r0
	ldi	r1, queue+34
	stw	r1, r0
	ldi	r1, queue+36
	stw	r1, r0
	ldi	r1, queue+38
	stw	r1, r0
	ldi	r1, queue+40
	stw	r1, r0
	ldi	r1, queue+42
	stw	r1, r0
	ldi	r1, queue+44
	stw	r1, r0
	ldi	r1, queue+46
	stw	r1, r0
	ldi	r1, queue+48
	stw	r1, r0
	ldi	r1, queue+50
	stw	r1, r0
	ldi	r1, queue+52
	stw	r1, r0
	ldi	r1, queue+54
	stw	r1, r0
	ldi	r1, queue+56
	stw	r1, r0
	ldi	r1, queue+58
	stw	r1, r0
	ldi	r1, queue+60
	stw	r1, r0
	ldi	r1, queue+62
	stw	r1, r0
	ldi	r1, head
	stw	r1, r0
	ldi	r1, end
	stw	r1, r0
	rts
                                        # -- End function
isNum>                                  # -- Begin function isNum
# %bb.0:                                # %entry
	sub	r0, 48
	ldi	r1, 255
	and r0, r1, r1
	ldi	r0, 1
	ldi	r2, 10
	cmp	r1, r2
	blo	__LBB1_2
# %bb.1:                                # %entry
	ldi	r0, 0
__LBB1_2:                               # %entry
	rts
                                        # -- End function
isAlpha>                                # -- Begin function isAlpha
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-2
	ssw	r4, -2                          # 2-byte Folded Spill
	ldi	r2, 0
	ldi	r1, 1
	ldi	r3, 45
	cmp	r0, r3
	movens	r1, r3
	beq	__LBB2_2
# %bb.1:                                # %entry
	movens	r2, r3
__LBB2_2:                               # %entry
	ldi	r4, 223
	and r0, r4, r0
	ldi	r4, -65
	add r0, r4, r0
	ldi	r4, 255
	and r0, r4, r0
	ldi	r4, 26
	cmp	r0, r4
	blo	__LBB2_4
# %bb.3:                                # %entry
	movens	r2, r1
__LBB2_4:                               # %entry
	or r3, r1, r0
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	2
	pop	fp
	rts
                                        # -- End function
print>                                  # -- Begin function print
# %bb.0:                                # %entry
	ldb	r0, r2
	ldi	r1, 0
	cmp	r2, r1
	beq	__LBB3_3
	br	__LBB3_1
__LBB3_1:                               # %while.body.preheader
	add	r0, 1
	ldi	r3, CURR_CHAR
__LBB3_2:                               # %while.body
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r2
	stw	r3, r2
	ldb	r0, r2
	add	r0, 1
	cmp	r2, r1
	bne	__LBB3_2
	br	__LBB3_3
__LBB3_3:                               # %while.end
	rts
                                        # -- End function
StringLen>                              # -- Begin function StringLen
# %bb.0:                                # %entry
	movens	r0, r1
	ldi	r2, 0
	movens	r2, r0
__LBB4_1:                               # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	ldb	r1, r0, r3
	add	r0, 1
	cmp	r3, r2
	bne	__LBB4_1
	br	__LBB4_2
__LBB4_2:                               # %while.end
	sub	r0, 1
	rts
                                        # -- End function
StringCmp>                              # -- Begin function StringCmp
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-6
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	movens	r0, r2
	ldb	r2, r4
	ldi	r5, 0
	cmp	r4, r5
	beq	__LBB5_4
	br	__LBB5_1
__LBB5_1:                               # %land.rhs.preheader
	ldi	r0, 0
	add	r2, 1
	ldi	r6, 255
	movens	r0, r5
__LBB5_2:                               # %land.rhs
                                        # =>This Inner Loop Header: Depth=1
	ldb	r1, r5, r3
	and r4, r6, r4
	cmp	r4, r3
	bne	__LBB5_6
	br	__LBB5_3
__LBB5_3:                               # %if.end
                                        #   in Loop: Header=BB5_2 Depth=1
	ldb	r2, r5, r4
	add	r5, 1
	cmp	r4, r0
	bne	__LBB5_2
	br	__LBB5_4
__LBB5_4:                               # %land.rhs16
	ldb	r1, r5, r1
	ldi	r0, 1
	ldi	r2, 0
	cmp	r1, r2
	beq	__LBB5_6
# %bb.5:                                # %land.rhs16
	movens	r2, r0
__LBB5_6:                               # %cleanup
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	6
	pop	fp
	rts
                                        # -- End function
my_mul>                                 # -- Begin function my_mul
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-2
	ldi	r2, 0
	ssw	r2, -2
	ldi	r3, 1
	cmp	r1, r3
	blt	__LBB6_2
	br	__LBB6_1
__LBB6_1:                               # %for.body.preheader
	br	__LBB6_3
__LBB6_3:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lsw	r3, -2
	add r3, r0, r3
	ssw	r3, -2
	sub	r1, 1
	cmp	r1, r2
	beq	__LBB6_2
	br	__LBB6_3
__LBB6_2:                               # %for.cond.cleanup
	lsw	r0, -2
	addsp	2
	pop	fp
	rts
                                        # -- End function
my_atoi>                                # -- Begin function my_atoi
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-8
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r2, 1
	ldb	r0, r2, r1
	shl	r1, r1, 8
	ldb	r0, r3
	or r1, r3, r3
	ldb	r3, r1
	ldi	r4, 32
	cmp	r1, r4
	bne	__LBB7_3
	br	__LBB7_1
__LBB7_1:                               # %while.body.preheader
	add	r3, 1
	br	__LBB7_5
__LBB7_5:                               # %while.body
                                        # =>This Inner Loop Header: Depth=1
	shr	r3, r1, 8
	stb	r0, r2, r1
	stb	r0, r3
	ldb	r3, r1
	add	r3, 1
	cmp	r1, r4
	beq	__LBB7_5
	br	__LBB7_2
__LBB7_2:                               # %while.cond2.preheader.loopexit
	sub	r3, 1
__LBB7_3:                               # %while.cond2.preheader
	sub	r1, 58
	ldi	r4, 255
	and r1, r4, r4
	ldi	r1, -1
	ldi	r5, 246
	cmp	r4, r5
	blo	__LBB7_7
	br	__LBB7_4
__LBB7_4:                               # %while.body3.preheader
	ldi	r1, 0
	add	r3, 1
	br	__LBB7_6
__LBB7_6:                               # %while.body3
                                        # =>This Inner Loop Header: Depth=1
	ldi	r4, 0
	ssw	r4, -8
	lsw	r6, -8
	add r6, r1, r6
	ssw	r6, -8
	lsw	r6, -8
	add r6, r1, r6
	ssw	r6, -8
	lsw	r6, -8
	add r6, r1, r6
	ssw	r6, -8
	lsw	r6, -8
	add r6, r1, r6
	ssw	r6, -8
	lsw	r6, -8
	add r6, r1, r6
	ssw	r6, -8
	lsw	r6, -8
	add r6, r1, r6
	ssw	r6, -8
	lsw	r6, -8
	add r6, r1, r6
	ssw	r6, -8
	lsw	r6, -8
	add r6, r1, r6
	ssw	r6, -8
	lsw	r6, -8
	add r6, r1, r6
	ssw	r6, -8
	lsw	r6, -8
	add r6, r1, r1
	ssw	r1, -8
	lsw	r1, -8
	ldi	r4, -1
	ldsb	r3, r4, r6
	shr	r3, r5, 8
	stb	r0, r2, r5
	stb	r0, r3
	ldb	r3, r5
	sub	r5, 58
	ldi	r4, 255
	and r5, r4, r5
	add r1, r6, r1
	add	r3, 1
	sub	r1, 48
	ldi	r4, 245
	cmp	r5, r4
	bhi	__LBB7_6
	br	__LBB7_7
__LBB7_7:                               # %while.end7
	movens	r1, r0
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	8
	pop	fp
	rts
                                        # -- End function
SetCommand>                             # -- Begin function SetCommand
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-6
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	or r1, r0, r4
	ldi	r3, 32
	cmp	r4, r3
	blo	__LBB8_2
	br	__LBB8_1
__LBB8_2:                               # %if.end
	ldi	r4, 2
	cmp	r2, r4
	blo	__LBB8_4
	br	__LBB8_3
__LBB8_3:                               # %while.body.i19.preheader
	ldi	r0, CURR_CHAR
	ldi	r1, 69
	stw	r0, r1
	ldi	r1, 114
	stw	r0, r1
	stw	r0, r1
	ldi	r2, 111
	stw	r0, r2
	stw	r0, r1
	ldi	r4, 58
	stw	r0, r4
	stw	r0, r3
	ldi	r4, 86
	stw	r0, r4
	ldi	r4, 97
	stw	r0, r4
	ldi	r4, 108
	stw	r0, r4
	ldi	r4, 117
	stw	r0, r4
	ldi	r5, 101
	stw	r0, r5
	stw	r0, r3
	ldi	r6, 109
	stw	r0, r6
	stw	r0, r4
	ldi	r4, 115
	stw	r0, r4
	ldi	r4, 116
	stw	r0, r4
	stw	r0, r3
	ldi	r4, 98
	stw	r0, r4
	stw	r0, r5
	stw	r0, r3
	ldi	r4, 48
	stw	r0, r4
	stw	r0, r3
	stw	r0, r2
	stw	r0, r1
	stw	r0, r3
	ldi	r1, 49
	stw	r0, r1
	ldi	r1, 46
	stw	r0, r1
	ldi	r1, 10
	stw	r0, r1
	br	__LBB8_5
__LBB8_1:                               # %while.body.i.preheader
	ldi	r0, CURR_CHAR
	ldi	r1, 69
	stw	r0, r1
	ldi	r2, 114
	stw	r0, r2
	stw	r0, r2
	ldi	r1, 111
	stw	r0, r1
	stw	r0, r2
	ldi	r4, 58
	stw	r0, r4
	stw	r0, r3
	ldi	r4, 67
	stw	r0, r4
	stw	r0, r1
	stw	r0, r1
	stw	r0, r2
	ldi	r2, 100
	stw	r0, r2
	ldi	r4, 105
	stw	r0, r4
	ldi	r4, 110
	stw	r0, r4
	ldi	r5, 97
	stw	r0, r5
	ldi	r6, 116
	stw	r0, r6
	ldi	r5, 101
	stw	r0, r5
	ldi	r5, 115
	stw	r0, r5
	stw	r0, r3
	stw	r0, r1
	ldi	r2, 117
	stw	r0, r2
	stw	r0, r6
	stw	r0, r3
	stw	r0, r1
	ldi	r6, 102
	stw	r0, r6
	stw	r0, r3
	ldi	r3, 98
	stw	r0, r3
	stw	r0, r1
	stw	r0, r2
	stw	r0, r4
	ldi	r1, 100
	stw	r0, r1
	stw	r0, r5
	ldi	r1, 46
	stw	r0, r1
	ldi	r1, 10
	stw	r0, r1
	br	__LBB8_5
__LBB8_4:                               # %if.end9
	ldi	r3, CELL_ADR
	stw	r3, r0
	ldi	r0, LINE_ADR
	stw	r0, r1
	ldi	r0, VALUE
	stw	r0, r2
	ldi	r0, UPDATE
	ldi	r1, 1
	stw	r0, r1
	ldi	r1, 0
	stw	r0, r1
__LBB8_5:                               # %return
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	6
	pop	fp
	rts
                                        # -- End function
StartCmd>                               # -- Begin function StartCmd
# %bb.0:                                # %entry
	ldi	r0, START_STOP
	ldi	r1, 1
	stw	r0, r1
	ldi	r0, CURR_CHAR
	ldi	r1, 71
	stw	r0, r1
	ldi	r1, 97
	stw	r0, r1
	ldi	r2, 109
	stw	r0, r2
	ldi	r2, 101
	stw	r0, r2
	ldi	r3, 32
	stw	r0, r3
	ldi	r3, 115
	stw	r0, r3
	ldi	r3, 116
	stw	r0, r3
	stw	r0, r1
	ldi	r1, 114
	stw	r0, r1
	stw	r0, r3
	stw	r0, r2
	ldi	r1, 100
	stw	r0, r1
	ldi	r1, 46
	stw	r0, r1
	ldi	r1, 10
	stw	r0, r1
	rts
                                        # -- End function
StopCmd>                                # -- Begin function StopCmd
# %bb.0:                                # %entry
	ldi	r0, START_STOP
	ldi	r1, 0
	stw	r0, r1
	ldi	r0, CURR_CHAR
	ldi	r1, 71
	stw	r0, r1
	ldi	r1, 97
	stw	r0, r1
	ldi	r1, 109
	stw	r0, r1
	ldi	r1, 101
	stw	r0, r1
	ldi	r2, 32
	stw	r0, r2
	ldi	r2, 115
	stw	r0, r2
	ldi	r2, 116
	stw	r0, r2
	ldi	r2, 111
	stw	r0, r2
	ldi	r2, 112
	stw	r0, r2
	stw	r0, r2
	stw	r0, r1
	ldi	r1, 100
	stw	r0, r1
	ldi	r1, 46
	stw	r0, r1
	ldi	r1, 10
	stw	r0, r1
	rts
                                        # -- End function
FillCmd>                                # -- Begin function FillCmd
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-60
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	movens	r1, r4
	movens	r0, r3
	ldw	r3, r0
	ldi	r1, 31
	ssw	r0, -58                         # 2-byte Folded Spill
	cmp	r0, r1
	ldi	r5, CURR_CHAR
	ldi	r0, 32
	ssw	r0, -14                         # 2-byte Folded Spill
	bhi	__LBB11_6
	br	__LBB11_1
__LBB11_1:                              # %lor.lhs.false3
	ldi	r0, 2
	ldw	r3, r0, r0
	cmp	r0, r1
	bhi	__LBB11_6
	br	__LBB11_2
__LBB11_6:                              # %if.then
	ldi	r0, 69
	stw	r5, r0
	ldi	r0, 114
	stw	r5, r0
	stw	r5, r0
	ldi	r3, 111
	stw	r5, r3
	stw	r5, r0
	ldi	r1, 58
	stw	r5, r1
	ldi	r2, 32
	stw	r5, r2
	ldi	r1, 73
	stw	r5, r1
	ldi	r1, 110
	stw	r5, r1
	ldi	r1, 118
	stw	r5, r1
	ldi	r1, 97
	stw	r5, r1
	ldi	r1, 108
	stw	r5, r1
	ldi	r4, 105
	stw	r5, r4
	ldi	r4, 100
	ssw	r4, -36                         # 2-byte Folded Spill
	stw	r5, r4
	ssw	r2, -16                         # 2-byte Folded Spill
	stw	r5, r2
	movens	r3, r4
	stw	r5, r0
	ldi	r2, 101
	stw	r5, r2
	ldi	r3, 99
	ssw	r3, -42                         # 2-byte Folded Spill
	stw	r5, r3
	ldi	r3, 115
	ssw	r3, -12                         # 2-byte Folded Spill
	ldi	r6, 103
	ssw	r6, -50                         # 2-byte Folded Spill
	ldi	r6, 116
	ssw	r4, -52                         # 2-byte Folded Spill
	ldi	r3, 110
	ssw	r3, -40                         # 2-byte Folded Spill
	ssw	r3, -48                         # 2-byte Folded Spill
	ldi	r3, 97
	ssw	r3, -38                         # 2-byte Folded Spill
	ssw	r3, -26                         # 2-byte Folded Spill
	ssw	r6, -54                         # 2-byte Folded Spill
	ssw	r6, -22                         # 2-byte Folded Spill
	ssw	r2, -44                         # 2-byte Folded Spill
	ssw	r2, -20                         # 2-byte Folded Spill
	ssw	r4, -46                         # 2-byte Folded Spill
	ssw	r4, -32                         # 2-byte Folded Spill
	ssw	r0, -18                         # 2-byte Folded Spill
	ldi	r4, 102
	ssw	r4, -24                         # 2-byte Folded Spill
	ldi	r6, 105
	movens	r6, r2
	ssw	r6, -28                         # 2-byte Folded Spill
	ssw	r1, -30                         # 2-byte Folded Spill
	ssw	r1, -34                         # 2-byte Folded Spill
	br	__LBB11_14
__LBB11_14:                             # %return.sink.split
	lsw	r6, -54                         # 2-byte Folded Reload
	stw	r5, r6
	lsw	r6, -38                         # 2-byte Folded Reload
	stw	r5, r6
	lsw	r6, -40                         # 2-byte Folded Reload
	stw	r5, r6
	lsw	r6, -50                         # 2-byte Folded Reload
	stw	r5, r6
	stw	r5, r1
	lsw	r1, -44                         # 2-byte Folded Reload
	stw	r5, r1
	ldi	r1, 32
	stw	r5, r1
	lsw	r1, -42                         # 2-byte Folded Reload
	stw	r5, r1
	lsw	r1, -46                         # 2-byte Folded Reload
	stw	r5, r1
	lsw	r1, -52                         # 2-byte Folded Reload
	stw	r5, r1
	stw	r5, r0
	lsw	r0, -36                         # 2-byte Folded Reload
	stw	r5, r0
	stw	r5, r2
	lsw	r0, -48                         # 2-byte Folded Reload
	stw	r5, r0
	lsw	r5, -34                         # 2-byte Folded Reload
__LBB11_15:                             # %return
	ldi	r1, CURR_CHAR
	lsw	r0, -26                         # 2-byte Folded Reload
	stw	r1, r0
	lsw	r0, -22                         # 2-byte Folded Reload
	stw	r1, r0
	lsw	r0, -20                         # 2-byte Folded Reload
	stw	r1, r0
	lsw	r0, -12                         # 2-byte Folded Reload
	stw	r1, r0
	lsw	r0, -16                         # 2-byte Folded Reload
	stw	r1, r0
	lsw	r0, -24                         # 2-byte Folded Reload
	stw	r1, r0
	lsw	r0, -32                         # 2-byte Folded Reload
	stw	r1, r0
	lsw	r0, -18                         # 2-byte Folded Reload
	stw	r1, r0
	lsw	r0, -14                         # 2-byte Folded Reload
	stw	r1, r0
	stw	r1, r4
	lsw	r0, -28                         # 2-byte Folded Reload
	stw	r1, r0
	lsw	r0, -30                         # 2-byte Folded Reload
	stw	r1, r0
	stw	r1, r5
	ldi	r0, 46
	stw	r1, r0
	ldi	r0, 10
	stw	r1, r0
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	60
	pop	fp
	rts
__LBB11_2:                              # %lor.lhs.false9
	ldw	r4, r6
	lsw	r1, -58                         # 2-byte Folded Reload
	ssw	r6, -56                         # 2-byte Folded Spill
	cmp	r6, r1
	ble	__LBB11_6
	br	__LBB11_3
__LBB11_3:                              # %lor.lhs.false9
	ldi	r1, 32
	lsw	r6, -56                         # 2-byte Folded Reload
	cmp	r6, r1
	bgt	__LBB11_6
	br	__LBB11_4
__LBB11_4:                              # %lor.lhs.false16
	ldi	r1, 2
	ldw	r4, r1, r6
	cmp	r6, r0
	ble	__LBB11_6
	br	__LBB11_5
__LBB11_5:                              # %lor.lhs.false16
	ldi	r0, 33
	cmp	r6, r0
	blt	__LBB11_7
	br	__LBB11_6
__LBB11_7:                              # %if.end
	ssw	r4, -8                          # 2-byte Folded Spill
	ssw	r3, -60                         # 2-byte Folded Spill
	ldi	r0, 49
	ssw	r0, -34                         # 2-byte Folded Spill
	ldi	r0, 48
	ssw	r0, -18                         # 2-byte Folded Spill
	ldi	r0, 98
	ssw	r0, -16                         # 2-byte Folded Spill
	ldi	r0, 116
	ssw	r0, -20                         # 2-byte Folded Spill
	ldi	r0, 115
	ssw	r0, -22                         # 2-byte Folded Spill
	ldi	r0, 109
	ssw	r0, -48                         # 2-byte Folded Spill
	ldi	r0, 117
	ldi	r1, 108
	ssw	r1, -52                         # 2-byte Folded Spill
	ldi	r1, 97
	ssw	r1, -46                         # 2-byte Folded Spill
	ldi	r1, 86
	ssw	r1, -42                         # 2-byte Folded Spill
	ldi	r1, 58
	ssw	r1, -44                         # 2-byte Folded Spill
	ldi	r3, 114
	ldi	r1, 69
	ssw	r1, -54                         # 2-byte Folded Spill
	ldi	r1, 1
	ssw	r2, -10                         # 2-byte Folded Spill
	cmp	r2, r1
	movens	r3, r1
	ssw	r1, -40                         # 2-byte Folded Spill
	ldi	r4, 32
	movens	r4, r2
	ssw	r0, -26                         # 2-byte Folded Spill
	ssw	r4, -12                         # 2-byte Folded Spill
	ldi	r3, 101
	ssw	r3, -36                         # 2-byte Folded Spill
	ssw	r3, -24                         # 2-byte Folded Spill
	ssw	r4, -32                         # 2-byte Folded Spill
	ldi	r4, 111
	ssw	r4, -50                         # 2-byte Folded Spill
	ldi	r3, 114
	ssw	r3, -38                         # 2-byte Folded Spill
	ssw	r3, -28                         # 2-byte Folded Spill
	ldi	r3, 32
	ssw	r3, -30                         # 2-byte Folded Spill
	bhi	__LBB11_14
	br	__LBB11_8
__LBB11_8:                              # %for.body.preheader
	ldi	r0, 116
	ssw	r0, -30                         # 2-byte Folded Spill
	ldi	r0, 101
	ssw	r0, -28                         # 2-byte Folded Spill
	ldi	r0, 112
	ssw	r0, -14                         # 2-byte Folded Spill
	ldi	r0, 109
	ssw	r0, -18                         # 2-byte Folded Spill
	ldi	r0, 111
	ssw	r0, -32                         # 2-byte Folded Spill
	ldi	r0, 99
	ssw	r0, -24                         # 2-byte Folded Spill
	ldi	r0, 32
	ssw	r0, -16                         # 2-byte Folded Spill
	ldi	r0, 108
	ssw	r0, -20                         # 2-byte Folded Spill
	ldi	r0, 105
	ssw	r0, -22                         # 2-byte Folded Spill
	ldi	r0, 70
	ssw	r0, -26                         # 2-byte Folded Spill
	lsw	r1, -58                         # 2-byte Folded Reload
	ldi	r2, 2
__LBB11_9:                              # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB11_13 Depth 2
	lsw	r0, -60                         # 2-byte Folded Reload
	ldw	r0, r2, r5
	cmp	r5, r6
	bgt	__LBB11_12
	br	__LBB11_10
__LBB11_10:                             # %for.body35.preheader
                                        #   in Loop: Header=BB11_9 Depth=1
	movens	r5, r4
	br	__LBB11_13
__LBB11_13:                             # %for.body35
                                        #   Parent Loop BB11_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movens	r1, r0
	movens	r1, r6
	movens	r5, r1
	lsw	r2, -10                         # 2-byte Folded Reload
	jsr	SetCommand
	ldi	r2, 2
	movens	r6, r1
	lsw	r0, -8                          # 2-byte Folded Reload
	ldw	r0, r2, r6
	add	r4, 1
	cmp	r5, r6
	movens	r4, r5
	blt	__LBB11_13
	br	__LBB11_11
__LBB11_11:                             # %for.cond.cleanup34.loopexit
                                        #   in Loop: Header=BB11_9 Depth=1
	lsw	r3, -8                          # 2-byte Folded Reload
	ldw	r3, r0
	ssw	r0, -56                         # 2-byte Folded Spill
__LBB11_12:                             # %for.cond.cleanup34
                                        #   in Loop: Header=BB11_9 Depth=1
	movens	r1, r0
	add	r0, 1
	lsw	r3, -56                         # 2-byte Folded Reload
	cmp	r1, r3
	movens	r0, r1
	ldi	r4, 108
	ssw	r4, -12                         # 2-byte Folded Spill
	ldi	r0, 101
	movens	r0, r5
	blt	__LBB11_9
	br	__LBB11_15
                                        # -- End function
CleanCmd>                               # -- Begin function CleanCmd
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-10
	ssw	r4, -2                          # 2-byte Folded Spill
	ldi	r0, -6
	add	r0, fp, r0
	ldi	r3, 2
	ldi	r2, 0
	stw	r0, r3, r2
	ssw	r2, -6
	ldi	r1, -10
	add	r1, fp, r1
	ldi	r4, 32
	stw	r1, r3, r4
	ssw	r4, -10
	jsr	FillCmd
	ldi	r0, CURR_CHAR
	ldi	r1, 70
	stw	r0, r1
	ldi	r1, 105
	stw	r0, r1
	ldi	r1, 101
	stw	r0, r1
	ldi	r2, 108
	stw	r0, r2
	ldi	r3, 100
	stw	r0, r3
	stw	r0, r4
	ldi	r4, 99
	stw	r0, r4
	stw	r0, r2
	stw	r0, r1
	ldi	r2, 97
	stw	r0, r2
	ldi	r2, 114
	stw	r0, r2
	stw	r0, r1
	stw	r0, r3
	ldi	r1, 46
	stw	r0, r1
	ldi	r1, 10
	stw	r0, r1
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	10
	pop	fp
	rts
                                        # -- End function
HelpCmd>                                # -- Begin function HelpCmd
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-104
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldb	r0, r4
	ldi	r2, 0
	cmp	r4, r2
	beq	__LBB13_2
	br	__LBB13_1
__LBB13_1:                              # %land.rhs.i110.preheader
	ldi	r3, __L.str.17
	ldi	r1, 255
	ssw	r4, -30                         # 2-byte Folded Spill
	movens	r2, r6
	br	__LBB13_5
__LBB13_5:                              # %land.rhs.i110
                                        # =>This Inner Loop Header: Depth=1
	ldb	r6, r3, r5
	and r4, r1, r4
	cmp	r4, r5
	bne	__LBB13_9
	br	__LBB13_6
__LBB13_6:                              # %if.end.i115
                                        #   in Loop: Header=BB13_5 Depth=1
	add r0, r6, r4
	ldi	r5, 1
	ldb	r4, r5, r4
	add	r6, 1
	cmp	r4, r2
	bne	__LBB13_5
	br	__LBB13_7
__LBB13_7:                              # %StringCmp.exit122
	ldb	r6, r3, r3
	ldi	r2, 0
	cmp	r3, r2
	bne	__LBB13_9
	br	__LBB13_8
__LBB13_9:                              # %land.rhs.i131.preheader
	ldi	r3, 0
	ldi	r2, __L.str.19
	lsw	r4, -30                         # 2-byte Folded Reload
	movens	r3, r6
	br	__LBB13_11
__LBB13_11:                             # %land.rhs.i131
                                        # =>This Inner Loop Header: Depth=1
	ldb	r6, r2, r5
	and r4, r1, r4
	cmp	r4, r5
	bne	__LBB13_15
	br	__LBB13_12
__LBB13_12:                             # %if.end.i136
                                        #   in Loop: Header=BB13_11 Depth=1
	add r0, r6, r4
	ldi	r5, 1
	ldb	r4, r5, r4
	add	r6, 1
	cmp	r4, r3
	bne	__LBB13_11
	br	__LBB13_13
__LBB13_13:                             # %StringCmp.exit144
	ldb	r6, r2, r3
	ldi	r2, 0
	cmp	r3, r2
	bne	__LBB13_15
	br	__LBB13_14
__LBB13_15:                             # %land.rhs.i153.preheader
	ldi	r3, 0
	ldi	r2, __L.str.21
	lsw	r4, -30                         # 2-byte Folded Reload
	movens	r3, r6
	br	__LBB13_17
__LBB13_17:                             # %land.rhs.i153
                                        # =>This Inner Loop Header: Depth=1
	ldb	r6, r2, r5
	and r4, r1, r4
	cmp	r4, r5
	bne	__LBB13_20
	br	__LBB13_18
__LBB13_18:                             # %if.end.i158
                                        #   in Loop: Header=BB13_17 Depth=1
	add r0, r6, r4
	ldi	r5, 1
	ldb	r4, r5, r4
	add	r6, 1
	cmp	r4, r3
	bne	__LBB13_17
	br	__LBB13_19
__LBB13_19:                             # %StringCmp.exit166
	ldb	r6, r2, r2
	ldi	r3, 46
	ssw	r3, -48                         # 2-byte Folded Spill
	ldi	r3, 110
	ssw	r3, -44                         # 2-byte Folded Spill
	ldi	r3, 108
	ssw	r3, -38                         # 2-byte Folded Spill
	ldi	r3, 117
	ssw	r3, -46                         # 2-byte Folded Spill
	ldi	r3, 104
	ssw	r3, -18                         # 2-byte Folded Spill
	ldi	r3, 83
	ssw	r3, -76                         # 2-byte Folded Spill
	ldi	r3, 10
	ssw	r3, -56                         # 2-byte Folded Spill
	ldi	r5, 116
	ldi	r6, 32
	ldi	r3, 58
	ssw	r3, -32                         # 2-byte Folded Spill
	ldi	r4, 115
	ldi	r3, 85
	ssw	r3, -84                         # 2-byte Folded Spill
	ldi	r3, 0
	cmp	r2, r3
	ssw	r4, -80                         # 2-byte Folded Spill
	ssw	r6, -68                         # 2-byte Folded Spill
	movens	r5, r2
	ssw	r2, -66                         # 2-byte Folded Spill
	ldi	r5, 111
	ssw	r5, -28                         # 2-byte Folded Spill
	ldi	r3, 112
	ssw	r3, -82                         # 2-byte Folded Spill
	ssw	r3, -22                         # 2-byte Folded Spill
	ldi	r5, 103
	ssw	r4, -62                         # 2-byte Folded Spill
	ssw	r6, -26                         # 2-byte Folded Spill
	ssw	r2, -34                         # 2-byte Folded Spill
	ldi	r2, 101
	ssw	r2, -24                         # 2-byte Folded Spill
	ssw	r6, -10                         # 2-byte Folded Spill
	ssw	r5, -70                         # 2-byte Folded Spill
	ssw	r5, -14                         # 2-byte Folded Spill
	ldi	r3, 97
	ssw	r3, -40                         # 2-byte Folded Spill
	ssw	r2, -58                         # 2-byte Folded Spill
	ssw	r2, -20                         # 2-byte Folded Spill
	ssw	r6, -50                         # 2-byte Folded Spill
	ssw	r6, -12                         # 2-byte Folded Spill
	ssw	r4, -64                         # 2-byte Folded Spill
	movens	r4, r2
	ldi	r4, 111
	ldi	r5, 109
	ssw	r5, -8                          # 2-byte Folded Spill
	ssw	r5, -42                         # 2-byte Folded Spill
	ssw	r3, -52                         # 2-byte Folded Spill
	ssw	r3, -78                         # 2-byte Folded Spill
	lsw	r3, -80                         # 2-byte Folded Reload
	ldi	r5, 116
	ssw	r5, -54                         # 2-byte Folded Spill
	ssw	r5, -60                         # 2-byte Folded Spill
	ldi	r5, 105
	ssw	r5, -74                         # 2-byte Folded Spill
	ssw	r4, -36                         # 2-byte Folded Spill
	beq	__LBB13_49
	br	__LBB13_20
__LBB13_20:                             # %land.rhs.i175.preheader
	ldi	r3, 0
	ldi	r2, __L.str.23
	lsw	r4, -30                         # 2-byte Folded Reload
	movens	r3, r6
__LBB13_21:                             # %land.rhs.i175
                                        # =>This Inner Loop Header: Depth=1
	ldb	r6, r2, r5
	and r4, r1, r4
	cmp	r4, r5
	bne	__LBB13_24
	br	__LBB13_22
__LBB13_22:                             # %if.end.i180
                                        #   in Loop: Header=BB13_21 Depth=1
	add r0, r6, r4
	ldi	r5, 1
	ldb	r4, r5, r4
	add	r6, 1
	cmp	r4, r3
	bne	__LBB13_21
	br	__LBB13_23
__LBB13_23:                             # %StringCmp.exit188
	ldb	r6, r2, r4
	ldi	r3, 46
	ssw	r3, -48                         # 2-byte Folded Spill
	ldi	r3, 110
	ssw	r3, -44                         # 2-byte Folded Spill
	ldi	r3, 111
	ssw	r3, -36                         # 2-byte Folded Spill
	ldi	r3, 108
	ssw	r3, -38                         # 2-byte Folded Spill
	ldi	r2, 104
	ssw	r2, -18                         # 2-byte Folded Spill
	ldi	r3, 47
	ssw	r3, -82                         # 2-byte Folded Spill
	ldi	r3, 83
	ssw	r3, -58                         # 2-byte Folded Spill
	ldi	r3, 10
	ssw	r3, -52                         # 2-byte Folded Spill
	ldi	r2, 116
	ldi	r5, 32
	ldi	r3, 58
	ssw	r3, -92                         # 2-byte Folded Spill
	ldi	r6, 115
	ldi	r3, 85
	ssw	r3, -88                         # 2-byte Folded Spill
	ldi	r3, 0
	cmp	r4, r3
	ssw	r6, -94                         # 2-byte Folded Spill
	ldi	r3, 97
	ssw	r3, -100                        # 2-byte Folded Spill
	movens	r2, r4
	ssw	r4, -64                         # 2-byte Folded Spill
	movens	r5, r2
	ssw	r2, -70                         # 2-byte Folded Spill
	ssw	r4, -32                         # 2-byte Folded Spill
	ssw	r3, -50                         # 2-byte Folded Spill
	movens	r3, r5
	ldi	r3, 114
	ssw	r3, -80                         # 2-byte Folded Spill
	ssw	r4, -54                         # 2-byte Folded Spill
	ssw	r6, -104                        # 2-byte Folded Spill
	ssw	r3, -84                         # 2-byte Folded Spill
	ssw	r3, -56                         # 2-byte Folded Spill
	ldi	r3, 101
	ssw	r3, -68                         # 2-byte Folded Spill
	ssw	r6, -76                         # 2-byte Folded Spill
	ssw	r3, -22                         # 2-byte Folded Spill
	ssw	r6, -62                         # 2-byte Folded Spill
	ssw	r2, -26                         # 2-byte Folded Spill
	ssw	r4, -34                         # 2-byte Folded Spill
	ssw	r3, -24                         # 2-byte Folded Spill
	ssw	r2, -10                         # 2-byte Folded Spill
	ldi	r4, 103
	ssw	r4, -90                         # 2-byte Folded Spill
	ssw	r5, -40                         # 2-byte Folded Spill
	ldi	r5, 109
	ssw	r5, -8                          # 2-byte Folded Spill
	ssw	r3, -72                         # 2-byte Folded Spill
	ssw	r3, -20                         # 2-byte Folded Spill
	ssw	r2, -102                        # 2-byte Folded Spill
	ssw	r2, -12                         # 2-byte Folded Spill
	ssw	r6, -86                         # 2-byte Folded Spill
	ssw	r6, -16                         # 2-byte Folded Spill
	movens	r5, r2
	ssw	r2, -42                         # 2-byte Folded Spill
	ldi	r6, 117
	ssw	r6, -66                         # 2-byte Folded Spill
	ldi	r3, 97
	ssw	r3, -98                         # 2-byte Folded Spill
	ssw	r3, -78                         # 2-byte Folded Spill
	ldi	r3, 116
	ssw	r3, -96                         # 2-byte Folded Spill
	ssw	r3, -60                         # 2-byte Folded Spill
	ldi	r5, 105
	ssw	r5, -74                         # 2-byte Folded Spill
	beq	__LBB13_48
	br	__LBB13_24
__LBB13_24:                             # %land.rhs.i197.preheader
	ldi	r3, 0
	ldi	r2, __L.str.25
	lsw	r4, -30                         # 2-byte Folded Reload
	movens	r3, r6
__LBB13_25:                             # %land.rhs.i197
                                        # =>This Inner Loop Header: Depth=1
	ldb	r6, r2, r5
	and r4, r1, r4
	cmp	r4, r5
	bne	__LBB13_29
	br	__LBB13_26
__LBB13_26:                             # %if.end.i202
                                        #   in Loop: Header=BB13_25 Depth=1
	add r0, r6, r4
	ldi	r5, 1
	ldb	r4, r5, r4
	add	r6, 1
	cmp	r4, r3
	bne	__LBB13_25
	br	__LBB13_27
__LBB13_27:                             # %StringCmp.exit210
	ldb	r6, r2, r3
	ldi	r2, 0
	cmp	r3, r2
	bne	__LBB13_29
	br	__LBB13_28
__LBB13_29:                             # %land.rhs.i219.preheader
	ldi	r3, 0
	ldi	r2, __L.str.27
	lsw	r4, -30                         # 2-byte Folded Reload
	movens	r3, r6
	br	__LBB13_31
__LBB13_31:                             # %land.rhs.i219
                                        # =>This Inner Loop Header: Depth=1
	ldb	r6, r2, r5
	and r4, r1, r4
	cmp	r4, r5
	bne	__LBB13_34
	br	__LBB13_32
__LBB13_32:                             # %if.end.i224
                                        #   in Loop: Header=BB13_31 Depth=1
	add r0, r6, r4
	ldi	r5, 1
	ldb	r4, r5, r4
	add	r6, 1
	cmp	r4, r3
	bne	__LBB13_31
	br	__LBB13_33
__LBB13_33:                             # %StringCmp.exit232
	ldb	r6, r2, r6
	ldi	r3, 46
	ssw	r3, -48                         # 2-byte Folded Spill
	ldi	r3, 100
	ssw	r3, -44                         # 2-byte Folded Spill
	ldi	r2, 102
	ssw	r2, -78                         # 2-byte Folded Spill
	ldi	r2, 104
	ssw	r2, -14                         # 2-byte Folded Spill
	ldi	r2, 67
	ssw	r2, -28                         # 2-byte Folded Spill
	ldi	r2, 10
	ssw	r2, -76                         # 2-byte Folded Spill
	ldi	r3, 108
	ldi	r4, 99
	ssw	r4, -54                         # 2-byte Folded Spill
	ldi	r4, 58
	ssw	r4, -50                         # 2-byte Folded Spill
	ldi	r4, 103
	ssw	r4, -58                         # 2-byte Folded Spill
	ldi	r5, 97
	ssw	r5, -70                         # 2-byte Folded Spill
	ldi	r2, 85
	ssw	r2, -64                         # 2-byte Folded Spill
	ldi	r4, 0
	cmp	r6, r4
	movens	r3, r4
	ldi	r3, 32
	ldi	r2, 101
	movens	r2, r6
	ssw	r5, -56                         # 2-byte Folded Spill
	ssw	r3, -66                         # 2-byte Folded Spill
	ssw	r4, -22                         # 2-byte Folded Spill
	ssw	r2, -62                         # 2-byte Folded Spill
	ssw	r5, -26                         # 2-byte Folded Spill
	ldi	r5, 115
	ssw	r5, -52                         # 2-byte Folded Spill
	ssw	r5, -18                         # 2-byte Folded Spill
	ssw	r3, -24                         # 2-byte Folded Spill
	ssw	r2, -40                         # 2-byte Folded Spill
	ssw	r3, -8                          # 2-byte Folded Spill
	ssw	r2, -20                         # 2-byte Folded Spill
	ldi	r2, 110
	ssw	r2, -68                         # 2-byte Folded Spill
	ssw	r2, -12                         # 2-byte Folded Spill
	ldi	r5, 116
	ssw	r5, -10                         # 2-byte Folded Spill
	ssw	r5, -16                         # 2-byte Folded Spill
	ldi	r2, 114
	ssw	r2, -34                         # 2-byte Folded Spill
	ssw	r2, -42                         # 2-byte Folded Spill
	ldi	r5, 101
	ssw	r5, -46                         # 2-byte Folded Spill
	ssw	r3, -38                         # 2-byte Folded Spill
	ldi	r2, 105
	ssw	r2, -74                         # 2-byte Folded Spill
	ssw	r2, -60                         # 2-byte Folded Spill
	lsw	r2, -16                         # 2-byte Folded Reload
	ssw	r5, -32                         # 2-byte Folded Spill
	ssw	r4, -36                         # 2-byte Folded Spill
	beq	__LBB13_50
	br	__LBB13_34
__LBB13_34:                             # %land.rhs.i241.preheader
	ldi	r3, 0
	ldi	r2, __L.str.29
	lsw	r4, -30                         # 2-byte Folded Reload
	movens	r3, r6
__LBB13_35:                             # %land.rhs.i241
                                        # =>This Inner Loop Header: Depth=1
	ldb	r6, r2, r5
	and r4, r1, r4
	cmp	r4, r5
	bne	__LBB13_39
	br	__LBB13_36
__LBB13_36:                             # %if.end.i246
                                        #   in Loop: Header=BB13_35 Depth=1
	add r0, r6, r4
	ldi	r5, 1
	ldb	r4, r5, r4
	add	r6, 1
	cmp	r4, r3
	bne	__LBB13_35
	br	__LBB13_37
__LBB13_37:                             # %StringCmp.exit254
	ldb	r6, r2, r3
	ldi	r2, 0
	cmp	r3, r2
	bne	__LBB13_39
	br	__LBB13_38
__LBB13_39:                             # %land.rhs.i263.preheader
	ldi	r3, 0
	ldi	r2, __L.str.31
	movens	r3, r6
	lsw	r5, -30                         # 2-byte Folded Reload
	br	__LBB13_41
__LBB13_41:                             # %land.rhs.i263
                                        # =>This Inner Loop Header: Depth=1
	ldb	r6, r2, r4
	and r5, r1, r5
	cmp	r5, r4
	bne	__LBB13_44
	br	__LBB13_42
__LBB13_42:                             # %if.end.i268
                                        #   in Loop: Header=BB13_41 Depth=1
	add r0, r6, r4
	ldi	r5, 1
	ldb	r4, r5, r5
	add	r6, 1
	cmp	r5, r3
	bne	__LBB13_41
	br	__LBB13_43
__LBB13_43:                             # %StringCmp.exit276
	ldb	r6, r2, r3
	ldi	r1, 46
	ssw	r1, -48                         # 2-byte Folded Spill
	ldi	r1, 110
	ssw	r1, -20                         # 2-byte Folded Spill
	ldi	r1, 99
	ssw	r1, -62                         # 2-byte Folded Spill
	ldi	r1, 80
	ssw	r1, -66                         # 2-byte Folded Spill
	ldi	r1, 10
	ssw	r1, -68                         # 2-byte Folded Spill
	ldi	r1, 121
	ssw	r1, -82                         # 2-byte Folded Spill
	ldi	r1, 120
	ssw	r1, -50                         # 2-byte Folded Spill
	ldi	r1, 60
	ssw	r1, -32                         # 2-byte Folded Spill
	ldi	r1, 45
	ssw	r1, -94                         # 2-byte Folded Spill
	ldi	r6, 32
	ldi	r1, 58
	ssw	r1, -98                         # 2-byte Folded Spill
	ldi	r2, 101
	ldi	r5, 103
	ldi	r1, 97
	ldi	r4, 85
	ssw	r4, -12                         # 2-byte Folded Spill
	ldi	r4, 0
	cmp	r3, r4
	ldi	r4, 62
	ssw	r2, -92                         # 2-byte Folded Spill
	ssw	r5, -96                         # 2-byte Folded Spill
	ssw	r2, -52                         # 2-byte Folded Spill
	movens	r2, r3
	ssw	r6, -58                         # 2-byte Folded Spill
	ssw	r6, -54                         # 2-byte Folded Spill
	ssw	r4, -56                         # 2-byte Folded Spill
	ldi	r2, 108
	ssw	r2, -100                        # 2-byte Folded Spill
	ssw	r1, -22                         # 2-byte Folded Spill
	ssw	r3, -26                         # 2-byte Folded Spill
	ldi	r3, 115
	ssw	r3, -72                         # 2-byte Folded Spill
	ssw	r3, -34                         # 2-byte Folded Spill
	ssw	r6, -18                         # 2-byte Folded Spill
	ssw	r1, -24                         # 2-byte Folded Spill
	ssw	r6, -90                         # 2-byte Folded Spill
	ldi	r3, 116
	ssw	r3, -102                        # 2-byte Folded Spill
	ssw	r3, -40                         # 2-byte Folded Spill
	ssw	r1, -8                          # 2-byte Folded Spill
	ssw	r1, -10                         # 2-byte Folded Spill
	ssw	r1, -16                         # 2-byte Folded Spill
	ldi	r3, 100
	ssw	r3, -42                         # 2-byte Folded Spill
	ssw	r5, -88                         # 2-byte Folded Spill
	ssw	r5, -38                         # 2-byte Folded Spill
	ldi	r1, 114
	ldi	r5, 105
	ssw	r5, -84                         # 2-byte Folded Spill
	ssw	r5, -60                         # 2-byte Folded Spill
	ssw	r3, -64                         # 2-byte Folded Spill
	movens	r3, r5
	ldi	r3, 101
	ssw	r3, -86                         # 2-byte Folded Spill
	ssw	r3, -36                         # 2-byte Folded Spill
	ssw	r1, -70                         # 2-byte Folded Spill
	beq	__LBB13_47
	br	__LBB13_44
__LBB13_44:                             # %if.else32
	ldi	r5, CURR_CHAR
	ldi	r2, 85
	stw	r5, r2
	ldi	r2, 110
	stw	r5, r2
	ldi	r3, 107
	stw	r5, r3
	stw	r5, r2
	ldi	r4, 111
	stw	r5, r4
	ldi	r3, 119
	stw	r5, r3
	stw	r5, r2
	ldi	r1, 32
	stw	r5, r1
	ldi	r3, 99
	stw	r5, r3
	ssw	r4, -46                         # 2-byte Folded Spill
	stw	r5, r4
	ldi	r3, 109
	stw	r5, r3
	stw	r5, r3
	ldi	r3, 97
	stw	r5, r3
	stw	r5, r2
	ldi	r2, 100
	stw	r5, r2
	ldi	r2, 58
	stw	r5, r2
	stw	r5, r1
	ldi	r4, 39
	stw	r5, r4
	ldi	r2, 116
	ssw	r2, -44                         # 2-byte Folded Spill
	ldi	r2, 115
	ssw	r2, -36                         # 2-byte Folded Spill
	ldi	r2, 105
	ssw	r2, -30                         # 2-byte Folded Spill
	ldi	r2, 114
	ssw	r2, -38                         # 2-byte Folded Spill
	ldi	r2, 102
	ssw	r2, -42                         # 2-byte Folded Spill
	ldi	r2, 104
	ssw	r2, -40                         # 2-byte Folded Spill
	ldi	r6, 101
	ldi	r3, 112
	ldi	r2, 121
	ssw	r2, -34                         # 2-byte Folded Spill
	ldi	r2, 84
	ssw	r2, -26                         # 2-byte Folded Spill
	ldb	r0, r5
	ldi	r2, 0
	cmp	r5, r2
	ssw	r1, -10                         # 2-byte Folded Spill
	ssw	r4, -14                         # 2-byte Folded Spill
	ssw	r6, -24                         # 2-byte Folded Spill
	ssw	r6, -8                          # 2-byte Folded Spill
	ssw	r3, -18                         # 2-byte Folded Spill
	ssw	r3, -12                         # 2-byte Folded Spill
	ssw	r4, -28                         # 2-byte Folded Spill
	ssw	r4, -16                         # 2-byte Folded Spill
	movens	r1, r6
	movens	r1, r2
	ldi	r3, 108
	ssw	r3, -20                         # 2-byte Folded Spill
	ldi	r4, 46
	ssw	r4, -22                         # 2-byte Folded Spill
	beq	__LBB13_51
	br	__LBB13_45
__LBB13_45:                             # %while.body.i291.preheader
	add	r0, 1
__LBB13_46:                             # %while.body.i291
                                        # =>This Inner Loop Header: Depth=1
	sxt	r5, r2
	ldi	r3, CURR_CHAR
	stw	r3, r2
	ldb	r0, r5
	add	r0, 1
	ldi	r2, 0
	cmp	r5, r2
	ssw	r1, -10                         # 2-byte Folded Spill
	ldi	r2, 39
	ssw	r2, -14                         # 2-byte Folded Spill
	ldi	r3, 101
	ssw	r3, -8                          # 2-byte Folded Spill
	ldi	r3, 112
	ssw	r3, -12                         # 2-byte Folded Spill
	ssw	r2, -16                         # 2-byte Folded Spill
	movens	r1, r6
	movens	r1, r2
	ldi	r3, 108
	beq	__LBB13_51
	br	__LBB13_46
__LBB13_2:                              # %while.body.i.preheader
	ldi	r0, CURR_CHAR
	ldi	r1, 65
	stw	r0, r1
	ldi	r1, 118
	stw	r0, r1
	ldi	r3, 97
	stw	r0, r3
	ldi	r1, 105
	stw	r0, r1
	ldi	r2, 108
	stw	r0, r2
	stw	r0, r3
	ldi	r1, 98
	stw	r0, r1
	stw	r0, r2
	ldi	r6, 101
	stw	r0, r6
	ldi	r4, 32
	stw	r0, r4
	ldi	r1, 99
	stw	r0, r1
	ldi	r1, 111
	stw	r0, r1
	ldi	r1, 109
	stw	r0, r1
	stw	r0, r1
	stw	r0, r3
	movens	r3, r2
	ldi	r1, 110
	stw	r0, r1
	ldi	r1, 100
	ssw	r1, -52                         # 2-byte Folded Spill
	stw	r0, r1
	ldi	r3, 115
	stw	r0, r3
	ldi	r1, 58
	stw	r0, r1
	ldi	r1, 10
	stw	r0, r1
	stw	r0, r4
	stw	r0, r3
	stw	r0, r6
	ldi	r1, 116
	stw	r0, r1
	stw	r0, r4
	ldi	r1, 60
	stw	r0, r1
	ldi	r3, 120
	stw	r0, r3
	ldi	r5, 62
	stw	r0, r5
	stw	r0, r4
	stw	r0, r1
	ldi	r3, 121
	stw	r0, r3
	stw	r0, r5
	stw	r0, r4
	stw	r0, r1
	ldi	r1, 118
	stw	r0, r1
	stw	r0, r2
	ldi	r1, 108
	stw	r0, r1
	stw	r0, r5
	stw	r0, r4
	ldi	r2, 45
	stw	r0, r2
	stw	r0, r4
	ldi	r2, 115
	stw	r0, r2
	stw	r0, r6
	ldi	r2, 116
	stw	r0, r2
	stw	r0, r4
	ldi	r5, 99
	ssw	r5, -34                         # 2-byte Folded Spill
	stw	r0, r5
	stw	r0, r6
	stw	r0, r1
	stw	r0, r1
	movens	r1, r6
	stw	r0, r4
	ldi	r5, 40
	stw	r0, r5
	ldi	r1, 120
	stw	r0, r1
	ldi	r1, 44
	ssw	r1, -36                         # 2-byte Folded Spill
	stw	r0, r1
	ssw	r3, -56                         # 2-byte Folded Spill
	stw	r0, r3
	ldi	r1, 41
	stw	r0, r1
	stw	r0, r4
	stw	r0, r2
	ldi	r3, 111
	stw	r0, r3
	stw	r0, r4
	ldi	r1, 118
	stw	r0, r1
	ldi	r1, 97
	stw	r0, r1
	stw	r0, r6
	stw	r0, r4
	stw	r0, r5
	ldi	r1, 48
	stw	r0, r1
	ldi	r1, 47
	stw	r0, r1
	ldi	r1, 49
	stw	r0, r1
	ldi	r1, 41
	stw	r0, r1
	ldi	r1, 10
	stw	r0, r1
	stw	r0, r4
	ldi	r5, 114
	stw	r0, r5
	ldi	r1, 117
	stw	r0, r1
	stw	r0, r6
	ldi	r1, 101
	stw	r0, r1
	stw	r0, r4
	ldi	r6, 60
	stw	r0, r6
	ldi	r2, 98
	stw	r0, r2
	stw	r0, r3
	stw	r0, r5
	ldi	r3, 110
	stw	r0, r3
	ldi	r1, 62
	stw	r0, r1
	stw	r0, r4
	ssw	r6, -50                         # 2-byte Folded Spill
	stw	r0, r6
	ldi	r3, 115
	stw	r0, r3
	ldi	r6, 117
	stw	r0, r6
	stw	r0, r5
	ssw	r1, -54                         # 2-byte Folded Spill
	stw	r0, r1
	stw	r0, r4
	ldi	r6, 45
	stw	r0, r6
	stw	r0, r4
	stw	r0, r3
	ldi	r1, 101
	stw	r0, r1
	ldi	r6, 116
	stw	r0, r6
	stw	r0, r4
	stw	r0, r2
	ldi	r2, 105
	stw	r0, r2
	stw	r0, r5
	stw	r0, r6
	ldi	r1, 104
	stw	r0, r1
	ldi	r1, 47
	stw	r0, r1
	stw	r0, r3
	ldi	r1, 117
	stw	r0, r1
	stw	r0, r5
	ldi	r1, 118
	stw	r0, r1
	stw	r0, r2
	stw	r0, r1
	ldi	r1, 97
	stw	r0, r1
	ldi	r1, 108
	stw	r0, r1
	stw	r0, r4
	stw	r0, r5
	ldi	r5, 117
	stw	r0, r5
	ssw	r1, -86                         # 2-byte Folded Spill
	stw	r0, r1
	ldi	r1, 101
	stw	r0, r1
	stw	r0, r3
	stw	r0, r4
	ldi	r5, 40
	ssw	r5, -60                         # 2-byte Folded Spill
	stw	r0, r5
	ldi	r1, 98
	stw	r0, r1
	stw	r0, r2
	stw	r0, r6
	ldi	r2, 109
	movens	r2, r1
	stw	r0, r1
	ldi	r1, 97
	stw	r0, r1
	stw	r0, r3
	ldi	r2, 107
	stw	r0, r2
	ldi	r1, 41
	ssw	r1, -48                         # 2-byte Folded Spill
	stw	r0, r1
	ldi	r1, 10
	stw	r0, r1
	stw	r0, r4
	stw	r0, r3
	stw	r0, r6
	ldi	r1, 111
	stw	r0, r1
	ldi	r2, 112
	stw	r0, r2
	stw	r0, r4
	ldi	r5, 45
	stw	r0, r5
	stw	r0, r4
	stw	r0, r3
	movens	r3, r5
	stw	r0, r6
	stw	r0, r1
	ssw	r2, -98                         # 2-byte Folded Spill
	stw	r0, r2
	stw	r0, r4
	ldi	r1, 103
	stw	r0, r1
	ldi	r1, 97
	stw	r0, r1
	ldi	r2, 109
	stw	r0, r2
	ldi	r2, 101
	stw	r0, r2
	ldi	r2, 10
	stw	r0, r2
	stw	r0, r4
	stw	r0, r5
	stw	r0, r6
	stw	r0, r1
	ldi	r2, 114
	stw	r0, r2
	stw	r0, r6
	stw	r0, r4
	ldi	r3, 45
	ssw	r3, -96                         # 2-byte Folded Spill
	stw	r0, r3
	stw	r0, r4
	ssw	r5, -92                         # 2-byte Folded Spill
	stw	r0, r5
	stw	r0, r6
	stw	r0, r1
	ssw	r2, -58                         # 2-byte Folded Spill
	stw	r0, r2
	ssw	r6, -94                         # 2-byte Folded Spill
	stw	r0, r6
	stw	r0, r4
	ldi	r2, 103
	ssw	r2, -100                        # 2-byte Folded Spill
	stw	r0, r2
	ssw	r1, -26                         # 2-byte Folded Spill
	stw	r0, r1
	ldi	r1, 109
	stw	r0, r1
	ldi	r1, 101
	ssw	r1, -88                         # 2-byte Folded Spill
	stw	r0, r1
	ldi	r1, 10
	ssw	r1, -90                         # 2-byte Folded Spill
	stw	r0, r1
	ldi	r2, __L.str.13+1
	ldi	r3, 0
__LBB13_3:                              # %while.body.i81
                                        # =>This Inner Loop Header: Depth=1
	sxt	r4, r4
	stw	r0, r4
	ldb	r2, r4
	add	r2, 1
	cmp	r4, r3
	bne	__LBB13_3
	br	__LBB13_4
__LBB13_4:                              # %while.body.i88.preheader
	ldi	r4, 32
	stw	r0, r4
	ldi	r3, 99
	stw	r0, r3
	ldi	r6, 108
	stw	r0, r6
	ldi	r5, 101
	stw	r0, r5
	ldi	r1, 97
	movens	r1, r2
	stw	r0, r2
	ldi	r1, 110
	stw	r0, r1
	stw	r0, r4
	ldi	r1, 45
	stw	r0, r1
	stw	r0, r4
	stw	r0, r3
	stw	r0, r6
	stw	r0, r5
	stw	r0, r2
	ldi	r1, 114
	stw	r0, r1
	stw	r0, r4
	ldi	r2, 102
	stw	r0, r2
	ldi	r1, 105
	stw	r0, r1
	stw	r0, r5
	stw	r0, r6
	ldi	r3, 100
	stw	r0, r3
	ldi	r2, 10
	stw	r0, r2
	stw	r0, r4
	ldi	r1, 104
	stw	r0, r1
	stw	r0, r5
	stw	r0, r6
	ldi	r2, 112
	stw	r0, r2
	stw	r0, r4
	ldi	r2, 91
	stw	r0, r2
	ldi	r2, 99
	stw	r0, r2
	ldi	r2, 109
	stw	r0, r2
	stw	r0, r3
	ldi	r2, 93
	stw	r0, r2
	stw	r0, r4
	ldi	r2, 45
	stw	r0, r2
	stw	r0, r4
	ldi	r2, 115
	stw	r0, r2
	ssw	r1, -10                         # 2-byte Folded Spill
	stw	r0, r1
	ldi	r1, 111
	stw	r0, r1
	ldi	r0, 119
	ssw	r0, -12                         # 2-byte Folded Spill
	ssw	r5, -102                        # 2-byte Folded Spill
	ssw	r6, -84                         # 2-byte Folded Spill
	ssw	r5, -70                         # 2-byte Folded Spill
	ssw	r4, -32                         # 2-byte Folded Spill
	ldi	r0, 60
	ssw	r0, -82                         # 2-byte Folded Spill
	ldi	r0, 62
	ssw	r0, -68                         # 2-byte Folded Spill
	ldi	r0, 45
	ssw	r0, -66                         # 2-byte Folded Spill
	movens	r4, r2
	ldi	r0, 112
	ssw	r0, -22                         # 2-byte Folded Spill
	ssw	r6, -62                         # 2-byte Folded Spill
	ssw	r5, -18                         # 2-byte Folded Spill
	ssw	r4, -24                         # 2-byte Folded Spill
	ldi	r0, 97
	ldi	r3, 103
	ssw	r3, -40                         # 2-byte Folded Spill
	ssw	r6, -8                          # 2-byte Folded Spill
	movens	r0, r6
	ldi	r0, 105
	ssw	r0, -64                         # 2-byte Folded Spill
	ssw	r0, -20                         # 2-byte Folded Spill
	ssw	r5, -16                         # 2-byte Folded Spill
	ssw	r4, -72                         # 2-byte Folded Spill
	ssw	r4, -42                         # 2-byte Folded Spill
	ldi	r0, 116
	ssw	r0, -38                         # 2-byte Folded Spill
	ldi	r4, 120
	movens	r4, r5
	ldi	r1, 121
	br	__LBB13_47
__LBB13_47:                             # %if.end40.sink.split.sink.split.sink.split.sink.split.sink.split
	ssw	r4, -80                         # 2-byte Folded Spill
	ssw	r1, -44                         # 2-byte Folded Spill
	ldi	r0, CURR_CHAR
	lsw	r1, -12                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r4, -72                         # 2-byte Folded Reload
	stw	r0, r4
	lsw	r1, -10                         # 2-byte Folded Reload
	stw	r0, r1
	ldi	r0, 114
	ssw	r0, -74                         # 2-byte Folded Spill
	ldi	r0, 100
	ssw	r0, -12                         # 2-byte Folded Spill
	ldi	r0, 32
	ssw	r0, -76                         # 2-byte Folded Spill
	lsw	r0, -32                         # 2-byte Folded Reload
	ssw	r0, -104                        # 2-byte Folded Spill
	ssw	r6, -10                         # 2-byte Folded Spill
	ssw	r2, -78                         # 2-byte Folded Spill
__LBB13_48:                             # %if.end40.sink.split.sink.split.sink.split.sink.split
	ssw	r4, -14                         # 2-byte Folded Spill
	ssw	r6, -46                         # 2-byte Folded Spill
	ssw	r2, -28                         # 2-byte Folded Spill
	lsw	r0, -18                         # 2-byte Folded Reload
	ssw	r0, -18                         # 2-byte Folded Spill
	ldi	r0, CURR_CHAR
	lsw	r1, -88                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -86                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -98                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -90                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -72                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -92                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -102                        # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -94                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -96                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -100                        # 2-byte Folded Reload
	stw	r0, r1
	lsw	r2, -16                         # 2-byte Folded Reload
	lsw	r4, -104                        # 2-byte Folded Reload
	lsw	r3, -80                         # 2-byte Folded Reload
__LBB13_49:                             # %if.end40.sink.split.sink.split.sink.split
	lsw	r0, -26                         # 2-byte Folded Reload
	ssw	r0, -26                         # 2-byte Folded Spill
	ldi	r0, CURR_CHAR
	lsw	r1, -84                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r6, -82                         # 2-byte Folded Reload
__LBB13_50:                             # %if.end40.sink.split.sink.split
	ssw	r2, -16                         # 2-byte Folded Spill
	ssw	r5, -30                         # 2-byte Folded Spill
	ldi	r0, CURR_CHAR
	lsw	r1, -64                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -52                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -70                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -58                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -32                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -50                         # 2-byte Folded Reload
	stw	r0, r1
	stw	r0, r3
	lsw	r1, -54                         # 2-byte Folded Reload
	stw	r0, r1
	stw	r0, r4
	stw	r0, r6
	lsw	r1, -56                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -68                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -76                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -66                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r4, -48                         # 2-byte Folded Reload
	lsw	r0, -28                         # 2-byte Folded Reload
	ssw	r0, -28                         # 2-byte Folded Spill
	lsw	r3, -60                         # 2-byte Folded Reload
	lsw	r1, -62                         # 2-byte Folded Reload
	lsw	r0, -18                         # 2-byte Folded Reload
	ssw	r0, -18                         # 2-byte Folded Spill
	lsw	r0, -20                         # 2-byte Folded Reload
	ssw	r0, -20                         # 2-byte Folded Spill
	lsw	r0, -22                         # 2-byte Folded Reload
	ssw	r0, -22                         # 2-byte Folded Spill
	lsw	r6, -74                         # 2-byte Folded Reload
	lsw	r0, -24                         # 2-byte Folded Reload
	ssw	r0, -24                         # 2-byte Folded Spill
	lsw	r0, -10                         # 2-byte Folded Reload
	ssw	r0, -10                         # 2-byte Folded Spill
	lsw	r0, -8                          # 2-byte Folded Reload
	ssw	r0, -8                          # 2-byte Folded Spill
	lsw	r0, -14                         # 2-byte Folded Reload
	ssw	r0, -14                         # 2-byte Folded Spill
	lsw	r0, -12                         # 2-byte Folded Reload
	ssw	r0, -12                         # 2-byte Folded Spill
	lsw	r2, -78                         # 2-byte Folded Reload
__LBB13_51:                             # %if.end40.sink.split
	ldi	r0, CURR_CHAR
	lsw	r5, -28                         # 2-byte Folded Reload
	stw	r0, r5
	lsw	r5, -22                         # 2-byte Folded Reload
	stw	r0, r5
	stw	r0, r1
	lsw	r1, -26                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -34                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -18                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -24                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -10                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -14                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -40                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -8                          # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -20                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -12                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -16                         # 2-byte Folded Reload
	stw	r0, r1
	stw	r0, r6
	lsw	r1, -42                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -46                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -38                         # 2-byte Folded Reload
	stw	r0, r1
	stw	r0, r2
	stw	r0, r3
	lsw	r1, -30                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -36                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -44                         # 2-byte Folded Reload
	stw	r0, r1
	stw	r0, r4
	ldi	r1, 10
	stw	r0, r1
__LBB13_52:                             # %if.end40
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	104
	pop	fp
	rts
__LBB13_8:                              # %while.body.i123.preheader
	ldi	r3, 85
	ldi	r0, __L.str.18+1
	ldi	r1, CURR_CHAR
	br	__LBB13_10
__LBB13_10:                             # %while.body.i123
                                        # =>This Inner Loop Header: Depth=1
	sxt	r3, r3
	stw	r1, r3
	ldb	r0, r3
	add	r0, 1
	cmp	r3, r2
	beq	__LBB13_52
	br	__LBB13_10
__LBB13_14:                             # %while.body.i145.preheader
	ldi	r3, 85
	ldi	r0, __L.str.20+1
	ldi	r1, CURR_CHAR
	br	__LBB13_16
__LBB13_16:                             # %while.body.i145
                                        # =>This Inner Loop Header: Depth=1
	sxt	r3, r3
	stw	r1, r3
	ldb	r0, r3
	add	r0, 1
	cmp	r3, r2
	beq	__LBB13_52
	br	__LBB13_16
__LBB13_28:                             # %while.body.i211.preheader
	ldi	r3, 85
	ldi	r0, __L.str.26+1
	ldi	r1, CURR_CHAR
	br	__LBB13_30
__LBB13_30:                             # %while.body.i211
                                        # =>This Inner Loop Header: Depth=1
	sxt	r3, r3
	stw	r1, r3
	ldb	r0, r3
	add	r0, 1
	cmp	r3, r2
	beq	__LBB13_52
	br	__LBB13_30
__LBB13_38:                             # %while.body.i255.preheader
	ldi	r3, 85
	ldi	r0, __L.str.30+1
	ldi	r1, CURR_CHAR
	br	__LBB13_40
__LBB13_40:                             # %while.body.i255
                                        # =>This Inner Loop Header: Depth=1
	sxt	r3, r3
	stw	r1, r3
	ldb	r0, r3
	add	r0, 1
	cmp	r3, r2
	beq	__LBB13_52
	br	__LBB13_40
                                        # -- End function
RuleCmd>                                # -- Begin function RuleCmd
# %bb.0:                                # %entry
	ldi	r2, BORN
	stw	r2, r0
	ldi	r0, SURV
	stw	r0, r1
	ldi	r0, CURR_CHAR
	ldi	r1, 82
	stw	r0, r1
	ldi	r2, 117
	stw	r0, r2
	ldi	r1, 108
	stw	r0, r1
	ldi	r1, 101
	stw	r0, r1
	ldi	r3, 115
	stw	r0, r3
	ldi	r3, 32
	stw	r0, r3
	stw	r0, r2
	ldi	r2, 112
	stw	r0, r2
	ldi	r2, 100
	stw	r0, r2
	ldi	r3, 97
	stw	r0, r3
	ldi	r3, 116
	stw	r0, r3
	stw	r0, r1
	stw	r0, r2
	ldi	r1, 10
	stw	r0, r1
	rts
                                        # -- End function
RuleCmdWrapper>                         # -- Begin function RuleCmdWrapper
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-10
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldb	r0, r1
	ldi	r2, 32
	cmp	r1, r2
	ldi	r5, 1
	bne	__LBB15_2
	br	__LBB15_1
__LBB15_1:                              # %while.body.i.preheader
	br	__LBB15_4
__LBB15_4:                              # %while.body.i
                                        # =>This Inner Loop Header: Depth=1
	ldb	r0, r5, r1
	add	r0, 1
	cmp	r1, r2
	beq	__LBB15_4
	br	__LBB15_2
__LBB15_2:                              # %while.cond2.preheader.i
	movens	r1, r3
	sub	r3, 58
	ldi	r2, 255
	and r3, r2, r4
	ldi	r3, -1
	ldi	r6, 246
	cmp	r4, r6
	ldi	r6, 245
	blo	__LBB15_6
	br	__LBB15_3
__LBB15_3:                              # %while.body3.i.preheader
	ldi	r3, 0
	br	__LBB15_5
__LBB15_5:                              # %while.body3.i
                                        # =>This Inner Loop Header: Depth=1
	ldi	r1, 0
	ssw	r1, -10
	movens	r6, r4
	lsw	r6, -10
	add r6, r3, r6
	ssw	r6, -10
	lsw	r6, -10
	add r6, r3, r6
	ssw	r6, -10
	lsw	r6, -10
	add r6, r3, r6
	ssw	r6, -10
	lsw	r6, -10
	add r6, r3, r6
	ssw	r6, -10
	lsw	r6, -10
	add r6, r3, r6
	ssw	r6, -10
	lsw	r6, -10
	add r6, r3, r6
	ssw	r6, -10
	lsw	r6, -10
	add r6, r3, r6
	ssw	r6, -10
	lsw	r6, -10
	add r6, r3, r6
	ssw	r6, -10
	lsw	r6, -10
	add r6, r3, r6
	ssw	r6, -10
	lsw	r6, -10
	add r6, r3, r3
	ssw	r3, -10
	lsw	r3, -10
	ldb	r0, r5, r1
	movens	r1, r6
	sub	r6, 58
	and r6, r2, r6
	ldsb	r0, r2
	add r3, r2, r3
	ldi	r2, 255
	add	r0, 1
	sub	r3, 48
	cmp	r6, r4
	movens	r4, r6
	bhi	__LBB15_5
	br	__LBB15_6
__LBB15_6:                              # %my_atoi.exit
	and r1, r2, r2
	ldi	r4, 32
	cmp	r2, r4
	bne	__LBB15_8
	br	__LBB15_7
__LBB15_7:                              # %while.body.i40.preheader
	br	__LBB15_10
__LBB15_10:                             # %while.body.i40
                                        # =>This Inner Loop Header: Depth=1
	ldb	r0, r5, r1
	add	r0, 1
	cmp	r1, r4
	beq	__LBB15_10
	br	__LBB15_8
__LBB15_8:                              # %while.cond2.preheader.i8
	sub	r1, 58
	ldi	r5, 255
	and r1, r5, r1
	ldi	r2, 246
	cmp	r1, r2
	blo	__LBB15_14
	br	__LBB15_9
__LBB15_14:                             # %while.body.i44.preheader
	ldi	r2, 69
	ldi	r0, __L.str.36+1
	ldi	r1, CURR_CHAR
	ldi	r3, 0
__LBB15_15:                             # %while.body.i44
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r2
	stw	r1, r2
	ldb	r0, r2
	add	r0, 1
	cmp	r2, r3
	beq	__LBB15_17
	br	__LBB15_15
__LBB15_9:                              # %while.body3.i11.preheader
	ldi	r1, 0
	add	r0, 1
	br	__LBB15_11
__LBB15_11:                             # %while.body3.i11
                                        # =>This Inner Loop Header: Depth=1
	ldi	r2, 0
	ssw	r2, -8
	lsw	r2, -8
	add r2, r1, r2
	ssw	r2, -8
	lsw	r2, -8
	add r2, r1, r2
	ssw	r2, -8
	lsw	r2, -8
	add r2, r1, r2
	ssw	r2, -8
	lsw	r2, -8
	add r2, r1, r2
	ssw	r2, -8
	lsw	r2, -8
	add r2, r1, r2
	ssw	r2, -8
	lsw	r2, -8
	add r2, r1, r2
	ssw	r2, -8
	lsw	r2, -8
	add r2, r1, r2
	ssw	r2, -8
	lsw	r2, -8
	add r2, r1, r2
	ssw	r2, -8
	lsw	r2, -8
	add r2, r1, r2
	ssw	r2, -8
	lsw	r2, -8
	add r2, r1, r1
	ssw	r1, -8
	lsw	r1, -8
	ldb	r0, r2
	sub	r2, 58
	and r2, r5, r2
	ldi	r4, -1
	ldsb	r0, r4, r4
	add r1, r4, r1
	add	r0, 1
	sub	r1, 48
	cmp	r2, r6
	bhi	__LBB15_11
	br	__LBB15_12
__LBB15_12:                             # %my_atoi.exit43
	ldi	r0, -1
	cmp	r3, r0
	ldi	r4, 32
	beq	__LBB15_14
	br	__LBB15_13
__LBB15_13:                             # %my_atoi.exit43
	cmp	r1, r0
	bne	__LBB15_16
	br	__LBB15_14
__LBB15_16:                             # %if.else
	ldi	r0, BORN
	stw	r0, r3
	ldi	r0, SURV
	stw	r0, r1
	ldi	r0, CURR_CHAR
	ldi	r1, 82
	stw	r0, r1
	ldi	r1, 117
	stw	r0, r1
	ldi	r2, 108
	stw	r0, r2
	ldi	r2, 101
	stw	r0, r2
	ldi	r3, 115
	stw	r0, r3
	stw	r0, r4
	stw	r0, r1
	ldi	r1, 112
	stw	r0, r1
	ldi	r1, 100
	stw	r0, r1
	ldi	r3, 97
	stw	r0, r3
	ldi	r3, 116
	stw	r0, r3
	stw	r0, r2
	stw	r0, r1
	ldi	r1, 10
	stw	r0, r1
__LBB15_17:                             # %if.end
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	10
	pop	fp
	rts
                                        # -- End function
SetGliderCmd>                           # -- Begin function SetGliderCmd
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-12
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	movens	r1, r3
	movens	r0, r4
	ldi	r2, CURR_CHAR
	ldi	r0, 80
	stw	r2, r0
	ldi	r0, 108
	stw	r2, r0
	ldi	r1, 97
	stw	r2, r1
	ldi	r1, 99
	stw	r2, r1
	ldi	r6, 105
	stw	r2, r6
	ldi	r1, 110
	stw	r2, r1
	ldi	r1, 103
	stw	r2, r1
	ldi	r5, 32
	stw	r2, r5
	stw	r2, r1
	stw	r2, r0
	stw	r2, r6
	ldi	r0, 100
	stw	r2, r0
	ldi	r0, 101
	stw	r2, r0
	ldi	r6, 114
	stw	r2, r6
	ldi	r0, 46
	stw	r2, r0
	stw	r2, r0
	stw	r2, r0
	ldi	r0, 10
	stw	r2, r0
	ssw	r4, -8                          # 2-byte Folded Spill
	add	r4, 1
	or r4, r3, r1
	cmp	r1, r5
	ldi	r1, 111
	ldi	r0, 115
	ssw	r4, -10                         # 2-byte Folded Spill
	blo	__LBB16_2
	br	__LBB16_1
__LBB16_2:                              # %if.end.i
	ldi	r1, CELL_ADR
	stw	r1, r4
	ldi	r1, LINE_ADR
	stw	r1, r3
	ldi	r1, 1
	movens	r1, r4
	ldi	r1, VALUE
	stw	r1, r4
	ldi	r1, UPDATE
	stw	r1, r4
	ldi	r4, 0
	stw	r1, r4
__LBB16_3:                              # %SetCommand.exit
	movens	r3, r1
	add	r1, 1
	lsw	r6, -8                          # 2-byte Folded Reload
	add	r6, 2
	or r1, r6, r4
	cmp	r4, r5
	ssw	r6, -12                         # 2-byte Folded Spill
	blo	__LBB16_5
	br	__LBB16_4
__LBB16_5:                              # %if.end.i18
	ldi	r4, CELL_ADR
	stw	r4, r6
	ldi	r6, LINE_ADR
	stw	r6, r1
	ldi	r1, VALUE
	ldi	r6, 1
	stw	r1, r6
	ldi	r1, UPDATE
	stw	r1, r6
	ldi	r6, 0
	stw	r1, r6
	movens	r5, r6
__LBB16_6:                              # %SetCommand.exit19
	add	r3, 2
	lsw	r5, -8                          # 2-byte Folded Reload
	or r3, r5, r1
	cmp	r1, r6
	blo	__LBB16_8
	br	__LBB16_7
__LBB16_8:                              # %if.end.i22
	stw	r4, r5
	ldi	r1, LINE_ADR
	stw	r1, r3
	ldi	r1, VALUE
	ldi	r4, 1
	stw	r1, r4
	ldi	r1, UPDATE
	stw	r1, r4
	ldi	r4, 0
	stw	r1, r4
	ldi	r4, 114
__LBB16_9:                              # %SetCommand.exit23
	lsw	r5, -10                         # 2-byte Folded Reload
	or r3, r5, r1
	cmp	r1, r6
	blo	__LBB16_11
	br	__LBB16_10
__LBB16_11:                             # %if.end.i26
	ldi	r4, CELL_ADR
	stw	r4, r5
	ldi	r5, LINE_ADR
	stw	r5, r3
	ldi	r0, VALUE
	ldi	r1, 1
	stw	r0, r1
	ldi	r0, UPDATE
	stw	r0, r1
	ldi	r1, 0
	stw	r0, r1
__LBB16_12:                             # %SetCommand.exit27
	lsw	r1, -12                         # 2-byte Folded Reload
	or r3, r1, r0
	cmp	r0, r6
	blo	__LBB16_14
	br	__LBB16_13
__LBB16_14:                             # %if.end.i30
	stw	r4, r1
	stw	r5, r3
	ldi	r0, VALUE
	ldi	r1, 1
	stw	r0, r1
	ldi	r0, UPDATE
	stw	r0, r1
	ldi	r1, 0
	stw	r0, r1
__LBB16_15:                             # %SetCommand.exit31
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	12
	pop	fp
	rts
__LBB16_1:                              # %while.body.i.preheader.i
	ldi	r4, 69
	stw	r2, r4
	stw	r2, r6
	stw	r2, r6
	stw	r2, r1
	stw	r2, r6
	ldi	r4, 58
	stw	r2, r4
	stw	r2, r5
	ldi	r4, 67
	stw	r2, r4
	stw	r2, r1
	stw	r2, r1
	stw	r2, r6
	ldi	r6, 100
	stw	r2, r6
	ldi	r4, 105
	stw	r2, r4
	ldi	r4, 110
	stw	r2, r4
	ldi	r6, 97
	stw	r2, r6
	ldi	r4, 116
	stw	r2, r4
	ldi	r6, 101
	stw	r2, r6
	stw	r2, r0
	stw	r2, r5
	stw	r2, r1
	ldi	r6, 117
	stw	r2, r6
	stw	r2, r4
	stw	r2, r5
	stw	r2, r1
	ldi	r4, 102
	stw	r2, r4
	stw	r2, r5
	ldi	r4, 98
	stw	r2, r4
	stw	r2, r1
	stw	r2, r6
	ldi	r1, 110
	stw	r2, r1
	ldi	r1, 100
	stw	r2, r1
	stw	r2, r0
	ldi	r1, 46
	stw	r2, r1
	ldi	r1, 10
	stw	r2, r1
	br	__LBB16_3
__LBB16_4:                              # %while.body.i.preheader.i17
	ldi	r0, 69
	stw	r2, r0
	ldi	r0, 114
	movens	r0, r1
	stw	r2, r1
	stw	r2, r1
	ldi	r0, 111
	stw	r2, r0
	stw	r2, r1
	ldi	r4, 58
	stw	r2, r4
	stw	r2, r5
	ldi	r4, 67
	stw	r2, r4
	stw	r2, r0
	stw	r2, r0
	stw	r2, r1
	ldi	r1, 100
	stw	r2, r1
	ldi	r4, 105
	stw	r2, r4
	ldi	r1, 110
	stw	r2, r1
	ldi	r6, 97
	stw	r2, r6
	ldi	r1, 116
	stw	r2, r1
	ldi	r6, 101
	stw	r2, r6
	ldi	r4, 115
	stw	r2, r4
	stw	r2, r5
	stw	r2, r0
	ldi	r4, 117
	stw	r2, r4
	stw	r2, r1
	stw	r2, r5
	stw	r2, r0
	ldi	r1, 102
	stw	r2, r1
	stw	r2, r5
	ldi	r6, 98
	stw	r2, r6
	stw	r2, r0
	ldi	r0, 115
	stw	r2, r4
	ldi	r1, 110
	stw	r2, r1
	ldi	r1, 100
	stw	r2, r1
	stw	r2, r0
	ldi	r1, 46
	stw	r2, r1
	ldi	r1, 10
	stw	r2, r1
	movens	r5, r6
	ldi	r4, CELL_ADR
	br	__LBB16_6
__LBB16_7:                              # %while.body.i.preheader.i21
	ldi	r0, 69
	stw	r2, r0
	ldi	r4, 114
	stw	r2, r4
	stw	r2, r4
	ldi	r0, 111
	stw	r2, r0
	stw	r2, r4
	ldi	r1, 58
	stw	r2, r1
	stw	r2, r6
	ldi	r1, 67
	stw	r2, r1
	stw	r2, r0
	stw	r2, r0
	stw	r2, r4
	ldi	r5, 100
	stw	r2, r5
	ldi	r1, 105
	stw	r2, r1
	ldi	r5, 110
	stw	r2, r5
	ldi	r1, 97
	stw	r2, r1
	ldi	r1, 116
	stw	r2, r1
	ldi	r1, 101
	stw	r2, r1
	ldi	r1, 115
	stw	r2, r1
	stw	r2, r6
	stw	r2, r0
	ldi	r1, 117
	stw	r2, r1
	ldi	r1, 116
	stw	r2, r1
	stw	r2, r6
	stw	r2, r0
	ldi	r1, 102
	stw	r2, r1
	stw	r2, r6
	ldi	r1, 98
	stw	r2, r1
	stw	r2, r0
	ldi	r0, 115
	ldi	r1, 117
	stw	r2, r1
	stw	r2, r5
	ldi	r1, 100
	stw	r2, r1
	stw	r2, r0
	ldi	r1, 46
	stw	r2, r1
	ldi	r1, 10
	stw	r2, r1
	br	__LBB16_9
__LBB16_10:                             # %while.body.i.preheader.i25
	ldi	r1, 69
	stw	r2, r1
	stw	r2, r4
	stw	r2, r4
	ldi	r1, 111
	stw	r2, r1
	stw	r2, r4
	ldi	r5, 58
	stw	r2, r5
	stw	r2, r6
	ldi	r5, 67
	stw	r2, r5
	stw	r2, r1
	stw	r2, r1
	stw	r2, r4
	ldi	r4, 100
	stw	r2, r4
	movens	r0, r1
	ldi	r0, 105
	stw	r2, r0
	ldi	r5, 110
	stw	r2, r5
	ldi	r0, 97
	stw	r2, r0
	ldi	r0, 116
	stw	r2, r0
	ldi	r0, 101
	stw	r2, r0
	stw	r2, r1
	stw	r2, r6
	ldi	r1, 111
	stw	r2, r1
	ldi	r0, 117
	stw	r2, r0
	ldi	r0, 116
	stw	r2, r0
	stw	r2, r6
	stw	r2, r1
	ldi	r0, 102
	stw	r2, r0
	stw	r2, r6
	ldi	r0, 98
	stw	r2, r0
	stw	r2, r1
	ldi	r0, 117
	stw	r2, r0
	stw	r2, r5
	stw	r2, r4
	ldi	r0, 115
	stw	r2, r0
	ldi	r1, 46
	stw	r2, r1
	ldi	r0, 10
	stw	r2, r0
	ldi	r4, CELL_ADR
	ldi	r5, LINE_ADR
	br	__LBB16_12
__LBB16_13:                             # %while.body.i.preheader.i29
	ldi	r0, 69
	stw	r2, r0
	ldi	r0, 114
	stw	r2, r0
	stw	r2, r0
	ldi	r3, 111
	stw	r2, r3
	stw	r2, r0
	ldi	r4, 58
	stw	r2, r4
	stw	r2, r6
	ldi	r4, 67
	stw	r2, r4
	stw	r2, r3
	stw	r2, r3
	stw	r2, r0
	ldi	r1, 100
	stw	r2, r1
	ldi	r0, 105
	stw	r2, r0
	ldi	r5, 110
	stw	r2, r5
	ldi	r0, 97
	stw	r2, r0
	ldi	r0, 116
	stw	r2, r0
	ldi	r0, 101
	stw	r2, r0
	ldi	r0, 115
	stw	r2, r0
	stw	r2, r6
	stw	r2, r3
	ldi	r4, 117
	stw	r2, r4
	ldi	r0, 116
	stw	r2, r0
	stw	r2, r6
	stw	r2, r3
	ldi	r0, 102
	stw	r2, r0
	stw	r2, r6
	ldi	r6, 98
	stw	r2, r6
	stw	r2, r3
	stw	r2, r4
	stw	r2, r5
	stw	r2, r1
	ldi	r0, 115
	stw	r2, r0
	ldi	r0, 46
	stw	r2, r0
	ldi	r0, 10
	stw	r2, r0
	br	__LBB16_15
                                        # -- End function
SetGliderCmdWrapper>                    # -- Begin function SetGliderCmdWrapper
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-10
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldb	r0, r2
	ldi	r1, 32
	cmp	r2, r1
	ldi	r5, 1
	bne	__LBB17_2
	br	__LBB17_1
__LBB17_1:                              # %while.body.i.preheader
	br	__LBB17_4
__LBB17_4:                              # %while.body.i
                                        # =>This Inner Loop Header: Depth=1
	ldb	r0, r5, r2
	add	r0, 1
	cmp	r2, r1
	beq	__LBB17_4
	br	__LBB17_2
__LBB17_2:                              # %while.cond2.preheader.i
	movens	r2, r3
	sub	r3, 58
	ldi	r1, 255
	and r3, r1, r3
	ldi	r4, -1
	ldi	r1, 246
	cmp	r3, r1
	ldi	r6, 245
	blo	__LBB17_6
	br	__LBB17_3
__LBB17_3:                              # %while.body3.i.preheader
	ldi	r4, 0
	br	__LBB17_5
__LBB17_5:                              # %while.body3.i
                                        # =>This Inner Loop Header: Depth=1
	ldi	r1, 0
	ssw	r1, -10
	movens	r6, r1
	lsw	r6, -10
	add r6, r4, r6
	ssw	r6, -10
	lsw	r6, -10
	add r6, r4, r6
	ssw	r6, -10
	lsw	r6, -10
	add r6, r4, r6
	ssw	r6, -10
	lsw	r6, -10
	add r6, r4, r6
	ssw	r6, -10
	lsw	r6, -10
	add r6, r4, r6
	ssw	r6, -10
	lsw	r6, -10
	add r6, r4, r6
	ssw	r6, -10
	lsw	r6, -10
	add r6, r4, r6
	ssw	r6, -10
	lsw	r6, -10
	add r6, r4, r6
	ssw	r6, -10
	lsw	r6, -10
	add r6, r4, r6
	ssw	r6, -10
	lsw	r6, -10
	add r6, r4, r2
	ssw	r2, -10
	lsw	r4, -10
	ldb	r0, r5, r2
	movens	r2, r6
	sub	r6, 58
	ldi	r3, 255
	and r6, r3, r6
	ldsb	r0, r3
	add r4, r3, r4
	add	r0, 1
	sub	r4, 48
	cmp	r6, r1
	movens	r1, r6
	bhi	__LBB17_5
	br	__LBB17_6
__LBB17_6:                              # %my_atoi.exit
	ldi	r1, 255
	and r2, r1, r3
	ldi	r1, 32
	cmp	r3, r1
	ldi	r3, 255
	bne	__LBB17_8
	br	__LBB17_7
__LBB17_7:                              # %while.body.i40.preheader
	br	__LBB17_10
__LBB17_10:                             # %while.body.i40
                                        # =>This Inner Loop Header: Depth=1
	ldb	r0, r5, r2
	add	r0, 1
	cmp	r2, r1
	beq	__LBB17_10
	br	__LBB17_8
__LBB17_8:                              # %while.cond2.preheader.i8
	sub	r2, 58
	and r2, r3, r1
	ldi	r2, 246
	cmp	r1, r2
	blo	__LBB17_14
	br	__LBB17_9
__LBB17_14:                             # %while.body.i44.preheader
	ldi	r2, 69
	ldi	r0, __L.str.38+1
	ldi	r1, CURR_CHAR
	ldi	r3, 0
__LBB17_15:                             # %while.body.i44
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r2
	stw	r1, r2
	ldb	r0, r2
	add	r0, 1
	cmp	r2, r3
	beq	__LBB17_17
	br	__LBB17_15
__LBB17_9:                              # %while.body3.i11.preheader
	movens	r6, r5
	ldi	r6, 0
	add	r0, 1
	movens	r6, r1
	br	__LBB17_11
__LBB17_11:                             # %while.body3.i11
                                        # =>This Inner Loop Header: Depth=1
	ssw	r6, -8
	lsw	r2, -8
	add r2, r1, r2
	ssw	r2, -8
	lsw	r2, -8
	add r2, r1, r2
	ssw	r2, -8
	lsw	r2, -8
	add r2, r1, r2
	ssw	r2, -8
	lsw	r2, -8
	add r2, r1, r2
	ssw	r2, -8
	lsw	r2, -8
	add r2, r1, r2
	ssw	r2, -8
	lsw	r2, -8
	add r2, r1, r2
	ssw	r2, -8
	lsw	r2, -8
	add r2, r1, r2
	ssw	r2, -8
	lsw	r2, -8
	add r2, r1, r2
	ssw	r2, -8
	lsw	r2, -8
	add r2, r1, r2
	ssw	r2, -8
	lsw	r2, -8
	add r2, r1, r1
	ssw	r1, -8
	lsw	r1, -8
	ldb	r0, r2
	sub	r2, 58
	ldi	r3, 255
	and r2, r3, r2
	ldi	r3, -1
	ldsb	r0, r3, r3
	add r1, r3, r1
	add	r0, 1
	sub	r1, 48
	cmp	r2, r5
	bhi	__LBB17_11
	br	__LBB17_12
__LBB17_12:                             # %my_atoi.exit43
	ldi	r0, -1
	cmp	r4, r0
	beq	__LBB17_14
	br	__LBB17_13
__LBB17_13:                             # %my_atoi.exit43
	cmp	r1, r0
	bne	__LBB17_16
	br	__LBB17_14
__LBB17_16:                             # %if.else
	movens	r4, r0
	jsr	SetGliderCmd
__LBB17_17:                             # %if.end
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	10
	pop	fp
	rts
                                        # -- End function
SetCmd>                                 # -- Begin function SetCmd
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-14
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldb	r0, r2
	ldi	r1, 32
	cmp	r2, r1
	ldi	r6, 1
	bne	__LBB18_2
	br	__LBB18_1
__LBB18_1:                              # %while.body.i.preheader
	br	__LBB18_4
__LBB18_4:                              # %while.body.i
                                        # =>This Inner Loop Header: Depth=1
	ldb	r0, r6, r2
	add	r0, 1
	cmp	r2, r1
	beq	__LBB18_4
	br	__LBB18_2
__LBB18_2:                              # %while.cond2.preheader.i
	movens	r2, r1
	sub	r1, 58
	ldi	r3, 255
	and r1, r3, r1
	ldi	r3, -1
	ldi	r4, 246
	cmp	r1, r4
	blo	__LBB18_6
	br	__LBB18_3
__LBB18_3:                              # %while.body3.i.preheader
	ldi	r3, 0
	movens	r3, r5
	br	__LBB18_5
__LBB18_5:                              # %while.body3.i
                                        # =>This Inner Loop Header: Depth=1
	ssw	r5, -12
	lsw	r4, -12
	add r4, r3, r4
	ssw	r4, -12
	lsw	r4, -12
	add r4, r3, r4
	ssw	r4, -12
	lsw	r4, -12
	add r4, r3, r4
	ssw	r4, -12
	lsw	r4, -12
	add r4, r3, r4
	ssw	r4, -12
	lsw	r4, -12
	add r4, r3, r4
	ssw	r4, -12
	lsw	r4, -12
	add r4, r3, r4
	ssw	r4, -12
	lsw	r4, -12
	add r4, r3, r4
	ssw	r4, -12
	lsw	r4, -12
	add r4, r3, r4
	ssw	r4, -12
	lsw	r4, -12
	add r4, r3, r4
	ssw	r4, -12
	lsw	r4, -12
	add r4, r3, r3
	ssw	r3, -12
	lsw	r3, -12
	ldb	r0, r6, r2
	movens	r2, r4
	sub	r4, 58
	ldi	r1, 255
	and r4, r1, r4
	ldsb	r0, r1
	add r3, r1, r3
	add	r0, 1
	sub	r3, 48
	ldi	r1, 245
	cmp	r4, r1
	bhi	__LBB18_5
	br	__LBB18_6
__LBB18_6:                              # %my_atoi.exit
	ssw	r3, -14                         # 2-byte Folded Spill
	ldi	r3, 255
	and r2, r3, r1
	ldi	r4, 32
	cmp	r1, r4
	bne	__LBB18_8
	br	__LBB18_7
__LBB18_7:                              # %while.body.i45.preheader
	br	__LBB18_10
__LBB18_10:                             # %while.body.i45
                                        # =>This Inner Loop Header: Depth=1
	ldb	r0, r6, r2
	add	r0, 1
	cmp	r2, r4
	beq	__LBB18_10
	br	__LBB18_8
__LBB18_8:                              # %while.cond2.preheader.i13
	movens	r2, r1
	sub	r1, 58
	and r1, r3, r3
	ldi	r1, -1
	ldi	r4, 246
	cmp	r3, r4
	ldi	r4, 245
	blo	__LBB18_12
	br	__LBB18_9
__LBB18_9:                              # %while.body3.i16.preheader
	ldi	r1, 0
	br	__LBB18_11
__LBB18_11:                             # %while.body3.i16
                                        # =>This Inner Loop Header: Depth=1
	ldi	r2, 0
	ssw	r2, -10
	lsw	r5, -10
	add r5, r1, r5
	ssw	r5, -10
	lsw	r5, -10
	add r5, r1, r5
	ssw	r5, -10
	lsw	r5, -10
	add r5, r1, r5
	ssw	r5, -10
	lsw	r5, -10
	add r5, r1, r5
	ssw	r5, -10
	lsw	r5, -10
	add r5, r1, r5
	ssw	r5, -10
	lsw	r5, -10
	add r5, r1, r5
	ssw	r5, -10
	lsw	r5, -10
	add r5, r1, r5
	ssw	r5, -10
	lsw	r5, -10
	add r5, r1, r5
	ssw	r5, -10
	lsw	r5, -10
	add r5, r1, r5
	ssw	r5, -10
	lsw	r5, -10
	add r5, r1, r1
	ssw	r1, -10
	lsw	r1, -10
	ldb	r0, r6, r2
	movens	r2, r5
	sub	r5, 58
	movens	r6, r3
	movens	r4, r6
	ldi	r4, 255
	and r5, r4, r5
	ldsb	r0, r4
	add r1, r4, r1
	movens	r6, r4
	movens	r3, r6
	add	r0, 1
	sub	r1, 48
	cmp	r5, r4
	bhi	__LBB18_11
	br	__LBB18_12
__LBB18_12:                             # %my_atoi.exit48
	ldi	r4, 255
	movens	r4, r3
	and r2, r3, r4
	ldi	r5, 32
	cmp	r4, r5
	movens	r5, r4
	movens	r3, r5
	bne	__LBB18_14
	br	__LBB18_13
__LBB18_13:                             # %while.body.i84.preheader
	br	__LBB18_16
__LBB18_16:                             # %while.body.i84
                                        # =>This Inner Loop Header: Depth=1
	ldb	r0, r6, r2
	add	r0, 1
	cmp	r2, r4
	beq	__LBB18_16
	br	__LBB18_14
__LBB18_14:                             # %while.cond2.preheader.i52
	sub	r2, 58
	and r2, r5, r2
	ldi	r4, 246
	cmp	r2, r4
	blo	__LBB18_21
	br	__LBB18_15
__LBB18_21:                             # %while.body.i88.preheader
	ldi	r2, 69
	ldi	r0, __L.str.39+1
	ldi	r1, CURR_CHAR
	ldi	r3, 0
__LBB18_22:                             # %while.body.i88
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r2
	stw	r1, r2
	ldb	r0, r2
	add	r0, 1
	cmp	r2, r3
	beq	__LBB18_24
	br	__LBB18_22
__LBB18_15:                             # %while.body3.i55.preheader
	ldi	r2, 0
	add	r0, 1
	movens	r2, r3
	br	__LBB18_17
__LBB18_17:                             # %while.body3.i55
                                        # =>This Inner Loop Header: Depth=1
	ssw	r3, -8
	lsw	r6, -8
	add r6, r2, r6
	ssw	r6, -8
	lsw	r6, -8
	add r6, r2, r6
	ssw	r6, -8
	lsw	r6, -8
	add r6, r2, r6
	ssw	r6, -8
	lsw	r6, -8
	add r6, r2, r6
	ssw	r6, -8
	lsw	r6, -8
	add r6, r2, r6
	ssw	r6, -8
	lsw	r6, -8
	add r6, r2, r6
	ssw	r6, -8
	lsw	r6, -8
	add r6, r2, r6
	ssw	r6, -8
	lsw	r6, -8
	add r6, r2, r6
	ssw	r6, -8
	lsw	r6, -8
	add r6, r2, r6
	ssw	r6, -8
	lsw	r6, -8
	add r6, r2, r2
	ssw	r2, -8
	lsw	r2, -8
	ldb	r0, r6
	sub	r6, 58
	and r6, r5, r6
	movens	r5, r4
	ldi	r5, -1
	ldsb	r0, r5, r5
	add r2, r5, r2
	movens	r4, r5
	add	r0, 1
	sub	r2, 48
	ldi	r4, 245
	cmp	r6, r4
	bhi	__LBB18_17
	br	__LBB18_18
__LBB18_18:                             # %my_atoi.exit87
	ldi	r0, -1
	lsw	r3, -14                         # 2-byte Folded Reload
	cmp	r3, r0
	beq	__LBB18_21
	br	__LBB18_19
__LBB18_19:                             # %my_atoi.exit87
	cmp	r1, r0
	beq	__LBB18_21
	br	__LBB18_20
__LBB18_20:                             # %my_atoi.exit87
	cmp	r2, r0
	bne	__LBB18_23
	br	__LBB18_21
__LBB18_23:                             # %if.else
	movens	r3, r0
	jsr	SetCommand
__LBB18_24:                             # %if.end
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	14
	pop	fp
	rts
                                        # -- End function
FillCmdWrapper>                         # -- Begin function FillCmdWrapper
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-18
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldb	r0, r1
	ldi	r3, 32
	cmp	r1, r3
	bne	__LBB19_2
	br	__LBB19_1
__LBB19_1:                              # %while.body.i.preheader
	ldi	r2, 1
	br	__LBB19_4
__LBB19_4:                              # %while.body.i
                                        # =>This Inner Loop Header: Depth=1
	ldb	r0, r2, r1
	add	r0, 1
	cmp	r1, r3
	beq	__LBB19_4
	br	__LBB19_2
__LBB19_2:                              # %while.cond2.preheader.i
	movens	r1, r2
	sub	r2, 58
	ldi	r3, 255
	and r2, r3, r2
	ldi	r3, -1
	ldi	r4, 246
	cmp	r2, r4
	blo	__LBB19_6
	br	__LBB19_3
__LBB19_3:                              # %while.body3.i.preheader
	ldi	r2, 0
	ldi	r5, 245
	movens	r2, r3
	br	__LBB19_5
__LBB19_5:                              # %while.body3.i
                                        # =>This Inner Loop Header: Depth=1
	ssw	r2, -10
	lsw	r4, -10
	add r4, r3, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r3, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r3, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r3, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r3, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r3, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r3, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r3, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r3, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r3, r1
	ssw	r1, -10
	lsw	r4, -10
	ldi	r1, 1
	ldb	r0, r1, r1
	movens	r1, r6
	sub	r6, 58
	ldi	r3, 255
	and r6, r3, r6
	ldsb	r0, r3
	add r4, r3, r3
	add	r0, 1
	sub	r3, 48
	cmp	r6, r5
	bhi	__LBB19_5
	br	__LBB19_6
__LBB19_6:                              # %my_atoi.exit
	ssw	r3, -16                         # 2-byte Folded Spill
	ldi	r6, 255
	and r1, r6, r2
	ldi	r3, 32
	cmp	r2, r3
	bne	__LBB19_8
	br	__LBB19_7
__LBB19_7:                              # %while.body.i58.preheader
	ldi	r2, 1
	br	__LBB19_10
__LBB19_10:                             # %while.body.i58
                                        # =>This Inner Loop Header: Depth=1
	ldb	r0, r2, r1
	add	r0, 1
	cmp	r1, r3
	beq	__LBB19_10
	br	__LBB19_8
__LBB19_8:                              # %while.cond2.preheader.i26
	movens	r1, r2
	sub	r2, 58
	and r2, r6, r2
	ldi	r5, -1
	ldi	r3, 246
	cmp	r2, r3
	blo	__LBB19_12
	br	__LBB19_9
__LBB19_9:                              # %while.body3.i29.preheader
	ldi	r3, 0
	movens	r3, r5
	br	__LBB19_11
__LBB19_11:                             # %while.body3.i29
                                        # =>This Inner Loop Header: Depth=1
	ssw	r3, -10
	lsw	r4, -10
	add r4, r5, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r5, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r5, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r5, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r5, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r5, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r5, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r5, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r5, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r5, r4
	ssw	r4, -10
	lsw	r5, -10
	ldi	r1, 1
	ldb	r0, r1, r1
	movens	r1, r4
	sub	r4, 58
	and r4, r6, r4
	ldsb	r0, r2
	add r5, r2, r5
	add	r0, 1
	sub	r5, 48
	ldi	r2, 245
	cmp	r4, r2
	bhi	__LBB19_11
	br	__LBB19_12
__LBB19_12:                             # %my_atoi.exit61
	ssw	r5, -18                         # 2-byte Folded Spill
	and r1, r6, r2
	ldi	r5, 32
	cmp	r2, r5
	movens	r6, r3
	bne	__LBB19_14
	br	__LBB19_13
__LBB19_13:                             # %while.body.i97.preheader
	ldi	r2, 1
	br	__LBB19_16
__LBB19_16:                             # %while.body.i97
                                        # =>This Inner Loop Header: Depth=1
	ldb	r0, r2, r1
	add	r0, 1
	cmp	r1, r5
	beq	__LBB19_16
	br	__LBB19_14
__LBB19_14:                             # %while.cond2.preheader.i65
	movens	r1, r2
	sub	r2, 58
	and r2, r3, r2
	ldi	r6, -1
	ldi	r4, 246
	cmp	r2, r4
	movens	r3, r2
	blo	__LBB19_18
	br	__LBB19_15
__LBB19_15:                             # %while.body3.i68.preheader
	ldi	r6, 0
	br	__LBB19_17
__LBB19_17:                             # %while.body3.i68
                                        # =>This Inner Loop Header: Depth=1
	ldi	r1, 0
	ssw	r1, -10
	lsw	r1, -10
	add r1, r6, r1
	ssw	r1, -10
	lsw	r1, -10
	add r1, r6, r1
	ssw	r1, -10
	lsw	r1, -10
	add r1, r6, r1
	ssw	r1, -10
	lsw	r1, -10
	add r1, r6, r1
	ssw	r1, -10
	lsw	r1, -10
	add r1, r6, r1
	ssw	r1, -10
	lsw	r1, -10
	add r1, r6, r1
	ssw	r1, -10
	lsw	r1, -10
	add r1, r6, r1
	ssw	r1, -10
	lsw	r1, -10
	add r1, r6, r1
	ssw	r1, -10
	lsw	r1, -10
	add r1, r6, r1
	ssw	r1, -10
	lsw	r1, -10
	add r1, r6, r1
	ssw	r1, -10
	lsw	r4, -10
	ldi	r1, 1
	ldb	r0, r1, r1
	movens	r1, r6
	sub	r6, 58
	and r6, r2, r3
	ldsb	r0, r6
	add r4, r6, r6
	add	r0, 1
	sub	r6, 48
	ldi	r4, 245
	cmp	r3, r4
	bhi	__LBB19_17
	br	__LBB19_18
__LBB19_18:                             # %my_atoi.exit100
	movens	r2, r3
	and r1, r3, r2
	cmp	r2, r5
	bne	__LBB19_20
	br	__LBB19_19
__LBB19_19:                             # %while.body.i136.preheader
	ldi	r2, 1
	br	__LBB19_22
__LBB19_22:                             # %while.body.i136
                                        # =>This Inner Loop Header: Depth=1
	ldb	r0, r2, r1
	add	r0, 1
	cmp	r1, r5
	beq	__LBB19_22
	br	__LBB19_20
__LBB19_20:                             # %while.cond2.preheader.i104
	movens	r1, r2
	sub	r2, 58
	and r2, r3, r2
	movens	r3, r5
	ldi	r3, -1
	ldi	r4, 246
	cmp	r2, r4
	movens	r5, r2
	blo	__LBB19_24
	br	__LBB19_21
__LBB19_21:                             # %while.body3.i107.preheader
	ldi	r3, 0
	br	__LBB19_23
__LBB19_23:                             # %while.body3.i107
                                        # =>This Inner Loop Header: Depth=1
	ldi	r1, 0
	ssw	r1, -10
	lsw	r1, -10
	add r1, r3, r1
	ssw	r1, -10
	lsw	r1, -10
	add r1, r3, r1
	ssw	r1, -10
	lsw	r1, -10
	add r1, r3, r1
	ssw	r1, -10
	lsw	r1, -10
	add r1, r3, r1
	ssw	r1, -10
	lsw	r1, -10
	add r1, r3, r1
	ssw	r1, -10
	lsw	r1, -10
	add r1, r3, r1
	ssw	r1, -10
	lsw	r1, -10
	add r1, r3, r1
	ssw	r1, -10
	lsw	r1, -10
	add r1, r3, r1
	ssw	r1, -10
	lsw	r1, -10
	add r1, r3, r1
	ssw	r1, -10
	lsw	r1, -10
	add r1, r3, r1
	ssw	r1, -10
	lsw	r3, -10
	ldi	r1, 1
	ldb	r0, r1, r1
	movens	r1, r4
	sub	r4, 58
	and r4, r2, r4
	movens	r2, r5
	ldsb	r0, r2
	add r3, r2, r3
	movens	r5, r2
	add	r0, 1
	sub	r3, 48
	ldi	r5, 245
	cmp	r4, r5
	bhi	__LBB19_23
	br	__LBB19_24
__LBB19_24:                             # %my_atoi.exit139
	movens	r2, r4
	and r1, r4, r2
	ldi	r5, 32
	cmp	r2, r5
	bne	__LBB19_26
	br	__LBB19_25
__LBB19_25:                             # %while.body.i175.preheader
	ldi	r2, 1
	br	__LBB19_28
__LBB19_28:                             # %while.body.i175
                                        # =>This Inner Loop Header: Depth=1
	ldb	r0, r2, r1
	add	r0, 1
	cmp	r1, r5
	beq	__LBB19_28
	br	__LBB19_26
__LBB19_26:                             # %while.cond2.preheader.i143
	sub	r1, 58
	and r1, r4, r1
	ldi	r5, -1
	ldi	r2, 246
	cmp	r1, r2
	movens	r5, r2
	blo	__LBB19_30
	br	__LBB19_27
__LBB19_27:                             # %while.body3.i146.preheader
	ldi	r2, 0
	add	r0, 1
	br	__LBB19_29
__LBB19_29:                             # %while.body3.i146
                                        # =>This Inner Loop Header: Depth=1
	ldi	r1, 0
	ssw	r1, -10
	lsw	r1, -10
	add r1, r2, r1
	ssw	r1, -10
	lsw	r1, -10
	add r1, r2, r1
	ssw	r1, -10
	lsw	r1, -10
	add r1, r2, r1
	ssw	r1, -10
	lsw	r1, -10
	add r1, r2, r1
	ssw	r1, -10
	lsw	r1, -10
	add r1, r2, r1
	ssw	r1, -10
	lsw	r1, -10
	add r1, r2, r1
	ssw	r1, -10
	lsw	r1, -10
	add r1, r2, r1
	ssw	r1, -10
	lsw	r1, -10
	add r1, r2, r1
	ssw	r1, -10
	lsw	r1, -10
	add r1, r2, r1
	ssw	r1, -10
	lsw	r1, -10
	add r1, r2, r1
	ssw	r1, -10
	lsw	r1, -10
	ldb	r0, r2
	sub	r2, 58
	and r2, r4, r5
	ldi	r2, -1
	ldsb	r0, r2, r2
	add r1, r2, r2
	add	r0, 1
	sub	r2, 48
	ldi	r1, 245
	cmp	r5, r1
	bhi	__LBB19_29
	br	__LBB19_30
__LBB19_30:                             # %my_atoi.exit178
	lsw	r0, -16                         # 2-byte Folded Reload
	ldi	r1, -1
	cmp	r0, r1
	lsw	r1, -18                         # 2-byte Folded Reload
	beq	__LBB19_35
	br	__LBB19_31
__LBB19_31:                             # %my_atoi.exit178
	ldi	r0, -1
	cmp	r1, r0
	beq	__LBB19_35
	br	__LBB19_32
__LBB19_32:                             # %my_atoi.exit178
	cmp	r6, r0
	beq	__LBB19_35
	br	__LBB19_33
__LBB19_33:                             # %my_atoi.exit178
	cmp	r3, r0
	beq	__LBB19_35
	br	__LBB19_34
__LBB19_34:                             # %my_atoi.exit178
	cmp	r2, r0
	bne	__LBB19_37
	br	__LBB19_35
__LBB19_37:                             # %if.else
	ldi	r0, -10
	add	r0, fp, r0
	ldi	r4, 2
	stw	r0, r4, r1
	lsw	r1, -16                         # 2-byte Folded Reload
	ssw	r1, -10
	ldi	r1, -14
	add	r1, fp, r1
	stw	r1, r4, r3
	ssw	r6, -14
	jsr	FillCmd
__LBB19_38:                             # %if.end
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	18
	pop	fp
	rts
__LBB19_35:                             # %while.body.i179.preheader
	ldi	r2, 69
	ldi	r0, __L.str.40+1
	ldi	r1, CURR_CHAR
	ldi	r3, 0
__LBB19_36:                             # %while.body.i179
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r2
	stw	r1, r2
	ldb	r0, r2
	add	r0, 1
	cmp	r2, r3
	beq	__LBB19_38
	br	__LBB19_36
                                        # -- End function
parse>                                  # -- Begin function parse
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-92
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r2, head
	ldw	r2, r0
	ldi	r4, end
	ldw	r4, r1
	cmp	r0, r1
	beq	__LBB20_72
	br	__LBB20_1
__LBB20_1:                              # %if.end
	ldi	r6, 0
	ldw	r2, r5
	ldw	r4, r0
	cmp	r5, r0
	beq	__LBB20_5
	br	__LBB20_2
__LBB20_2:                              # %while.body.preheader
	ldi	r2, 0
	ldi	r0, 62
	movens	r2, r6
__LBB20_3:                              # %while.body
                                        # =>This Inner Loop Header: Depth=1
	movens	r4, r1
	shl	r5, r4, 1
	ldi	r3, queue
	ldw	r4, r3, r4
	ldi	r3, -70
	add	r3, fp, r3
	stb	r3, r2, r4
	movens	r1, r4
	add	r5, 1
	shra	r5, r3, 8
	shra	r3, r3, 15-8
	shr	r3, r3, 8
	shr	r3, r3, 11-8
	add r5, r3, r3
	ldi	r1, -32
	and r3, r1, r3
	sub r5, r3, r5
	add	r6, 1
	ldw	r4, r3
	cmp	r5, r3
	beq	__LBB20_5
	br	__LBB20_4
__LBB20_4:                              # %while.body
                                        #   in Loop: Header=BB20_3 Depth=1
	cmp	r2, r0
	movens	r6, r2
	blo	__LBB20_3
	br	__LBB20_5
__LBB20_5:                              # %while.end
	ldi	r0, -70
	add	r0, fp, r0
	ldi	r1, 0
	stb	r0, r6, r1
	ldi	r0, queue
	stw	r0, r1
	ldi	r0, queue+2
	stw	r0, r1
	ldi	r0, queue+4
	stw	r0, r1
	ldi	r0, queue+6
	stw	r0, r1
	ldi	r0, queue+8
	stw	r0, r1
	ldi	r0, queue+10
	stw	r0, r1
	ldi	r0, queue+12
	stw	r0, r1
	ldi	r0, queue+14
	stw	r0, r1
	ldi	r0, queue+16
	stw	r0, r1
	ldi	r0, queue+18
	stw	r0, r1
	ldi	r0, queue+20
	stw	r0, r1
	ldi	r0, queue+22
	stw	r0, r1
	ldi	r0, queue+24
	stw	r0, r1
	ldi	r0, queue+26
	stw	r0, r1
	ldi	r0, queue+28
	stw	r0, r1
	ldi	r0, queue+30
	stw	r0, r1
	ldi	r0, queue+32
	stw	r0, r1
	ldi	r0, queue+34
	stw	r0, r1
	ldi	r0, queue+36
	stw	r0, r1
	ldi	r0, queue+38
	stw	r0, r1
	ldi	r0, queue+40
	stw	r0, r1
	ldi	r0, queue+42
	stw	r0, r1
	ldi	r0, queue+44
	stw	r0, r1
	ldi	r0, queue+46
	stw	r0, r1
	ldi	r0, queue+48
	stw	r0, r1
	ldi	r0, queue+50
	stw	r0, r1
	ldi	r0, queue+52
	stw	r0, r1
	ldi	r0, queue+54
	stw	r0, r1
	ldi	r0, queue+56
	stw	r0, r1
	ldi	r0, queue+58
	stw	r0, r1
	ldi	r0, queue+60
	stw	r0, r1
	ldi	r0, queue+62
	stw	r0, r1
	ldi	r0, head
	stw	r0, r1
	stw	r4, r1
	lsw	r4, -70
	cmp	r4, r1
	beq	__LBB20_8
	br	__LBB20_6
__LBB20_6:                              # %while.body.i.preheader
	ldi	r0, -70
	add	r0, fp, r0
	add	r0, 1
	ldi	r1, CURR_CHAR
	ldi	r2, 0
	movens	r4, r3
__LBB20_7:                              # %while.body.i
                                        # =>This Inner Loop Header: Depth=1
	sxt	r3, r3
	stw	r1, r3
	ldb	r0, r3
	add	r0, 1
	cmp	r3, r2
	bne	__LBB20_7
	br	__LBB20_8
__LBB20_8:                              # %while.cond6.preheader
	ldi	r0, -70
	add	r0, fp, r0
	add	r0, 1
	ldi	r3, 255
	ldi	r2, 32
__LBB20_9:                              # %while.cond6
                                        # =>This Inner Loop Header: Depth=1
	and r4, r3, r1
	cmp	r1, r2
	beq	__LBB20_12
	br	__LBB20_10
__LBB20_12:                             # %while.body10
                                        #   in Loop: Header=BB20_9 Depth=1
	ldb	r0, r4
	add	r0, 1
	br	__LBB20_9
__LBB20_10:                             # %while.cond6
	ldi	r5, 0
	cmp	r1, r5
	beq	__LBB20_72
	br	__LBB20_11
__LBB20_11:                             # %land.lhs.true.preheader
	ldi	r2, 18
	movens	r5, r6
	br	__LBB20_13
__LBB20_13:                             # %land.lhs.true
                                        # =>This Inner Loop Header: Depth=1
	and r4, r3, r1
	cmp	r1, r5
	beq	__LBB20_17
	br	__LBB20_14
__LBB20_14:                             # %land.lhs.true
                                        #   in Loop: Header=BB20_13 Depth=1
	cmp	r6, r2
	bhi	__LBB20_17
	br	__LBB20_15
__LBB20_15:                             # %while.body28
                                        #   in Loop: Header=BB20_13 Depth=1
	ldi	r1, -90
	add	r1, fp, r1
	stb	r1, r6, r4
	ldb	r0, r6, r4
	add	r6, 1
	ldi	r1, 32
	cmp	r4, r1
	bne	__LBB20_13
	br	__LBB20_16
__LBB20_16:                             # %while.end32split
	add r0, r6, r0
	sub	r0, 1
	br	__LBB20_18
__LBB20_17:                             # %land.lhs.true.while.end32_crit_edge
	add r0, r6, r0
	sub	r0, 1
__LBB20_18:                             # %while.end32
	ldi	r1, -90
	add	r1, fp, r1
	ldi	r5, 0
	stb	r1, r6, r5
	sub	r0, 1
	ldi	r1, 1
	ldi	r4, 32
__LBB20_19:                             # %while.cond34
                                        # =>This Inner Loop Header: Depth=1
	ldb	r0, r1, r2
	add	r0, 1
	cmp	r2, r4
	beq	__LBB20_19
	br	__LBB20_20
__LBB20_20:                             # %while.end40
	lsw	r1, -90
	ssw	r1, -92                         # 2-byte Folded Spill
	cmp	r1, r5
	beq	__LBB20_24
	br	__LBB20_21
__LBB20_21:                             # %land.rhs.i.preheader
	ldi	r2, 0
	ldi	r1, -90
	add	r1, fp, r4
	add	r4, 1
	lsw	r1, -92                         # 2-byte Folded Reload
	movens	r2, r5
__LBB20_22:                             # %land.rhs.i
                                        # =>This Inner Loop Header: Depth=1
	ldi	r6, __L.str.17
	ldb	r5, r6, r6
	and r1, r3, r1
	cmp	r1, r6
	bne	__LBB20_26
	br	__LBB20_23
__LBB20_23:                             # %if.end.i
                                        #   in Loop: Header=BB20_22 Depth=1
	ldb	r4, r5, r1
	add	r5, 1
	cmp	r1, r2
	bne	__LBB20_22
	br	__LBB20_24
__LBB20_24:                             # %StringCmp.exit
	ldi	r1, __L.str.17
	ldb	r5, r1, r1
	ldi	r2, 0
	cmp	r1, r2
	bne	__LBB20_26
	br	__LBB20_25
__LBB20_26:                             # %if.else
	ldi	r5, 0
	lsw	r1, -92                         # 2-byte Folded Reload
	cmp	r1, r5
	beq	__LBB20_30
	br	__LBB20_27
__LBB20_27:                             # %land.rhs.i114.preheader
	ldi	r2, 0
	ldi	r1, -90
	add	r1, fp, r4
	add	r4, 1
	lsw	r1, -92                         # 2-byte Folded Reload
	movens	r2, r5
__LBB20_28:                             # %land.rhs.i114
                                        # =>This Inner Loop Header: Depth=1
	ldi	r6, __L.str.19
	ldb	r5, r6, r6
	and r1, r3, r1
	cmp	r1, r6
	bne	__LBB20_32
	br	__LBB20_29
__LBB20_29:                             # %if.end.i119
                                        #   in Loop: Header=BB20_28 Depth=1
	ldb	r4, r5, r1
	add	r5, 1
	cmp	r1, r2
	bne	__LBB20_28
	br	__LBB20_30
__LBB20_30:                             # %StringCmp.exit127
	ldi	r1, __L.str.19
	ldb	r5, r1, r1
	ldi	r2, 0
	cmp	r1, r2
	bne	__LBB20_32
	br	__LBB20_31
__LBB20_32:                             # %if.else47
	ldi	r5, 0
	lsw	r1, -92                         # 2-byte Folded Reload
	cmp	r1, r5
	beq	__LBB20_36
	br	__LBB20_33
__LBB20_33:                             # %land.rhs.i129.preheader
	ldi	r2, 0
	ldi	r1, -90
	add	r1, fp, r4
	add	r4, 1
	lsw	r1, -92                         # 2-byte Folded Reload
	movens	r2, r5
__LBB20_34:                             # %land.rhs.i129
                                        # =>This Inner Loop Header: Depth=1
	ldi	r6, __L.str.21
	ldb	r5, r6, r6
	and r1, r3, r1
	cmp	r1, r6
	bne	__LBB20_38
	br	__LBB20_35
__LBB20_35:                             # %if.end.i134
                                        #   in Loop: Header=BB20_34 Depth=1
	ldb	r4, r5, r1
	add	r5, 1
	cmp	r1, r2
	bne	__LBB20_34
	br	__LBB20_36
__LBB20_36:                             # %StringCmp.exit142
	ldi	r1, __L.str.21
	ldb	r5, r1, r1
	ldi	r2, 0
	cmp	r1, r2
	bne	__LBB20_38
	br	__LBB20_37
__LBB20_38:                             # %if.else52
	ldi	r5, 0
	lsw	r1, -92                         # 2-byte Folded Reload
	cmp	r1, r5
	beq	__LBB20_42
	br	__LBB20_39
__LBB20_39:                             # %land.rhs.i144.preheader
	ldi	r2, 0
	ldi	r1, -90
	add	r1, fp, r4
	add	r4, 1
	lsw	r1, -92                         # 2-byte Folded Reload
	movens	r2, r5
__LBB20_40:                             # %land.rhs.i144
                                        # =>This Inner Loop Header: Depth=1
	ldi	r6, __L.str.23
	ldb	r5, r6, r6
	and r1, r3, r1
	cmp	r1, r6
	bne	__LBB20_44
	br	__LBB20_41
__LBB20_41:                             # %if.end.i149
                                        #   in Loop: Header=BB20_40 Depth=1
	ldb	r4, r5, r1
	add	r5, 1
	cmp	r1, r2
	bne	__LBB20_40
	br	__LBB20_42
__LBB20_42:                             # %StringCmp.exit157
	ldi	r1, __L.str.23
	ldb	r5, r1, r1
	ldi	r2, 0
	cmp	r1, r2
	bne	__LBB20_44
	br	__LBB20_43
__LBB20_44:                             # %if.else57
	ldi	r5, 0
	lsw	r1, -92                         # 2-byte Folded Reload
	cmp	r1, r5
	beq	__LBB20_48
	br	__LBB20_45
__LBB20_45:                             # %land.rhs.i159.preheader
	ldi	r2, 0
	ldi	r1, -90
	add	r1, fp, r4
	add	r4, 1
	lsw	r1, -92                         # 2-byte Folded Reload
	movens	r2, r5
__LBB20_46:                             # %land.rhs.i159
                                        # =>This Inner Loop Header: Depth=1
	ldi	r6, __L.str.25
	ldb	r5, r6, r6
	and r1, r3, r1
	cmp	r1, r6
	bne	__LBB20_50
	br	__LBB20_47
__LBB20_47:                             # %if.end.i164
                                        #   in Loop: Header=BB20_46 Depth=1
	ldb	r4, r5, r1
	add	r5, 1
	cmp	r1, r2
	bne	__LBB20_46
	br	__LBB20_48
__LBB20_48:                             # %StringCmp.exit172
	ldi	r1, __L.str.25
	ldb	r5, r1, r1
	ldi	r2, 0
	cmp	r1, r2
	bne	__LBB20_50
	br	__LBB20_49
__LBB20_50:                             # %if.else62
	ldi	r5, 0
	lsw	r1, -92                         # 2-byte Folded Reload
	cmp	r1, r5
	beq	__LBB20_54
	br	__LBB20_51
__LBB20_51:                             # %land.rhs.i174.preheader
	ldi	r2, 0
	ldi	r1, -90
	add	r1, fp, r4
	add	r4, 1
	lsw	r1, -92                         # 2-byte Folded Reload
	movens	r2, r5
__LBB20_52:                             # %land.rhs.i174
                                        # =>This Inner Loop Header: Depth=1
	ldi	r6, __L.str.27
	ldb	r5, r6, r6
	and r1, r3, r1
	cmp	r1, r6
	bne	__LBB20_56
	br	__LBB20_53
__LBB20_53:                             # %if.end.i179
                                        #   in Loop: Header=BB20_52 Depth=1
	ldb	r4, r5, r1
	add	r5, 1
	cmp	r1, r2
	bne	__LBB20_52
	br	__LBB20_54
__LBB20_54:                             # %StringCmp.exit187
	ldi	r1, __L.str.27
	ldb	r5, r1, r1
	ldi	r2, 0
	cmp	r1, r2
	bne	__LBB20_56
	br	__LBB20_55
__LBB20_56:                             # %if.else67
	ldi	r5, 0
	lsw	r1, -92                         # 2-byte Folded Reload
	cmp	r1, r5
	beq	__LBB20_60
	br	__LBB20_57
__LBB20_57:                             # %land.rhs.i189.preheader
	ldi	r2, 0
	ldi	r1, -90
	add	r1, fp, r4
	add	r4, 1
	lsw	r1, -92                         # 2-byte Folded Reload
	movens	r2, r5
__LBB20_58:                             # %land.rhs.i189
                                        # =>This Inner Loop Header: Depth=1
	ldi	r6, __L.str.29
	ldb	r5, r6, r6
	and r1, r3, r1
	cmp	r1, r6
	bne	__LBB20_62
	br	__LBB20_59
__LBB20_59:                             # %if.end.i194
                                        #   in Loop: Header=BB20_58 Depth=1
	ldb	r4, r5, r1
	add	r5, 1
	cmp	r1, r2
	bne	__LBB20_58
	br	__LBB20_60
__LBB20_60:                             # %StringCmp.exit202
	ldi	r1, __L.str.29
	ldb	r5, r1, r1
	ldi	r2, 0
	cmp	r1, r2
	bne	__LBB20_62
	br	__LBB20_61
__LBB20_62:                             # %if.else72
	ldi	r5, 0
	lsw	r1, -92                         # 2-byte Folded Reload
	cmp	r1, r5
	beq	__LBB20_66
	br	__LBB20_63
__LBB20_63:                             # %land.rhs.i204.preheader
	ldi	r2, 0
	ldi	r1, -90
	add	r1, fp, r4
	add	r4, 1
	lsw	r1, -92                         # 2-byte Folded Reload
	movens	r2, r5
__LBB20_64:                             # %land.rhs.i204
                                        # =>This Inner Loop Header: Depth=1
	ldi	r6, __L.str.31
	ldb	r5, r6, r6
	and r1, r3, r1
	cmp	r1, r6
	bne	__LBB20_68
	br	__LBB20_65
__LBB20_65:                             # %if.end.i209
                                        #   in Loop: Header=BB20_64 Depth=1
	ldb	r4, r5, r1
	add	r5, 1
	cmp	r1, r2
	bne	__LBB20_64
	br	__LBB20_66
__LBB20_66:                             # %StringCmp.exit217
	ldi	r1, __L.str.31
	ldb	r5, r1, r1
	ldi	r2, 0
	cmp	r1, r2
	bne	__LBB20_68
	br	__LBB20_67
__LBB20_68:                             # %if.else77
	ldi	r0, CURR_CHAR
	ldi	r1, 69
	stw	r0, r1
	ldi	r1, 114
	stw	r0, r1
	stw	r0, r1
	ldi	r2, 111
	stw	r0, r2
	stw	r0, r1
	ldi	r1, 58
	stw	r0, r1
	ldi	r5, 32
	stw	r0, r5
	ldi	r1, 85
	stw	r0, r1
	ldi	r3, 110
	stw	r0, r3
	ldi	r1, 107
	stw	r0, r1
	stw	r0, r3
	stw	r0, r2
	ldi	r1, 119
	stw	r0, r1
	stw	r0, r3
	stw	r0, r5
	ldi	r1, 99
	stw	r0, r1
	stw	r0, r2
	ldi	r1, 109
	stw	r0, r1
	stw	r0, r1
	ldi	r1, 97
	stw	r0, r1
	stw	r0, r3
	ldi	r1, 100
	stw	r0, r1
	stw	r0, r5
	ldi	r3, 39
	stw	r0, r3
	ldi	r2, 0
	lsw	r1, -92                         # 2-byte Folded Reload
	cmp	r1, r2
	beq	__LBB20_71
	br	__LBB20_69
__LBB20_69:                             # %while.body.i226.preheader
	ldi	r1, -90
	add	r1, fp, r4
	lsw	r1, -92                         # 2-byte Folded Reload
	add	r4, 1
__LBB20_70:                             # %while.body.i226
                                        # =>This Inner Loop Header: Depth=1
	sxt	r1, r1
	stw	r0, r1
	ldb	r4, r1
	add	r4, 1
	cmp	r1, r2
	bne	__LBB20_70
	br	__LBB20_71
__LBB20_71:                             # %print.exit232
	stw	r0, r3
	ldi	r2, 46
	stw	r0, r2
	stw	r0, r5
	ldi	r1, 84
	stw	r0, r1
	ldi	r1, 121
	stw	r0, r1
	ldi	r1, 112
	stw	r0, r1
	ldi	r4, 101
	stw	r0, r4
	stw	r0, r5
	stw	r0, r3
	ldi	r5, 104
	stw	r0, r5
	stw	r0, r4
	ldi	r4, 108
	stw	r0, r4
	stw	r0, r1
	stw	r0, r3
	stw	r0, r2
	ldi	r1, 10
	stw	r0, r1
__LBB20_72:                             # %cleanup87
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	92
	pop	fp
	rts
__LBB20_25:                             # %if.then42
	jsr	SetCmd
	br	__LBB20_72
__LBB20_31:                             # %if.then46
	jsr	RuleCmdWrapper
	br	__LBB20_72
__LBB20_37:                             # %if.then51
	ldi	r0, START_STOP
	ldi	r1, 0
	stw	r0, r1
	ldi	r0, CURR_CHAR
	ldi	r1, 71
	stw	r0, r1
	ldi	r1, 97
	stw	r0, r1
	ldi	r1, 109
	stw	r0, r1
	ldi	r1, 101
	stw	r0, r1
	ldi	r2, 32
	stw	r0, r2
	ldi	r2, 115
	stw	r0, r2
	ldi	r2, 116
	stw	r0, r2
	ldi	r2, 111
	stw	r0, r2
	ldi	r2, 112
	stw	r0, r2
	stw	r0, r2
	stw	r0, r1
	ldi	r1, 100
	stw	r0, r1
	ldi	r1, 46
	stw	r0, r1
	ldi	r1, 10
	stw	r0, r1
	br	__LBB20_72
__LBB20_43:                             # %if.then56
	jsr	StartCmd
	br	__LBB20_72
__LBB20_49:                             # %if.then61
	jsr	FillCmdWrapper
	br	__LBB20_72
__LBB20_55:                             # %if.then66
	jsr	CleanCmd
	br	__LBB20_72
__LBB20_61:                             # %if.then71
	jsr	HelpCmd
	br	__LBB20_72
__LBB20_67:                             # %if.then76
	jsr	SetGliderCmdWrapper
	br	__LBB20_72
                                        # -- End function
main>                                   # -- Begin function main
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	0
	ldi	r0, CURR_CHAR
	ldi	r1, 105
	stw	r0, r1
	ldi	r2, 110
	stw	r0, r2
	ldi	r3, 32
	stw	r0, r3
	ldi	r3, 109
	stw	r0, r3
	ldi	r3, 97
	stw	r0, r3
	stw	r0, r1
	stw	r0, r2
	ldi	r1, 10
	stw	r0, r1
	jsr	parse
	ldi	r0, 0
	addsp	0
	pop	fp
	rts
                                        # -- End function
### SECTION: .bss
queue>                                  # @queue
	ds	64

head>                                   # @head
	dc	0                               # 0x0

end>                                    # @end
	dc	0                               # 0x0

### SECTION: .rodata.str1.1
__L.str.13:                             # @.str.13
	db	32
	db	102
	db	105
	db	108
	db	108
	db	32
	db	60
	db	120
	db	49
	db	62
	db	32
	db	60
	db	121
	db	49
	db	62
	db	32
	db	60
	db	120
	db	50
	db	62
	db	32
	db	60
	db	121
	db	50
	db	62
	db	32
	db	60
	db	118
	db	97
	db	108
	db	62
	db	32
	db	45
	db	32
	db	102
	db	105
	db	108
	db	108
	db	32
	db	114
	db	101
	db	99
	db	116
	db	32
	db	40
	db	120
	db	49
	db	44
	db	121
	db	49
	db	41
	db	45
	db	40
	db	120
	db	50
	db	45
	db	49
	db	44
	db	121
	db	50
	db	45
	db	49
	db	41
	db	10
	db	0

__L.str.17:                             # @.str.17
	db	115
	db	101
	db	116
	db	0

__L.str.18:                             # @.str.18
	db	85
	db	115
	db	97
	db	103
	db	101
	db	58
	db	32
	db	115
	db	101
	db	116
	db	32
	db	60
	db	120
	db	62
	db	32
	db	60
	db	121
	db	62
	db	32
	db	60
	db	118
	db	97
	db	108
	db	62
	db	10
	db	32
	db	83
	db	101
	db	116
	db	115
	db	32
	db	99
	db	101
	db	108
	db	108
	db	32
	db	40
	db	120
	db	44
	db	121
	db	41
	db	32
	db	116
	db	111
	db	32
	db	118
	db	97
	db	108
	db	117
	db	101
	db	32
	db	40
	db	48
	db	32
	db	111
	db	114
	db	32
	db	49
	db	41
	db	46
	db	10
	db	0

__L.str.19:                             # @.str.19
	db	114
	db	117
	db	108
	db	101
	db	0

__L.str.20:                             # @.str.20
	db	85
	db	115
	db	97
	db	103
	db	101
	db	58
	db	32
	db	114
	db	117
	db	108
	db	101
	db	32
	db	60
	db	98
	db	111
	db	114
	db	110
	db	62
	db	32
	db	60
	db	115
	db	117
	db	114
	db	62
	db	10
	db	32
	db	83
	db	101
	db	116
	db	115
	db	32
	db	67
	db	111
	db	110
	db	119
	db	97
	db	121
	db	39
	db	115
	db	32
	db	71
	db	97
	db	109
	db	101
	db	32
	db	111
	db	102
	db	32
	db	76
	db	105
	db	102
	db	101
	db	32
	db	114
	db	117
	db	108
	db	101
	db	115
	db	46
	db	10
	db	0

__L.str.21:                             # @.str.21
	db	115
	db	116
	db	111
	db	112
	db	0

__L.str.23:                             # @.str.23
	db	115
	db	116
	db	97
	db	114
	db	116
	db	0

__L.str.25:                             # @.str.25
	db	102
	db	105
	db	108
	db	108
	db	0

__L.str.26:                             # @.str.26
	db	85
	db	115
	db	97
	db	103
	db	101
	db	58
	db	32
	db	102
	db	105
	db	108
	db	108
	db	32
	db	60
	db	120
	db	49
	db	62
	db	32
	db	60
	db	121
	db	49
	db	62
	db	32
	db	60
	db	120
	db	50
	db	62
	db	32
	db	60
	db	121
	db	50
	db	62
	db	32
	db	60
	db	118
	db	97
	db	108
	db	62
	db	10
	db	32
	db	70
	db	105
	db	108
	db	108
	db	115
	db	32
	db	114
	db	101
	db	99
	db	116
	db	97
	db	110
	db	103
	db	108
	db	101
	db	32
	db	119
	db	105
	db	116
	db	104
	db	32
	db	118
	db	97
	db	108
	db	117
	db	101
	db	46
	db	10
	db	0

__L.str.27:                             # @.str.27
	db	99
	db	108
	db	101
	db	97
	db	110
	db	0

__L.str.29:                             # @.str.29
	db	104
	db	101
	db	108
	db	112
	db	0

__L.str.30:                             # @.str.30
	db	85
	db	115
	db	97
	db	103
	db	101
	db	58
	db	32
	db	104
	db	101
	db	108
	db	112
	db	32
	db	91
	db	99
	db	111
	db	109
	db	109
	db	97
	db	110
	db	100
	db	93
	db	10
	db	32
	db	83
	db	104
	db	111
	db	119
	db	115
	db	32
	db	103
	db	101
	db	110
	db	101
	db	114
	db	97
	db	108
	db	32
	db	111
	db	114
	db	32
	db	99
	db	111
	db	109
	db	109
	db	97
	db	110
	db	100
	db	45
	db	115
	db	112
	db	101
	db	99
	db	105
	db	102
	db	105
	db	99
	db	32
	db	104
	db	101
	db	108
	db	112
	db	46
	db	10
	db	0

__L.str.31:                             # @.str.31
	db	115
	db	101
	db	116
	db	45
	db	103
	db	108
	db	105
	db	100
	db	101
	db	114
	db	0

__L.str.36:                             # @.str.36
	db	69
	db	114
	db	114
	db	111
	db	114
	db	58
	db	32
	db	73
	db	110
	db	118
	db	97
	db	108
	db	105
	db	100
	db	32
	db	97
	db	114
	db	103
	db	117
	db	109
	db	101
	db	110
	db	116
	db	115
	db	32
	db	102
	db	111
	db	114
	db	32
	db	39
	db	114
	db	117
	db	108
	db	101
	db	39
	db	46
	db	32
	db	85
	db	115
	db	97
	db	103
	db	101
	db	58
	db	32
	db	114
	db	117
	db	108
	db	101
	db	32
	db	60
	db	98
	db	111
	db	114
	db	110
	db	62
	db	32
	db	60
	db	115
	db	117
	db	114
	db	62
	db	10
	db	0

__L.str.38:                             # @.str.38
	db	69
	db	114
	db	114
	db	111
	db	114
	db	58
	db	32
	db	73
	db	110
	db	118
	db	97
	db	108
	db	105
	db	100
	db	32
	db	97
	db	114
	db	103
	db	117
	db	109
	db	101
	db	110
	db	116
	db	115
	db	32
	db	102
	db	111
	db	114
	db	32
	db	39
	db	115
	db	101
	db	116
	db	45
	db	103
	db	108
	db	105
	db	100
	db	101
	db	114
	db	39
	db	46
	db	32
	db	85
	db	115
	db	97
	db	103
	db	101
	db	58
	db	32
	db	115
	db	101
	db	116
	db	45
	db	103
	db	108
	db	105
	db	100
	db	101
	db	114
	db	32
	db	60
	db	120
	db	62
	db	32
	db	60
	db	121
	db	62
	db	10
	db	0

__L.str.39:                             # @.str.39
	db	69
	db	114
	db	114
	db	111
	db	114
	db	58
	db	32
	db	73
	db	110
	db	118
	db	97
	db	108
	db	105
	db	100
	db	32
	db	97
	db	114
	db	103
	db	117
	db	109
	db	101
	db	110
	db	116
	db	115
	db	32
	db	102
	db	111
	db	114
	db	32
	db	39
	db	115
	db	101
	db	116
	db	39
	db	46
	db	32
	db	85
	db	115
	db	97
	db	103
	db	101
	db	58
	db	32
	db	115
	db	101
	db	116
	db	32
	db	60
	db	120
	db	62
	db	32
	db	60
	db	121
	db	62
	db	32
	db	60
	db	118
	db	97
	db	108
	db	62
	db	10
	db	0

__L.str.40:                             # @.str.40
	db	69
	db	114
	db	114
	db	111
	db	114
	db	58
	db	32
	db	73
	db	110
	db	118
	db	97
	db	108
	db	105
	db	100
	db	32
	db	97
	db	114
	db	103
	db	117
	db	109
	db	101
	db	110
	db	116
	db	115
	db	32
	db	102
	db	111
	db	114
	db	32
	db	39
	db	102
	db	105
	db	108
	db	108
	db	39
	db	46
	db	32
	db	85
	db	115
	db	97
	db	103
	db	101
	db	58
	db	32
	db	102
	db	105
	db	108
	db	108
	db	32
	db	60
	db	120
	db	49
	db	62
	db	32
	db	60
	db	121
	db	49
	db	62
	db	32
	db	60
	db	120
	db	50
	db	62
	db	32
	db	60
	db	121
	db	50
	db	62
	db	32
	db	60
	db	118
	db	97
	db	108
	db	62
	db	10
	db	0

end.
