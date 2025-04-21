### SECTION: .text
rsect ___src_main_c_41

memset: ext
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
	blt	__LBB1_3
	br	__LBB1_1
__LBB1_1:                               # %land.lhs.true
	lssb	r0, -3
	ldi	r1, 57
	cmp	r0, r1
	bgt	__LBB1_3
	br	__LBB1_2
__LBB1_2:                               # %if.then
	ldi	r0, 1
	ssw	r0, -2
	br	__LBB1_4
__LBB1_3:                               # %if.end
	ldi	r0, 0
	ssw	r0, -2
	br	__LBB1_4
__LBB1_4:                               # %return
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
	blt	__LBB2_3
	br	__LBB2_1
__LBB2_1:                               # %land.lhs.true
	lssb	r0, -3
	ldi	r1, 122
	cmp	r0, r1
	bgt	__LBB2_3
	br	__LBB2_2
__LBB2_2:                               # %if.then
	ldi	r0, 1
	ssw	r0, -2
	br	__LBB2_9
__LBB2_3:                               # %if.end
	lssb	r0, -3
	ldi	r1, 65
	cmp	r0, r1
	blt	__LBB2_6
	br	__LBB2_4
__LBB2_4:                               # %land.lhs.true8
	lssb	r0, -3
	ldi	r1, 90
	cmp	r0, r1
	bgt	__LBB2_6
	br	__LBB2_5
__LBB2_5:                               # %if.then12
	ldi	r0, 1
	ssw	r0, -2
	br	__LBB2_9
__LBB2_6:                               # %if.end13
	lssb	r0, -3
	ldi	r1, 45
	cmp	r0, r1
	bne	__LBB2_8
	br	__LBB2_7
__LBB2_7:                               # %if.then17
	ldi	r0, 1
	ssw	r0, -2
	br	__LBB2_9
__LBB2_8:                               # %if.end18
	ldi	r0, 0
	ssw	r0, -2
	br	__LBB2_9
__LBB2_9:                               # %return
	lsw	r0, -2
	addsp	4
	pop	fp
	rts
                                        # -- End function
print>                                  # -- Begin function print
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-4
	shr	r0, r1, 8
	ldi	r2, -2
	add	r2, fp, r2
	ldi	r3, 1
	stb	r2, r3, r1
	ssb	r0, -2
	ldi	r0, 0
	ssw	r0, -4
	br	__LBB3_1
__LBB3_1:                               # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	ldi	r0, -2
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -2
	or r0, r1, r0
	lsw	r1, -4
	ldsb	r0, r1, r0
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB3_3
	br	__LBB3_2
__LBB3_2:                               # %while.body
                                        #   in Loop: Header=BB3_1 Depth=1
	ldi	r0, -2
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -2
	or r0, r1, r0
	lsw	r1, -4
	movens	r1, r2
	add	r2, 1
	ssw	r2, -4
	ldsb	r0, r1, r0
	ldi	r1, CURR_CHAR
	stw	r1, r0
	br	__LBB3_1
__LBB3_3:                               # %while.end
	addsp	4
	pop	fp
	rts
                                        # -- End function
StringLen>                              # -- Begin function StringLen
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-4
	shr	r0, r1, 8
	ldi	r2, -2
	add	r2, fp, r2
	ldi	r3, 1
	stb	r2, r3, r1
	ssb	r0, -2
	ldi	r0, 0
	ssw	r0, -4
	br	__LBB4_1
__LBB4_1:                               # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	ldi	r0, -2
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -2
	or r0, r1, r0
	lsw	r1, -4
	ldsb	r0, r1, r0
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB4_3
	br	__LBB4_2
__LBB4_2:                               # %while.body
                                        #   in Loop: Header=BB4_1 Depth=1
	lsw	r0, -4
	add	r0, 1
	ssw	r0, -4
	br	__LBB4_1
__LBB4_3:                               # %while.end
	lsw	r0, -4
	addsp	4
	pop	fp
	rts
                                        # -- End function
StringCmp>                              # -- Begin function StringCmp
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-22
	ssw	r4, -2                          # 2-byte Folded Spill
	shr	r0, r2, 8
	ldi	r3, -6
	add	r3, fp, r4
	ldi	r3, 1
	stb	r4, r3, r2
	ssb	r0, -6
	shr	r1, r0, 8
	ldi	r2, -8
	add	r2, fp, r2
	stb	r2, r3, r0
	ssb	r1, -8
	ldi	r0, 0
	ssw	r0, -10
	br	__LBB5_1
__LBB5_1:                               # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	ldi	r0, -6
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -6
	or r0, r1, r0
	lsw	r1, -10
	ldsb	r0, r1, r1
	ldi	r0, 0
	cmp	r1, r0
	ssw	r0, -12                         # 2-byte Folded Spill
	beq	__LBB5_3
	br	__LBB5_2
__LBB5_2:                               # %land.rhs
                                        #   in Loop: Header=BB5_1 Depth=1
	ldi	r0, -8
	add	r0, fp, r1
	ldi	r0, 1
	ldb	r1, r0, r1
	shl	r1, r1, 8
	lsb	r2, -8
	or r1, r2, r1
	lsw	r2, -10
	ldsb	r1, r2, r1
	ldi	r2, 0
	ssw	r2, -16                         # 2-byte Folded Spill
	cmp	r1, r2
	ssw	r0, -14                         # 2-byte Folded Spill
	bne	__LBB5_12
# %bb.11:                               # %land.rhs
                                        #   in Loop: Header=BB5_1 Depth=1
	lsw	r0, -16                         # 2-byte Folded Reload
	ssw	r0, -14                         # 2-byte Folded Spill
__LBB5_12:                              # %land.rhs
                                        #   in Loop: Header=BB5_1 Depth=1
	lsw	r0, -14                         # 2-byte Folded Reload
	ssw	r0, -12                         # 2-byte Folded Spill
	br	__LBB5_3
__LBB5_3:                               # %land.end
                                        #   in Loop: Header=BB5_1 Depth=1
	lsw	r0, -12                         # 2-byte Folded Reload
	ldi	r1, 1
	and r0, r1, r0
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB5_7
	br	__LBB5_4
__LBB5_4:                               # %while.body
                                        #   in Loop: Header=BB5_1 Depth=1
	ldi	r0, -6
	add	r0, fp, r0
	ldi	r3, 1
	ldb	r0, r3, r0
	shl	r0, r0, 8
	lsb	r1, -6
	or r0, r1, r0
	lsw	r2, -10
	ldsb	r0, r2, r0
	ldi	r1, -8
	add	r1, fp, r1
	ldb	r1, r3, r1
	shl	r1, r1, 8
	lsb	r3, -8
	or r1, r3, r1
	ldsb	r1, r2, r1
	cmp	r0, r1
	beq	__LBB5_6
	br	__LBB5_5
__LBB5_5:                               # %if.then
	ldi	r0, 0
	ssw	r0, -4
	br	__LBB5_10
__LBB5_6:                               # %if.end
                                        #   in Loop: Header=BB5_1 Depth=1
	lsw	r0, -10
	add	r0, 1
	ssw	r0, -10
	br	__LBB5_1
__LBB5_7:                               # %while.end
	ldi	r0, -6
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -6
	or r0, r1, r0
	lsw	r1, -10
	ldsb	r0, r1, r1
	ldi	r0, 0
	cmp	r1, r0
	ssw	r0, -18                         # 2-byte Folded Spill
	bne	__LBB5_9
	br	__LBB5_8
__LBB5_8:                               # %land.rhs16
	ldi	r0, -8
	add	r0, fp, r1
	ldi	r0, 1
	ldb	r1, r0, r1
	shl	r1, r1, 8
	lsb	r2, -8
	or r1, r2, r1
	lsw	r2, -10
	ldsb	r1, r2, r1
	ldi	r2, 0
	ssw	r2, -22                         # 2-byte Folded Spill
	cmp	r1, r2
	ssw	r0, -20                         # 2-byte Folded Spill
	beq	__LBB5_14
# %bb.13:                               # %land.rhs16
	lsw	r0, -22                         # 2-byte Folded Reload
	ssw	r0, -20                         # 2-byte Folded Spill
__LBB5_14:                              # %land.rhs16
	lsw	r0, -20                         # 2-byte Folded Reload
	ssw	r0, -18                         # 2-byte Folded Spill
	br	__LBB5_9
__LBB5_9:                               # %land.end21
	lsw	r0, -18                         # 2-byte Folded Reload
	ldi	r1, 1
	and r0, r1, r0
	ssw	r0, -4
	br	__LBB5_10
__LBB5_10:                              # %return
	lsw	r0, -4
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	22
	pop	fp
	rts
                                        # -- End function
my_mul>                                 # -- Begin function my_mul
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-8
	ssw	r0, -2
	ssw	r1, -4
	ldi	r0, 0
	ssw	r0, -6
	ssw	r0, -8
	br	__LBB6_1
__LBB6_1:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	lsw	r0, -8
	lsw	r1, -4
	cmp	r0, r1
	bge	__LBB6_4
	br	__LBB6_2
__LBB6_2:                               # %for.body
                                        #   in Loop: Header=BB6_1 Depth=1
	lsw	r1, -2
	lsw	r0, -6
	add r0, r1, r0
	ssw	r0, -6
	br	__LBB6_3
__LBB6_3:                               # %for.inc
                                        #   in Loop: Header=BB6_1 Depth=1
	lsw	r0, -8
	add	r0, 1
	ssw	r0, -8
	br	__LBB6_1
__LBB6_4:                               # %for.end
	lsw	r0, -6
	addsp	8
	pop	fp
	rts
                                        # -- End function
my_atoi>                                # -- Begin function my_atoi
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-10
	ssw	r4, -2                          # 2-byte Folded Spill
	shr	r0, r1, 8
	ldi	r2, -4
	add	r2, fp, r2
	ldi	r3, 1
	stb	r2, r3, r1
	ssb	r0, -4
	ldi	r0, 0
	ssw	r0, -6
	ssw	r0, -8
	br	__LBB7_1
__LBB7_1:                               # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	ldi	r0, -4
	add	r0, fp, r0
	ldi	r2, 1
	ldb	r0, r2, r0
	shl	r0, r0, 8
	lsb	r1, -4
	or r0, r1, r0
	ldb	r0, r1
	ldb	r0, r2, r0
	shl	r0, r0, 8
	or r0, r1, r0
	ldsb	r0, r0
	ldi	r1, 32
	cmp	r0, r1
	bne	__LBB7_3
	br	__LBB7_2
__LBB7_2:                               # %while.body
                                        #   in Loop: Header=BB7_1 Depth=1
	ldi	r0, -4
	add	r0, fp, r0
	ldi	r3, 1
	ldb	r0, r3, r0
	shl	r0, r0, 8
	lsb	r1, -4
	or r0, r1, r1
	ldb	r1, r2
	ldb	r1, r3, r0
	shl	r0, r0, 8
	or r0, r2, r0
	add	r0, 1
	shr	r0, r2, 8
	stb	r1, r3, r2
	stb	r1, r0
	br	__LBB7_1
__LBB7_3:                               # %while.end
	br	__LBB7_4
__LBB7_4:                               # %while.cond2
                                        # =>This Inner Loop Header: Depth=1
	ldi	r0, -4
	add	r0, fp, r0
	ldi	r2, 1
	ldb	r0, r2, r0
	shl	r0, r0, 8
	lsb	r1, -4
	or r0, r1, r0
	ldb	r0, r1
	ldb	r0, r2, r0
	shl	r0, r0, 8
	or r0, r1, r0
	ldsb	r0, r0
	jsr	isNum
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB7_6
	br	__LBB7_5
__LBB7_5:                               # %while.body3
                                        #   in Loop: Header=BB7_4 Depth=1
	lsw	r0, -6
	ldi	r1, 10
	jsr	my_mul
	movens	r0, r2
	ldi	r0, -4
	add	r0, fp, r0
	ldi	r3, 1
	ldb	r0, r3, r1
	shl	r1, r1, 8
	lsb	r4, -4
	or r1, r4, r1
	ldb	r1, r4
	ldb	r1, r3, r1
	shl	r1, r1, 8
	or r1, r4, r1
	ldsb	r1, r1
	add r1, r2, r1
	sub	r1, 48
	ssw	r1, -6
	ldb	r0, r3, r0
	shl	r0, r0, 8
	lsb	r1, -4
	or r0, r1, r1
	ldb	r1, r2
	ldb	r1, r3, r0
	shl	r0, r0, 8
	or r0, r2, r0
	add	r0, 1
	shr	r0, r2, 8
	stb	r1, r3, r2
	stb	r1, r0
	lsw	r0, -8
	add	r0, 1
	ssw	r0, -8
	br	__LBB7_4
__LBB7_6:                               # %while.end7
	lsw	r0, -8
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB7_8
	br	__LBB7_7
__LBB7_7:                               # %cond.true
	lsw	r0, -6
	ssw	r0, -10                         # 2-byte Folded Spill
	br	__LBB7_9
__LBB7_8:                               # %cond.false
	ldi	r0, -1
	ssw	r0, -10                         # 2-byte Folded Spill
	br	__LBB7_9
__LBB7_9:                               # %cond.end
	lsw	r0, -10                         # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	10
	pop	fp
	rts
                                        # -- End function
SetCommand>                             # -- Begin function SetCommand
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-6
	ssw	r0, -2
	ssw	r1, -4
	ssw	r2, -6
	lsw	r0, -2
	ldi	r1, 0
	cmp	r0, r1
	blt	__LBB8_4
	br	__LBB8_1
__LBB8_1:                               # %lor.lhs.false
	lsw	r0, -2
	ldi	r1, 31
	cmp	r0, r1
	bgt	__LBB8_4
	br	__LBB8_2
__LBB8_2:                               # %lor.lhs.false2
	lsw	r0, -4
	ldi	r1, 0
	cmp	r0, r1
	blt	__LBB8_4
	br	__LBB8_3
__LBB8_3:                               # %lor.lhs.false4
	lsw	r0, -4
	ldi	r1, 32
	cmp	r0, r1
	blt	__LBB8_5
	br	__LBB8_4
__LBB8_4:                               # %if.then
	ldi	r0, __L.str
	jsr	print
	br	__LBB8_9
__LBB8_5:                               # %if.end
	lsw	r0, -6
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB8_8
	br	__LBB8_6
__LBB8_6:                               # %land.lhs.true
	lsw	r0, -6
	ldi	r1, 1
	cmp	r0, r1
	beq	__LBB8_8
	br	__LBB8_7
__LBB8_7:                               # %if.then8
	ldi	r0, __L.str.1
	jsr	print
	br	__LBB8_9
__LBB8_8:                               # %if.end9
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
	br	__LBB8_9
__LBB8_9:                               # %return
	addsp	6
	pop	fp
	rts
                                        # -- End function
StartCmd>                               # -- Begin function StartCmd
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	0
	ldi	r1, START_STOP
	ldi	r0, 1
	stw	r1, r0
	ldi	r0, __L.str.2
	jsr	print
	addsp	0
	pop	fp
	rts
                                        # -- End function
StopCmd>                                # -- Begin function StopCmd
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	0
	ldi	r1, START_STOP
	ldi	r0, 0
	stw	r1, r0
	ldi	r0, __L.str.3
	jsr	print
	addsp	0
	pop	fp
	rts
                                        # -- End function
FillCmd>                                # -- Begin function FillCmd
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
	ldi	r1, 0
	cmp	r0, r1
	blt	__LBB11_8
	br	__LBB11_1
__LBB11_1:                              # %lor.lhs.false
	ldi	r0, -6
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -6
	or r0, r1, r0
	ldw	r0, r0
	ldi	r1, 31
	cmp	r0, r1
	bgt	__LBB11_8
	br	__LBB11_2
__LBB11_2:                              # %lor.lhs.false3
	ldi	r0, -6
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -6
	or r0, r1, r0
	ldi	r1, 2
	ldw	r0, r1, r0
	ldi	r1, 0
	cmp	r0, r1
	blt	__LBB11_8
	br	__LBB11_3
__LBB11_3:                              # %lor.lhs.false6
	ldi	r0, -6
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -6
	or r0, r1, r0
	ldi	r1, 2
	ldw	r0, r1, r0
	ldi	r1, 31
	cmp	r0, r1
	bgt	__LBB11_8
	br	__LBB11_4
__LBB11_4:                              # %lor.lhs.false9
	ldi	r0, -8
	add	r0, fp, r0
	ldi	r2, 1
	ldb	r0, r2, r0
	shl	r0, r0, 8
	lsb	r1, -8
	or r0, r1, r0
	ldw	r0, r0
	ldi	r1, -6
	add	r1, fp, r1
	ldb	r1, r2, r1
	shl	r1, r1, 8
	lsb	r2, -6
	or r1, r2, r1
	ldw	r1, r1
	cmp	r0, r1
	ble	__LBB11_8
	br	__LBB11_5
__LBB11_5:                              # %lor.lhs.false13
	ldi	r0, -8
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -8
	or r0, r1, r0
	ldw	r0, r0
	ldi	r1, 32
	cmp	r0, r1
	bgt	__LBB11_8
	br	__LBB11_6
__LBB11_6:                              # %lor.lhs.false16
	ldi	r0, -8
	add	r0, fp, r0
	ldi	r3, 1
	ldb	r0, r3, r0
	shl	r0, r0, 8
	lsb	r1, -8
	or r0, r1, r0
	ldi	r2, 2
	ldw	r0, r2, r0
	ldi	r1, -6
	add	r1, fp, r1
	ldb	r1, r3, r1
	shl	r1, r1, 8
	lsb	r3, -6
	or r1, r3, r1
	ldw	r1, r2, r1
	cmp	r0, r1
	ble	__LBB11_8
	br	__LBB11_7
__LBB11_7:                              # %lor.lhs.false20
	ldi	r0, -8
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -8
	or r0, r1, r0
	ldi	r1, 2
	ldw	r0, r1, r0
	ldi	r1, 33
	cmp	r0, r1
	blt	__LBB11_9
	br	__LBB11_8
__LBB11_8:                              # %if.then
	ldi	r0, __L.str.4
	jsr	print
	br	__LBB11_21
__LBB11_9:                              # %if.end
	lsw	r0, -10
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB11_12
	br	__LBB11_10
__LBB11_10:                             # %land.lhs.true
	lsw	r0, -10
	ldi	r1, 1
	cmp	r0, r1
	beq	__LBB11_12
	br	__LBB11_11
__LBB11_11:                             # %if.then25
	ldi	r0, __L.str.1
	jsr	print
	br	__LBB11_21
__LBB11_12:                             # %if.end26
	ldi	r0, -6
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -6
	or r0, r1, r0
	ldw	r0, r0
	ssw	r0, -12
	br	__LBB11_13
__LBB11_13:                             # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB11_15 Depth 2
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
	bgt	__LBB11_20
	br	__LBB11_14
__LBB11_14:                             # %for.body
                                        #   in Loop: Header=BB11_13 Depth=1
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
	br	__LBB11_15
__LBB11_15:                             # %for.cond31
                                        #   Parent Loop BB11_13 Depth=1
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
	bgt	__LBB11_18
	br	__LBB11_16
__LBB11_16:                             # %for.body34
                                        #   in Loop: Header=BB11_15 Depth=2
	lsw	r0, -12
	lsw	r1, -14
	lsw	r2, -10
	jsr	SetCommand
	br	__LBB11_17
__LBB11_17:                             # %for.inc
                                        #   in Loop: Header=BB11_15 Depth=2
	lsw	r0, -14
	add	r0, 1
	ssw	r0, -14
	br	__LBB11_15
__LBB11_18:                             # %for.end
                                        #   in Loop: Header=BB11_13 Depth=1
	br	__LBB11_19
__LBB11_19:                             # %for.inc35
                                        #   in Loop: Header=BB11_13 Depth=1
	lsw	r0, -12
	add	r0, 1
	ssw	r0, -12
	br	__LBB11_13
__LBB11_20:                             # %for.end37
	ldi	r0, __L.str.5
	jsr	print
	br	__LBB11_21
__LBB11_21:                             # %return
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	14
	pop	fp
	rts
                                        # -- End function
CleanCmd>                               # -- Begin function CleanCmd
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
	ldi	r1, __L__const.CleanCmd.e+2
	ldw	r1, r3
	ldi	r1, -10
	add	r1, fp, r1
	stw	r1, r4, r3
	ldi	r3, __L__const.CleanCmd.e
	ldw	r3, r3
	ssw	r3, -10
	jsr	FillCmd
	ldi	r0, __L.str.6
	jsr	print
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	10
	pop	fp
	rts
                                        # -- End function
HelpCmd>                                # -- Begin function HelpCmd
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-2
	movens	r0, r2
	shr	r2, r3, 8
	ldi	r0, -2
	add	r0, fp, r0
	ldi	r1, 1
	stb	r0, r1, r3
	ssb	r2, -2
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -2
	or r0, r1, r0
	ldi	r1, __L.str.7
	jsr	StringCmp
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB13_2
	br	__LBB13_1
__LBB13_1:                              # %if.then
	ldi	r0, __L.str.8
	jsr	print
	ldi	r0, __L.str.9
	jsr	print
	ldi	r0, __L.str.10
	jsr	print
	ldi	r0, __L.str.11
	jsr	print
	ldi	r0, __L.str.12
	jsr	print
	ldi	r0, __L.str.13
	jsr	print
	ldi	r0, __L.str.14
	jsr	print
	ldi	r0, __L.str.15
	jsr	print
	ldi	r0, __L.str.16
	jsr	print
	br	__LBB13_27
__LBB13_2:                              # %if.else
	ldi	r0, -2
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -2
	or r0, r1, r0
	ldi	r1, __L.str.17
	jsr	StringCmp
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB13_4
	br	__LBB13_3
__LBB13_3:                              # %if.then3
	ldi	r0, __L.str.18
	jsr	print
	br	__LBB13_26
__LBB13_4:                              # %if.else4
	ldi	r0, -2
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -2
	or r0, r1, r0
	ldi	r1, __L.str.19
	jsr	StringCmp
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB13_6
	br	__LBB13_5
__LBB13_5:                              # %if.then7
	ldi	r0, __L.str.20
	jsr	print
	br	__LBB13_25
__LBB13_6:                              # %if.else8
	ldi	r0, -2
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -2
	or r0, r1, r0
	ldi	r1, __L.str.21
	jsr	StringCmp
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB13_8
	br	__LBB13_7
__LBB13_7:                              # %if.then11
	ldi	r0, __L.str.22
	jsr	print
	br	__LBB13_24
__LBB13_8:                              # %if.else12
	ldi	r0, -2
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -2
	or r0, r1, r0
	ldi	r1, __L.str.23
	jsr	StringCmp
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB13_10
	br	__LBB13_9
__LBB13_9:                              # %if.then15
	ldi	r0, __L.str.24
	jsr	print
	br	__LBB13_23
__LBB13_10:                             # %if.else16
	ldi	r0, -2
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -2
	or r0, r1, r0
	ldi	r1, __L.str.25
	jsr	StringCmp
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB13_12
	br	__LBB13_11
__LBB13_11:                             # %if.then19
	ldi	r0, __L.str.26
	jsr	print
	br	__LBB13_22
__LBB13_12:                             # %if.else20
	ldi	r0, -2
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -2
	or r0, r1, r0
	ldi	r1, __L.str.27
	jsr	StringCmp
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB13_14
	br	__LBB13_13
__LBB13_13:                             # %if.then23
	ldi	r0, __L.str.28
	jsr	print
	br	__LBB13_21
__LBB13_14:                             # %if.else24
	ldi	r0, -2
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -2
	or r0, r1, r0
	ldi	r1, __L.str.29
	jsr	StringCmp
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB13_16
	br	__LBB13_15
__LBB13_15:                             # %if.then27
	ldi	r0, __L.str.30
	jsr	print
	br	__LBB13_20
__LBB13_16:                             # %if.else28
	ldi	r0, -2
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -2
	or r0, r1, r0
	ldi	r1, __L.str.31
	jsr	StringCmp
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB13_18
	br	__LBB13_17
__LBB13_17:                             # %if.then31
	ldi	r0, __L.str.32
	jsr	print
	br	__LBB13_19
__LBB13_18:                             # %if.else32
	ldi	r0, __L.str.33
	jsr	print
	ldi	r0, -2
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -2
	or r0, r1, r0
	jsr	print
	ldi	r0, __L.str.34
	jsr	print
	br	__LBB13_19
__LBB13_19:                             # %if.end
	br	__LBB13_20
__LBB13_20:                             # %if.end33
	br	__LBB13_21
__LBB13_21:                             # %if.end34
	br	__LBB13_22
__LBB13_22:                             # %if.end35
	br	__LBB13_23
__LBB13_23:                             # %if.end36
	br	__LBB13_24
__LBB13_24:                             # %if.end37
	br	__LBB13_25
__LBB13_25:                             # %if.end38
	br	__LBB13_26
__LBB13_26:                             # %if.end39
	br	__LBB13_27
__LBB13_27:                             # %if.end40
	addsp	2
	pop	fp
	rts
                                        # -- End function
RuleCmd>                                # -- Begin function RuleCmd
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
	ldi	r0, __L.str.35
	jsr	print
	addsp	4
	pop	fp
	rts
                                        # -- End function
RuleCmdWrapper>                         # -- Begin function RuleCmdWrapper
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-8
	movens	r0, r1
	shr	r1, r2, 8
	ldi	r0, -2
	add	r0, fp, r0
	ssw	r0, -8                          # 2-byte Folded Spill
	ldi	r3, 1
	stb	r0, r3, r2
	ssb	r1, -2
	jsr	my_atoi
	movens	r0, r1
	lsw	r0, -8                          # 2-byte Folded Reload
	ssw	r1, -4
	jsr	my_atoi
	ssw	r0, -6
	lsw	r0, -4
	ldi	r1, -1
	cmp	r0, r1
	beq	__LBB15_2
	br	__LBB15_1
__LBB15_1:                              # %lor.lhs.false
	lsw	r0, -6
	ldi	r1, -1
	cmp	r0, r1
	bne	__LBB15_3
	br	__LBB15_2
__LBB15_2:                              # %if.then
	ldi	r0, __L.str.36
	jsr	print
	br	__LBB15_4
__LBB15_3:                              # %if.else
	lsw	r0, -4
	lsw	r1, -6
	jsr	RuleCmd
	br	__LBB15_4
__LBB15_4:                              # %if.end
	addsp	8
	pop	fp
	rts
                                        # -- End function
SetGliderCmd>                           # -- Begin function SetGliderCmd
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-6
	ssw	r0, -2
	ssw	r1, -4
	ldi	r0, __L.str.37
	jsr	print
	lsw	r0, -2
	add	r0, 1
	lsw	r1, -4
	ldi	r2, 1
	ssw	r2, -6                          # 2-byte Folded Spill
	jsr	SetCommand
	lsw	r2, -6                          # 2-byte Folded Reload
	lsw	r0, -2
	add	r0, 2
	lsw	r1, -4
	add	r1, 1
	jsr	SetCommand
	lsw	r2, -6                          # 2-byte Folded Reload
	lsw	r0, -2
	lsw	r1, -4
	add	r1, 2
	jsr	SetCommand
	lsw	r2, -6                          # 2-byte Folded Reload
	lsw	r0, -2
	add	r0, 1
	lsw	r1, -4
	add	r1, 2
	jsr	SetCommand
	lsw	r2, -6                          # 2-byte Folded Reload
	lsw	r0, -2
	add	r0, 2
	lsw	r1, -4
	add	r1, 2
	jsr	SetCommand
	addsp	6
	pop	fp
	rts
                                        # -- End function
SetGliderCmdWrapper>                    # -- Begin function SetGliderCmdWrapper
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-8
	movens	r0, r1
	shr	r1, r2, 8
	ldi	r0, -2
	add	r0, fp, r0
	ssw	r0, -8                          # 2-byte Folded Spill
	ldi	r3, 1
	stb	r0, r3, r2
	ssb	r1, -2
	jsr	my_atoi
	movens	r0, r1
	lsw	r0, -8                          # 2-byte Folded Reload
	ssw	r1, -4
	jsr	my_atoi
	ssw	r0, -6
	lsw	r0, -4
	ldi	r1, -1
	cmp	r0, r1
	beq	__LBB17_2
	br	__LBB17_1
__LBB17_1:                              # %lor.lhs.false
	lsw	r0, -6
	ldi	r1, -1
	cmp	r0, r1
	bne	__LBB17_3
	br	__LBB17_2
__LBB17_2:                              # %if.then
	ldi	r0, __L.str.38
	jsr	print
	br	__LBB17_4
__LBB17_3:                              # %if.else
	lsw	r0, -4
	lsw	r1, -6
	jsr	SetGliderCmd
	br	__LBB17_4
__LBB17_4:                              # %if.end
	addsp	8
	pop	fp
	rts
                                        # -- End function
SetCmd>                                 # -- Begin function SetCmd
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-10
	movens	r0, r1
	shr	r1, r2, 8
	ldi	r0, -2
	add	r0, fp, r0
	ssw	r0, -10                         # 2-byte Folded Spill
	ldi	r3, 1
	stb	r0, r3, r2
	ssb	r1, -2
	jsr	my_atoi
	movens	r0, r1
	lsw	r0, -10                         # 2-byte Folded Reload
	ssw	r1, -4
	jsr	my_atoi
	movens	r0, r1
	lsw	r0, -10                         # 2-byte Folded Reload
	ssw	r1, -6
	jsr	my_atoi
	ssw	r0, -8
	lsw	r0, -4
	ldi	r1, -1
	cmp	r0, r1
	beq	__LBB18_3
	br	__LBB18_1
__LBB18_1:                              # %lor.lhs.false
	lsw	r0, -6
	ldi	r1, -1
	cmp	r0, r1
	beq	__LBB18_3
	br	__LBB18_2
__LBB18_2:                              # %lor.lhs.false4
	lsw	r0, -8
	ldi	r1, -1
	cmp	r0, r1
	bne	__LBB18_4
	br	__LBB18_3
__LBB18_3:                              # %if.then
	ldi	r0, __L.str.39
	jsr	print
	br	__LBB18_5
__LBB18_4:                              # %if.else
	lsw	r0, -4
	lsw	r1, -6
	lsw	r2, -8
	jsr	SetCommand
	br	__LBB18_5
__LBB18_5:                              # %if.end
	addsp	10
	pop	fp
	rts
                                        # -- End function
FillCmdWrapper>                         # -- Begin function FillCmdWrapper
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-22
	movens	r0, r1
	shr	r1, r2, 8
	ldi	r0, -2
	add	r0, fp, r0
	ssw	r0, -22                         # 2-byte Folded Spill
	ldi	r3, 1
	stb	r0, r3, r2
	ssb	r1, -2
	jsr	my_atoi
	movens	r0, r1
	lsw	r0, -22                         # 2-byte Folded Reload
	ssw	r1, -4
	jsr	my_atoi
	movens	r0, r1
	lsw	r0, -22                         # 2-byte Folded Reload
	ssw	r1, -6
	jsr	my_atoi
	movens	r0, r1
	lsw	r0, -22                         # 2-byte Folded Reload
	ssw	r1, -8
	jsr	my_atoi
	movens	r0, r1
	lsw	r0, -22                         # 2-byte Folded Reload
	ssw	r1, -10
	jsr	my_atoi
	ssw	r0, -12
	lsw	r0, -4
	ldi	r1, -1
	cmp	r0, r1
	beq	__LBB19_5
	br	__LBB19_1
__LBB19_1:                              # %lor.lhs.false
	lsw	r0, -6
	ldi	r1, -1
	cmp	r0, r1
	beq	__LBB19_5
	br	__LBB19_2
__LBB19_2:                              # %lor.lhs.false6
	lsw	r0, -8
	ldi	r1, -1
	cmp	r0, r1
	beq	__LBB19_5
	br	__LBB19_3
__LBB19_3:                              # %lor.lhs.false8
	lsw	r0, -10
	ldi	r1, -1
	cmp	r0, r1
	beq	__LBB19_5
	br	__LBB19_4
__LBB19_4:                              # %lor.lhs.false10
	lsw	r0, -12
	ldi	r1, -1
	cmp	r0, r1
	bne	__LBB19_6
	br	__LBB19_5
__LBB19_5:                              # %if.then
	ldi	r0, __L.str.40
	jsr	print
	br	__LBB19_7
__LBB19_6:                              # %if.else
	lsw	r0, -4
	ssw	r0, -16
	lsw	r1, -6
	ldi	r0, -16
	add	r0, fp, r0
	ldi	r3, 2
	stw	r0, r3, r1
	lsw	r1, -8
	ssw	r1, -20
	lsw	r2, -10
	ldi	r1, -20
	add	r1, fp, r1
	stw	r1, r3, r2
	lsw	r2, -12
	jsr	FillCmd
	br	__LBB19_7
__LBB19_7:                              # %if.end
	addsp	22
	pop	fp
	rts
                                        # -- End function
parse>                                  # -- Begin function parse
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-108
	ssw	r4, -2                          # 2-byte Folded Spill
	ldi	r0, 0
	ssw	r0, -88
	ssw	r0, -90
	ldi	r0, head
	ldw	r0, r0
	ldi	r1, end
	ldw	r1, r1
	cmp	r0, r1
	bne	__LBB20_2
	br	__LBB20_1
__LBB20_1:                              # %if.then
	br	__LBB20_45
__LBB20_2:                              # %if.end
	ldi	r0, head
	ldw	r0, r0
	ssw	r0, -94
	br	__LBB20_3
__LBB20_3:                              # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	lsw	r1, -94
	ldi	r0, end
	ldw	r0, r2
	ldi	r0, 0
	cmp	r1, r2
	ssw	r0, -96                         # 2-byte Folded Spill
	beq	__LBB20_5
	br	__LBB20_4
__LBB20_4:                              # %land.rhs
                                        #   in Loop: Header=BB20_3 Depth=1
	lsw	r1, -88
	ldi	r0, 0
	ssw	r0, -100                        # 2-byte Folded Spill
	ldi	r0, 1
	ldi	r2, 63
	cmp	r1, r2
	ssw	r0, -98                         # 2-byte Folded Spill
	blt	__LBB20_47
# %bb.46:                               # %land.rhs
                                        #   in Loop: Header=BB20_3 Depth=1
	lsw	r0, -100                        # 2-byte Folded Reload
	ssw	r0, -98                         # 2-byte Folded Spill
__LBB20_47:                             # %land.rhs
                                        #   in Loop: Header=BB20_3 Depth=1
	lsw	r0, -98                         # 2-byte Folded Reload
	ssw	r0, -96                         # 2-byte Folded Spill
	br	__LBB20_5
__LBB20_5:                              # %land.end
                                        #   in Loop: Header=BB20_3 Depth=1
	lsw	r0, -96                         # 2-byte Folded Reload
	ldi	r1, 1
	and r0, r1, r0
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB20_7
	br	__LBB20_6
__LBB20_6:                              # %while.body
                                        #   in Loop: Header=BB20_3 Depth=1
	lsw	r0, -94
	shl	r0, r0, 1
	ldi	r1, queue
	ldw	r0, r1, r0
	lsw	r2, -88
	movens	r2, r1
	add	r1, 1
	ssw	r1, -88
	ldi	r1, -66
	add	r1, fp, r1
	stb	r1, r2, r0
	lsw	r0, -94
	add	r0, 1
	shra	r0, r1, 8
	shra	r1, r1, 15-8
	shr	r1, r1, 8
	shr	r1, r1, 11-8
	add r0, r1, r1
	ldi	r2, -32
	and r1, r2, r1
	sub r0, r1, r0
	ssw	r0, -94
	br	__LBB20_3
__LBB20_7:                              # %while.end
	lsw	r2, -88
	ldi	r0, -66
	add	r0, fp, r1
	ssw	r1, -102                        # 2-byte Folded Spill
	ldi	r0, 0
	stb	r1, r2, r0
	jsr	qInit
	lsw	r0, -102                        # 2-byte Folded Reload
	shr	r0, r1, 8
	ldi	r2, -92
	add	r2, fp, r2
	ldi	r3, 1
	stb	r2, r3, r1
	ssb	r0, -92
	br	__LBB20_8
__LBB20_8:                              # %while.cond5
                                        # =>This Inner Loop Header: Depth=1
	ldi	r0, -92
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -92
	or r0, r1, r0
	ldsb	r0, r0
	ldi	r1, 32
	cmp	r0, r1
	bne	__LBB20_10
	br	__LBB20_9
__LBB20_9:                              # %while.body9
                                        #   in Loop: Header=BB20_8 Depth=1
	ldi	r0, -92
	add	r0, fp, r2
	ldi	r3, 1
	ldb	r2, r3, r0
	shl	r0, r0, 8
	lsb	r1, -92
	or r0, r1, r0
	add	r0, 1
	shr	r0, r1, 8
	stb	r2, r3, r1
	ssb	r0, -92
	br	__LBB20_8
__LBB20_10:                             # %while.end10
	ldi	r0, -92
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -92
	or r0, r1, r0
	ldsb	r0, r0
	ldi	r1, 0
	cmp	r0, r1
	bne	__LBB20_12
	br	__LBB20_11
__LBB20_11:                             # %if.then14
	br	__LBB20_45
__LBB20_12:                             # %if.end15
	ldi	r0, 0
	ssw	r0, -90
	br	__LBB20_13
__LBB20_13:                             # %while.cond16
                                        # =>This Inner Loop Header: Depth=1
	ldi	r0, -92
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -92
	or r0, r1, r0
	ldsb	r0, r1
	ldi	r0, 0
	ldi	r2, 32
	cmp	r1, r2
	ssw	r0, -104                        # 2-byte Folded Spill
	beq	__LBB20_16
	br	__LBB20_14
__LBB20_14:                             # %land.lhs.true
                                        #   in Loop: Header=BB20_13 Depth=1
	ldi	r0, -92
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -92
	or r0, r1, r0
	ldsb	r0, r1
	ldi	r0, 0
	cmp	r1, r0
	ssw	r0, -104                        # 2-byte Folded Spill
	beq	__LBB20_16
	br	__LBB20_15
__LBB20_15:                             # %land.rhs23
                                        #   in Loop: Header=BB20_13 Depth=1
	lsw	r1, -90
	ldi	r0, 0
	ssw	r0, -108                        # 2-byte Folded Spill
	ldi	r0, 1
	ldi	r2, 19
	cmp	r1, r2
	ssw	r0, -106                        # 2-byte Folded Spill
	blt	__LBB20_49
# %bb.48:                               # %land.rhs23
                                        #   in Loop: Header=BB20_13 Depth=1
	lsw	r0, -108                        # 2-byte Folded Reload
	ssw	r0, -106                        # 2-byte Folded Spill
__LBB20_49:                             # %land.rhs23
                                        #   in Loop: Header=BB20_13 Depth=1
	lsw	r0, -106                        # 2-byte Folded Reload
	ssw	r0, -104                        # 2-byte Folded Spill
	br	__LBB20_16
__LBB20_16:                             # %land.end26
                                        #   in Loop: Header=BB20_13 Depth=1
	lsw	r0, -104                        # 2-byte Folded Reload
	ldi	r1, 1
	and r0, r1, r0
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB20_18
	br	__LBB20_17
__LBB20_17:                             # %while.body27
                                        #   in Loop: Header=BB20_13 Depth=1
	ldi	r0, -92
	add	r0, fp, r3
	ldi	r4, 1
	ldb	r3, r4, r0
	shl	r0, r0, 8
	lsb	r1, -92
	or r0, r1, r0
	movens	r0, r1
	add	r1, 1
	shr	r1, r2, 8
	stb	r3, r4, r2
	ssb	r1, -92
	ldb	r0, r0
	lsw	r2, -90
	movens	r2, r1
	add	r1, 1
	ssw	r1, -90
	ldi	r1, -86
	add	r1, fp, r1
	stb	r1, r2, r0
	br	__LBB20_13
__LBB20_18:                             # %while.end31
	lsw	r2, -90
	ldi	r0, -86
	add	r0, fp, r1
	ldi	r0, 0
	stb	r1, r2, r0
	br	__LBB20_19
__LBB20_19:                             # %while.cond33
                                        # =>This Inner Loop Header: Depth=1
	ldi	r0, -92
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -92
	or r0, r1, r0
	ldsb	r0, r0
	ldi	r1, 32
	cmp	r0, r1
	bne	__LBB20_21
	br	__LBB20_20
__LBB20_20:                             # %while.body37
                                        #   in Loop: Header=BB20_19 Depth=1
	ldi	r0, -92
	add	r0, fp, r2
	ldi	r3, 1
	ldb	r2, r3, r0
	shl	r0, r0, 8
	lsb	r1, -92
	or r0, r1, r0
	add	r0, 1
	shr	r0, r1, 8
	stb	r2, r3, r1
	ssb	r0, -92
	br	__LBB20_19
__LBB20_21:                             # %while.end39
	ldi	r1, __L.str.17
	ldi	r0, -86
	add	r0, fp, r0
	jsr	StringCmp
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB20_23
	br	__LBB20_22
__LBB20_22:                             # %if.then41
	ldi	r0, -92
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -92
	or r0, r1, r0
	jsr	SetCmd
	br	__LBB20_45
__LBB20_23:                             # %if.else
	ldi	r1, __L.str.19
	ldi	r0, -86
	add	r0, fp, r0
	jsr	StringCmp
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB20_25
	br	__LBB20_24
__LBB20_24:                             # %if.then45
	ldi	r0, -92
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -92
	or r0, r1, r0
	jsr	RuleCmdWrapper
	br	__LBB20_44
__LBB20_25:                             # %if.else46
	ldi	r1, __L.str.21
	ldi	r0, -86
	add	r0, fp, r0
	jsr	StringCmp
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB20_27
	br	__LBB20_26
__LBB20_26:                             # %if.then50
	jsr	StopCmd
	br	__LBB20_43
__LBB20_27:                             # %if.else51
	ldi	r1, __L.str.23
	ldi	r0, -86
	add	r0, fp, r0
	jsr	StringCmp
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB20_29
	br	__LBB20_28
__LBB20_28:                             # %if.then55
	jsr	StartCmd
	br	__LBB20_42
__LBB20_29:                             # %if.else56
	ldi	r1, __L.str.25
	ldi	r0, -86
	add	r0, fp, r0
	jsr	StringCmp
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB20_31
	br	__LBB20_30
__LBB20_30:                             # %if.then60
	ldi	r0, -92
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -92
	or r0, r1, r0
	jsr	FillCmdWrapper
	br	__LBB20_41
__LBB20_31:                             # %if.else61
	ldi	r1, __L.str.27
	ldi	r0, -86
	add	r0, fp, r0
	jsr	StringCmp
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB20_33
	br	__LBB20_32
__LBB20_32:                             # %if.then65
	jsr	CleanCmd
	br	__LBB20_40
__LBB20_33:                             # %if.else66
	ldi	r1, __L.str.29
	ldi	r0, -86
	add	r0, fp, r0
	jsr	StringCmp
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB20_35
	br	__LBB20_34
__LBB20_34:                             # %if.then70
	ldi	r0, -92
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -92
	or r0, r1, r0
	jsr	HelpCmd
	br	__LBB20_39
__LBB20_35:                             # %if.else71
	ldi	r1, __L.str.31
	ldi	r0, -86
	add	r0, fp, r0
	jsr	StringCmp
	ldi	r1, 0
	cmp	r0, r1
	beq	__LBB20_37
	br	__LBB20_36
__LBB20_36:                             # %if.then75
	ldi	r0, -92
	add	r0, fp, r0
	ldi	r1, 1
	ldb	r0, r1, r0
	shl	r0, r0, 8
	lsb	r1, -92
	or r0, r1, r0
	jsr	SetGliderCmdWrapper
	br	__LBB20_38
__LBB20_37:                             # %if.else76
	ldi	r0, __L.str.41
	jsr	print
	ldi	r0, -86
	add	r0, fp, r0
	jsr	print
	ldi	r0, __L.str.42
	jsr	print
	br	__LBB20_38
__LBB20_38:                             # %if.end78
	br	__LBB20_39
__LBB20_39:                             # %if.end79
	br	__LBB20_40
__LBB20_40:                             # %if.end80
	br	__LBB20_41
__LBB20_41:                             # %if.end81
	br	__LBB20_42
__LBB20_42:                             # %if.end82
	br	__LBB20_43
__LBB20_43:                             # %if.end83
	br	__LBB20_44
__LBB20_44:                             # %if.end84
	br	__LBB20_45
__LBB20_45:                             # %if.end85
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	108
	pop	fp
	rts
                                        # -- End function
main>                                   # -- Begin function main
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	0
	ldi	r0, __L.str.43
	jsr	print
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
__L.str:                                # @.str
	db	69
	db	114
	db	114
	db	111
	db	114
	db	58
	db	32
	db	67
	db	111
	db	111
	db	114
	db	100
	db	105
	db	110
	db	97
	db	116
	db	101
	db	115
	db	32
	db	111
	db	117
	db	116
	db	32
	db	111
	db	102
	db	32
	db	98
	db	111
	db	117
	db	110
	db	100
	db	115
	db	46
	db	10
	db	0

__L.str.1:                              # @.str.1
	db	69
	db	114
	db	114
	db	111
	db	114
	db	58
	db	32
	db	86
	db	97
	db	108
	db	117
	db	101
	db	32
	db	109
	db	117
	db	115
	db	116
	db	32
	db	98
	db	101
	db	32
	db	48
	db	32
	db	111
	db	114
	db	32
	db	49
	db	46
	db	10
	db	0

__L.str.2:                              # @.str.2
	db	71
	db	97
	db	109
	db	101
	db	32
	db	115
	db	116
	db	97
	db	114
	db	116
	db	101
	db	100
	db	46
	db	10
	db	0

__L.str.3:                              # @.str.3
	db	71
	db	97
	db	109
	db	101
	db	32
	db	115
	db	116
	db	111
	db	112
	db	112
	db	101
	db	100
	db	46
	db	10
	db	0

__L.str.4:                              # @.str.4
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
	db	99
	db	111
	db	111
	db	114
	db	100
	db	105
	db	110
	db	97
	db	116
	db	101
	db	115
	db	32
	db	102
	db	111
	db	114
	db	32
	db	102
	db	105
	db	108
	db	108
	db	46
	db	10
	db	0

__L.str.5:                              # @.str.5
	db	70
	db	105
	db	108
	db	108
	db	32
	db	99
	db	111
	db	109
	db	112
	db	108
	db	101
	db	116
	db	101
	db	46
	db	10
	db	0

### SECTION: .rodata.cst4
__L__const.CleanCmd.e:                  # @__const.CleanCmd.e
	dc	32                              # 0x20
	dc	32                              # 0x20

### SECTION: .rodata.str1.1
__L.str.6:                              # @.str.6
	db	70
	db	105
	db	101
	db	108
	db	100
	db	32
	db	99
	db	108
	db	101
	db	97
	db	114
	db	101
	db	100
	db	46
	db	10
	db	0

__L.str.7:                              # @.str.7
	ds	1

__L.str.8:                              # @.str.8
	db	65
	db	118
	db	97
	db	105
	db	108
	db	97
	db	98
	db	108
	db	101
	db	32
	db	99
	db	111
	db	109
	db	109
	db	97
	db	110
	db	100
	db	115
	db	58
	db	10
	db	0

__L.str.9:                              # @.str.9
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
	db	32
	db	45
	db	32
	db	115
	db	101
	db	116
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
	db	32
	db	40
	db	48
	db	47
	db	49
	db	41
	db	10
	db	0

__L.str.10:                             # @.str.10
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
	db	32
	db	45
	db	32
	db	115
	db	101
	db	116
	db	32
	db	98
	db	105
	db	114
	db	116
	db	104
	db	47
	db	115
	db	117
	db	114
	db	118
	db	105
	db	118
	db	97
	db	108
	db	32
	db	114
	db	117
	db	108
	db	101
	db	115
	db	32
	db	40
	db	98
	db	105
	db	116
	db	109
	db	97
	db	115
	db	107
	db	41
	db	10
	db	0

__L.str.11:                             # @.str.11
	db	32
	db	115
	db	116
	db	111
	db	112
	db	32
	db	45
	db	32
	db	115
	db	116
	db	111
	db	112
	db	32
	db	103
	db	97
	db	109
	db	101
	db	10
	db	0

__L.str.12:                             # @.str.12
	db	32
	db	115
	db	116
	db	97
	db	114
	db	116
	db	32
	db	45
	db	32
	db	115
	db	116
	db	97
	db	114
	db	116
	db	32
	db	103
	db	97
	db	109
	db	101
	db	10
	db	0

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

__L.str.14:                             # @.str.14
	db	32
	db	99
	db	108
	db	101
	db	97
	db	110
	db	32
	db	45
	db	32
	db	99
	db	108
	db	101
	db	97
	db	114
	db	32
	db	102
	db	105
	db	101
	db	108
	db	100
	db	10
	db	0

__L.str.15:                             # @.str.15
	db	32
	db	104
	db	101
	db	108
	db	112
	db	32
	db	91
	db	99
	db	109
	db	100
	db	93
	db	32
	db	45
	db	32
	db	115
	db	104
	db	111
	db	119
	db	32
	db	104
	db	101
	db	108
	db	112
	db	10
	db	0

__L.str.16:                             # @.str.16
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
	db	32
	db	45
	db	32
	db	112
	db	108
	db	97
	db	99
	db	101
	db	32
	db	97
	db	32
	db	103
	db	108
	db	105
	db	100
	db	101
	db	114
	db	32
	db	97
	db	116
	db	32
	db	40
	db	120
	db	44
	db	121
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

__L.str.22:                             # @.str.22
	db	85
	db	115
	db	97
	db	103
	db	101
	db	58
	db	32
	db	115
	db	116
	db	111
	db	112
	db	10
	db	32
	db	83
	db	116
	db	111
	db	112
	db	115
	db	32
	db	116
	db	104
	db	101
	db	32
	db	103
	db	97
	db	109
	db	101
	db	32
	db	115
	db	105
	db	109
	db	117
	db	108
	db	97
	db	116
	db	105
	db	111
	db	110
	db	46
	db	10
	db	0

__L.str.23:                             # @.str.23
	db	115
	db	116
	db	97
	db	114
	db	116
	db	0

__L.str.24:                             # @.str.24
	db	85
	db	115
	db	97
	db	103
	db	101
	db	58
	db	32
	db	115
	db	116
	db	97
	db	114
	db	116
	db	10
	db	32
	db	83
	db	116
	db	97
	db	114
	db	116
	db	115
	db	47
	db	114
	db	101
	db	115
	db	117
	db	109
	db	101
	db	115
	db	32
	db	116
	db	104
	db	101
	db	32
	db	103
	db	97
	db	109
	db	101
	db	32
	db	115
	db	105
	db	109
	db	117
	db	108
	db	97
	db	116
	db	105
	db	111
	db	110
	db	46
	db	10
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

__L.str.28:                             # @.str.28
	db	85
	db	115
	db	97
	db	103
	db	101
	db	58
	db	32
	db	99
	db	108
	db	101
	db	97
	db	110
	db	10
	db	32
	db	67
	db	108
	db	101
	db	97
	db	114
	db	115
	db	32
	db	116
	db	104
	db	101
	db	32
	db	101
	db	110
	db	116
	db	105
	db	114
	db	101
	db	32
	db	102
	db	105
	db	101
	db	108
	db	100
	db	46
	db	10
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

__L.str.32:                             # @.str.32
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
	db	32
	db	80
	db	108
	db	97
	db	99
	db	101
	db	115
	db	32
	db	97
	db	32
	db	115
	db	116
	db	97
	db	110
	db	100
	db	97
	db	114
	db	100
	db	32
	db	103
	db	108
	db	105
	db	100
	db	101
	db	114
	db	46
	db	10
	db	0

__L.str.33:                             # @.str.33
	db	85
	db	110
	db	107
	db	110
	db	111
	db	119
	db	110
	db	32
	db	99
	db	111
	db	109
	db	109
	db	97
	db	110
	db	100
	db	58
	db	32
	db	39
	db	0

__L.str.34:                             # @.str.34
	db	39
	db	46
	db	32
	db	84
	db	121
	db	112
	db	101
	db	32
	db	39
	db	104
	db	101
	db	108
	db	112
	db	39
	db	32
	db	102
	db	111
	db	114
	db	32
	db	108
	db	105
	db	115
	db	116
	db	46
	db	10
	db	0

__L.str.35:                             # @.str.35
	db	82
	db	117
	db	108
	db	101
	db	115
	db	32
	db	117
	db	112
	db	100
	db	97
	db	116
	db	101
	db	100
	db	10
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

__L.str.37:                             # @.str.37
	db	80
	db	108
	db	97
	db	99
	db	105
	db	110
	db	103
	db	32
	db	103
	db	108
	db	105
	db	100
	db	101
	db	114
	db	46
	db	46
	db	46
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

__L.str.41:                             # @.str.41
	db	69
	db	114
	db	114
	db	111
	db	114
	db	58
	db	32
	db	85
	db	110
	db	107
	db	110
	db	111
	db	119
	db	110
	db	32
	db	99
	db	111
	db	109
	db	109
	db	97
	db	110
	db	100
	db	32
	db	39
	db	0

__L.str.42:                             # @.str.42
	db	39
	db	46
	db	32
	db	84
	db	121
	db	112
	db	101
	db	32
	db	39
	db	104
	db	101
	db	108
	db	112
	db	39
	db	46
	db	10
	db	0

__L.str.43:                             # @.str.43
	db	105
	db	110
	db	32
	db	109
	db	97
	db	105
	db	110
	db	10
	db	0

end.
