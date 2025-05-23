### SECTION: .text
rsect ___src_parser_c_41

CURR_CHAR: ext
CELL_ADR: ext
LINE_ADR: ext
VALUE: ext
UPDATE: ext
START_STOP: ext
RESET: ext
BORN: ext
SURV: ext


macro movens/2
push $1
pop $2
mend

isNum>                                  # -- Begin function isNum
# %bb.0:                                # %entry
	sub	r0, 48
	ldi	r1, 255
	and r0, r1, r1
	ldi	r0, 1
	ldi	r2, 10
	cmp	r1, r2
	blo	__LBB0_2
# %bb.1:                                # %entry
	ldi	r0, 0
__LBB0_2:                               # %entry
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
	beq	__LBB1_2
# %bb.1:                                # %entry
	movens	r2, r3
__LBB1_2:                               # %entry
	ldi	r4, 223
	and r0, r4, r0
	ldi	r4, -65
	add r0, r4, r0
	ldi	r4, 255
	and r0, r4, r0
	ldi	r4, 26
	cmp	r0, r4
	blo	__LBB1_4
# %bb.3:                                # %entry
	movens	r2, r1
__LBB1_4:                               # %entry
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
	beq	__LBB2_3
	br	__LBB2_1
__LBB2_1:                               # %while.body.preheader
	add	r0, 1
	ldi	r3, CURR_CHAR
__LBB2_2:                               # %while.body
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r2
	stw	r3, r2
	ldb	r0, r2
	add	r0, 1
	cmp	r2, r1
	bne	__LBB2_2
	br	__LBB2_3
__LBB2_3:                               # %while.end
	rts
                                        # -- End function
StringLen>                              # -- Begin function StringLen
# %bb.0:                                # %entry
	movens	r0, r1
	ldi	r2, 0
	movens	r2, r0
__LBB3_1:                               # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	ldb	r1, r0, r3
	add	r0, 1
	cmp	r3, r2
	bne	__LBB3_1
	br	__LBB3_2
__LBB3_2:                               # %while.end
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
	beq	__LBB4_4
	br	__LBB4_1
__LBB4_1:                               # %land.rhs.preheader
	ldi	r0, 0
	add	r2, 1
	ldi	r6, 255
	movens	r0, r5
__LBB4_2:                               # %land.rhs
                                        # =>This Inner Loop Header: Depth=1
	ldb	r1, r5, r3
	and r4, r6, r4
	cmp	r4, r3
	bne	__LBB4_6
	br	__LBB4_3
__LBB4_3:                               # %if.end
                                        #   in Loop: Header=BB4_2 Depth=1
	ldb	r2, r5, r4
	add	r5, 1
	cmp	r4, r0
	bne	__LBB4_2
	br	__LBB4_4
__LBB4_4:                               # %land.rhs16
	ldb	r1, r5, r1
	ldi	r0, 1
	ldi	r2, 0
	cmp	r1, r2
	beq	__LBB4_6
# %bb.5:                                # %land.rhs16
	movens	r2, r0
__LBB4_6:                               # %cleanup
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
	blt	__LBB5_2
	br	__LBB5_1
__LBB5_1:                               # %for.body.preheader
	br	__LBB5_3
__LBB5_3:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lsw	r3, -2
	add r3, r0, r3
	ssw	r3, -2
	sub	r1, 1
	cmp	r1, r2
	beq	__LBB5_2
	br	__LBB5_3
__LBB5_2:                               # %for.cond.cleanup
	lsw	r0, -2
	addsp	2
	pop	fp
	rts
                                        # -- End function
StringTrimRight>                        # -- Begin function StringTrimRight
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-6
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r1, 0
	movens	r1, r2
__LBB6_1:                               # %while.cond.i
                                        # =>This Inner Loop Header: Depth=1
	ldb	r0, r2, r3
	add	r2, 1
	cmp	r3, r1
	bne	__LBB6_1
	br	__LBB6_2
__LBB6_2:                               # %while.cond.preheader
	ldi	r1, 0
	ldi	r3, 1
	cmp	r2, r3
	beq	__LBB6_8
	br	__LBB6_3
__LBB6_3:                               # %land.rhs.preheader
	sub	r0, 2
	ldi	r4, 2
__LBB6_4:                               # %land.rhs
                                        # =>This Inner Loop Header: Depth=1
	ldb	r0, r2, r5
	movens	r5, r6
	sub	r6, 9
	cmp	r6, r4
	blo	__LBB6_6
	br	__LBB6_5
__LBB6_5:                               # %land.rhs
                                        #   in Loop: Header=BB6_4 Depth=1
	ldi	r6, 32
	cmp	r5, r6
	bne	__LBB6_7
	br	__LBB6_6
__LBB6_6:                               # %while.body
                                        #   in Loop: Header=BB6_4 Depth=1
	stb	r0, r2, r1
	sub	r2, 1
	cmp	r2, r3
	bgt	__LBB6_4
	br	__LBB6_8
__LBB6_7:                               # %land.rhs.while.end.loopexit_crit_edge
	sub	r2, 1
	movens	r2, r1
__LBB6_8:                               # %while.end
	movens	r1, r0
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	6
	pop	fp
	rts
                                        # -- End function
clearBuffer>                            # -- Begin function clearBuffer
# %bb.0:                                # %entry
	ldi	r2, 1
	cmp	r1, r2
	blt	__LBB7_2
	br	__LBB7_1
__LBB7_1:                               # %for.body.preheader
	ldi	r2, 0
	br	__LBB7_3
__LBB7_3:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	stw	r0, r2
	add	r0, 2
	sub	r1, 1
	cmp	r1, r2
	beq	__LBB7_2
	br	__LBB7_3
__LBB7_2:                               # %for.cond.cleanup
	rts
                                        # -- End function
parseArgs>                              # -- Begin function parseArgs
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-14
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ssw	r1, -12                         # 2-byte Folded Spill
	ldi	r1, 1
	ldi	r3, 0
	cmp	r2, r3
	bgt	__LBB8_2
# %bb.1:                                # %entry
	movens	r3, r1
__LBB8_2:                               # %entry
	ldb	r0, r6
	cmp	r6, r3
	ldi	r4, 255
	ldi	r5, 32
	beq	__LBB8_22
	br	__LBB8_3
__LBB8_3:                               # %entry
	ssw	r1, -10                         # 2-byte Folded Spill
	ldi	r1, 1
	cmp	r2, r1
	lsw	r1, -10                         # 2-byte Folded Reload
	blt	__LBB8_22
	br	__LBB8_4
__LBB8_4:                               # %while.cond2.preheader.preheader
	ssw	r2, -14                         # 2-byte Folded Spill
	ldi	r2, 0
	ssw	r2, -8                          # 2-byte Folded Spill
	movens	r0, r3
__LBB8_5:                               # %while.cond2.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB8_6 Depth 2
                                        #     Child Loop BB8_10 Depth 2
	ldi	r1, 1
__LBB8_6:                               # %while.cond2
                                        #   Parent Loop BB8_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	and r6, r4, r0
	cmp	r0, r5
	beq	__LBB8_8
	br	__LBB8_7
__LBB8_8:                               # %while.body6
                                        #   in Loop: Header=BB8_6 Depth=2
	ldb	r3, r1, r6
	add	r3, 1
	br	__LBB8_6
__LBB8_7:                               # %while.cond2
                                        #   in Loop: Header=BB8_5 Depth=1
	cmp	r0, r2
	beq	__LBB8_20
	br	__LBB8_9
__LBB8_9:                               # %if.end
                                        #   in Loop: Header=BB8_5 Depth=1
	lsw	r1, -8                          # 2-byte Folded Reload
	shl	r1, r0, 1
	lsw	r2, -12                         # 2-byte Folded Reload
	stb	r2, r0, r3
	add r2, r0, r0
	shr	r3, r6, 8
	ldi	r2, 1
	stb	r0, r2, r6
	ldi	r2, 0
	add	r1, 1
	ssw	r1, -8                          # 2-byte Folded Spill
	movens	r3, r0
__LBB8_10:                              # %while.cond10
                                        #   Parent Loop BB8_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	ldb	r0, r3
	cmp	r3, r5
	beq	__LBB8_16
	br	__LBB8_11
__LBB8_11:                              # %while.cond10
                                        #   in Loop: Header=BB8_10 Depth=2
	cmp	r3, r2
	bne	__LBB8_15
	br	__LBB8_12
__LBB8_15:                              # %while.body19
                                        #   in Loop: Header=BB8_10 Depth=2
	add	r0, 1
	br	__LBB8_10
__LBB8_16:                              # %if.end27
                                        #   in Loop: Header=BB8_5 Depth=1
	lsw	r2, -14                         # 2-byte Folded Reload
	lsw	r1, -8                          # 2-byte Folded Reload
	cmp	r1, r2
	ldi	r2, 1
	movens	r2, r1
	blt	__LBB8_18
# %bb.17:                               # %if.end27
                                        #   in Loop: Header=BB8_5 Depth=1
	ldi	r1, 0
__LBB8_18:                              # %if.end27
                                        #   in Loop: Header=BB8_5 Depth=1
	ssw	r1, -10                         # 2-byte Folded Spill
	ldi	r1, 0
	stb	r0, r1
	ldb	r0, r2, r6
	cmp	r6, r1
	beq	__LBB8_21
	br	__LBB8_19
__LBB8_19:                              # %if.end27
                                        #   in Loop: Header=BB8_5 Depth=1
	movens	r0, r3
	add	r3, 1
	lsw	r2, -14                         # 2-byte Folded Reload
	lsw	r1, -8                          # 2-byte Folded Reload
	cmp	r1, r2
	ldi	r2, 0
	blt	__LBB8_5
	br	__LBB8_21
__LBB8_21:                              # %while.end28.loopexit112
	add	r0, 1
	lsw	r3, -8                          # 2-byte Folded Reload
	lsw	r1, -10                         # 2-byte Folded Reload
__LBB8_22:                              # %while.end28
	movens	r1, r2
	add	r0, 1
__LBB8_23:                              # %while.cond29
                                        # =>This Inner Loop Header: Depth=1
	and r6, r4, r1
	cmp	r1, r5
	beq	__LBB8_25
	br	__LBB8_24
__LBB8_25:                              # %while.body33
                                        #   in Loop: Header=BB8_23 Depth=1
	ldb	r0, r6
	add	r0, 1
	br	__LBB8_23
__LBB8_24:                              # %while.cond29
	ldi	r0, 0
	cmp	r1, r0
	beq	__LBB8_27
	br	__LBB8_26
__LBB8_26:                              # %land.lhs.true
	add r3, r2, r3
	br	__LBB8_27
__LBB8_27:                              # %if.end43
	movens	r3, r0
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	14
	pop	fp
	rts
__LBB8_20:                              # %while.end28.loopexit
	ldi	r1, 1
	movens	r3, r0
	lsw	r3, -8                          # 2-byte Folded Reload
	br	__LBB8_22
__LBB8_12:                              # %if.end27.thread
	ldi	r6, 0
	ldi	r2, 1
	lsw	r3, -8                          # 2-byte Folded Reload
	lsw	r1, -14                         # 2-byte Folded Reload
	cmp	r3, r1
	movens	r2, r1
	blt	__LBB8_14
# %bb.13:                               # %if.end27.thread
	movens	r6, r1
__LBB8_14:                              # %if.end27.thread
	br	__LBB8_22
                                        # -- End function
my_atoi_safe>                           # -- Begin function my_atoi_safe
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-12
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ssw	r1, -12                         # 2-byte Folded Spill
	ldi	r3, 32
__LBB9_1:                               # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	ldb	r0, r5
	add	r0, 1
	cmp	r5, r3
	beq	__LBB9_1
	br	__LBB9_2
__LBB9_2:                               # %while.end
	movens	r5, r1
	sub	r1, 58
	ldi	r2, 255
	and r1, r2, r1
	ldi	r2, 0
	ssw	r2, -10                         # 2-byte Folded Spill
	ldi	r6, 246
	cmp	r1, r6
	blo	__LBB9_10
	br	__LBB9_3
__LBB9_10:                              # %cleanup
	lsw	r0, -10                         # 2-byte Folded Reload
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	12
	pop	fp
	rts
__LBB9_3:                               # %while.body5.preheader
	ldi	r6, 0
	ssw	r6, -10                         # 2-byte Folded Spill
	ldi	r2, 255
__LBB9_4:                               # %while.body5
                                        # =>This Inner Loop Header: Depth=1
	ldi	r1, 3276
	cmp	r6, r1
	bgt	__LBB9_10
	br	__LBB9_5
__LBB9_5:                               # %if.end9
                                        #   in Loop: Header=BB9_4 Depth=1
	ldi	r1, 0
	ssw	r1, -8
	lsw	r1, -8
	add r1, r6, r1
	ssw	r1, -8
	lsw	r1, -8
	add r1, r6, r1
	ssw	r1, -8
	lsw	r1, -8
	add r1, r6, r1
	ssw	r1, -8
	lsw	r1, -8
	add r1, r6, r1
	ssw	r1, -8
	lsw	r1, -8
	add r1, r6, r1
	ssw	r1, -8
	lsw	r1, -8
	add r1, r6, r1
	ssw	r1, -8
	lsw	r1, -8
	add r1, r6, r1
	ssw	r1, -8
	lsw	r1, -8
	add r1, r6, r1
	ssw	r1, -8
	lsw	r1, -8
	add r1, r6, r1
	ssw	r1, -8
	lsw	r1, -8
	add r1, r6, r1
	ssw	r1, -8
	and r5, r2, r1
	lsw	r6, -8
	ldb	r0, r5
	movens	r5, r4
	sub	r4, 58
	and r4, r2, r4
	add r1, r6, r6
	add	r0, 1
	sub	r6, 48
	ldi	r1, 245
	cmp	r4, r1
	bhi	__LBB9_4
	br	__LBB9_6
__LBB9_8:                               # %while.body18
                                        #   in Loop: Header=BB9_6 Depth=1
	ldb	r0, r5
	add	r0, 1
	br	__LBB9_6
__LBB9_6:                               # %while.cond14
                                        # =>This Inner Loop Header: Depth=1
	ldi	r1, 255
	and r5, r1, r1
	cmp	r1, r3
	beq	__LBB9_8
	br	__LBB9_7
__LBB9_7:                               # %while.cond14
	ldi	r0, 0
	ssw	r0, -10                         # 2-byte Folded Spill
	cmp	r1, r0
	beq	__LBB9_9
	br	__LBB9_10
__LBB9_9:                               # %if.end25
	lsw	r0, -12                         # 2-byte Folded Reload
	stw	r0, r6
	ldi	r0, 1
	ssw	r0, -10                         # 2-byte Folded Spill
	br	__LBB9_10
                                        # -- End function
pow2>                                   # -- Begin function pow2
# %bb.0:                                # %entry
	ldi	r1, 1
	cmp	r0, r1
	blt	__LBB10_2
	br	__LBB10_1
__LBB10_1:                              # %for.body.preheader
	ldi	r2, 0
	br	__LBB10_3
__LBB10_3:                              # %for.body
                                        # =>This Inner Loop Header: Depth=1
	shl	r1, r1, 1
	sub	r0, 1
	cmp	r0, r2
	beq	__LBB10_2
	br	__LBB10_3
__LBB10_2:                              # %for.cond.cleanup
	movens	r1, r0
	rts
                                        # -- End function
parseRuleArg>                           # -- Begin function parseRuleArg
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-88
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	movens	r0, r1
	ldi	r5, 0
	ssw	r5, -24
	ldi	r0, -24
	add	r0, fp, r0
	ldi	r2, 2
	stw	r0, r2, r5
	ldi	r2, 4
	stw	r0, r2, r5
	ldi	r2, 6
	stw	r0, r2, r5
	ldi	r2, 8
	stw	r0, r2, r5
	ldi	r2, 10
	stw	r0, r2, r5
	ldi	r2, 12
	stw	r0, r2, r5
	ldi	r2, 14
	stw	r0, r2, r5
	ldi	r2, 16
	stw	r0, r2, r5
	ldb	r1, r2
	cmp	r2, r5
	beq	__LBB11_15
	br	__LBB11_1
__LBB11_1:                              # %while.body.preheader
	ldi	r4, 255
	ldi	r6, 9
	ldi	r0, 32
	ssw	r0, -32                         # 2-byte Folded Spill
	ldi	r0, -1
	ssw	r0, -30                         # 2-byte Folded Spill
	ssw	r5, -28                         # 2-byte Folded Spill
__LBB11_2:                              # %while.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB11_9 Depth 2
	movens	r2, r0
	sub	r0, 48
	and r0, r4, r3
	cmp	r3, r6
	bhi	__LBB11_11
	br	__LBB11_3
__LBB11_11:                             # %if.else11
                                        #   in Loop: Header=BB11_2 Depth=1
	and r2, r4, r0
	ldi	r2, 32
	cmp	r0, r2
	beq	__LBB11_13
	br	__LBB11_12
__LBB11_12:                             # %if.else11
                                        #   in Loop: Header=BB11_2 Depth=1
	ldi	r2, 9
	cmp	r0, r2
	bne	__LBB11_25
	br	__LBB11_13
__LBB11_3:                              # %if.then
                                        #   in Loop: Header=BB11_2 Depth=1
	cmp	r3, r6
	bne	__LBB11_5
	br	__LBB11_4
__LBB11_5:                              # %if.then5
                                        #   in Loop: Header=BB11_2 Depth=1
	and r2, r4, r2
	ssw	r2, -26                         # 2-byte Folded Spill
	sub	r2, 48
	shl	r2, r4, 1
	movens	r5, r0
	ldi	r5, -24
	add	r5, fp, r6
	ldw	r6, r4, r5
	cmp	r5, r0
	movens	r0, r5
	bne	__LBB11_13
	br	__LBB11_6
__LBB11_6:                              # %if.then7
                                        #   in Loop: Header=BB11_2 Depth=1
	add r6, r4, r4
	ldi	r0, 49
	lsw	r6, -26                         # 2-byte Folded Reload
	cmp	r6, r0
	blo	__LBB11_8
	br	__LBB11_7
__LBB11_7:                              # %for.body.i59.preheader
                                        #   in Loop: Header=BB11_2 Depth=1
	ldi	r0, 1
	br	__LBB11_9
__LBB11_9:                              # %for.body.i59
                                        #   Parent Loop BB11_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	shl	r0, r0, 1
	sub	r2, 1
	cmp	r2, r5
	bne	__LBB11_9
	br	__LBB11_10
__LBB11_10:                             # %cleanup
                                        #   in Loop: Header=BB11_2 Depth=1
	ldi	r2, 1
	stw	r4, r2
	lsw	r2, -28                         # 2-byte Folded Reload
	add r0, r2, r2
	ssw	r2, -28                         # 2-byte Folded Spill
	ldi	r0, 9
	cmp	r3, r0
	beq	__LBB11_28
	br	__LBB11_13
__LBB11_8:                              # %cleanup.thread92
                                        #   in Loop: Header=BB11_2 Depth=1
	ldi	r0, 1
	stw	r4, r0
	lsw	r0, -28                         # 2-byte Folded Reload
	add	r0, 1
	ssw	r0, -28                         # 2-byte Folded Spill
	br	__LBB11_13
__LBB11_13:                             # %if.end21
                                        #   in Loop: Header=BB11_2 Depth=1
	ldi	r0, 1
	ldb	r1, r0, r2
	add	r1, 1
	cmp	r2, r5
	ldi	r4, 255
	ldi	r6, 9
	bne	__LBB11_2
	br	__LBB11_14
__LBB11_14:                             # %while.end
	ldi	r0, 0
	lsw	r1, -28                         # 2-byte Folded Reload
	cmp	r1, r0
	ssw	r1, -30                         # 2-byte Folded Spill
	bne	__LBB11_28
	br	__LBB11_15
__LBB11_15:                             # %land.lhs.true24
	ldi	r1, 0
	lsw	r0, -24
	ssw	r1, -30                         # 2-byte Folded Spill
	cmp	r0, r1
	bne	__LBB11_28
	br	__LBB11_16
__LBB11_16:                             # %for.body.preheader
	lsw	r0, -24
	ssw	r1, -30                         # 2-byte Folded Spill
	cmp	r0, r1
	bne	__LBB11_28
	br	__LBB11_17
__LBB11_17:                             # %for.cond
	ldi	r0, -24
	add	r0, fp, r0
	ldi	r1, 2
	ldw	r0, r1, r0
	ldi	r1, 0
	ssw	r1, -30                         # 2-byte Folded Spill
	cmp	r0, r1
	bne	__LBB11_28
	br	__LBB11_18
__LBB11_18:                             # %for.cond.1
	ldi	r0, -24
	add	r0, fp, r0
	ldi	r1, 4
	ldw	r0, r1, r0
	ldi	r1, 0
	ssw	r1, -30                         # 2-byte Folded Spill
	cmp	r0, r1
	bne	__LBB11_28
	br	__LBB11_19
__LBB11_19:                             # %for.cond.2
	ldi	r0, -24
	add	r0, fp, r0
	ldi	r1, 6
	ldw	r0, r1, r0
	ldi	r1, 0
	ssw	r1, -30                         # 2-byte Folded Spill
	cmp	r0, r1
	bne	__LBB11_28
	br	__LBB11_20
__LBB11_20:                             # %for.cond.3
	ldi	r0, -24
	add	r0, fp, r0
	ldi	r1, 8
	ldw	r0, r1, r0
	ldi	r1, 0
	ssw	r1, -30                         # 2-byte Folded Spill
	cmp	r0, r1
	bne	__LBB11_28
	br	__LBB11_21
__LBB11_21:                             # %for.cond.4
	ldi	r0, -24
	add	r0, fp, r0
	ldi	r1, 10
	ldw	r0, r1, r0
	ldi	r1, 0
	ssw	r1, -30                         # 2-byte Folded Spill
	cmp	r0, r1
	bne	__LBB11_28
	br	__LBB11_22
__LBB11_22:                             # %for.cond.5
	ldi	r0, -24
	add	r0, fp, r0
	ldi	r1, 12
	ldw	r0, r1, r0
	ldi	r1, 0
	ssw	r1, -30                         # 2-byte Folded Spill
	cmp	r0, r1
	bne	__LBB11_28
	br	__LBB11_23
__LBB11_23:                             # %for.cond.6
	ldi	r0, -24
	add	r0, fp, r0
	ldi	r1, 14
	ldw	r0, r1, r0
	ldi	r1, 0
	ssw	r1, -30                         # 2-byte Folded Spill
	cmp	r0, r1
	bne	__LBB11_28
	br	__LBB11_24
__LBB11_24:                             # %for.cond.7
	ldi	r0, -24
	add	r0, fp, r0
	ldi	r1, 16
	ldw	r0, r1, r2
	ldi	r1, 121
	ssw	r1, -26                         # 2-byte Folded Spill
	ldi	r0, 112
	ssw	r0, -68                         # 2-byte Folded Spill
	ldi	r0, 98
	ssw	r0, -84                         # 2-byte Folded Spill
	ldi	r0, 99
	ssw	r0, -62                         # 2-byte Folded Spill
	ldi	r0, 103
	ssw	r0, -58                         # 2-byte Folded Spill
	ldi	r6, 97
	ldi	r4, 101
	ldi	r0, 108
	ssw	r0, -46                         # 2-byte Folded Spill
	ldi	r0, 82
	ssw	r0, -86                         # 2-byte Folded Spill
	ldi	r3, 32
	ldi	r0, 58
	ldi	r5, 114
	ldi	r1, 69
	ssw	r1, -32                         # 2-byte Folded Spill
	ldi	r1, 0
	ssw	r1, -30                         # 2-byte Folded Spill
	cmp	r2, r1
	ssw	r5, -52                         # 2-byte Folded Spill
	ssw	r5, -48                         # 2-byte Folded Spill
	ssw	r3, -42                         # 2-byte Folded Spill
	ssw	r5, -50                         # 2-byte Folded Spill
	ssw	r5, -54                         # 2-byte Folded Spill
	movens	r0, r5
	ldi	r0, 117
	ssw	r0, -34                         # 2-byte Folded Spill
	ssw	r0, -76                         # 2-byte Folded Spill
	ssw	r4, -56                         # 2-byte Folded Spill
	ssw	r3, -60                         # 2-byte Folded Spill
	movens	r6, r1
	movens	r6, r2
	ldi	r0, 110
	ssw	r0, -78                         # 2-byte Folded Spill
	ssw	r0, -40                         # 2-byte Folded Spill
	ssw	r0, -38                         # 2-byte Folded Spill
	ldi	r0, 111
	ssw	r0, -44                         # 2-byte Folded Spill
	ssw	r0, -80                         # 2-byte Folded Spill
	ldi	r0, 116
	ssw	r0, -88                         # 2-byte Folded Spill
	ssw	r3, -64                         # 2-byte Folded Spill
	ssw	r4, -66                         # 2-byte Folded Spill
	ssw	r3, -36                         # 2-byte Folded Spill
	ssw	r3, -70                         # 2-byte Folded Spill
	ssw	r4, -28                         # 2-byte Folded Spill
	ssw	r4, -72                         # 2-byte Folded Spill
	ldi	r3, 109
	movens	r3, r4
	ssw	r3, -74                         # 2-byte Folded Spill
	movens	r0, r6
	ssw	r0, -82                         # 2-byte Folded Spill
	beq	__LBB11_27
	br	__LBB11_28
__LBB11_4:                              # %cleanup.thread
	ldi	r0, CURR_CHAR
	ldi	r1, 69
	stw	r0, r1
	ldi	r0, 56
	ssw	r0, -26                         # 2-byte Folded Spill
	ldi	r0, 97
	ssw	r0, -72                         # 2-byte Folded Spill
	ldi	r0, 48
	ssw	r0, -66                         # 2-byte Folded Spill
	ldi	r0, 119
	ssw	r0, -38                         # 2-byte Folded Spill
	ldi	r0, 109
	ssw	r0, -54                         # 2-byte Folded Spill
	ldi	r2, 115
	ldi	r6, 116
	ldi	r0, 105
	ssw	r0, -46                         # 2-byte Folded Spill
	ldi	r0, 103
	ssw	r0, -34                         # 2-byte Folded Spill
	ldi	r5, 101
	ldi	r0, 108
	ssw	r0, -44                         # 2-byte Folded Spill
	ldi	r1, 117
	ldi	r0, 82
	ssw	r0, -50                         # 2-byte Folded Spill
	ldi	r0, 58
	ssw	r0, -86                         # 2-byte Folded Spill
	ldi	r0, 111
	ldi	r4, 114
	ssw	r4, -84                         # 2-byte Folded Spill
	ldi	r3, 32
	ssw	r3, -30                         # 2-byte Folded Spill
	ssw	r1, -52                         # 2-byte Folded Spill
	ssw	r1, -58                         # 2-byte Folded Spill
	ssw	r2, -42                         # 2-byte Folded Spill
	ssw	r2, -76                         # 2-byte Folded Spill
	ssw	r3, -56                         # 2-byte Folded Spill
	movens	r5, r2
	ssw	r3, -60                         # 2-byte Folded Spill
	ldi	r1, 98
	ssw	r1, -40                         # 2-byte Folded Spill
	ssw	r1, -62                         # 2-byte Folded Spill
	ssw	r6, -28                         # 2-byte Folded Spill
	ssw	r6, -78                         # 2-byte Folded Spill
	ssw	r5, -48                         # 2-byte Folded Spill
	ssw	r5, -80                         # 2-byte Folded Spill
	ssw	r3, -70                         # 2-byte Folded Spill
	ldi	r1, 110
	ssw	r1, -64                         # 2-byte Folded Spill
	ssw	r1, -74                         # 2-byte Folded Spill
	ldi	r1, 100
	ssw	r1, -36                         # 2-byte Folded Spill
	ssw	r1, -68                         # 2-byte Folded Spill
	ssw	r3, -82                         # 2-byte Folded Spill
	br	__LBB11_26
__LBB11_25:                             # %cleanup42.sink.split.sink.split.loopexit
	ldi	r0, 116
	ssw	r0, -26                         # 2-byte Folded Spill
	ldi	r0, 109
	ssw	r0, -74                         # 2-byte Folded Spill
	ldi	r0, 103
	ssw	r0, -70                         # 2-byte Folded Spill
	ldi	r0, 105
	ssw	r0, -60                         # 2-byte Folded Spill
	ldi	r0, 104
	ssw	r0, -42                         # 2-byte Folded Spill
	ldi	r3, 99
	ldi	r0, 100
	ssw	r0, -34                         # 2-byte Folded Spill
	ldi	r6, 108
	ldi	r1, 97
	ldi	r0, 118
	ssw	r0, -48                         # 2-byte Folded Spill
	ldi	r2, 110
	ldi	r0, 73
	ssw	r0, -52                         # 2-byte Folded Spill
	ldi	r5, 32
	ldi	r0, 58
	ssw	r0, -32                         # 2-byte Folded Spill
	ldi	r0, 111
	ssw	r0, -84                         # 2-byte Folded Spill
	ldi	r0, 114
	ldi	r4, 69
	ssw	r0, -86                         # 2-byte Folded Spill
	ssw	r5, -46                         # 2-byte Folded Spill
	ssw	r0, -54                         # 2-byte Folded Spill
	ssw	r1, -30                         # 2-byte Folded Spill
	ssw	r1, -58                         # 2-byte Folded Spill
	ssw	r3, -28                         # 2-byte Folded Spill
	ssw	r3, -76                         # 2-byte Folded Spill
	ssw	r0, -40                         # 2-byte Folded Spill
	movens	r5, r1
	ssw	r2, -62                         # 2-byte Folded Spill
	ssw	r0, -78                         # 2-byte Folded Spill
	ssw	r6, -36                         # 2-byte Folded Spill
	ssw	r6, -80                         # 2-byte Folded Spill
	ssw	r5, -50                         # 2-byte Folded Spill
	ssw	r5, -64                         # 2-byte Folded Spill
	ssw	r0, -66                         # 2-byte Folded Spill
	ldi	r3, 117
	ssw	r3, -38                         # 2-byte Folded Spill
	ssw	r3, -72                         # 2-byte Folded Spill
	ldi	r3, 101
	ssw	r3, -56                         # 2-byte Folded Spill
	ssw	r3, -68                         # 2-byte Folded Spill
	ssw	r2, -44                         # 2-byte Folded Spill
	ssw	r2, -82                         # 2-byte Folded Spill
	movens	r1, r2
__LBB11_26:                             # %cleanup42.sink.split.sink.split
	ldi	r3, CURR_CHAR
	stw	r3, r4
	ldi	r4, 114
	stw	r3, r4
	stw	r3, r0
	lsw	r0, -84                         # 2-byte Folded Reload
	stw	r3, r0
	lsw	r0, -86                         # 2-byte Folded Reload
	stw	r3, r0
	ldi	r0, 101
	ssw	r0, -88                         # 2-byte Folded Spill
	ldi	r4, 116
	ldi	r0, 105
	ssw	r0, -86                         # 2-byte Folded Spill
	lsw	r5, -30                         # 2-byte Folded Reload
	movens	r5, r1
	movens	r2, r6
	ssw	r5, -84                         # 2-byte Folded Spill
__LBB11_27:                             # %cleanup42.sink.split
	ldi	r0, CURR_CHAR
	lsw	r3, -32                         # 2-byte Folded Reload
	stw	r0, r3
	lsw	r3, -50                         # 2-byte Folded Reload
	stw	r0, r3
	lsw	r3, -52                         # 2-byte Folded Reload
	stw	r0, r3
	lsw	r3, -44                         # 2-byte Folded Reload
	stw	r0, r3
	lsw	r3, -48                         # 2-byte Folded Reload
	stw	r0, r3
	stw	r0, r5
	lsw	r3, -36                         # 2-byte Folded Reload
	stw	r0, r3
	lsw	r3, -86                         # 2-byte Folded Reload
	stw	r0, r3
	lsw	r3, -34                         # 2-byte Folded Reload
	stw	r0, r3
	lsw	r3, -46                         # 2-byte Folded Reload
	stw	r0, r3
	lsw	r3, -28                         # 2-byte Folded Reload
	stw	r0, r3
	lsw	r3, -42                         # 2-byte Folded Reload
	stw	r0, r3
	stw	r0, r1
	lsw	r3, -54                         # 2-byte Folded Reload
	stw	r0, r3
	lsw	r3, -58                         # 2-byte Folded Reload
	stw	r0, r3
	lsw	r3, -76                         # 2-byte Folded Reload
	stw	r0, r3
	stw	r0, r4
	lsw	r3, -56                         # 2-byte Folded Reload
	stw	r0, r3
	lsw	r3, -40                         # 2-byte Folded Reload
	stw	r0, r3
	stw	r0, r6
	lsw	r3, -60                         # 2-byte Folded Reload
	stw	r0, r3
	lsw	r3, -62                         # 2-byte Folded Reload
	stw	r0, r3
	stw	r0, r2
	lsw	r2, -78                         # 2-byte Folded Reload
	stw	r0, r2
	lsw	r2, -38                         # 2-byte Folded Reload
	stw	r0, r2
	lsw	r2, -80                         # 2-byte Folded Reload
	stw	r0, r2
	lsw	r1, -88                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -64                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -84                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -66                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -70                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -72                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -74                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -68                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -82                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -26                         # 2-byte Folded Reload
	stw	r0, r1
	ldi	r1, 46
	stw	r0, r1
	ldi	r1, 10
	stw	r0, r1
	ldi	r0, -1
	ssw	r0, -30                         # 2-byte Folded Spill
__LBB11_28:                             # %cleanup42
	lsw	r0, -30                         # 2-byte Folded Reload
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	88
	pop	fp
	rts
                                        # -- End function
qInit>                                  # -- Begin function qInit
# %bb.0:                                # %entry
	ldi	r1, queue
	ldi	r0, 0
	stb	r1, r0
	ldi	r1, queue+1
	stb	r1, r0
	ldi	r1, queue+2
	stb	r1, r0
	ldi	r1, queue+3
	stb	r1, r0
	ldi	r1, queue+4
	stb	r1, r0
	ldi	r1, queue+5
	stb	r1, r0
	ldi	r1, queue+6
	stb	r1, r0
	ldi	r1, queue+7
	stb	r1, r0
	ldi	r1, queue+8
	stb	r1, r0
	ldi	r1, queue+9
	stb	r1, r0
	ldi	r1, queue+10
	stb	r1, r0
	ldi	r1, queue+11
	stb	r1, r0
	ldi	r1, queue+12
	stb	r1, r0
	ldi	r1, queue+13
	stb	r1, r0
	ldi	r1, queue+14
	stb	r1, r0
	ldi	r1, queue+15
	stb	r1, r0
	ldi	r1, queue+16
	stb	r1, r0
	ldi	r1, queue+17
	stb	r1, r0
	ldi	r1, queue+18
	stb	r1, r0
	ldi	r1, queue+19
	stb	r1, r0
	ldi	r1, queue+20
	stb	r1, r0
	ldi	r1, queue+21
	stb	r1, r0
	ldi	r1, queue+22
	stb	r1, r0
	ldi	r1, queue+23
	stb	r1, r0
	ldi	r1, queue+24
	stb	r1, r0
	ldi	r1, queue+25
	stb	r1, r0
	ldi	r1, queue+26
	stb	r1, r0
	ldi	r1, queue+27
	stb	r1, r0
	ldi	r1, queue+28
	stb	r1, r0
	ldi	r1, queue+29
	stb	r1, r0
	ldi	r1, queue+30
	stb	r1, r0
	ldi	r1, queue+31
	stb	r1, r0
	ldi	r1, head
	stw	r1, r0
	ldi	r1, end
	stw	r1, r0
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
	blo	__LBB13_2
	br	__LBB13_1
__LBB13_2:                              # %if.end
	ldi	r4, 2
	cmp	r2, r4
	blo	__LBB13_4
	br	__LBB13_3
__LBB13_3:                              # %while.body.i19.preheader
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
	br	__LBB13_5
__LBB13_1:                              # %while.body.i.preheader
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
	ldi	r6, 98
	stw	r0, r6
	stw	r0, r1
	stw	r0, r2
	stw	r0, r4
	ldi	r1, 100
	stw	r0, r1
	stw	r0, r5
	stw	r0, r3
	ldi	r1, 91
	stw	r0, r1
	ldi	r1, 48
	stw	r0, r1
	ldi	r1, 45
	stw	r0, r1
	ldi	r1, 51
	stw	r0, r1
	ldi	r1, 49
	stw	r0, r1
	ldi	r1, 93
	stw	r0, r1
	ldi	r1, 46
	stw	r0, r1
	ldi	r1, 10
	stw	r0, r1
	br	__LBB13_5
__LBB13_4:                              # %if.end9
	ldi	r3, CELL_ADR
	stw	r3, r0
	ldi	r0, LINE_ADR
	stw	r0, r1
	ldi	r0, VALUE
	stw	r0, r2
	ldi	r0, UPDATE
	ldi	r1, 1
	stw	r0, r1
__LBB13_5:                              # %return
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	6
	pop	fp
	rts
                                        # -- End function
StartCmdWrapper>                        # -- Begin function StartCmdWrapper
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-20
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r0, 0
	cmp	r1, r0
	ldi	r0, CURR_CHAR
	beq	__LBB14_2
	br	__LBB14_1
__LBB14_1:                              # %while.body.i.preheader
	ldi	r1, 69
	stw	r0, r1
	ldi	r3, 114
	ssw	r3, -14                         # 2-byte Folded Spill
	stw	r0, r3
	stw	r0, r3
	ldi	r1, 111
	stw	r0, r1
	stw	r0, r3
	ldi	r2, 58
	stw	r0, r2
	ldi	r4, 32
	stw	r0, r4
	ldi	r2, 39
	stw	r0, r2
	ldi	r5, 115
	stw	r0, r5
	ldi	r6, 116
	stw	r0, r6
	ldi	r5, 97
	stw	r0, r5
	stw	r0, r3
	stw	r0, r6
	stw	r0, r2
	stw	r0, r4
	ldi	r2, 99
	stw	r0, r2
	ssw	r1, -10                         # 2-byte Folded Spill
	stw	r0, r1
	ldi	r3, 109
	stw	r0, r3
	stw	r0, r3
	stw	r0, r5
	ldi	r2, 110
	stw	r0, r2
	ldi	r1, 100
	stw	r0, r1
	stw	r0, r4
	stw	r0, r6
	stw	r0, r5
	ldi	r1, 107
	stw	r0, r1
	ldi	r1, 101
	ssw	r1, -12                         # 2-byte Folded Spill
	stw	r0, r1
	ldi	r1, 115
	ssw	r1, -8                          # 2-byte Folded Spill
	stw	r0, r1
	stw	r0, r4
	ldi	r1, 117
	ssw	r1, -16                         # 2-byte Folded Spill
	ldi	r1, 103
	ssw	r1, -18                         # 2-byte Folded Spill
	ssw	r2, -20                         # 2-byte Folded Spill
	br	__LBB14_3
__LBB14_2:                              # %if.end
	ldi	r1, START_STOP
	ldi	r2, 1
	stw	r1, r2
	ldi	r1, gmState
	stw	r1, r2
	ldi	r1, 100
	ssw	r1, -8                          # 2-byte Folded Spill
	ldi	r1, 114
	ssw	r1, -12                         # 2-byte Folded Spill
	ldi	r6, 116
	ldi	r1, 115
	ssw	r1, -18                         # 2-byte Folded Spill
	ldi	r1, 32
	ssw	r1, -14                         # 2-byte Folded Spill
	ldi	r5, 101
	ldi	r4, 109
	ldi	r3, 97
	ldi	r2, 71
	ssw	r3, -10                         # 2-byte Folded Spill
	ssw	r6, -16                         # 2-byte Folded Spill
	ssw	r6, -20                         # 2-byte Folded Spill
	movens	r5, r6
__LBB14_3:                              # %return
	stw	r0, r2
	lsw	r2, -10                         # 2-byte Folded Reload
	stw	r0, r2
	stw	r0, r4
	stw	r0, r5
	lsw	r1, -14                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -18                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -16                         # 2-byte Folded Reload
	stw	r0, r1
	stw	r0, r3
	lsw	r1, -12                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -20                         # 2-byte Folded Reload
	stw	r0, r1
	stw	r0, r6
	lsw	r1, -8                          # 2-byte Folded Reload
	stw	r0, r1
	ldi	r1, 46
	stw	r0, r1
	ldi	r1, 10
	stw	r0, r1
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	20
	pop	fp
	rts
                                        # -- End function
StopCmdWrapper>                         # -- Begin function StopCmdWrapper
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-18
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r2, 0
	cmp	r1, r2
	ldi	r0, CURR_CHAR
	beq	__LBB15_2
	br	__LBB15_1
__LBB15_1:                              # %while.body.i.preheader
	ldi	r1, 69
	stw	r0, r1
	ldi	r1, 114
	stw	r0, r1
	stw	r0, r1
	ldi	r3, 111
	stw	r0, r3
	ssw	r1, -8                          # 2-byte Folded Spill
	stw	r0, r1
	ldi	r1, 58
	stw	r0, r1
	ldi	r4, 32
	stw	r0, r4
	ldi	r1, 39
	stw	r0, r1
	ldi	r2, 115
	stw	r0, r2
	ldi	r2, 116
	stw	r0, r2
	stw	r0, r3
	ldi	r5, 112
	stw	r0, r5
	stw	r0, r1
	stw	r0, r4
	ldi	r1, 99
	stw	r0, r1
	stw	r0, r3
	ldi	r1, 109
	stw	r0, r1
	ssw	r1, -12                         # 2-byte Folded Spill
	stw	r0, r1
	ldi	r6, 97
	stw	r0, r6
	ldi	r1, 110
	stw	r0, r1
	ldi	r5, 100
	stw	r0, r5
	stw	r0, r4
	stw	r0, r2
	stw	r0, r6
	ldi	r5, 107
	stw	r0, r5
	ldi	r5, 101
	ssw	r5, -14                         # 2-byte Folded Spill
	stw	r0, r5
	ldi	r5, 115
	ssw	r5, -10                         # 2-byte Folded Spill
	stw	r0, r5
	stw	r0, r4
	ldi	r5, 117
	ssw	r5, -16                         # 2-byte Folded Spill
	ldi	r5, 103
	ssw	r5, -18                         # 2-byte Folded Spill
	movens	r1, r5
	br	__LBB15_3
__LBB15_2:                              # %if.end
	ldi	r1, START_STOP
	stw	r1, r2
	ldi	r1, gmState
	stw	r1, r2
	ldi	r1, 100
	ssw	r1, -10                         # 2-byte Folded Spill
	ldi	r5, 112
	ldi	r1, 111
	ssw	r1, -12                         # 2-byte Folded Spill
	ldi	r1, 116
	ssw	r1, -16                         # 2-byte Folded Spill
	ldi	r1, 115
	ssw	r1, -18                         # 2-byte Folded Spill
	ldi	r1, 32
	ssw	r1, -8                          # 2-byte Folded Spill
	ldi	r6, 101
	ldi	r4, 109
	ldi	r3, 97
	ldi	r1, 71
	ssw	r5, -14                         # 2-byte Folded Spill
	movens	r6, r2
__LBB15_3:                              # %return
	stw	r0, r1
	stw	r0, r3
	stw	r0, r4
	stw	r0, r6
	lsw	r1, -8                          # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -18                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -16                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -12                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -14                         # 2-byte Folded Reload
	stw	r0, r1
	stw	r0, r5
	stw	r0, r2
	lsw	r1, -10                         # 2-byte Folded Reload
	stw	r0, r1
	ldi	r1, 46
	stw	r0, r1
	ldi	r1, 10
	stw	r0, r1
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	18
	pop	fp
	rts
                                        # -- End function
FillCmd>                                # -- Begin function FillCmd
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-22
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ssw	r0, -8                          # 2-byte Folded Spill
	ldw	r0, r4
	ldi	r3, 31
	cmp	r4, r3
	bhi	__LBB16_6
	br	__LBB16_1
__LBB16_1:                              # %lor.lhs.false3
	ldi	r0, 2
	lsw	r5, -8                          # 2-byte Folded Reload
	ldw	r5, r0, r5
	cmp	r5, r3
	bhi	__LBB16_6
	br	__LBB16_2
__LBB16_6:                              # %if.then
	ldi	r0, CURR_CHAR
	ldi	r1, 69
	stw	r0, r1
	ldi	r5, 114
	stw	r0, r5
	stw	r0, r5
	ldi	r1, 111
	stw	r0, r1
	stw	r0, r5
	ldi	r1, 58
	stw	r0, r1
	ldi	r1, 32
	stw	r0, r1
	ldi	r3, 73
	stw	r0, r3
	ldi	r2, 110
	stw	r0, r2
	ldi	r3, 118
	stw	r0, r3
	ldi	r6, 97
	stw	r0, r6
	ldi	r3, 108
	stw	r0, r3
	ldi	r3, 105
	stw	r0, r3
	ldi	r3, 100
	stw	r0, r3
	stw	r0, r1
	stw	r0, r5
	ldi	r3, 101
	stw	r0, r3
	ldi	r4, 99
	stw	r0, r4
	ldi	r2, 116
	stw	r0, r2
	stw	r0, r6
	ldi	r2, 110
	stw	r0, r2
	ldi	r6, 103
	stw	r0, r6
	ldi	r6, 108
	stw	r0, r6
	stw	r0, r3
	stw	r0, r1
	stw	r0, r4
	ldi	r4, 111
	stw	r0, r4
	stw	r0, r4
	stw	r0, r5
	ldi	r6, 100
	stw	r0, r6
	ldi	r6, 105
	stw	r0, r6
	stw	r0, r2
	ldi	r2, 97
	stw	r0, r2
	ldi	r2, 116
	stw	r0, r2
	stw	r0, r3
	ldi	r3, 115
	stw	r0, r3
	stw	r0, r1
	ldi	r3, 102
	stw	r0, r3
	stw	r0, r4
	stw	r0, r5
	stw	r0, r1
	stw	r0, r3
	stw	r0, r6
	ldi	r2, 108
	stw	r0, r2
	stw	r0, r2
	ldi	r2, 46
	stw	r0, r2
	ldi	r2, 10
	stw	r0, r2
	ldi	r2, __L.str.10+1
	ldi	r3, 0
__LBB16_7:                              # %while.body.i64
                                        # =>This Inner Loop Header: Depth=1
	sxt	r1, r1
	stw	r0, r1
	ldb	r2, r1
	add	r2, 1
	cmp	r1, r3
	beq	__LBB16_18
	br	__LBB16_7
__LBB16_2:                              # %lor.lhs.false9
	ldw	r1, r6
	cmp	r6, r4
	blt	__LBB16_6
	br	__LBB16_3
__LBB16_3:                              # %lor.lhs.false9
	cmp	r6, r3
	bgt	__LBB16_6
	br	__LBB16_4
__LBB16_4:                              # %lor.lhs.false16
	ldw	r1, r0, r6
	cmp	r6, r5
	blt	__LBB16_6
	br	__LBB16_5
__LBB16_5:                              # %lor.lhs.false16
	ldi	r3, 32
	cmp	r6, r3
	blt	__LBB16_8
	br	__LBB16_6
__LBB16_8:                              # %if.end
	cmp	r2, r0
	ldi	r3, CURR_CHAR
	blo	__LBB16_10
	br	__LBB16_9
__LBB16_9:                              # %while.body.i71.preheader
	ldi	r0, 69
	stw	r3, r0
	ldi	r0, 114
	stw	r3, r0
	stw	r3, r0
	ldi	r1, 111
	ssw	r1, -8                          # 2-byte Folded Spill
	stw	r3, r1
	stw	r3, r0
	ldi	r1, 58
	stw	r3, r1
	ldi	r2, 32
	stw	r3, r2
	ldi	r1, 86
	stw	r3, r1
	ldi	r1, 97
	stw	r3, r1
	ldi	r1, 108
	stw	r3, r1
	ldi	r6, 117
	stw	r3, r6
	ldi	r1, 101
	ssw	r1, -22                         # 2-byte Folded Spill
	stw	r3, r1
	stw	r3, r2
	ldi	r1, 109
	stw	r3, r1
	ldi	r1, 49
	ssw	r1, -18                         # 2-byte Folded Spill
	ldi	r1, 48
	ssw	r1, -10                         # 2-byte Folded Spill
	ldi	r4, 98
	ldi	r1, 116
	ldi	r5, 115
	ssw	r5, -20                         # 2-byte Folded Spill
	ssw	r2, -16                         # 2-byte Folded Spill
	ssw	r2, -14                         # 2-byte Folded Spill
	ssw	r2, -12                         # 2-byte Folded Spill
	br	__LBB16_17
__LBB16_10:                             # %for.body.lr.ph
	ssw	r2, -10                         # 2-byte Folded Spill
	ldi	r3, START_STOP
	ldi	r0, 0
	stw	r3, r0
	ssw	r1, -12                         # 2-byte Folded Spill
	ldw	r1, r3
	lsw	r0, -8                          # 2-byte Folded Reload
	ldw	r0, r0
	cmp	r0, r3
	bgt	__LBB16_12
	br	__LBB16_11
__LBB16_12:                             # %for.cond.cleanup
	ldi	r0, gmState
	ldw	r0, r0
	ldi	r1, START_STOP
	stw	r1, r0
	ldi	r0, 116
	ssw	r0, -12                         # 2-byte Folded Spill
	ldi	r0, 101
	ldi	r1, 112
	ssw	r1, -14                         # 2-byte Folded Spill
	ldi	r1, 109
	ssw	r1, -10                         # 2-byte Folded Spill
	ldi	r1, 111
	ssw	r1, -16                         # 2-byte Folded Spill
	ldi	r1, 99
	ssw	r1, -22                         # 2-byte Folded Spill
	ldi	r1, 108
	ldi	r2, 105
	ssw	r2, -20                         # 2-byte Folded Spill
	ldi	r6, 70
	movens	r1, r2
	ssw	r1, -8                          # 2-byte Folded Spill
	ssw	r0, -18                         # 2-byte Folded Spill
	ldi	r3, CURR_CHAR
	ldi	r4, 32
	br	__LBB16_17
__LBB16_17:                             # %return.sink.split
	stw	r3, r6
	lsw	r5, -20                         # 2-byte Folded Reload
	stw	r3, r5
	stw	r3, r1
	stw	r3, r2
	stw	r3, r4
	lsw	r1, -22                         # 2-byte Folded Reload
	stw	r3, r1
	lsw	r1, -16                         # 2-byte Folded Reload
	stw	r3, r1
	lsw	r1, -10                         # 2-byte Folded Reload
	stw	r3, r1
	lsw	r1, -14                         # 2-byte Folded Reload
	stw	r3, r1
	lsw	r1, -8                          # 2-byte Folded Reload
	stw	r3, r1
	stw	r3, r0
	lsw	r0, -12                         # 2-byte Folded Reload
	stw	r3, r0
	lsw	r0, -18                         # 2-byte Folded Reload
	stw	r3, r0
	ldi	r0, 46
	stw	r3, r0
	ldi	r0, 10
	stw	r3, r0
__LBB16_18:                             # %return
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	22
	pop	fp
	rts
__LBB16_11:                             # %for.body.preheader
	ssw	r6, -14                         # 2-byte Folded Spill
	ldi	r0, 1
	br	__LBB16_13
__LBB16_15:                             # %for.cond.cleanup34
                                        #   in Loop: Header=BB16_13 Depth=1
	movens	r5, r4
	add	r4, 1
	lsw	r6, -14                         # 2-byte Folded Reload
	cmp	r5, r6
	movens	r4, r5
	beq	__LBB16_12
	br	__LBB16_13
__LBB16_13:                             # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB16_16 Depth 2
	lsw	r4, -8                          # 2-byte Folded Reload
	ldw	r4, r4
	cmp	r4, r3
	lsw	r2, -10                         # 2-byte Folded Reload
	lsw	r1, -12                         # 2-byte Folded Reload
	bgt	__LBB16_15
	br	__LBB16_14
__LBB16_14:                             # %for.body35.preheader
                                        #   in Loop: Header=BB16_13 Depth=1
	movens	r4, r6
	br	__LBB16_16
__LBB16_16:                             # %for.body35
                                        #   Parent Loop BB16_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	ldi	r3, CELL_ADR
	stw	r3, r4
	ldi	r3, LINE_ADR
	stw	r3, r5
	ldi	r3, VALUE
	stw	r3, r2
	ldi	r3, UPDATE
	stw	r3, r0
	add	r6, 1
	ldw	r1, r3
	cmp	r4, r3
	movens	r6, r4
	blt	__LBB16_16
	br	__LBB16_15
                                        # -- End function
CleanCmdWrapper>                        # -- Begin function CleanCmdWrapper
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-20
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r0, 0
	cmp	r1, r0
	ldi	r0, CURR_CHAR
	beq	__LBB17_2
	br	__LBB17_1
__LBB17_1:                              # %while.body.i.preheader
	ldi	r1, 69
	stw	r0, r1
	ldi	r2, 114
	stw	r0, r2
	stw	r0, r2
	ldi	r1, 111
	stw	r0, r1
	ssw	r2, -8                          # 2-byte Folded Spill
	stw	r0, r2
	ldi	r2, 58
	stw	r0, r2
	ldi	r5, 32
	stw	r0, r5
	ldi	r2, 39
	stw	r0, r2
	ldi	r3, 99
	stw	r0, r3
	ldi	r4, 108
	stw	r0, r4
	ldi	r4, 101
	stw	r0, r4
	ldi	r6, 97
	stw	r0, r6
	ldi	r4, 110
	stw	r0, r4
	stw	r0, r2
	stw	r0, r5
	stw	r0, r3
	stw	r0, r1
	ldi	r3, 109
	stw	r0, r3
	stw	r0, r3
	stw	r0, r6
	stw	r0, r4
	ldi	r2, 100
	stw	r0, r2
	stw	r0, r5
	ldi	r2, 116
	ssw	r2, -20                         # 2-byte Folded Spill
	stw	r0, r2
	stw	r0, r6
	ldi	r2, 107
	stw	r0, r2
	ldi	r2, 101
	ssw	r2, -10                         # 2-byte Folded Spill
	stw	r0, r2
	ldi	r2, 115
	stw	r0, r2
	ldi	r4, 117
	ssw	r4, -18                         # 2-byte Folded Spill
	ldi	r4, 103
	ssw	r4, -12                         # 2-byte Folded Spill
	ldi	r4, 110
	ssw	r4, -16                         # 2-byte Folded Spill
	ssw	r5, -14                         # 2-byte Folded Spill
	br	__LBB17_3
__LBB17_2:                              # %if.end
	ldi	r1, RESET
	ldi	r2, 1
	stw	r1, r2
	ldi	r1, 97
	ssw	r1, -10                         # 2-byte Folded Spill
	ldi	r1, 99
	ssw	r1, -12                         # 2-byte Folded Spill
	ldi	r1, 32
	ssw	r1, -8                          # 2-byte Folded Spill
	ldi	r6, 100
	ldi	r2, 108
	ldi	r1, 101
	ldi	r3, 105
	ssw	r3, -16                         # 2-byte Folded Spill
	ldi	r5, 70
	ssw	r2, -14                         # 2-byte Folded Spill
	ssw	r2, -18                         # 2-byte Folded Spill
	movens	r1, r3
	ssw	r1, -20                         # 2-byte Folded Spill
	movens	r6, r2
__LBB17_3:                              # %return
	stw	r0, r5
	lsw	r5, -16                         # 2-byte Folded Reload
	stw	r0, r5
	stw	r0, r1
	lsw	r1, -14                         # 2-byte Folded Reload
	stw	r0, r1
	stw	r0, r6
	lsw	r1, -8                          # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -12                         # 2-byte Folded Reload
	stw	r0, r1
	lsw	r1, -18                         # 2-byte Folded Reload
	stw	r0, r1
	stw	r0, r3
	lsw	r1, -10                         # 2-byte Folded Reload
	stw	r0, r1
	ldi	r1, 110
	stw	r0, r1
	lsw	r1, -20                         # 2-byte Folded Reload
	stw	r0, r1
	stw	r0, r2
	ldi	r1, 46
	stw	r0, r1
	ldi	r1, 10
	stw	r0, r1
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	20
	pop	fp
	rts
                                        # -- End function
RuleCmdWrapper>                         # -- Begin function RuleCmdWrapper
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-6
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r6, 2
	cmp	r1, r6
	beq	__LBB18_3
	br	__LBB18_1
__LBB18_3:                              # %if.end
	ldi	r2, 1
	ldb	r0, r2, r1
	shl	r1, r1, 8
	ldb	r0, r3
	or r1, r3, r1
	ldb	r1, r3
	ldi	r4, 98
	cmp	r3, r4
	bne	__LBB18_7
	br	__LBB18_4
__LBB18_4:                              # %lor.lhs.false
	ldb	r0, r6, r3
	ldi	r4, 3
	ldb	r0, r4, r5
	shl	r5, r5, 8
	or r5, r3, r3
	ldb	r3, r5
	ldi	r4, 115
	cmp	r5, r4
	bne	__LBB18_7
	br	__LBB18_5
__LBB18_5:                              # %lor.lhs.false9
	ldb	r1, r2, r4
	sub	r4, 58
	ldi	r5, 255
	and r4, r5, r4
	ldi	r5, 246
	cmp	r4, r5
	blo	__LBB18_7
	br	__LBB18_6
__LBB18_6:                              # %lor.lhs.false12
	ldb	r3, r2, r2
	sub	r2, 58
	ldi	r3, 255
	and r2, r3, r2
	ldi	r3, 245
	cmp	r2, r3
	bhi	__LBB18_9
	br	__LBB18_7
__LBB18_7:                              # %while.body.i40.preheader
	ldi	r2, 69
	ldi	r0, __L.str.15+1
	ldi	r1, CURR_CHAR
	ldi	r3, 0
__LBB18_8:                              # %while.body.i40
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r2
	stw	r1, r2
	ldb	r0, r2
	add	r0, 1
	cmp	r2, r3
	beq	__LBB18_12
	br	__LBB18_8
__LBB18_1:                              # %while.body.i.preheader
	ldi	r2, 69
	ldi	r0, __L.str.14+1
	ldi	r1, CURR_CHAR
	ldi	r3, 0
__LBB18_2:                              # %while.body.i
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r2
	stw	r1, r2
	ldb	r0, r2
	add	r0, 1
	cmp	r2, r3
	beq	__LBB18_12
	br	__LBB18_2
__LBB18_9:                              # %if.end18
	add	r1, 1
	movens	r0, r4
	movens	r1, r0
	jsr	parseRuleArg
	movens	r0, r5
	ldb	r4, r6, r0
	ldi	r1, 3
	ldb	r4, r1, r1
	shl	r1, r1, 8
	or r1, r0, r0
	add	r0, 1
	jsr	parseRuleArg
	ldi	r1, -1
	cmp	r5, r1
	beq	__LBB18_12
	br	__LBB18_10
__LBB18_10:                             # %if.end18
	cmp	r0, r1
	beq	__LBB18_12
	br	__LBB18_11
__LBB18_11:                             # %if.end30
	ldi	r1, BORN
	stw	r1, r5
	ldi	r1, SURV
	stw	r1, r0
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
	ldi	r3, 32
	stw	r0, r3
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
	ldi	r1, 46
	stw	r0, r1
	ldi	r1, 10
	stw	r0, r1
__LBB18_12:                             # %cleanup.cont
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	6
	pop	fp
	rts
                                        # -- End function
SetCmdWrapper>                          # -- Begin function SetCmdWrapper
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-16
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r2, 3
	cmp	r1, r2
	beq	__LBB19_3
	br	__LBB19_1
__LBB19_3:                              # %if.end
	ldi	r1, 1
	ldb	r0, r1, r1
	shl	r1, r1, 8
	ssw	r0, -16                         # 2-byte Folded Spill
	ldb	r0, r0
	or r1, r0, r1
	ldi	r3, 32
__LBB19_4:                              # %while.cond.i
                                        # =>This Inner Loop Header: Depth=1
	ldb	r1, r4
	add	r1, 1
	cmp	r4, r3
	beq	__LBB19_4
	br	__LBB19_5
__LBB19_5:                              # %while.end.i
	movens	r4, r0
	sub	r0, 58
	ldi	r2, 255
	and r0, r2, r0
	ldi	r2, 246
	cmp	r0, r2
	blo	__LBB19_7
	br	__LBB19_6
__LBB19_7:                              # %while.body.i104.preheader
	ldi	r2, 69
	ldi	r0, __L.str.18+1
	ldi	r1, CURR_CHAR
	ldi	r3, 0
	br	__LBB19_34
__LBB19_34:                             # %while.body.i104
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r2
	stw	r1, r2
	ldb	r0, r2
	add	r0, 1
	cmp	r2, r3
	beq	__LBB19_36
	br	__LBB19_34
__LBB19_1:                              # %while.body.i.preheader
	ldi	r2, 69
	ldi	r0, __L.str.17+1
	ldi	r1, CURR_CHAR
	ldi	r3, 0
__LBB19_2:                              # %while.body.i
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r2
	stw	r1, r2
	ldb	r0, r2
	add	r0, 1
	cmp	r2, r3
	beq	__LBB19_36
	br	__LBB19_2
__LBB19_6:                              # %while.body5.i.preheader
	ldi	r0, 0
	ldi	r5, 255
	br	__LBB19_8
__LBB19_8:                              # %while.body5.i
                                        # =>This Inner Loop Header: Depth=1
	ldi	r2, 3276
	cmp	r0, r2
	bgt	__LBB19_7
	br	__LBB19_9
__LBB19_9:                              # %if.end9.i
                                        #   in Loop: Header=BB19_8 Depth=1
	ldi	r2, 0
	ssw	r2, -12
	lsw	r2, -12
	add r2, r0, r2
	ssw	r2, -12
	lsw	r2, -12
	add r2, r0, r2
	ssw	r2, -12
	lsw	r2, -12
	add r2, r0, r2
	ssw	r2, -12
	lsw	r2, -12
	add r2, r0, r2
	ssw	r2, -12
	lsw	r2, -12
	add r2, r0, r2
	ssw	r2, -12
	lsw	r2, -12
	add r2, r0, r2
	ssw	r2, -12
	lsw	r2, -12
	add r2, r0, r2
	ssw	r2, -12
	lsw	r2, -12
	add r2, r0, r2
	ssw	r2, -12
	lsw	r2, -12
	add r2, r0, r2
	ssw	r2, -12
	lsw	r2, -12
	add r2, r0, r0
	ssw	r0, -12
	and r4, r5, r0
	lsw	r2, -12
	ldb	r1, r4
	movens	r4, r6
	sub	r6, 58
	and r6, r5, r6
	add r0, r2, r0
	add	r1, 1
	sub	r0, 48
	ldi	r2, 245
	cmp	r6, r2
	bhi	__LBB19_8
	br	__LBB19_10
__LBB19_10:                             # %while.cond14.i.preheader
	ldi	r2, 255
__LBB19_11:                             # %while.cond14.i
                                        # =>This Inner Loop Header: Depth=1
	and r4, r2, r5
	cmp	r5, r3
	beq	__LBB19_13
	br	__LBB19_12
__LBB19_13:                             # %while.body18.i
                                        #   in Loop: Header=BB19_11 Depth=1
	ldb	r1, r4
	add	r1, 1
	br	__LBB19_11
__LBB19_12:                             # %while.cond14.i
	ldi	r1, 0
	cmp	r5, r1
	beq	__LBB19_14
	br	__LBB19_7
__LBB19_14:                             # %lor.lhs.false
	ldi	r1, 2
	lsw	r2, -16                         # 2-byte Folded Reload
	ldb	r2, r1, r1
	ldi	r4, 3
	ldb	r2, r4, r2
	shl	r2, r2, 8
	or r2, r1, r2
__LBB19_15:                             # %while.cond.i15
                                        # =>This Inner Loop Header: Depth=1
	ldb	r2, r6
	add	r2, 1
	cmp	r6, r3
	beq	__LBB19_15
	br	__LBB19_16
__LBB19_16:                             # %while.end.i19
	movens	r6, r1
	sub	r1, 58
	ldi	r4, 255
	and r1, r4, r1
	ldi	r4, 246
	cmp	r1, r4
	blo	__LBB19_7
	br	__LBB19_17
__LBB19_17:                             # %while.body5.i20.preheader
	ldi	r1, 0
__LBB19_18:                             # %while.body5.i20
                                        # =>This Inner Loop Header: Depth=1
	ldi	r4, 3276
	cmp	r1, r4
	bgt	__LBB19_7
	br	__LBB19_19
__LBB19_19:                             # %if.end9.i24
                                        #   in Loop: Header=BB19_18 Depth=1
	ldi	r4, 0
	ssw	r4, -10
	lsw	r4, -10
	add r4, r1, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r1, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r1, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r1, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r1, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r1, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r1, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r1, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r1, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r1, r1
	ssw	r1, -10
	ldi	r1, 255
	and r6, r1, r1
	ssw	r1, -14                         # 2-byte Folded Spill
	lsw	r4, -10
	ldb	r2, r6
	movens	r6, r5
	sub	r5, 58
	movens	r3, r1
	ldi	r3, 255
	and r5, r3, r5
	movens	r1, r3
	lsw	r1, -14                         # 2-byte Folded Reload
	add r1, r4, r1
	add	r2, 1
	sub	r1, 48
	ldi	r4, 245
	cmp	r5, r4
	bhi	__LBB19_18
	br	__LBB19_20
__LBB19_20:                             # %while.cond14.i51.preheader
	ldi	r4, 255
__LBB19_21:                             # %while.cond14.i51
                                        # =>This Inner Loop Header: Depth=1
	and r6, r4, r5
	cmp	r5, r3
	beq	__LBB19_23
	br	__LBB19_22
__LBB19_23:                             # %while.body18.i55
                                        #   in Loop: Header=BB19_21 Depth=1
	ldb	r2, r6
	add	r2, 1
	br	__LBB19_21
__LBB19_22:                             # %while.cond14.i51
	ldi	r2, 0
	cmp	r5, r2
	beq	__LBB19_24
	br	__LBB19_7
__LBB19_24:                             # %lor.lhs.false4
	ldi	r2, 4
	lsw	r4, -16                         # 2-byte Folded Reload
	ldb	r4, r2, r2
	ldi	r5, 5
	ldb	r4, r5, r4
	shl	r4, r4, 8
	or r4, r2, r6
__LBB19_25:                             # %while.cond.i60
                                        # =>This Inner Loop Header: Depth=1
	ldb	r6, r5
	add	r6, 1
	cmp	r5, r3
	beq	__LBB19_25
	br	__LBB19_26
__LBB19_26:                             # %while.end.i64
	movens	r5, r2
	sub	r2, 58
	ldi	r4, 255
	and r2, r4, r2
	ldi	r4, 246
	cmp	r2, r4
	blo	__LBB19_7
	br	__LBB19_27
__LBB19_27:                             # %while.body5.i65.preheader
	ldi	r2, 0
__LBB19_28:                             # %while.body5.i65
                                        # =>This Inner Loop Header: Depth=1
	ldi	r4, 3276
	cmp	r2, r4
	bgt	__LBB19_7
	br	__LBB19_29
__LBB19_29:                             # %if.end9.i69
                                        #   in Loop: Header=BB19_28 Depth=1
	ldi	r4, 0
	ssw	r4, -8
	lsw	r4, -8
	add r4, r2, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r2, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r2, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r2, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r2, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r2, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r2, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r2, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r2, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r2, r2
	ssw	r2, -8
	ldi	r2, 255
	and r5, r2, r2
	ssw	r2, -16                         # 2-byte Folded Spill
	lsw	r4, -8
	ldb	r6, r5
	ssw	r5, -14                         # 2-byte Folded Spill
	sub	r5, 58
	ldi	r2, 255
	and r5, r2, r5
	lsw	r2, -16                         # 2-byte Folded Reload
	add r2, r4, r2
	add	r6, 1
	sub	r2, 48
	ldi	r4, 245
	cmp	r5, r4
	lsw	r5, -14                         # 2-byte Folded Reload
	bhi	__LBB19_28
	br	__LBB19_30
__LBB19_30:                             # %while.cond14.i96.preheader
	ldi	r4, 255
__LBB19_31:                             # %while.cond14.i96
                                        # =>This Inner Loop Header: Depth=1
	and r5, r4, r5
	cmp	r5, r3
	beq	__LBB19_33
	br	__LBB19_32
__LBB19_33:                             # %while.body18.i100
                                        #   in Loop: Header=BB19_31 Depth=1
	ldb	r6, r5
	add	r6, 1
	br	__LBB19_31
__LBB19_32:                             # %while.cond14.i96
	ldi	r3, 0
	cmp	r5, r3
	beq	__LBB19_35
	br	__LBB19_7
__LBB19_35:                             # %if.end9
	jsr	SetCommand
__LBB19_36:                             # %cleanup.cont
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	16
	pop	fp
	rts
                                        # -- End function
FillCmdWrapper>                         # -- Begin function FillCmdWrapper
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-22
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r2, 5
	cmp	r1, r2
	beq	__LBB20_3
	br	__LBB20_1
__LBB20_3:                              # %if.end
	ldi	r1, 1
	ldb	r0, r1, r1
	shl	r1, r2, 8
	ssw	r0, -16                         # 2-byte Folded Spill
	ldb	r0, r1
	or r2, r1, r6
	ldi	r0, 32
__LBB20_4:                              # %while.cond.i
                                        # =>This Inner Loop Header: Depth=1
	ldb	r6, r3
	add	r6, 1
	cmp	r3, r0
	beq	__LBB20_4
	br	__LBB20_5
__LBB20_5:                              # %while.end.i
	movens	r3, r0
	sub	r0, 58
	ldi	r1, 255
	and r0, r1, r0
	ldi	r2, 246
	cmp	r0, r2
	blo	__LBB20_7
	br	__LBB20_6
__LBB20_7:                              # %while.body.i209.preheader
	ldi	r2, 69
	ldi	r0, __L.str.20+1
	ldi	r1, CURR_CHAR
	ldi	r3, 0
	br	__LBB20_54
__LBB20_54:                             # %while.body.i209
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r2
	stw	r1, r2
	ldb	r0, r2
	add	r0, 1
	cmp	r2, r3
	beq	__LBB20_56
	br	__LBB20_54
__LBB20_1:                              # %while.body.i.preheader
	ldi	r2, 69
	ldi	r0, __L.str.19+1
	ldi	r1, CURR_CHAR
	ldi	r3, 0
__LBB20_2:                              # %while.body.i
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r2
	stw	r1, r2
	ldb	r0, r2
	add	r0, 1
	cmp	r2, r3
	beq	__LBB20_56
	br	__LBB20_2
__LBB20_6:                              # %while.body5.i.preheader
	ldi	r5, 0
	movens	r5, r4
	br	__LBB20_8
__LBB20_8:                              # %while.body5.i
                                        # =>This Inner Loop Header: Depth=1
	ldi	r0, 3276
	cmp	r4, r0
	bgt	__LBB20_7
	br	__LBB20_9
__LBB20_9:                              # %if.end9.i
                                        #   in Loop: Header=BB20_8 Depth=1
	ssw	r5, -10
	lsw	r0, -10
	add r0, r4, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r4, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r4, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r4, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r4, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r4, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r4, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r4, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r4, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r4, r0
	ssw	r0, -10
	and r3, r1, r0
	lsw	r4, -10
	ldb	r6, r3
	movens	r3, r2
	sub	r2, 58
	and r2, r1, r2
	add r0, r4, r4
	add	r6, 1
	sub	r4, 48
	ldi	r0, 245
	cmp	r2, r0
	bhi	__LBB20_8
	br	__LBB20_10
__LBB20_10:                             # %while.cond14.i.preheader
	ldi	r0, 32
__LBB20_11:                             # %while.cond14.i
                                        # =>This Inner Loop Header: Depth=1
	and r3, r1, r2
	cmp	r2, r0
	beq	__LBB20_13
	br	__LBB20_12
__LBB20_13:                             # %while.body18.i
                                        #   in Loop: Header=BB20_11 Depth=1
	ldb	r6, r3
	add	r6, 1
	br	__LBB20_11
__LBB20_12:                             # %while.cond14.i
	ldi	r0, 0
	cmp	r2, r0
	beq	__LBB20_14
	br	__LBB20_7
__LBB20_14:                             # %lor.lhs.false
	ldi	r0, 2
	lsw	r3, -16                         # 2-byte Folded Reload
	ldb	r3, r0, r0
	ldi	r2, 3
	ldb	r3, r2, r2
	shl	r2, r2, 8
	or r2, r0, r2
	ldi	r0, 32
__LBB20_15:                             # %while.cond.i30
                                        # =>This Inner Loop Header: Depth=1
	ldb	r2, r5
	add	r2, 1
	cmp	r5, r0
	beq	__LBB20_15
	br	__LBB20_16
__LBB20_16:                             # %while.end.i34
	movens	r5, r0
	sub	r0, 58
	and r0, r1, r0
	ldi	r3, 246
	cmp	r0, r3
	blo	__LBB20_7
	br	__LBB20_17
__LBB20_17:                             # %while.body5.i35.preheader
	ldi	r6, 0
__LBB20_18:                             # %while.body5.i35
                                        # =>This Inner Loop Header: Depth=1
	ldi	r0, 3276
	cmp	r6, r0
	bgt	__LBB20_7
	br	__LBB20_19
__LBB20_19:                             # %if.end9.i39
                                        #   in Loop: Header=BB20_18 Depth=1
	ldi	r0, 0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r6, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r6, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r6, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r6, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r6, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r6, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r6, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r6, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r6, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r6, r0
	ssw	r0, -10
	and r5, r1, r0
	lsw	r3, -10
	ldb	r2, r5
	movens	r5, r6
	sub	r6, 58
	ldi	r1, 255
	and r6, r1, r1
	add r0, r3, r6
	add	r2, 1
	sub	r6, 48
	ldi	r0, 245
	cmp	r1, r0
	ldi	r1, 255
	bhi	__LBB20_18
	br	__LBB20_20
__LBB20_20:                             # %while.cond14.i66.preheader
	ldi	r0, 32
__LBB20_21:                             # %while.cond14.i66
                                        # =>This Inner Loop Header: Depth=1
	and r5, r1, r5
	cmp	r5, r0
	beq	__LBB20_23
	br	__LBB20_22
__LBB20_23:                             # %while.body18.i70
                                        #   in Loop: Header=BB20_21 Depth=1
	ldb	r2, r5
	add	r2, 1
	br	__LBB20_21
__LBB20_22:                             # %while.cond14.i66
	ldi	r0, 0
	cmp	r5, r0
	beq	__LBB20_24
	br	__LBB20_7
__LBB20_24:                             # %lor.lhs.false4
	ldi	r0, 4
	lsw	r1, -16                         # 2-byte Folded Reload
	ldb	r1, r0, r0
	ldi	r2, 5
	ldb	r1, r2, r1
	shl	r1, r1, 8
	or r1, r0, r2
	ldi	r0, 32
__LBB20_25:                             # %while.cond.i75
                                        # =>This Inner Loop Header: Depth=1
	ldb	r2, r5
	add	r2, 1
	cmp	r5, r0
	beq	__LBB20_25
	br	__LBB20_26
__LBB20_26:                             # %while.end.i79
	movens	r5, r0
	sub	r0, 58
	ldi	r1, 255
	and r0, r1, r0
	ldi	r3, 246
	cmp	r0, r3
	blo	__LBB20_7
	br	__LBB20_27
__LBB20_27:                             # %while.body5.i80.preheader
	ldi	r3, 0
__LBB20_28:                             # %while.body5.i80
                                        # =>This Inner Loop Header: Depth=1
	ldi	r0, 3276
	cmp	r3, r0
	bgt	__LBB20_7
	br	__LBB20_29
__LBB20_29:                             # %if.end9.i84
                                        #   in Loop: Header=BB20_28 Depth=1
	ldi	r0, 0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r3, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r3, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r3, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r3, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r3, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r3, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r3, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r3, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r3, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r3, r0
	ssw	r0, -10
	and r5, r1, r0
	ssw	r0, -18                         # 2-byte Folded Spill
	lsw	r1, -10
	ldb	r2, r5
	movens	r5, r3
	sub	r3, 58
	ldi	r0, 255
	and r3, r0, r0
	ssw	r0, -20                         # 2-byte Folded Spill
	lsw	r0, -18                         # 2-byte Folded Reload
	add r0, r1, r3
	add	r2, 1
	sub	r3, 48
	ldi	r0, 245
	lsw	r1, -20                         # 2-byte Folded Reload
	cmp	r1, r0
	ldi	r1, 255
	bhi	__LBB20_28
	br	__LBB20_30
__LBB20_30:                             # %while.cond14.i111.preheader
	ldi	r0, 32
__LBB20_31:                             # %while.cond14.i111
                                        # =>This Inner Loop Header: Depth=1
	and r5, r1, r5
	cmp	r5, r0
	beq	__LBB20_33
	br	__LBB20_32
__LBB20_33:                             # %while.body18.i115
                                        #   in Loop: Header=BB20_31 Depth=1
	ldb	r2, r5
	add	r2, 1
	br	__LBB20_31
__LBB20_32:                             # %while.cond14.i111
	ldi	r0, 0
	cmp	r5, r0
	beq	__LBB20_34
	br	__LBB20_7
__LBB20_34:                             # %lor.lhs.false8
	ssw	r3, -22                         # 2-byte Folded Spill
	ldi	r0, 6
	lsw	r2, -16                         # 2-byte Folded Reload
	ldb	r2, r0, r0
	ldi	r1, 7
	ldb	r2, r1, r1
	shl	r1, r1, 8
	or r1, r0, r2
	ldi	r0, 32
__LBB20_35:                             # %while.cond.i120
                                        # =>This Inner Loop Header: Depth=1
	ldb	r2, r5
	add	r2, 1
	cmp	r5, r0
	beq	__LBB20_35
	br	__LBB20_36
__LBB20_36:                             # %while.end.i124
	movens	r5, r0
	sub	r0, 58
	ldi	r1, 255
	and r0, r1, r0
	ldi	r3, 246
	cmp	r0, r3
	blo	__LBB20_7
	br	__LBB20_37
__LBB20_37:                             # %while.body5.i125.preheader
	ldi	r3, 0
__LBB20_38:                             # %while.body5.i125
                                        # =>This Inner Loop Header: Depth=1
	ldi	r0, 3276
	cmp	r3, r0
	bgt	__LBB20_7
	br	__LBB20_39
__LBB20_39:                             # %if.end9.i129
                                        #   in Loop: Header=BB20_38 Depth=1
	ldi	r0, 0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r3, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r3, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r3, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r3, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r3, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r3, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r3, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r3, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r3, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r3, r0
	ssw	r0, -10
	and r5, r1, r0
	ssw	r0, -18                         # 2-byte Folded Spill
	lsw	r1, -10
	ldb	r2, r5
	movens	r5, r3
	sub	r3, 58
	ldi	r0, 255
	and r3, r0, r0
	ssw	r0, -20                         # 2-byte Folded Spill
	lsw	r0, -18                         # 2-byte Folded Reload
	add r0, r1, r3
	add	r2, 1
	sub	r3, 48
	ldi	r0, 245
	lsw	r1, -20                         # 2-byte Folded Reload
	cmp	r1, r0
	ldi	r1, 255
	bhi	__LBB20_38
	br	__LBB20_40
__LBB20_40:                             # %while.cond14.i156.preheader
	ldi	r0, 32
__LBB20_41:                             # %while.cond14.i156
                                        # =>This Inner Loop Header: Depth=1
	and r5, r1, r5
	cmp	r5, r0
	beq	__LBB20_43
	br	__LBB20_42
__LBB20_43:                             # %while.body18.i160
                                        #   in Loop: Header=BB20_41 Depth=1
	ldb	r2, r5
	add	r2, 1
	br	__LBB20_41
__LBB20_42:                             # %while.cond14.i156
	ldi	r0, 0
	cmp	r5, r0
	beq	__LBB20_44
	br	__LBB20_7
__LBB20_44:                             # %lor.lhs.false12
	ssw	r3, -18                         # 2-byte Folded Spill
	ldi	r0, 8
	lsw	r2, -16                         # 2-byte Folded Reload
	ldb	r2, r0, r0
	ldi	r1, 9
	ldb	r2, r1, r1
	shl	r1, r1, 8
	or r1, r0, r5
	ldi	r0, 32
__LBB20_45:                             # %while.cond.i165
                                        # =>This Inner Loop Header: Depth=1
	ldb	r5, r2
	add	r5, 1
	cmp	r2, r0
	beq	__LBB20_45
	br	__LBB20_46
__LBB20_46:                             # %while.end.i169
	movens	r2, r0
	sub	r0, 58
	ldi	r1, 255
	and r0, r1, r0
	ldi	r1, 246
	cmp	r0, r1
	blo	__LBB20_7
	br	__LBB20_47
__LBB20_47:                             # %while.body5.i170.preheader
	ldi	r0, 0
	movens	r0, r1
__LBB20_48:                             # %while.body5.i170
                                        # =>This Inner Loop Header: Depth=1
	ldi	r0, 3276
	cmp	r1, r0
	movens	r1, r3
	ldi	r1, 255
	bgt	__LBB20_7
	br	__LBB20_49
__LBB20_49:                             # %if.end9.i174
                                        #   in Loop: Header=BB20_48 Depth=1
	ldi	r0, 0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r3, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r3, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r3, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r3, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r3, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r3, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r3, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r3, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r3, r0
	ssw	r0, -10
	lsw	r0, -10
	add r0, r3, r0
	ssw	r0, -10
	and r2, r1, r0
	ssw	r0, -16                         # 2-byte Folded Spill
	lsw	r0, -10
	ldb	r5, r2
	movens	r2, r3
	sub	r3, 58
	and r3, r1, r3
	lsw	r1, -16                         # 2-byte Folded Reload
	add r1, r0, r1
	add	r5, 1
	sub	r1, 48
	ldi	r0, 245
	cmp	r3, r0
	bhi	__LBB20_48
	br	__LBB20_50
__LBB20_50:                             # %while.cond14.i201.preheader
	movens	r1, r3
	ldi	r0, 255
	ldi	r1, 32
__LBB20_51:                             # %while.cond14.i201
                                        # =>This Inner Loop Header: Depth=1
	and r2, r0, r0
	cmp	r0, r1
	beq	__LBB20_53
	br	__LBB20_52
__LBB20_53:                             # %while.body18.i205
                                        #   in Loop: Header=BB20_51 Depth=1
	ldb	r5, r2
	add	r5, 1
	ldi	r0, 255
	br	__LBB20_51
__LBB20_52:                             # %while.cond14.i201
	ldi	r1, 0
	cmp	r0, r1
	lsw	r2, -22                         # 2-byte Folded Reload
	lsw	r5, -18                         # 2-byte Folded Reload
	beq	__LBB20_55
	br	__LBB20_7
__LBB20_55:                             # %if.end17
	ldi	r0, -10
	add	r0, fp, r0
	ldi	r1, 2
	stw	r0, r1, r6
	movens	r1, r6
	ssw	r4, -10
	ldi	r1, -14
	add	r1, fp, r1
	stw	r1, r6, r5
	ssw	r2, -14
	movens	r3, r2
	jsr	FillCmd
__LBB20_56:                             # %cleanup.cont
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	22
	pop	fp
	rts
                                        # -- End function
SetGliderCmd>                           # -- Begin function SetGliderCmd
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-22
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	movens	r0, r4
	ldi	r3, START_STOP
	ldi	r2, 0
	stw	r3, r2
	or r1, r4, r2
	ldi	r3, 32
	cmp	r2, r3
	ldi	r2, CURR_CHAR
	blo	__LBB21_2
	br	__LBB21_1
__LBB21_2:                              # %SetCommand.exit50
	ldi	r3, 80
	stw	r2, r3
	ldi	r3, 108
	stw	r2, r3
	movens	r3, r5
	ldi	r3, 97
	ssw	r3, -14                         # 2-byte Folded Spill
	stw	r2, r3
	ldi	r3, 99
	ssw	r3, -16                         # 2-byte Folded Spill
	stw	r2, r3
	ldi	r0, 105
	stw	r2, r0
	ldi	r3, 110
	stw	r2, r3
	ldi	r3, 103
	stw	r2, r3
	ldi	r6, 32
	stw	r2, r6
	stw	r2, r3
	stw	r2, r5
	ssw	r0, -12                         # 2-byte Folded Spill
	stw	r2, r0
	ldi	r3, 100
	stw	r2, r3
	ldi	r3, 101
	stw	r2, r3
	ldi	r3, 114
	ssw	r3, -18                         # 2-byte Folded Spill
	stw	r2, r3
	ldi	r3, 46
	stw	r2, r3
	stw	r2, r3
	stw	r2, r3
	ldi	r3, 10
	stw	r2, r3
	movens	r4, r3
	add	r3, 1
	ldi	r0, 31
	and r3, r0, r5
	ssw	r5, -10                         # 2-byte Folded Spill
	movens	r1, r3
	add	r3, 2
	and r3, r0, r3
	ssw	r3, -8                          # 2-byte Folded Spill
	movens	r1, r6
	add	r6, 1
	and r6, r0, r6
	ssw	r6, -20                         # 2-byte Folded Spill
	movens	r4, r6
	add	r6, 2
	and r6, r0, r0
	ssw	r0, -22                         # 2-byte Folded Spill
	ldi	r3, CELL_ADR
	stw	r3, r5
	ldi	r5, 108
	ldi	r3, LINE_ADR
	stw	r3, r1
	ldi	r1, VALUE
	ldi	r6, 1
	stw	r1, r6
	ldi	r1, UPDATE
	stw	r1, r6
	ldi	r1, CELL_ADR
	stw	r1, r0
	lsw	r0, -20                         # 2-byte Folded Reload
	stw	r3, r0
	ldi	r3, VALUE
	stw	r3, r6
	ldi	r0, UPDATE
	stw	r0, r6
	stw	r1, r4
	ldi	r4, LINE_ADR
	lsw	r0, -8                          # 2-byte Folded Reload
	stw	r4, r0
	stw	r3, r6
	ldi	r0, UPDATE
	stw	r0, r6
	lsw	r3, -10                         # 2-byte Folded Reload
	stw	r1, r3
	lsw	r3, -8                          # 2-byte Folded Reload
	stw	r4, r3
	ldi	r0, VALUE
	stw	r0, r6
	ldi	r0, UPDATE
	stw	r0, r6
	lsw	r0, -22                         # 2-byte Folded Reload
	stw	r1, r0
	stw	r4, r3
	ldi	r0, VALUE
	stw	r0, r6
	ldi	r0, UPDATE
	stw	r0, r6
	ldi	r0, gmState
	ldw	r0, r0
	ldi	r1, START_STOP
	stw	r1, r0
	ldi	r0, 112
	ldi	r6, 71
	movens	r5, r3
	ldi	r4, 101
	ssw	r4, -8                          # 2-byte Folded Spill
	ldi	r1, 100
	ssw	r1, -10                         # 2-byte Folded Spill
__LBB21_3:                              # %return
	stw	r2, r6
	stw	r2, r5
	lsw	r5, -12                         # 2-byte Folded Reload
	stw	r2, r5
	lsw	r5, -10                         # 2-byte Folded Reload
	stw	r2, r5
	lsw	r5, -8                          # 2-byte Folded Reload
	stw	r2, r5
	lsw	r5, -18                         # 2-byte Folded Reload
	stw	r2, r5
	ldi	r5, 32
	stw	r2, r5
	stw	r2, r0
	stw	r2, r3
	lsw	r0, -14                         # 2-byte Folded Reload
	stw	r2, r0
	lsw	r0, -16                         # 2-byte Folded Reload
	stw	r2, r0
	stw	r2, r4
	stw	r2, r1
	ldi	r0, 46
	stw	r2, r0
	ldi	r0, 10
	stw	r2, r0
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	22
	pop	fp
	rts
__LBB21_1:                              # %while.body.i.preheader
	ldi	r0, 69
	stw	r2, r0
	ldi	r0, 114
	stw	r2, r0
	stw	r2, r0
	ldi	r5, 111
	stw	r2, r5
	stw	r2, r0
	ldi	r1, 58
	stw	r2, r1
	stw	r2, r3
	ldi	r1, 67
	stw	r2, r1
	stw	r2, r5
	stw	r2, r5
	stw	r2, r0
	ldi	r0, 100
	ssw	r0, -8                          # 2-byte Folded Spill
	stw	r2, r0
	ldi	r0, 105
	stw	r2, r0
	ldi	r0, 110
	ssw	r0, -10                         # 2-byte Folded Spill
	stw	r2, r0
	ldi	r0, 97
	stw	r2, r0
	ldi	r0, 116
	stw	r2, r0
	ldi	r1, 101
	stw	r2, r1
	ldi	r1, 115
	ssw	r1, -18                         # 2-byte Folded Spill
	stw	r2, r1
	stw	r2, r3
	stw	r2, r5
	ldi	r1, 117
	ssw	r1, -12                         # 2-byte Folded Spill
	stw	r2, r1
	stw	r2, r0
	stw	r2, r3
	stw	r2, r5
	ldi	r0, 102
	stw	r2, r0
	stw	r2, r3
	ldi	r1, 93
	ldi	r4, 49
	ldi	r0, 51
	ssw	r0, -16                         # 2-byte Folded Spill
	ldi	r0, 45
	ssw	r0, -14                         # 2-byte Folded Spill
	ldi	r3, 48
	ldi	r0, 91
	ldi	r6, 98
	br	__LBB21_3
                                        # -- End function
SetGliderCmdWrapper>                    # -- Begin function SetGliderCmdWrapper
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-12
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r2, 2
	cmp	r1, r2
	beq	__LBB22_3
	br	__LBB22_1
__LBB22_3:                              # %if.end
	ldi	r1, 1
	ldb	r0, r1, r1
	shl	r1, r1, 8
	ssw	r0, -12                         # 2-byte Folded Spill
	ldb	r0, r0
	or r1, r0, r1
	ldi	r2, 32
__LBB22_4:                              # %while.cond.i
                                        # =>This Inner Loop Header: Depth=1
	ldb	r1, r5
	add	r1, 1
	cmp	r5, r2
	beq	__LBB22_4
	br	__LBB22_5
__LBB22_5:                              # %while.end.i
	movens	r5, r0
	sub	r0, 58
	ldi	r3, 255
	and r0, r3, r0
	ldi	r3, 246
	cmp	r0, r3
	blo	__LBB22_7
	br	__LBB22_6
__LBB22_7:                              # %while.body.i53.preheader
	ldi	r2, 69
	ldi	r0, __L.str.24+1
	ldi	r1, CURR_CHAR
	ldi	r3, 0
	br	__LBB22_23
__LBB22_23:                             # %while.body.i53
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r2
	stw	r1, r2
	ldb	r0, r2
	add	r0, 1
	cmp	r2, r3
	beq	__LBB22_25
	br	__LBB22_23
__LBB22_1:                              # %while.body.i.preheader
	ldi	r2, 69
	ldi	r0, __L.str.23+1
	ldi	r1, CURR_CHAR
	ldi	r3, 0
__LBB22_2:                              # %while.body.i
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r2
	stw	r1, r2
	ldb	r0, r2
	add	r0, 1
	cmp	r2, r3
	beq	__LBB22_25
	br	__LBB22_2
__LBB22_6:                              # %while.body5.i.preheader
	ldi	r0, 0
	br	__LBB22_8
__LBB22_8:                              # %while.body5.i
                                        # =>This Inner Loop Header: Depth=1
	ldi	r3, 3276
	cmp	r0, r3
	bgt	__LBB22_7
	br	__LBB22_9
__LBB22_9:                              # %if.end9.i
                                        #   in Loop: Header=BB22_8 Depth=1
	ldi	r3, 0
	ssw	r3, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r0
	ssw	r0, -10
	ldi	r0, 255
	movens	r0, r3
	and r5, r3, r0
	lsw	r4, -10
	ldb	r1, r5
	movens	r5, r6
	sub	r6, 58
	and r6, r3, r6
	add r0, r4, r0
	add	r1, 1
	sub	r0, 48
	ldi	r3, 245
	cmp	r6, r3
	bhi	__LBB22_8
	br	__LBB22_10
__LBB22_10:                             # %while.cond14.i.preheader
	ldi	r3, 255
__LBB22_11:                             # %while.cond14.i
                                        # =>This Inner Loop Header: Depth=1
	and r5, r3, r5
	cmp	r5, r2
	beq	__LBB22_13
	br	__LBB22_12
__LBB22_13:                             # %while.body18.i
                                        #   in Loop: Header=BB22_11 Depth=1
	ldb	r1, r5
	add	r1, 1
	br	__LBB22_11
__LBB22_12:                             # %while.cond14.i
	ldi	r1, 0
	cmp	r5, r1
	beq	__LBB22_14
	br	__LBB22_7
__LBB22_14:                             # %lor.lhs.false
	lsw	r1, -12                         # 2-byte Folded Reload
	ldi	r3, 2
	ldb	r1, r3, r4
	ldi	r5, 3
	ldb	r1, r5, r1
	shl	r1, r1, 8
	or r1, r4, r6
__LBB22_15:                             # %while.cond.i9
                                        # =>This Inner Loop Header: Depth=1
	ldb	r6, r3
	add	r6, 1
	cmp	r3, r2
	beq	__LBB22_15
	br	__LBB22_16
__LBB22_16:                             # %while.end.i13
	movens	r3, r1
	sub	r1, 58
	ldi	r4, 255
	and r1, r4, r1
	ldi	r4, 246
	cmp	r1, r4
	blo	__LBB22_7
	br	__LBB22_17
__LBB22_17:                             # %while.body5.i14.preheader
	ldi	r1, 0
__LBB22_18:                             # %while.body5.i14
                                        # =>This Inner Loop Header: Depth=1
	ldi	r4, 3276
	cmp	r1, r4
	bgt	__LBB22_7
	br	__LBB22_19
__LBB22_19:                             # %if.end9.i18
                                        #   in Loop: Header=BB22_18 Depth=1
	ldi	r4, 0
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r1
	ssw	r1, -8
	ldi	r1, 255
	and r3, r1, r1
	ssw	r1, -12                         # 2-byte Folded Spill
	lsw	r4, -8
	ldb	r6, r3
	movens	r3, r5
	sub	r5, 58
	ldi	r1, 255
	and r5, r1, r5
	lsw	r1, -12                         # 2-byte Folded Reload
	add r1, r4, r1
	add	r6, 1
	sub	r1, 48
	ldi	r4, 245
	cmp	r5, r4
	bhi	__LBB22_18
	br	__LBB22_20
__LBB22_22:                             # %while.body18.i49
                                        #   in Loop: Header=BB22_20 Depth=1
	ldb	r6, r3
	add	r6, 1
	br	__LBB22_20
__LBB22_20:                             # %while.cond14.i45
                                        # =>This Inner Loop Header: Depth=1
	ldi	r4, 255
	and r3, r4, r4
	cmp	r4, r2
	beq	__LBB22_22
	br	__LBB22_21
__LBB22_21:                             # %while.cond14.i45
	ldi	r2, 0
	cmp	r4, r2
	beq	__LBB22_24
	br	__LBB22_7
__LBB22_24:                             # %if.end5
	jsr	SetGliderCmd
__LBB22_25:                             # %cleanup.cont
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	12
	pop	fp
	rts
                                        # -- End function
SetBeeQueenCmd>                         # -- Begin function SetBeeQueenCmd
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-38
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	movens	r0, r6
	ldi	r2, START_STOP
	ldi	r0, 0
	stw	r2, r0
	or r1, r6, r0
	ldi	r5, 32
	cmp	r0, r5
	ldi	r2, CURR_CHAR
	blo	__LBB23_2
	br	__LBB23_1
__LBB23_2:                              # %SetCommand.exit92
	ldi	r0, 80
	stw	r2, r0
	ldi	r0, 108
	ssw	r0, -10                         # 2-byte Folded Spill
	stw	r2, r0
	ldi	r0, 97
	ssw	r0, -12                         # 2-byte Folded Spill
	stw	r2, r0
	ldi	r0, 99
	ssw	r0, -14                         # 2-byte Folded Spill
	stw	r2, r0
	ldi	r0, 105
	stw	r2, r0
	ldi	r4, 110
	stw	r2, r4
	ldi	r0, 103
	stw	r2, r0
	stw	r2, r5
	ldi	r0, 98
	stw	r2, r0
	ldi	r3, 101
	stw	r2, r3
	stw	r2, r3
	ssw	r5, -16                         # 2-byte Folded Spill
	stw	r2, r5
	ldi	r0, 113
	ssw	r0, -18                         # 2-byte Folded Spill
	stw	r2, r0
	ldi	r0, 117
	stw	r2, r0
	stw	r2, r3
	stw	r2, r3
	ssw	r4, -8                          # 2-byte Folded Spill
	stw	r2, r4
	ldi	r0, 46
	stw	r2, r0
	stw	r2, r0
	stw	r2, r0
	ldi	r0, 10
	stw	r2, r0
	movens	r1, r3
	add	r3, 6
	ldi	r0, 31
	and r3, r0, r3
	ssw	r3, -24                         # 2-byte Folded Spill
	movens	r1, r3
	add	r3, 5
	and r3, r0, r3
	ssw	r3, -26                         # 2-byte Folded Spill
	movens	r1, r3
	add	r3, 4
	and r3, r0, r3
	ssw	r3, -28                         # 2-byte Folded Spill
	movens	r1, r3
	add	r3, 3
	and r3, r0, r3
	ssw	r3, -30                         # 2-byte Folded Spill
	movens	r1, r3
	add	r3, 2
	and r3, r0, r3
	ssw	r3, -32                         # 2-byte Folded Spill
	movens	r6, r3
	add	r3, 3
	and r3, r0, r3
	ssw	r3, -22                         # 2-byte Folded Spill
	movens	r1, r3
	add	r3, 1
	and r3, r0, r3
	ssw	r3, -38                         # 2-byte Folded Spill
	movens	r6, r3
	add	r3, 2
	and r3, r0, r3
	ssw	r3, -20                         # 2-byte Folded Spill
	movens	r6, r3
	add	r3, 1
	and r3, r0, r3
	ssw	r3, -36                         # 2-byte Folded Spill
	ldi	r0, CELL_ADR
	stw	r0, r6
	ldi	r0, LINE_ADR
	stw	r0, r1
	ldi	r4, VALUE
	ssw	r6, -34                         # 2-byte Folded Spill
	ldi	r6, 1
	stw	r4, r6
	ldi	r0, UPDATE
	stw	r0, r6
	ldi	r5, CELL_ADR
	stw	r5, r3
	ldi	r5, LINE_ADR
	stw	r5, r1
	stw	r4, r6
	stw	r0, r6
	ldi	r3, CELL_ADR
	lsw	r1, -20                         # 2-byte Folded Reload
	stw	r3, r1
	lsw	r1, -38                         # 2-byte Folded Reload
	stw	r5, r1
	stw	r4, r6
	stw	r0, r6
	lsw	r1, -22                         # 2-byte Folded Reload
	stw	r3, r1
	lsw	r5, -32                         # 2-byte Folded Reload
	ldi	r4, LINE_ADR
	stw	r4, r5
	ldi	r4, VALUE
	stw	r4, r6
	stw	r0, r6
	stw	r3, r1
	lsw	r1, -30                         # 2-byte Folded Reload
	ldi	r5, LINE_ADR
	stw	r5, r1
	stw	r4, r6
	stw	r0, r6
	lsw	r1, -22                         # 2-byte Folded Reload
	stw	r3, r1
	lsw	r1, -28                         # 2-byte Folded Reload
	stw	r5, r1
	stw	r4, r6
	stw	r0, r6
	lsw	r1, -20                         # 2-byte Folded Reload
	stw	r3, r1
	lsw	r1, -26                         # 2-byte Folded Reload
	stw	r5, r1
	stw	r4, r6
	stw	r0, r6
	lsw	r1, -34                         # 2-byte Folded Reload
	stw	r3, r1
	lsw	r1, -24                         # 2-byte Folded Reload
	stw	r5, r1
	stw	r4, r6
	stw	r0, r6
	lsw	r3, -36                         # 2-byte Folded Reload
	ldi	r0, CELL_ADR
	stw	r0, r3
	stw	r5, r1
	stw	r4, r6
	ldi	r0, UPDATE
	stw	r0, r6
	ldi	r0, gmState
	ldw	r0, r0
	ldi	r1, START_STOP
	stw	r1, r0
	ldi	r0, 100
	ssw	r0, -20                         # 2-byte Folded Spill
	ldi	r0, 112
	ssw	r0, -22                         # 2-byte Folded Spill
	ldi	r0, 66
	ldi	r3, 101
	movens	r3, r5
	movens	r3, r4
	movens	r3, r1
	movens	r3, r6
__LBB23_3:                              # %return
	stw	r2, r0
	stw	r2, r6
	stw	r2, r5
	lsw	r0, -16                         # 2-byte Folded Reload
	stw	r2, r0
	lsw	r0, -18                         # 2-byte Folded Reload
	stw	r2, r0
	ldi	r0, 117
	stw	r2, r0
	stw	r2, r4
	stw	r2, r1
	lsw	r0, -8                          # 2-byte Folded Reload
	stw	r2, r0
	ldi	r0, 32
	stw	r2, r0
	lsw	r0, -22                         # 2-byte Folded Reload
	stw	r2, r0
	lsw	r0, -10                         # 2-byte Folded Reload
	stw	r2, r0
	lsw	r0, -12                         # 2-byte Folded Reload
	stw	r2, r0
	lsw	r0, -14                         # 2-byte Folded Reload
	stw	r2, r0
	stw	r2, r3
	lsw	r0, -20                         # 2-byte Folded Reload
	stw	r2, r0
	ldi	r0, 46
	stw	r2, r0
	ldi	r0, 10
	stw	r2, r0
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	38
	pop	fp
	rts
__LBB23_1:                              # %while.body.i.preheader
	ldi	r0, 69
	stw	r2, r0
	ldi	r1, 114
	stw	r2, r1
	stw	r2, r1
	ldi	r0, 111
	stw	r2, r0
	stw	r2, r1
	ldi	r3, 58
	stw	r2, r3
	stw	r2, r5
	ldi	r3, 67
	stw	r2, r3
	stw	r2, r0
	stw	r2, r0
	stw	r2, r1
	ldi	r1, 100
	stw	r2, r1
	ldi	r3, 105
	stw	r2, r3
	ldi	r4, 110
	stw	r2, r4
	ldi	r3, 97
	stw	r2, r3
	ldi	r6, 116
	stw	r2, r6
	movens	r5, r3
	ldi	r5, 101
	stw	r2, r5
	ldi	r5, 115
	ssw	r5, -8                          # 2-byte Folded Spill
	stw	r2, r5
	stw	r2, r3
	stw	r2, r0
	ldi	r5, 117
	stw	r2, r5
	stw	r2, r6
	stw	r2, r3
	ldi	r5, 93
	ssw	r5, -20                         # 2-byte Folded Spill
	ldi	r5, 51
	ssw	r5, -14                         # 2-byte Folded Spill
	ldi	r5, 45
	ssw	r5, -12                         # 2-byte Folded Spill
	ldi	r5, 48
	ssw	r5, -10                         # 2-byte Folded Spill
	ldi	r5, 91
	ssw	r5, -22                         # 2-byte Folded Spill
	ldi	r5, 98
	ssw	r5, -16                         # 2-byte Folded Spill
	ldi	r6, 102
	movens	r3, r5
	ldi	r3, 49
	ssw	r0, -18                         # 2-byte Folded Spill
	br	__LBB23_3
                                        # -- End function
SetBeeQueenCmdWrapper>                  # -- Begin function SetBeeQueenCmdWrapper
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-12
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r2, 2
	cmp	r1, r2
	beq	__LBB24_3
	br	__LBB24_1
__LBB24_3:                              # %if.end
	ldi	r1, 1
	ldb	r0, r1, r1
	shl	r1, r1, 8
	ssw	r0, -12                         # 2-byte Folded Spill
	ldb	r0, r0
	or r1, r0, r1
	ldi	r2, 32
__LBB24_4:                              # %while.cond.i
                                        # =>This Inner Loop Header: Depth=1
	ldb	r1, r5
	add	r1, 1
	cmp	r5, r2
	beq	__LBB24_4
	br	__LBB24_5
__LBB24_5:                              # %while.end.i
	movens	r5, r0
	sub	r0, 58
	ldi	r3, 255
	and r0, r3, r0
	ldi	r3, 246
	cmp	r0, r3
	blo	__LBB24_7
	br	__LBB24_6
__LBB24_7:                              # %while.body.i53.preheader
	ldi	r2, 69
	ldi	r0, __L.str.28+1
	ldi	r1, CURR_CHAR
	ldi	r3, 0
	br	__LBB24_23
__LBB24_23:                             # %while.body.i53
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r2
	stw	r1, r2
	ldb	r0, r2
	add	r0, 1
	cmp	r2, r3
	beq	__LBB24_25
	br	__LBB24_23
__LBB24_1:                              # %while.body.i.preheader
	ldi	r2, 69
	ldi	r0, __L.str.27+1
	ldi	r1, CURR_CHAR
	ldi	r3, 0
__LBB24_2:                              # %while.body.i
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r2
	stw	r1, r2
	ldb	r0, r2
	add	r0, 1
	cmp	r2, r3
	beq	__LBB24_25
	br	__LBB24_2
__LBB24_6:                              # %while.body5.i.preheader
	ldi	r0, 0
	br	__LBB24_8
__LBB24_8:                              # %while.body5.i
                                        # =>This Inner Loop Header: Depth=1
	ldi	r3, 3276
	cmp	r0, r3
	bgt	__LBB24_7
	br	__LBB24_9
__LBB24_9:                              # %if.end9.i
                                        #   in Loop: Header=BB24_8 Depth=1
	ldi	r3, 0
	ssw	r3, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r0
	ssw	r0, -10
	ldi	r0, 255
	movens	r0, r3
	and r5, r3, r0
	lsw	r4, -10
	ldb	r1, r5
	movens	r5, r6
	sub	r6, 58
	and r6, r3, r6
	add r0, r4, r0
	add	r1, 1
	sub	r0, 48
	ldi	r3, 245
	cmp	r6, r3
	bhi	__LBB24_8
	br	__LBB24_10
__LBB24_10:                             # %while.cond14.i.preheader
	ldi	r3, 255
__LBB24_11:                             # %while.cond14.i
                                        # =>This Inner Loop Header: Depth=1
	and r5, r3, r5
	cmp	r5, r2
	beq	__LBB24_13
	br	__LBB24_12
__LBB24_13:                             # %while.body18.i
                                        #   in Loop: Header=BB24_11 Depth=1
	ldb	r1, r5
	add	r1, 1
	br	__LBB24_11
__LBB24_12:                             # %while.cond14.i
	ldi	r1, 0
	cmp	r5, r1
	beq	__LBB24_14
	br	__LBB24_7
__LBB24_14:                             # %lor.lhs.false
	lsw	r1, -12                         # 2-byte Folded Reload
	ldi	r3, 2
	ldb	r1, r3, r4
	ldi	r5, 3
	ldb	r1, r5, r1
	shl	r1, r1, 8
	or r1, r4, r6
__LBB24_15:                             # %while.cond.i9
                                        # =>This Inner Loop Header: Depth=1
	ldb	r6, r3
	add	r6, 1
	cmp	r3, r2
	beq	__LBB24_15
	br	__LBB24_16
__LBB24_16:                             # %while.end.i13
	movens	r3, r1
	sub	r1, 58
	ldi	r4, 255
	and r1, r4, r1
	ldi	r4, 246
	cmp	r1, r4
	blo	__LBB24_7
	br	__LBB24_17
__LBB24_17:                             # %while.body5.i14.preheader
	ldi	r1, 0
__LBB24_18:                             # %while.body5.i14
                                        # =>This Inner Loop Header: Depth=1
	ldi	r4, 3276
	cmp	r1, r4
	bgt	__LBB24_7
	br	__LBB24_19
__LBB24_19:                             # %if.end9.i18
                                        #   in Loop: Header=BB24_18 Depth=1
	ldi	r4, 0
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r1
	ssw	r1, -8
	ldi	r1, 255
	and r3, r1, r1
	ssw	r1, -12                         # 2-byte Folded Spill
	lsw	r4, -8
	ldb	r6, r3
	movens	r3, r5
	sub	r5, 58
	ldi	r1, 255
	and r5, r1, r5
	lsw	r1, -12                         # 2-byte Folded Reload
	add r1, r4, r1
	add	r6, 1
	sub	r1, 48
	ldi	r4, 245
	cmp	r5, r4
	bhi	__LBB24_18
	br	__LBB24_20
__LBB24_22:                             # %while.body18.i49
                                        #   in Loop: Header=BB24_20 Depth=1
	ldb	r6, r3
	add	r6, 1
	br	__LBB24_20
__LBB24_20:                             # %while.cond14.i45
                                        # =>This Inner Loop Header: Depth=1
	ldi	r4, 255
	and r3, r4, r4
	cmp	r4, r2
	beq	__LBB24_22
	br	__LBB24_21
__LBB24_21:                             # %while.cond14.i45
	ldi	r2, 0
	cmp	r4, r2
	beq	__LBB24_24
	br	__LBB24_7
__LBB24_24:                             # %if.end5
	jsr	SetBeeQueenCmd
__LBB24_25:                             # %cleanup.cont
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	12
	pop	fp
	rts
                                        # -- End function
SetLWSSCmd>                             # -- Begin function SetLWSSCmd
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-44
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r3, START_STOP
	ldi	r2, 0
	stw	r3, r2
	or r1, r0, r3
	ldi	r2, 32
	cmp	r3, r2
	ldi	r2, CURR_CHAR
	blo	__LBB25_2
	br	__LBB25_1
__LBB25_2:                              # %SetCommand.exit90
	ldi	r3, 80
	stw	r2, r3
	ldi	r4, 108
	stw	r2, r4
	ldi	r3, 97
	stw	r2, r3
	ldi	r3, 99
	stw	r2, r3
	ldi	r5, 105
	stw	r2, r5
	ldi	r3, 110
	stw	r2, r3
	ldi	r3, 103
	stw	r2, r3
	ldi	r6, 32
	stw	r2, r6
	ssw	r4, -8                          # 2-byte Folded Spill
	stw	r2, r4
	stw	r2, r5
	stw	r2, r3
	movens	r3, r6
	ldi	r3, 104
	stw	r2, r3
	ldi	r4, 116
	stw	r2, r4
	ssw	r0, -10                         # 2-byte Folded Spill
	ldi	r5, 45
	ssw	r5, -22                         # 2-byte Folded Spill
	stw	r2, r5
	ldi	r5, 119
	ssw	r5, -18                         # 2-byte Folded Spill
	stw	r2, r5
	ldi	r0, 101
	stw	r2, r0
	movens	r0, r5
	ldi	r0, 105
	stw	r2, r0
	stw	r2, r6
	stw	r2, r3
	ssw	r4, -16                         # 2-byte Folded Spill
	stw	r2, r4
	ldi	r0, 32
	stw	r2, r0
	ldi	r4, 115
	stw	r2, r4
	ldi	r6, 112
	stw	r2, r6
	ldi	r0, 97
	stw	r2, r0
	ldi	r0, 99
	stw	r2, r0
	stw	r2, r5
	stw	r2, r4
	stw	r2, r3
	ldi	r0, 105
	stw	r2, r0
	stw	r2, r6
	ldi	r0, 46
	stw	r2, r0
	stw	r2, r0
	stw	r2, r0
	ldi	r0, 10
	stw	r2, r0
	lsw	r5, -10                         # 2-byte Folded Reload
	movens	r5, r0
	add	r0, 1
	ldi	r3, 31
	and r0, r3, r0
	movens	r1, r4
	add	r4, 1
	and r4, r3, r4
	ssw	r4, -14                         # 2-byte Folded Spill
	movens	r5, r4
	add	r4, 4
	and r4, r3, r4
	ssw	r4, -26                         # 2-byte Folded Spill
	movens	r5, r4
	add	r4, 3
	and r4, r3, r4
	ssw	r4, -12                         # 2-byte Folded Spill
	movens	r5, r4
	add	r4, 2
	and r4, r3, r4
	ssw	r4, -28                         # 2-byte Folded Spill
	movens	r1, r4
	add	r4, 3
	and r4, r3, r4
	ssw	r4, -20                         # 2-byte Folded Spill
	movens	r1, r4
	add	r4, 2
	and r4, r3, r3
	ssw	r3, -24                         # 2-byte Folded Spill
	ldi	r3, CELL_ADR
	stw	r3, r0
	ldi	r0, LINE_ADR
	stw	r0, r1
	ldi	r5, VALUE
	ldi	r0, 1
	stw	r5, r0
	ldi	r6, UPDATE
	stw	r6, r0
	lsw	r4, -28                         # 2-byte Folded Reload
	stw	r3, r4
	movens	r3, r4
	ldi	r3, LINE_ADR
	stw	r3, r1
	stw	r5, r0
	stw	r6, r0
	lsw	r3, -12                         # 2-byte Folded Reload
	stw	r4, r3
	ldi	r4, LINE_ADR
	stw	r4, r1
	stw	r5, r0
	stw	r6, r0
	lsw	r3, -26                         # 2-byte Folded Reload
	ldi	r5, CELL_ADR
	stw	r5, r3
	stw	r4, r1
	ldi	r1, VALUE
	stw	r1, r0
	stw	r6, r0
	lsw	r1, -10                         # 2-byte Folded Reload
	stw	r5, r1
	lsw	r1, -14                         # 2-byte Folded Reload
	stw	r4, r1
	ldi	r5, VALUE
	stw	r5, r0
	stw	r6, r0
	ldi	r5, CELL_ADR
	stw	r5, r3
	stw	r4, r1
	ldi	r5, VALUE
	stw	r5, r0
	stw	r6, r0
	ldi	r1, CELL_ADR
	stw	r1, r3
	movens	r1, r3
	lsw	r1, -24                         # 2-byte Folded Reload
	stw	r4, r1
	stw	r5, r0
	stw	r6, r0
	lsw	r1, -10                         # 2-byte Folded Reload
	stw	r3, r1
	lsw	r3, -20                         # 2-byte Folded Reload
	stw	r4, r3
	stw	r5, r0
	stw	r6, r0
	lsw	r1, -12                         # 2-byte Folded Reload
	ldi	r4, CELL_ADR
	stw	r4, r1
	ldi	r1, LINE_ADR
	stw	r1, r3
	stw	r5, r0
	stw	r6, r0
	ldi	r0, gmState
	ldw	r0, r0
	ldi	r1, START_STOP
	stw	r1, r0
	ldi	r0, 100
	ssw	r0, -26                         # 2-byte Folded Spill
	ldi	r1, 76
	ldi	r0, 105
	movens	r0, r5
	ssw	r0, -38                         # 2-byte Folded Spill
	ldi	r0, 103
	ssw	r0, -14                         # 2-byte Folded Spill
	ldi	r6, 104
	ssw	r6, -12                         # 2-byte Folded Spill
	ldi	r4, 101
	ssw	r4, -40                         # 2-byte Folded Spill
	ldi	r3, 115
	ssw	r3, -24                         # 2-byte Folded Spill
	ssw	r3, -44                         # 2-byte Folded Spill
	ldi	r3, 112
	ssw	r3, -42                         # 2-byte Folded Spill
	ssw	r3, -20                         # 2-byte Folded Spill
	ssw	r3, -34                         # 2-byte Folded Spill
	ldi	r3, 97
	ssw	r3, -36                         # 2-byte Folded Spill
	ssw	r3, -32                         # 2-byte Folded Spill
	ldi	r3, 99
	ssw	r3, -10                         # 2-byte Folded Spill
	ssw	r3, -30                         # 2-byte Folded Spill
	movens	r4, r3
	ssw	r3, -28                         # 2-byte Folded Spill
__LBB25_3:                              # %return
	stw	r2, r1
	stw	r2, r5
	lsw	r1, -14                         # 2-byte Folded Reload
	stw	r2, r1
	lsw	r1, -12                         # 2-byte Folded Reload
	stw	r2, r1
	lsw	r3, -16                         # 2-byte Folded Reload
	stw	r2, r3
	lsw	r3, -22                         # 2-byte Folded Reload
	stw	r2, r3
	lsw	r3, -18                         # 2-byte Folded Reload
	stw	r2, r3
	stw	r2, r4
	lsw	r3, -38                         # 2-byte Folded Reload
	stw	r2, r3
	stw	r2, r0
	stw	r2, r6
	ldi	r0, 116
	stw	r2, r0
	ldi	r0, 32
	movens	r0, r3
	stw	r2, r3
	lsw	r0, -24                         # 2-byte Folded Reload
	stw	r2, r0
	lsw	r0, -20                         # 2-byte Folded Reload
	stw	r2, r0
	lsw	r0, -36                         # 2-byte Folded Reload
	stw	r2, r0
	lsw	r0, -10                         # 2-byte Folded Reload
	stw	r2, r0
	lsw	r0, -40                         # 2-byte Folded Reload
	stw	r2, r0
	lsw	r0, -44                         # 2-byte Folded Reload
	stw	r2, r0
	stw	r2, r1
	stw	r2, r5
	lsw	r0, -42                         # 2-byte Folded Reload
	stw	r2, r0
	stw	r2, r3
	lsw	r0, -34                         # 2-byte Folded Reload
	stw	r2, r0
	lsw	r0, -8                          # 2-byte Folded Reload
	stw	r2, r0
	lsw	r0, -32                         # 2-byte Folded Reload
	stw	r2, r0
	lsw	r0, -30                         # 2-byte Folded Reload
	stw	r2, r0
	lsw	r0, -28                         # 2-byte Folded Reload
	stw	r2, r0
	lsw	r0, -26                         # 2-byte Folded Reload
	stw	r2, r0
	ldi	r0, 46
	stw	r2, r0
	ldi	r0, 10
	stw	r2, r0
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	44
	pop	fp
	rts
__LBB25_1:                              # %while.body.i.preheader
	ldi	r0, 69
	stw	r2, r0
	ldi	r1, 114
	stw	r2, r1
	stw	r2, r1
	ldi	r0, 111
	stw	r2, r0
	stw	r2, r1
	ldi	r3, 58
	stw	r2, r3
	ldi	r4, 32
	stw	r2, r4
	ldi	r3, 67
	stw	r2, r3
	stw	r2, r0
	stw	r2, r0
	ldi	r3, 93
	ssw	r3, -26                         # 2-byte Folded Spill
	ldi	r3, 49
	ssw	r3, -28                         # 2-byte Folded Spill
	ldi	r3, 51
	ssw	r3, -30                         # 2-byte Folded Spill
	ldi	r3, 45
	ssw	r3, -32                         # 2-byte Folded Spill
	ldi	r3, 48
	ssw	r3, -8                          # 2-byte Folded Spill
	ldi	r3, 91
	ssw	r3, -34                         # 2-byte Folded Spill
	ldi	r3, 98
	ssw	r3, -10                         # 2-byte Folded Spill
	ldi	r3, 102
	ssw	r3, -20                         # 2-byte Folded Spill
	ldi	r3, 101
	ssw	r3, -18                         # 2-byte Folded Spill
	ldi	r3, 97
	ssw	r3, -16                         # 2-byte Folded Spill
	ldi	r3, 110
	ssw	r3, -12                         # 2-byte Folded Spill
	ldi	r3, 105
	ssw	r3, -14                         # 2-byte Folded Spill
	ldi	r5, 100
	ldi	r3, 116
	ssw	r3, -22                         # 2-byte Folded Spill
	ssw	r4, -38                         # 2-byte Folded Spill
	ssw	r0, -24                         # 2-byte Folded Spill
	movens	r4, r6
	ssw	r6, -36                         # 2-byte Folded Spill
	ssw	r0, -40                         # 2-byte Folded Spill
	ldi	r3, 117
	movens	r3, r6
	ssw	r3, -44                         # 2-byte Folded Spill
	ldi	r3, 115
	movens	r3, r4
	ssw	r3, -42                         # 2-byte Folded Spill
	br	__LBB25_3
                                        # -- End function
SetLWSSCmdWrapper>                      # -- Begin function SetLWSSCmdWrapper
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-12
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r2, 2
	cmp	r1, r2
	beq	__LBB26_3
	br	__LBB26_1
__LBB26_3:                              # %if.end
	ldi	r1, 1
	ldb	r0, r1, r1
	shl	r1, r1, 8
	ssw	r0, -12                         # 2-byte Folded Spill
	ldb	r0, r0
	or r1, r0, r1
	ldi	r2, 32
__LBB26_4:                              # %while.cond.i
                                        # =>This Inner Loop Header: Depth=1
	ldb	r1, r5
	add	r1, 1
	cmp	r5, r2
	beq	__LBB26_4
	br	__LBB26_5
__LBB26_5:                              # %while.end.i
	movens	r5, r0
	sub	r0, 58
	ldi	r3, 255
	and r0, r3, r0
	ldi	r3, 246
	cmp	r0, r3
	blo	__LBB26_7
	br	__LBB26_6
__LBB26_7:                              # %while.body.i53.preheader
	ldi	r2, 69
	ldi	r0, __L.str.32+1
	ldi	r1, CURR_CHAR
	ldi	r3, 0
	br	__LBB26_23
__LBB26_23:                             # %while.body.i53
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r2
	stw	r1, r2
	ldb	r0, r2
	add	r0, 1
	cmp	r2, r3
	beq	__LBB26_25
	br	__LBB26_23
__LBB26_1:                              # %while.body.i.preheader
	ldi	r2, 69
	ldi	r0, __L.str.31+1
	ldi	r1, CURR_CHAR
	ldi	r3, 0
__LBB26_2:                              # %while.body.i
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r2
	stw	r1, r2
	ldb	r0, r2
	add	r0, 1
	cmp	r2, r3
	beq	__LBB26_25
	br	__LBB26_2
__LBB26_6:                              # %while.body5.i.preheader
	ldi	r0, 0
	br	__LBB26_8
__LBB26_8:                              # %while.body5.i
                                        # =>This Inner Loop Header: Depth=1
	ldi	r3, 3276
	cmp	r0, r3
	bgt	__LBB26_7
	br	__LBB26_9
__LBB26_9:                              # %if.end9.i
                                        #   in Loop: Header=BB26_8 Depth=1
	ldi	r3, 0
	ssw	r3, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r0
	ssw	r0, -10
	ldi	r0, 255
	movens	r0, r3
	and r5, r3, r0
	lsw	r4, -10
	ldb	r1, r5
	movens	r5, r6
	sub	r6, 58
	and r6, r3, r6
	add r0, r4, r0
	add	r1, 1
	sub	r0, 48
	ldi	r3, 245
	cmp	r6, r3
	bhi	__LBB26_8
	br	__LBB26_10
__LBB26_10:                             # %while.cond14.i.preheader
	ldi	r3, 255
__LBB26_11:                             # %while.cond14.i
                                        # =>This Inner Loop Header: Depth=1
	and r5, r3, r5
	cmp	r5, r2
	beq	__LBB26_13
	br	__LBB26_12
__LBB26_13:                             # %while.body18.i
                                        #   in Loop: Header=BB26_11 Depth=1
	ldb	r1, r5
	add	r1, 1
	br	__LBB26_11
__LBB26_12:                             # %while.cond14.i
	ldi	r1, 0
	cmp	r5, r1
	beq	__LBB26_14
	br	__LBB26_7
__LBB26_14:                             # %lor.lhs.false
	lsw	r1, -12                         # 2-byte Folded Reload
	ldi	r3, 2
	ldb	r1, r3, r4
	ldi	r5, 3
	ldb	r1, r5, r1
	shl	r1, r1, 8
	or r1, r4, r6
__LBB26_15:                             # %while.cond.i9
                                        # =>This Inner Loop Header: Depth=1
	ldb	r6, r3
	add	r6, 1
	cmp	r3, r2
	beq	__LBB26_15
	br	__LBB26_16
__LBB26_16:                             # %while.end.i13
	movens	r3, r1
	sub	r1, 58
	ldi	r4, 255
	and r1, r4, r1
	ldi	r4, 246
	cmp	r1, r4
	blo	__LBB26_7
	br	__LBB26_17
__LBB26_17:                             # %while.body5.i14.preheader
	ldi	r1, 0
__LBB26_18:                             # %while.body5.i14
                                        # =>This Inner Loop Header: Depth=1
	ldi	r4, 3276
	cmp	r1, r4
	bgt	__LBB26_7
	br	__LBB26_19
__LBB26_19:                             # %if.end9.i18
                                        #   in Loop: Header=BB26_18 Depth=1
	ldi	r4, 0
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r1
	ssw	r1, -8
	ldi	r1, 255
	and r3, r1, r1
	ssw	r1, -12                         # 2-byte Folded Spill
	lsw	r4, -8
	ldb	r6, r3
	movens	r3, r5
	sub	r5, 58
	ldi	r1, 255
	and r5, r1, r5
	lsw	r1, -12                         # 2-byte Folded Reload
	add r1, r4, r1
	add	r6, 1
	sub	r1, 48
	ldi	r4, 245
	cmp	r5, r4
	bhi	__LBB26_18
	br	__LBB26_20
__LBB26_22:                             # %while.body18.i49
                                        #   in Loop: Header=BB26_20 Depth=1
	ldb	r6, r3
	add	r6, 1
	br	__LBB26_20
__LBB26_20:                             # %while.cond14.i45
                                        # =>This Inner Loop Header: Depth=1
	ldi	r4, 255
	and r3, r4, r4
	cmp	r4, r2
	beq	__LBB26_22
	br	__LBB26_21
__LBB26_21:                             # %while.cond14.i45
	ldi	r2, 0
	cmp	r4, r2
	beq	__LBB26_24
	br	__LBB26_7
__LBB26_24:                             # %if.end5
	jsr	SetLWSSCmd
__LBB26_25:                             # %cleanup.cont
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	12
	pop	fp
	rts
                                        # -- End function
SetHWSSCmd>                             # -- Begin function SetHWSSCmd
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-48
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	movens	r0, r6
	ldi	r2, START_STOP
	ldi	r0, 0
	stw	r2, r0
	or r1, r6, r0
	ldi	r4, 32
	cmp	r0, r4
	ldi	r3, CURR_CHAR
	blo	__LBB27_2
	br	__LBB27_1
__LBB27_2:                              # %SetCommand.exit108
	ldi	r0, 80
	stw	r3, r0
	ldi	r0, 108
	ssw	r0, -8                          # 2-byte Folded Spill
	stw	r3, r0
	ldi	r0, 97
	stw	r3, r0
	movens	r0, r4
	ldi	r0, 99
	stw	r3, r0
	ldi	r0, 105
	stw	r3, r0
	ldi	r0, 110
	stw	r3, r0
	ldi	r2, 103
	stw	r3, r2
	ldi	r0, 32
	stw	r3, r0
	ldi	r0, 104
	stw	r3, r0
	ssw	r1, -38                         # 2-byte Folded Spill
	ldi	r1, 101
	stw	r3, r1
	stw	r3, r4
	ldi	r4, 118
	ssw	r4, -14                         # 2-byte Folded Spill
	stw	r3, r4
	ldi	r4, 121
	ssw	r4, -16                         # 2-byte Folded Spill
	stw	r3, r4
	ldi	r4, 45
	ssw	r4, -22                         # 2-byte Folded Spill
	stw	r3, r4
	ldi	r4, 119
	ssw	r4, -18                         # 2-byte Folded Spill
	stw	r3, r4
	stw	r3, r1
	ldi	r4, 105
	stw	r3, r4
	ssw	r2, -10                         # 2-byte Folded Spill
	stw	r3, r2
	stw	r3, r0
	movens	r0, r4
	ldi	r2, 116
	stw	r3, r2
	ldi	r0, 32
	stw	r3, r0
	ldi	r5, 115
	stw	r3, r5
	ldi	r2, 112
	stw	r3, r2
	ldi	r0, 97
	stw	r3, r0
	ldi	r0, 99
	stw	r3, r0
	stw	r3, r1
	stw	r3, r5
	stw	r3, r4
	ldi	r0, 105
	stw	r3, r0
	stw	r3, r2
	ldi	r0, 46
	stw	r3, r0
	stw	r3, r0
	stw	r3, r0
	ldi	r0, 10
	stw	r3, r0
	movens	r6, r2
	add	r2, 2
	ldi	r0, 31
	and r2, r0, r1
	ssw	r1, -24                         # 2-byte Folded Spill
	movens	r6, r2
	add	r2, 3
	and r2, r0, r1
	ssw	r1, -20                         # 2-byte Folded Spill
	lsw	r4, -38                         # 2-byte Folded Reload
	movens	r4, r2
	add	r2, 3
	and r2, r0, r1
	ssw	r1, -30                         # 2-byte Folded Spill
	movens	r4, r2
	add	r2, 2
	and r2, r0, r1
	ssw	r1, -34                         # 2-byte Folded Spill
	ssw	r6, -28                         # 2-byte Folded Spill
	movens	r6, r2
	add	r2, 6
	and r2, r0, r1
	ssw	r1, -12                         # 2-byte Folded Spill
	movens	r6, r2
	add	r2, 5
	and r2, r0, r1
	ssw	r1, -26                         # 2-byte Folded Spill
	movens	r4, r2
	add	r2, 1
	and r2, r0, r1
	ssw	r1, -42                         # 2-byte Folded Spill
	movens	r4, r2
	add	r2, 4
	and r2, r0, r1
	ssw	r1, -36                         # 2-byte Folded Spill
	movens	r6, r2
	add	r2, 1
	and r2, r0, r1
	ssw	r1, -40                         # 2-byte Folded Spill
	add	r6, 4
	and r6, r0, r0
	ssw	r0, -32                         # 2-byte Folded Spill
	ldi	r5, CELL_ADR
	lsw	r0, -24                         # 2-byte Folded Reload
	stw	r5, r0
	ldi	r1, LINE_ADR
	movens	r4, r0
	stw	r1, r0
	ldi	r6, VALUE
	ldi	r2, 1
	stw	r6, r2
	ldi	r4, UPDATE
	stw	r4, r2
	lsw	r1, -20                         # 2-byte Folded Reload
	stw	r5, r1
	ldi	r1, LINE_ADR
	stw	r1, r0
	stw	r6, r2
	stw	r4, r2
	lsw	r0, -28                         # 2-byte Folded Reload
	stw	r5, r0
	lsw	r0, -42                         # 2-byte Folded Reload
	stw	r1, r0
	stw	r6, r2
	stw	r4, r2
	lsw	r1, -26                         # 2-byte Folded Reload
	stw	r5, r1
	ldi	r1, LINE_ADR
	stw	r1, r0
	stw	r6, r2
	stw	r4, r2
	lsw	r0, -12                         # 2-byte Folded Reload
	stw	r5, r0
	lsw	r1, -34                         # 2-byte Folded Reload
	ldi	r0, LINE_ADR
	stw	r0, r1
	stw	r6, r2
	stw	r4, r2
	lsw	r1, -28                         # 2-byte Folded Reload
	stw	r5, r1
	lsw	r1, -30                         # 2-byte Folded Reload
	stw	r0, r1
	stw	r6, r2
	stw	r4, r2
	lsw	r0, -12                         # 2-byte Folded Reload
	stw	r5, r0
	ldi	r0, LINE_ADR
	stw	r0, r1
	movens	r0, r1
	stw	r6, r2
	stw	r4, r2
	lsw	r0, -40                         # 2-byte Folded Reload
	stw	r5, r0
	lsw	r0, -36                         # 2-byte Folded Reload
	stw	r1, r0
	stw	r6, r2
	stw	r4, r2
	lsw	r1, -24                         # 2-byte Folded Reload
	stw	r5, r1
	ldi	r1, LINE_ADR
	stw	r1, r0
	stw	r6, r2
	stw	r4, r2
	lsw	r1, -20                         # 2-byte Folded Reload
	stw	r5, r1
	movens	r0, r1
	ldi	r0, LINE_ADR
	stw	r0, r1
	stw	r6, r2
	stw	r4, r2
	lsw	r0, -32                         # 2-byte Folded Reload
	stw	r5, r0
	ldi	r0, LINE_ADR
	stw	r0, r1
	movens	r1, r0
	stw	r6, r2
	stw	r4, r2
	lsw	r1, -26                         # 2-byte Folded Reload
	stw	r5, r1
	ldi	r1, LINE_ADR
	stw	r1, r0
	stw	r6, r2
	stw	r4, r2
	lsw	r5, -12                         # 2-byte Folded Reload
	ldi	r1, CELL_ADR
	stw	r1, r5
	ldi	r1, LINE_ADR
	stw	r1, r0
	stw	r6, r2
	stw	r4, r2
	ldi	r0, gmState
	ldw	r0, r0
	ldi	r1, START_STOP
	stw	r1, r0
	ldi	r0, 100
	ssw	r0, -26                         # 2-byte Folded Spill
	ldi	r1, 72
	ldi	r0, 101
	movens	r0, r2
	ldi	r5, 97
	ssw	r5, -38                         # 2-byte Folded Spill
	ssw	r0, -40                         # 2-byte Folded Spill
	ldi	r0, 115
	ssw	r0, -24                         # 2-byte Folded Spill
	ssw	r0, -42                         # 2-byte Folded Spill
	ldi	r0, 104
	movens	r0, r4
	ssw	r0, -44                         # 2-byte Folded Spill
	ldi	r0, 105
	ssw	r0, -36                         # 2-byte Folded Spill
	ssw	r0, -46                         # 2-byte Folded Spill
	ldi	r6, 112
	movens	r6, r0
	ssw	r6, -20                         # 2-byte Folded Spill
	ssw	r6, -34                         # 2-byte Folded Spill
	ssw	r5, -48                         # 2-byte Folded Spill
	ssw	r5, -32                         # 2-byte Folded Spill
	ldi	r5, 99
	ssw	r5, -12                         # 2-byte Folded Spill
	ssw	r5, -30                         # 2-byte Folded Spill
	ldi	r6, 101
	movens	r6, r5
	ssw	r6, -28                         # 2-byte Folded Spill
__LBB27_3:                              # %return
	stw	r3, r1
	stw	r3, r5
	lsw	r1, -48                         # 2-byte Folded Reload
	stw	r3, r1
	lsw	r1, -14                         # 2-byte Folded Reload
	stw	r3, r1
	lsw	r1, -16                         # 2-byte Folded Reload
	stw	r3, r1
	lsw	r1, -22                         # 2-byte Folded Reload
	stw	r3, r1
	lsw	r1, -18                         # 2-byte Folded Reload
	stw	r3, r1
	stw	r3, r2
	lsw	r1, -36                         # 2-byte Folded Reload
	stw	r3, r1
	lsw	r1, -10                         # 2-byte Folded Reload
	stw	r3, r1
	stw	r3, r4
	ldi	r1, 116
	stw	r3, r1
	ldi	r1, 32
	movens	r1, r2
	stw	r3, r2
	lsw	r1, -24                         # 2-byte Folded Reload
	stw	r3, r1
	lsw	r1, -20                         # 2-byte Folded Reload
	stw	r3, r1
	lsw	r1, -38                         # 2-byte Folded Reload
	stw	r3, r1
	lsw	r1, -12                         # 2-byte Folded Reload
	stw	r3, r1
	lsw	r1, -40                         # 2-byte Folded Reload
	stw	r3, r1
	lsw	r1, -42                         # 2-byte Folded Reload
	stw	r3, r1
	lsw	r1, -44                         # 2-byte Folded Reload
	stw	r3, r1
	lsw	r1, -46                         # 2-byte Folded Reload
	stw	r3, r1
	stw	r3, r0
	stw	r3, r2
	lsw	r0, -34                         # 2-byte Folded Reload
	stw	r3, r0
	lsw	r0, -8                          # 2-byte Folded Reload
	stw	r3, r0
	lsw	r0, -32                         # 2-byte Folded Reload
	stw	r3, r0
	lsw	r0, -30                         # 2-byte Folded Reload
	stw	r3, r0
	lsw	r0, -28                         # 2-byte Folded Reload
	stw	r3, r0
	lsw	r0, -26                         # 2-byte Folded Reload
	stw	r3, r0
	ldi	r0, 46
	stw	r3, r0
	ldi	r0, 10
	stw	r3, r0
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	48
	pop	fp
	rts
__LBB27_1:                              # %while.body.i.preheader
	ldi	r0, 69
	stw	r3, r0
	ldi	r1, 114
	stw	r3, r1
	stw	r3, r1
	ldi	r5, 111
	stw	r3, r5
	stw	r3, r1
	ldi	r0, 58
	stw	r3, r0
	stw	r3, r4
	ldi	r0, 67
	stw	r3, r0
	stw	r3, r5
	stw	r3, r5
	ldi	r0, 93
	ssw	r0, -26                         # 2-byte Folded Spill
	ldi	r0, 49
	ssw	r0, -28                         # 2-byte Folded Spill
	ldi	r0, 51
	ssw	r0, -30                         # 2-byte Folded Spill
	ldi	r0, 45
	ssw	r0, -32                         # 2-byte Folded Spill
	ldi	r0, 48
	ssw	r0, -8                          # 2-byte Folded Spill
	ldi	r0, 91
	ssw	r0, -34                         # 2-byte Folded Spill
	ldi	r0, 98
	ssw	r0, -12                         # 2-byte Folded Spill
	ldi	r0, 102
	ssw	r0, -20                         # 2-byte Folded Spill
	ldi	r0, 101
	ssw	r0, -18                         # 2-byte Folded Spill
	ldi	r0, 97
	ssw	r0, -16                         # 2-byte Folded Spill
	ldi	r2, 110
	ldi	r0, 105
	ssw	r0, -48                         # 2-byte Folded Spill
	ldi	r0, 116
	ssw	r0, -22                         # 2-byte Folded Spill
	ssw	r4, -36                         # 2-byte Folded Spill
	ssw	r5, -24                         # 2-byte Folded Spill
	ssw	r4, -38                         # 2-byte Folded Spill
	ssw	r5, -10                         # 2-byte Folded Spill
	ssw	r5, -40                         # 2-byte Folded Spill
	ldi	r0, 117
	movens	r0, r4
	ssw	r0, -42                         # 2-byte Folded Spill
	ssw	r2, -14                         # 2-byte Folded Spill
	ssw	r2, -44                         # 2-byte Folded Spill
	ldi	r0, 100
	movens	r0, r5
	ssw	r0, -46                         # 2-byte Folded Spill
	ldi	r0, 115
	movens	r0, r2
	br	__LBB27_3
                                        # -- End function
SetHWSSCmdWrapper>                      # -- Begin function SetHWSSCmdWrapper
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-12
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r2, 2
	cmp	r1, r2
	beq	__LBB28_3
	br	__LBB28_1
__LBB28_3:                              # %if.end
	ldi	r1, 1
	ldb	r0, r1, r1
	shl	r1, r1, 8
	ssw	r0, -12                         # 2-byte Folded Spill
	ldb	r0, r0
	or r1, r0, r1
	ldi	r2, 32
__LBB28_4:                              # %while.cond.i
                                        # =>This Inner Loop Header: Depth=1
	ldb	r1, r5
	add	r1, 1
	cmp	r5, r2
	beq	__LBB28_4
	br	__LBB28_5
__LBB28_5:                              # %while.end.i
	movens	r5, r0
	sub	r0, 58
	ldi	r3, 255
	and r0, r3, r0
	ldi	r3, 246
	cmp	r0, r3
	blo	__LBB28_7
	br	__LBB28_6
__LBB28_7:                              # %while.body.i53.preheader
	ldi	r2, 69
	ldi	r0, __L.str.36+1
	ldi	r1, CURR_CHAR
	ldi	r3, 0
	br	__LBB28_23
__LBB28_23:                             # %while.body.i53
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r2
	stw	r1, r2
	ldb	r0, r2
	add	r0, 1
	cmp	r2, r3
	beq	__LBB28_25
	br	__LBB28_23
__LBB28_1:                              # %while.body.i.preheader
	ldi	r2, 69
	ldi	r0, __L.str.35+1
	ldi	r1, CURR_CHAR
	ldi	r3, 0
__LBB28_2:                              # %while.body.i
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r2
	stw	r1, r2
	ldb	r0, r2
	add	r0, 1
	cmp	r2, r3
	beq	__LBB28_25
	br	__LBB28_2
__LBB28_6:                              # %while.body5.i.preheader
	ldi	r0, 0
	br	__LBB28_8
__LBB28_8:                              # %while.body5.i
                                        # =>This Inner Loop Header: Depth=1
	ldi	r3, 3276
	cmp	r0, r3
	bgt	__LBB28_7
	br	__LBB28_9
__LBB28_9:                              # %if.end9.i
                                        #   in Loop: Header=BB28_8 Depth=1
	ldi	r3, 0
	ssw	r3, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r4
	ssw	r4, -10
	lsw	r4, -10
	add r4, r0, r0
	ssw	r0, -10
	ldi	r0, 255
	movens	r0, r3
	and r5, r3, r0
	lsw	r4, -10
	ldb	r1, r5
	movens	r5, r6
	sub	r6, 58
	and r6, r3, r6
	add r0, r4, r0
	add	r1, 1
	sub	r0, 48
	ldi	r3, 245
	cmp	r6, r3
	bhi	__LBB28_8
	br	__LBB28_10
__LBB28_10:                             # %while.cond14.i.preheader
	ldi	r3, 255
__LBB28_11:                             # %while.cond14.i
                                        # =>This Inner Loop Header: Depth=1
	and r5, r3, r5
	cmp	r5, r2
	beq	__LBB28_13
	br	__LBB28_12
__LBB28_13:                             # %while.body18.i
                                        #   in Loop: Header=BB28_11 Depth=1
	ldb	r1, r5
	add	r1, 1
	br	__LBB28_11
__LBB28_12:                             # %while.cond14.i
	ldi	r1, 0
	cmp	r5, r1
	beq	__LBB28_14
	br	__LBB28_7
__LBB28_14:                             # %lor.lhs.false
	lsw	r1, -12                         # 2-byte Folded Reload
	ldi	r3, 2
	ldb	r1, r3, r4
	ldi	r5, 3
	ldb	r1, r5, r1
	shl	r1, r1, 8
	or r1, r4, r6
__LBB28_15:                             # %while.cond.i9
                                        # =>This Inner Loop Header: Depth=1
	ldb	r6, r3
	add	r6, 1
	cmp	r3, r2
	beq	__LBB28_15
	br	__LBB28_16
__LBB28_16:                             # %while.end.i13
	movens	r3, r1
	sub	r1, 58
	ldi	r4, 255
	and r1, r4, r1
	ldi	r4, 246
	cmp	r1, r4
	blo	__LBB28_7
	br	__LBB28_17
__LBB28_17:                             # %while.body5.i14.preheader
	ldi	r1, 0
__LBB28_18:                             # %while.body5.i14
                                        # =>This Inner Loop Header: Depth=1
	ldi	r4, 3276
	cmp	r1, r4
	bgt	__LBB28_7
	br	__LBB28_19
__LBB28_19:                             # %if.end9.i18
                                        #   in Loop: Header=BB28_18 Depth=1
	ldi	r4, 0
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r4
	ssw	r4, -8
	lsw	r4, -8
	add r4, r1, r1
	ssw	r1, -8
	ldi	r1, 255
	and r3, r1, r1
	ssw	r1, -12                         # 2-byte Folded Spill
	lsw	r4, -8
	ldb	r6, r3
	movens	r3, r5
	sub	r5, 58
	ldi	r1, 255
	and r5, r1, r5
	lsw	r1, -12                         # 2-byte Folded Reload
	add r1, r4, r1
	add	r6, 1
	sub	r1, 48
	ldi	r4, 245
	cmp	r5, r4
	bhi	__LBB28_18
	br	__LBB28_20
__LBB28_22:                             # %while.body18.i49
                                        #   in Loop: Header=BB28_20 Depth=1
	ldb	r6, r3
	add	r6, 1
	br	__LBB28_20
__LBB28_20:                             # %while.cond14.i45
                                        # =>This Inner Loop Header: Depth=1
	ldi	r4, 255
	and r3, r4, r4
	cmp	r4, r2
	beq	__LBB28_22
	br	__LBB28_21
__LBB28_21:                             # %while.cond14.i45
	ldi	r2, 0
	cmp	r4, r2
	beq	__LBB28_24
	br	__LBB28_7
__LBB28_24:                             # %if.end5
	jsr	SetHWSSCmd
__LBB28_25:                             # %cleanup.cont
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	12
	pop	fp
	rts
                                        # -- End function
HelpCmdWrapper>                         # -- Begin function HelpCmdWrapper
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-66
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r2, 0
	cmp	r1, r2
	beq	__LBB29_3
	br	__LBB29_1
__LBB29_1:                              # %entry
	ldi	r2, 1
	cmp	r1, r2
	ldi	r1, CURR_CHAR
	ldi	r5, 114
	ldi	r6, 32
	ldi	r3, 97
	ldi	r4, 109
	beq	__LBB29_6
	br	__LBB29_2
__LBB29_6:                              # %if.then2
	ldb	r0, r2, r1
	shl	r1, r1, 8
	ldb	r0, r0
	or r1, r0, r2
	ldb	r2, r0
	ssw	r0, -10                         # 2-byte Folded Spill
	ldi	r5, 0
	cmp	r0, r5
	ldi	r0, __L.str.37
	ssw	r2, -8                          # 2-byte Folded Spill
	beq	__LBB29_10
	br	__LBB29_7
__LBB29_7:                              # %land.rhs.i.preheader
	ldi	r6, 0
	movens	r2, r4
	add	r4, 1
	lsw	r1, -10                         # 2-byte Folded Reload
	movens	r6, r5
	ldi	r3, 255
__LBB29_8:                              # %land.rhs.i
                                        # =>This Inner Loop Header: Depth=1
	ldb	r5, r0, r2
	and r1, r3, r1
	cmp	r1, r2
	lsw	r2, -8                          # 2-byte Folded Reload
	bne	__LBB29_14
	br	__LBB29_9
__LBB29_9:                              # %if.end.i
                                        #   in Loop: Header=BB29_8 Depth=1
	ldb	r4, r5, r1
	add	r5, 1
	cmp	r1, r6
	bne	__LBB29_8
	br	__LBB29_10
__LBB29_10:                             # %StringCmp.exit
	ldb	r5, r0, r0
	ldi	r1, 0
	cmp	r0, r1
	bne	__LBB29_14
	br	__LBB29_11
__LBB29_14:                             # %if.else4
	ldi	r5, 0
	lsw	r0, -10                         # 2-byte Folded Reload
	cmp	r0, r5
	ldi	r3, __L.str.38
	beq	__LBB29_18
	br	__LBB29_15
__LBB29_15:                             # %land.rhs.i82.preheader
	ldi	r6, 0
	movens	r2, r4
	add	r4, 1
	lsw	r1, -10                         # 2-byte Folded Reload
	movens	r6, r5
	ldi	r0, 255
__LBB29_16:                             # %land.rhs.i82
                                        # =>This Inner Loop Header: Depth=1
	ldb	r5, r3, r2
	and r1, r0, r1
	cmp	r1, r2
	lsw	r2, -8                          # 2-byte Folded Reload
	bne	__LBB29_22
	br	__LBB29_17
__LBB29_17:                             # %if.end.i87
                                        #   in Loop: Header=BB29_16 Depth=1
	ldb	r4, r5, r1
	add	r5, 1
	cmp	r1, r6
	bne	__LBB29_16
	br	__LBB29_18
__LBB29_18:                             # %StringCmp.exit95
	ldb	r5, r3, r1
	ldi	r0, 0
	cmp	r1, r0
	bne	__LBB29_22
	br	__LBB29_19
__LBB29_22:                             # %if.else8
	ldi	r5, 0
	lsw	r0, -10                         # 2-byte Folded Reload
	cmp	r0, r5
	ldi	r3, __L.str.39
	beq	__LBB29_26
	br	__LBB29_23
__LBB29_23:                             # %land.rhs.i105.preheader
	ldi	r6, 0
	movens	r2, r4
	add	r4, 1
	lsw	r1, -10                         # 2-byte Folded Reload
	movens	r6, r5
	ldi	r0, 255
__LBB29_24:                             # %land.rhs.i105
                                        # =>This Inner Loop Header: Depth=1
	ldb	r5, r3, r2
	and r1, r0, r1
	cmp	r1, r2
	lsw	r2, -8                          # 2-byte Folded Reload
	bne	__LBB29_30
	br	__LBB29_25
__LBB29_25:                             # %if.end.i110
                                        #   in Loop: Header=BB29_24 Depth=1
	ldb	r4, r5, r1
	add	r5, 1
	cmp	r1, r6
	bne	__LBB29_24
	br	__LBB29_26
__LBB29_26:                             # %StringCmp.exit118
	ldb	r5, r3, r1
	ldi	r0, 0
	cmp	r1, r0
	bne	__LBB29_30
	br	__LBB29_27
__LBB29_30:                             # %if.else12
	ldi	r5, 0
	lsw	r0, -10                         # 2-byte Folded Reload
	cmp	r0, r5
	ldi	r3, __L.str.40
	beq	__LBB29_34
	br	__LBB29_31
__LBB29_31:                             # %land.rhs.i128.preheader
	ldi	r6, 0
	movens	r2, r4
	add	r4, 1
	lsw	r1, -10                         # 2-byte Folded Reload
	movens	r6, r5
	ldi	r0, 255
__LBB29_32:                             # %land.rhs.i128
                                        # =>This Inner Loop Header: Depth=1
	ldb	r5, r3, r2
	and r1, r0, r1
	cmp	r1, r2
	lsw	r2, -8                          # 2-byte Folded Reload
	bne	__LBB29_38
	br	__LBB29_33
__LBB29_33:                             # %if.end.i133
                                        #   in Loop: Header=BB29_32 Depth=1
	ldb	r4, r5, r1
	add	r5, 1
	cmp	r1, r6
	bne	__LBB29_32
	br	__LBB29_34
__LBB29_34:                             # %StringCmp.exit141
	ldb	r5, r3, r1
	ldi	r0, 0
	cmp	r1, r0
	bne	__LBB29_38
	br	__LBB29_35
__LBB29_38:                             # %if.else16
	ldi	r5, 0
	lsw	r0, -10                         # 2-byte Folded Reload
	cmp	r0, r5
	ldi	r3, __L.str.41
	beq	__LBB29_42
	br	__LBB29_39
__LBB29_39:                             # %land.rhs.i151.preheader
	ldi	r6, 0
	movens	r2, r4
	add	r4, 1
	lsw	r1, -10                         # 2-byte Folded Reload
	movens	r6, r5
	ldi	r0, 255
__LBB29_40:                             # %land.rhs.i151
                                        # =>This Inner Loop Header: Depth=1
	ldb	r5, r3, r2
	and r1, r0, r1
	cmp	r1, r2
	lsw	r2, -8                          # 2-byte Folded Reload
	bne	__LBB29_46
	br	__LBB29_41
__LBB29_41:                             # %if.end.i156
                                        #   in Loop: Header=BB29_40 Depth=1
	ldb	r4, r5, r1
	add	r5, 1
	cmp	r1, r6
	bne	__LBB29_40
	br	__LBB29_42
__LBB29_42:                             # %StringCmp.exit164
	ldb	r5, r3, r1
	ldi	r0, 0
	cmp	r1, r0
	bne	__LBB29_46
	br	__LBB29_43
__LBB29_46:                             # %if.else20
	ldi	r5, 0
	lsw	r0, -10                         # 2-byte Folded Reload
	cmp	r0, r5
	ldi	r3, __L.str.42
	beq	__LBB29_50
	br	__LBB29_47
__LBB29_47:                             # %land.rhs.i174.preheader
	ldi	r6, 0
	movens	r2, r4
	add	r4, 1
	lsw	r1, -10                         # 2-byte Folded Reload
	movens	r6, r5
	ldi	r0, 255
__LBB29_48:                             # %land.rhs.i174
                                        # =>This Inner Loop Header: Depth=1
	ldb	r5, r3, r2
	and r1, r0, r1
	cmp	r1, r2
	lsw	r2, -8                          # 2-byte Folded Reload
	bne	__LBB29_54
	br	__LBB29_49
__LBB29_49:                             # %if.end.i179
                                        #   in Loop: Header=BB29_48 Depth=1
	ldb	r4, r5, r1
	add	r5, 1
	cmp	r1, r6
	bne	__LBB29_48
	br	__LBB29_50
__LBB29_50:                             # %StringCmp.exit187
	ldb	r5, r3, r1
	ldi	r0, 0
	cmp	r1, r0
	bne	__LBB29_54
	br	__LBB29_51
__LBB29_54:                             # %if.else24
	ldi	r5, 0
	lsw	r0, -10                         # 2-byte Folded Reload
	cmp	r0, r5
	ldi	r3, __L.str.43
	beq	__LBB29_58
	br	__LBB29_55
__LBB29_55:                             # %land.rhs.i197.preheader
	ldi	r6, 0
	movens	r2, r4
	add	r4, 1
	lsw	r1, -10                         # 2-byte Folded Reload
	movens	r6, r5
	ldi	r0, 255
__LBB29_56:                             # %land.rhs.i197
                                        # =>This Inner Loop Header: Depth=1
	ldb	r5, r3, r2
	and r1, r0, r1
	cmp	r1, r2
	lsw	r2, -8                          # 2-byte Folded Reload
	bne	__LBB29_62
	br	__LBB29_57
__LBB29_57:                             # %if.end.i202
                                        #   in Loop: Header=BB29_56 Depth=1
	ldb	r4, r5, r1
	add	r5, 1
	cmp	r1, r6
	bne	__LBB29_56
	br	__LBB29_58
__LBB29_58:                             # %StringCmp.exit210
	ldb	r5, r3, r1
	ldi	r0, 0
	cmp	r1, r0
	bne	__LBB29_62
	br	__LBB29_59
__LBB29_62:                             # %if.else28
	ldi	r5, 0
	lsw	r0, -10                         # 2-byte Folded Reload
	cmp	r0, r5
	ldi	r3, __L.str.44
	beq	__LBB29_66
	br	__LBB29_63
__LBB29_63:                             # %land.rhs.i220.preheader
	ldi	r6, 0
	movens	r2, r4
	add	r4, 1
	lsw	r1, -10                         # 2-byte Folded Reload
	movens	r6, r5
	ldi	r0, 255
__LBB29_64:                             # %land.rhs.i220
                                        # =>This Inner Loop Header: Depth=1
	ldb	r5, r3, r2
	and r1, r0, r1
	cmp	r1, r2
	lsw	r2, -8                          # 2-byte Folded Reload
	bne	__LBB29_70
	br	__LBB29_65
__LBB29_65:                             # %if.end.i225
                                        #   in Loop: Header=BB29_64 Depth=1
	ldb	r4, r5, r1
	add	r5, 1
	cmp	r1, r6
	bne	__LBB29_64
	br	__LBB29_66
__LBB29_66:                             # %StringCmp.exit233
	ldb	r5, r3, r1
	ldi	r0, 0
	cmp	r1, r0
	bne	__LBB29_70
	br	__LBB29_67
__LBB29_70:                             # %if.else32
	ldi	r5, 0
	lsw	r0, -10                         # 2-byte Folded Reload
	cmp	r0, r5
	ldi	r3, __L.str.45
	beq	__LBB29_74
	br	__LBB29_71
__LBB29_71:                             # %land.rhs.i243.preheader
	ldi	r6, 0
	movens	r2, r4
	add	r4, 1
	lsw	r1, -10                         # 2-byte Folded Reload
	movens	r6, r5
	ldi	r0, 255
__LBB29_72:                             # %land.rhs.i243
                                        # =>This Inner Loop Header: Depth=1
	ldb	r5, r3, r2
	and r1, r0, r1
	cmp	r1, r2
	lsw	r2, -8                          # 2-byte Folded Reload
	bne	__LBB29_78
	br	__LBB29_73
__LBB29_73:                             # %if.end.i248
                                        #   in Loop: Header=BB29_72 Depth=1
	ldb	r4, r5, r1
	add	r5, 1
	cmp	r1, r6
	bne	__LBB29_72
	br	__LBB29_74
__LBB29_74:                             # %StringCmp.exit256
	ldb	r5, r3, r1
	ldi	r0, 0
	cmp	r1, r0
	bne	__LBB29_78
	br	__LBB29_75
__LBB29_78:                             # %if.else36
	ldi	r5, 0
	lsw	r0, -10                         # 2-byte Folded Reload
	cmp	r0, r5
	ldi	r3, __L.str.46
	beq	__LBB29_82
	br	__LBB29_79
__LBB29_79:                             # %land.rhs.i266.preheader
	ldi	r6, 0
	movens	r2, r4
	add	r4, 1
	lsw	r1, -10                         # 2-byte Folded Reload
	movens	r6, r5
	ldi	r0, 255
__LBB29_80:                             # %land.rhs.i266
                                        # =>This Inner Loop Header: Depth=1
	ldb	r5, r3, r2
	and r1, r0, r1
	cmp	r1, r2
	lsw	r2, -8                          # 2-byte Folded Reload
	bne	__LBB29_86
	br	__LBB29_81
__LBB29_81:                             # %if.end.i271
                                        #   in Loop: Header=BB29_80 Depth=1
	ldb	r4, r5, r1
	add	r5, 1
	cmp	r1, r6
	bne	__LBB29_80
	br	__LBB29_82
__LBB29_82:                             # %StringCmp.exit279
	ldb	r5, r3, r1
	ldi	r0, 0
	cmp	r1, r0
	bne	__LBB29_86
	br	__LBB29_83
__LBB29_86:                             # %if.else40
	ldi	r5, 0
	lsw	r1, -10                         # 2-byte Folded Reload
	cmp	r1, r5
	ldi	r3, __L.str.47
	beq	__LBB29_90
	br	__LBB29_87
__LBB29_87:                             # %land.rhs.i289.preheader
	ldi	r6, 0
	movens	r2, r4
	add	r4, 1
	movens	r6, r5
__LBB29_88:                             # %land.rhs.i289
                                        # =>This Inner Loop Header: Depth=1
	ldb	r5, r3, r0
	ldi	r2, 255
	and r1, r2, r2
	cmp	r2, r0
	lsw	r2, -8                          # 2-byte Folded Reload
	bne	__LBB29_94
	br	__LBB29_89
__LBB29_89:                             # %if.end.i294
                                        #   in Loop: Header=BB29_88 Depth=1
	ldb	r4, r5, r1
	add	r5, 1
	cmp	r1, r6
	bne	__LBB29_88
	br	__LBB29_90
__LBB29_90:                             # %StringCmp.exit302
	ldb	r5, r3, r1
	ldi	r0, 0
	cmp	r1, r0
	bne	__LBB29_94
	br	__LBB29_91
__LBB29_94:                             # %if.else44
	ldi	r0, 69
	ldi	r1, CURR_CHAR
	stw	r1, r0
	ldi	r0, 114
	stw	r1, r0
	stw	r1, r0
	ldi	r4, 111
	stw	r1, r4
	ssw	r0, -32                         # 2-byte Folded Spill
	stw	r1, r0
	ldi	r0, 58
	stw	r1, r0
	ldi	r6, 32
	stw	r1, r6
	ldi	r0, 85
	stw	r1, r0
	ldi	r3, 110
	stw	r1, r3
	ldi	r0, 107
	stw	r1, r0
	stw	r1, r3
	stw	r1, r4
	ldi	r0, 119
	stw	r1, r0
	stw	r1, r3
	stw	r1, r6
	ldi	r0, 99
	ssw	r0, -34                         # 2-byte Folded Spill
	stw	r1, r0
	stw	r1, r4
	ldi	r0, 109
	stw	r1, r0
	ssw	r0, -44                         # 2-byte Folded Spill
	stw	r1, r0
	ldi	r0, 97
	ssw	r0, -64                         # 2-byte Folded Spill
	stw	r1, r0
	ssw	r3, -38                         # 2-byte Folded Spill
	stw	r1, r3
	ldi	r0, 100
	ssw	r0, -46                         # 2-byte Folded Spill
	stw	r1, r0
	stw	r1, r6
	ldi	r5, 39
	stw	r1, r5
	ldi	r0, 116
	ssw	r0, -52                         # 2-byte Folded Spill
	ldi	r0, 105
	ssw	r0, -36                         # 2-byte Folded Spill
	ldi	r0, 121
	ssw	r0, -50                         # 2-byte Folded Spill
	ldi	r0, 84
	ssw	r0, -58                         # 2-byte Folded Spill
	ldi	r0, 108
	ssw	r0, -48                         # 2-byte Folded Spill
	movens	r5, r0
	ldi	r5, 104
	ssw	r5, -56                         # 2-byte Folded Spill
	ldb	r2, r3
	ldi	r5, 0
	ssw	r3, -66                         # 2-byte Folded Spill
	cmp	r3, r5
	ssw	r6, -8                          # 2-byte Folded Spill
	ssw	r6, -10                         # 2-byte Folded Spill
	ldi	r5, 112
	ssw	r5, -60                         # 2-byte Folded Spill
	ldi	r3, 101
	ssw	r3, -62                         # 2-byte Folded Spill
	ssw	r3, -24                         # 2-byte Folded Spill
	ssw	r6, -12                         # 2-byte Folded Spill
	ldi	r3, 102
	ssw	r3, -20                         # 2-byte Folded Spill
	ssw	r4, -22                         # 2-byte Folded Spill
	ssw	r6, -42                         # 2-byte Folded Spill
	ssw	r6, -26                         # 2-byte Folded Spill
	movens	r3, r6
	ssw	r4, -28                         # 2-byte Folded Spill
	ssw	r6, -30                         # 2-byte Folded Spill
	ssw	r4, -40                         # 2-byte Folded Spill
	ssw	r4, -14                         # 2-byte Folded Spill
	ldi	r3, 115
	ssw	r3, -54                         # 2-byte Folded Spill
	ssw	r3, -16                         # 2-byte Folded Spill
	ldi	r3, 46
	ssw	r3, -18                         # 2-byte Folded Spill
	beq	__LBB29_97
	br	__LBB29_95
__LBB29_95:                             # %while.body.i319.preheader
	add	r2, 1
__LBB29_96:                             # %while.body.i319
                                        # =>This Inner Loop Header: Depth=1
	lsw	r0, -66                         # 2-byte Folded Reload
	sxt	r0, r0
	stw	r1, r0
	ldb	r2, r3
	add	r2, 1
	ldi	r0, 0
	ssw	r3, -66                         # 2-byte Folded Spill
	cmp	r3, r0
	ldi	r3, 32
	ssw	r3, -8                          # 2-byte Folded Spill
	ssw	r3, -10                         # 2-byte Folded Spill
	ldi	r0, 101
	ssw	r0, -24                         # 2-byte Folded Spill
	ssw	r3, -12                         # 2-byte Folded Spill
	ssw	r6, -20                         # 2-byte Folded Spill
	movens	r6, r0
	ssw	r4, -22                         # 2-byte Folded Spill
	ssw	r3, -26                         # 2-byte Folded Spill
	ldi	r3, 46
	ssw	r4, -28                         # 2-byte Folded Spill
	ssw	r6, -30                         # 2-byte Folded Spill
	ssw	r4, -14                         # 2-byte Folded Spill
	ldi	r0, 115
	ssw	r0, -16                         # 2-byte Folded Spill
	ldi	r0, 39
	ssw	r3, -18                         # 2-byte Folded Spill
	bne	__LBB29_96
	br	__LBB29_97
__LBB29_3:                              # %if.then
	ldi	r0, mainHelp
	ldb	r0, r1
	ldi	r0, 0
	cmp	r1, r0
	beq	__LBB29_98
	br	__LBB29_4
__LBB29_4:                              # %while.body.i.preheader
	ldi	r2, mainHelp+1
	ldi	r3, CURR_CHAR
__LBB29_5:                              # %while.body.i
                                        # =>This Inner Loop Header: Depth=1
	sxt	r1, r1
	stw	r3, r1
	ldb	r2, r1
	add	r2, 1
	cmp	r1, r0
	beq	__LBB29_98
	br	__LBB29_5
__LBB29_2:                              # %while.body.i333.preheader
	ldi	r0, 69
	stw	r1, r0
	stw	r1, r5
	stw	r1, r5
	movens	r5, r0
	ldi	r5, 111
	stw	r1, r5
	stw	r1, r0
	ldi	r0, 58
	ssw	r0, -36                         # 2-byte Folded Spill
	stw	r1, r0
	stw	r1, r6
	ldi	r0, 84
	stw	r1, r0
	stw	r1, r5
	stw	r1, r5
	stw	r1, r6
	stw	r1, r4
	stw	r1, r3
	ldi	r0, 93
	ssw	r0, -18                         # 2-byte Folded Spill
	ldi	r0, 100
	ssw	r0, -16                         # 2-byte Folded Spill
	ldi	r0, 99
	ssw	r0, -14                         # 2-byte Folded Spill
	ldi	r0, 91
	ssw	r0, -34                         # 2-byte Folded Spill
	ldi	r0, 85
	ssw	r0, -32                         # 2-byte Folded Spill
	ldi	r0, 46
	ssw	r0, -12                         # 2-byte Folded Spill
	ldi	r0, 102
	ssw	r0, -50                         # 2-byte Folded Spill
	ldi	r0, 115
	ssw	r0, -10                         # 2-byte Folded Spill
	ldi	r0, 117
	ssw	r0, -56                         # 2-byte Folded Spill
	ldi	r0, 103
	ssw	r0, -8                          # 2-byte Folded Spill
	ldi	r0, 121
	ssw	r0, -42                         # 2-byte Folded Spill
	ldi	r0, 110
	movens	r6, r2
	ssw	r3, -40                         # 2-byte Folded Spill
	ssw	r4, -62                         # 2-byte Folded Spill
	ldi	r3, 101
	ssw	r3, -48                         # 2-byte Folded Spill
	ssw	r0, -60                         # 2-byte Folded Spill
	ssw	r6, -58                         # 2-byte Folded Spill
	ldi	r3, 114
	ssw	r3, -24                         # 2-byte Folded Spill
	ldi	r3, 116
	ldi	r4, 10
	ssw	r4, -20                         # 2-byte Folded Spill
	ssw	r6, -22                         # 2-byte Folded Spill
	ssw	r6, -54                         # 2-byte Folded Spill
	ldi	r2, 104
	ssw	r2, -52                         # 2-byte Folded Spill
	ldi	r2, 101
	ssw	r2, -26                         # 2-byte Folded Spill
	ldi	r2, 108
	ssw	r2, -28                         # 2-byte Folded Spill
	ldi	r2, 112
	ssw	r2, -30                         # 2-byte Folded Spill
	ssw	r5, -44                         # 2-byte Folded Spill
	ldi	r2, 109
	ssw	r2, -64                         # 2-byte Folded Spill
	ldi	r2, 97
	ssw	r2, -38                         # 2-byte Folded Spill
	ssw	r0, -46                         # 2-byte Folded Spill
	br	__LBB29_97
__LBB29_97:                             # %if.end57.sink.split
	stw	r1, r0
	lsw	r0, -42                         # 2-byte Folded Reload
	stw	r1, r0
	stw	r1, r6
	lsw	r0, -40                         # 2-byte Folded Reload
	stw	r1, r0
	ldi	r0, 114
	stw	r1, r0
	lsw	r6, -8                          # 2-byte Folded Reload
	stw	r1, r6
	lsw	r0, -56                         # 2-byte Folded Reload
	stw	r1, r0
	lsw	r0, -62                         # 2-byte Folded Reload
	stw	r1, r0
	lsw	r2, -48                         # 2-byte Folded Reload
	stw	r1, r2
	lsw	r0, -60                         # 2-byte Folded Reload
	stw	r1, r0
	stw	r1, r3
	lsw	r4, -10                         # 2-byte Folded Reload
	stw	r1, r4
	lsw	r0, -58                         # 2-byte Folded Reload
	stw	r1, r0
	lsw	r0, -50                         # 2-byte Folded Reload
	stw	r1, r0
	stw	r1, r5
	lsw	r0, -24                         # 2-byte Folded Reload
	stw	r1, r0
	ldi	r3, 32
	stw	r1, r3
	ldi	r0, 39
	stw	r1, r0
	ldi	r5, 104
	stw	r1, r5
	ldi	r5, 101
	stw	r1, r5
	ldi	r5, 108
	stw	r1, r5
	ldi	r5, 112
	stw	r1, r5
	stw	r1, r0
	lsw	r0, -12                         # 2-byte Folded Reload
	stw	r1, r0
	lsw	r0, -20                         # 2-byte Folded Reload
	stw	r1, r0
	lsw	r0, -22                         # 2-byte Folded Reload
	stw	r1, r0
	lsw	r0, -32                         # 2-byte Folded Reload
	stw	r1, r0
	stw	r1, r4
	ldi	r0, 97
	stw	r1, r0
	stw	r1, r6
	stw	r1, r2
	lsw	r0, -36                         # 2-byte Folded Reload
	stw	r1, r0
	lsw	r0, -54                         # 2-byte Folded Reload
	stw	r1, r0
	lsw	r0, -52                         # 2-byte Folded Reload
	stw	r1, r0
	lsw	r0, -26                         # 2-byte Folded Reload
	stw	r1, r0
	lsw	r0, -28                         # 2-byte Folded Reload
	stw	r1, r0
	lsw	r0, -30                         # 2-byte Folded Reload
	stw	r1, r0
	stw	r1, r3
	lsw	r0, -34                         # 2-byte Folded Reload
	stw	r1, r0
	lsw	r0, -14                         # 2-byte Folded Reload
	stw	r1, r0
	lsw	r0, -44                         # 2-byte Folded Reload
	stw	r1, r0
	ldi	r0, 109
	stw	r1, r0
	lsw	r0, -64                         # 2-byte Folded Reload
	stw	r1, r0
	lsw	r0, -38                         # 2-byte Folded Reload
	stw	r1, r0
	lsw	r0, -46                         # 2-byte Folded Reload
	stw	r1, r0
	lsw	r0, -16                         # 2-byte Folded Reload
	stw	r1, r0
	lsw	r0, -18                         # 2-byte Folded Reload
	stw	r1, r0
	ldi	r0, 10
	stw	r1, r0
__LBB29_98:                             # %if.end57
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	66
	pop	fp
	rts
__LBB29_11:                             # %if.then3
	ldi	r0, setHelp
	ldb	r0, r2
	ldi	r0, 0
	cmp	r2, r0
	ldi	r4, CURR_CHAR
	beq	__LBB29_98
	br	__LBB29_12
__LBB29_12:                             # %while.body.i74.preheader
	ldi	r3, setHelp+1
__LBB29_13:                             # %while.body.i74
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r1
	stw	r4, r1
	ldb	r3, r2
	add	r3, 1
	cmp	r2, r0
	beq	__LBB29_98
	br	__LBB29_13
__LBB29_19:                             # %if.then7
	ldi	r0, stopHelp
	ldb	r0, r2
	ldi	r0, 0
	cmp	r2, r0
	ldi	r4, CURR_CHAR
	beq	__LBB29_98
	br	__LBB29_20
__LBB29_20:                             # %while.body.i97.preheader
	ldi	r3, stopHelp+1
__LBB29_21:                             # %while.body.i97
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r1
	stw	r4, r1
	ldb	r3, r2
	add	r3, 1
	cmp	r2, r0
	beq	__LBB29_98
	br	__LBB29_21
__LBB29_27:                             # %if.then11
	ldi	r0, startHelp
	ldb	r0, r2
	ldi	r0, 0
	cmp	r2, r0
	ldi	r4, CURR_CHAR
	beq	__LBB29_98
	br	__LBB29_28
__LBB29_28:                             # %while.body.i120.preheader
	ldi	r3, startHelp+1
__LBB29_29:                             # %while.body.i120
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r1
	stw	r4, r1
	ldb	r3, r2
	add	r3, 1
	cmp	r2, r0
	beq	__LBB29_98
	br	__LBB29_29
__LBB29_35:                             # %if.then15
	ldi	r0, fillHelp
	ldb	r0, r2
	ldi	r0, 0
	cmp	r2, r0
	ldi	r4, CURR_CHAR
	beq	__LBB29_98
	br	__LBB29_36
__LBB29_36:                             # %while.body.i143.preheader
	ldi	r3, fillHelp+1
__LBB29_37:                             # %while.body.i143
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r1
	stw	r4, r1
	ldb	r3, r2
	add	r3, 1
	cmp	r2, r0
	beq	__LBB29_98
	br	__LBB29_37
__LBB29_43:                             # %if.then19
	ldi	r0, cleanHelp
	ldb	r0, r2
	ldi	r0, 0
	cmp	r2, r0
	ldi	r4, CURR_CHAR
	beq	__LBB29_98
	br	__LBB29_44
__LBB29_44:                             # %while.body.i166.preheader
	ldi	r3, cleanHelp+1
__LBB29_45:                             # %while.body.i166
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r1
	stw	r4, r1
	ldb	r3, r2
	add	r3, 1
	cmp	r2, r0
	beq	__LBB29_98
	br	__LBB29_45
__LBB29_51:                             # %if.then23
	ldi	r0, ruleHelp
	ldb	r0, r2
	ldi	r0, 0
	cmp	r2, r0
	ldi	r4, CURR_CHAR
	beq	__LBB29_98
	br	__LBB29_52
__LBB29_52:                             # %while.body.i189.preheader
	ldi	r3, ruleHelp+1
__LBB29_53:                             # %while.body.i189
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r1
	stw	r4, r1
	ldb	r3, r2
	add	r3, 1
	cmp	r2, r0
	beq	__LBB29_98
	br	__LBB29_53
__LBB29_59:                             # %if.then27
	ldi	r0, setGliderHelp
	ldb	r0, r2
	ldi	r0, 0
	cmp	r2, r0
	ldi	r4, CURR_CHAR
	beq	__LBB29_98
	br	__LBB29_60
__LBB29_60:                             # %while.body.i212.preheader
	ldi	r3, setGliderHelp+1
__LBB29_61:                             # %while.body.i212
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r1
	stw	r4, r1
	ldb	r3, r2
	add	r3, 1
	cmp	r2, r0
	beq	__LBB29_98
	br	__LBB29_61
__LBB29_67:                             # %if.then31
	ldi	r0, setBeeQueenHelp
	ldb	r0, r2
	ldi	r0, 0
	cmp	r2, r0
	ldi	r4, CURR_CHAR
	beq	__LBB29_98
	br	__LBB29_68
__LBB29_68:                             # %while.body.i235.preheader
	ldi	r3, setBeeQueenHelp+1
__LBB29_69:                             # %while.body.i235
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r1
	stw	r4, r1
	ldb	r3, r2
	add	r3, 1
	cmp	r2, r0
	beq	__LBB29_98
	br	__LBB29_69
__LBB29_75:                             # %if.then35
	ldi	r0, setLWSSHelp
	ldb	r0, r2
	ldi	r0, 0
	cmp	r2, r0
	ldi	r4, CURR_CHAR
	beq	__LBB29_98
	br	__LBB29_76
__LBB29_76:                             # %while.body.i258.preheader
	ldi	r3, setLWSSHelp+1
__LBB29_77:                             # %while.body.i258
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r1
	stw	r4, r1
	ldb	r3, r2
	add	r3, 1
	cmp	r2, r0
	beq	__LBB29_98
	br	__LBB29_77
__LBB29_83:                             # %if.then39
	ldi	r0, setHWSSHelp
	ldb	r0, r2
	ldi	r0, 0
	cmp	r2, r0
	ldi	r4, CURR_CHAR
	beq	__LBB29_98
	br	__LBB29_84
__LBB29_84:                             # %while.body.i281.preheader
	ldi	r3, setHWSSHelp+1
__LBB29_85:                             # %while.body.i281
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r1
	stw	r4, r1
	ldb	r3, r2
	add	r3, 1
	cmp	r2, r0
	beq	__LBB29_98
	br	__LBB29_85
__LBB29_91:                             # %if.then43
	ldi	r0, helpHelp
	ldb	r0, r2
	ldi	r0, 0
	cmp	r2, r0
	ldi	r4, CURR_CHAR
	beq	__LBB29_98
	br	__LBB29_92
__LBB29_92:                             # %while.body.i304.preheader
	ldi	r3, helpHelp+1
__LBB29_93:                             # %while.body.i304
                                        # =>This Inner Loop Header: Depth=1
	sxt	r2, r1
	stw	r4, r1
	ldb	r3, r2
	add	r3, 1
	cmp	r2, r0
	beq	__LBB29_98
	br	__LBB29_93
                                        # -- End function
parse>                                  # -- Begin function parse
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-104
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r2, head
	ldw	r2, r0
	ldi	r4, end
	ldw	r4, r1
	cmp	r0, r1
	beq	__LBB30_119
	br	__LBB30_1
__LBB30_1:                              # %if.end
	ldi	r3, 0
	ldw	r2, r6
	ldw	r4, r0
	cmp	r6, r0
	ldi	r5, queue
	movens	r3, r1
	beq	__LBB30_7
	br	__LBB30_2
__LBB30_2:                              # %while.body.preheader
	ldi	r4, 0
	movens	r4, r2
__LBB30_3:                              # %while.body
                                        # =>This Inner Loop Header: Depth=1
	ldb	r6, r5, r1
	cmp	r1, r4
	bne	__LBB30_5
	br	__LBB30_4
__LBB30_5:                              # %if.end6
                                        #   in Loop: Header=BB30_3 Depth=1
	ldb	r6, r5, r1
	ldi	r0, -39
	add	r0, fp, r0
	stb	r0, r2, r1
	add	r6, 1
	shra	r6, r0, 8
	shra	r0, r0, 15-8
	shr	r0, r0, 8
	shr	r0, r0, 11-8
	add r6, r0, r0
	ldi	r1, -32
	and r0, r1, r0
	sub r6, r0, r6
	movens	r2, r1
	add	r1, 1
	ldi	r0, end
	ldw	r0, r0
	cmp	r6, r0
	beq	__LBB30_7
	br	__LBB30_6
__LBB30_6:                              # %if.end6
                                        #   in Loop: Header=BB30_3 Depth=1
	ldi	r0, 31
	cmp	r2, r0
	movens	r1, r2
	blo	__LBB30_3
	br	__LBB30_7
__LBB30_4:                              # %if.then5
	add	r6, 1
	shra	r6, r1, 8
	shra	r1, r1, 15-8
	shr	r1, r1, 8
	shr	r1, r1, 11-8
	add r6, r1, r1
	ldi	r0, -32
	and r1, r0, r0
	sub r6, r0, r0
	ldi	r1, end
	stw	r1, r0
	movens	r2, r1
	br	__LBB30_7
__LBB30_7:                              # %while.end
	stb	r5, r3
	ldi	r0, queue+1
	stb	r0, r3
	ldi	r0, queue+2
	stb	r0, r3
	ldi	r0, queue+3
	stb	r0, r3
	ldi	r0, queue+4
	stb	r0, r3
	ldi	r0, queue+5
	stb	r0, r3
	ldi	r0, queue+6
	stb	r0, r3
	ldi	r0, queue+7
	stb	r0, r3
	ldi	r0, -39
	add	r0, fp, r6
	stb	r6, r1, r3
	ldi	r0, queue+8
	stb	r0, r3
	ldi	r0, queue+9
	stb	r0, r3
	ldi	r0, queue+10
	stb	r0, r3
	ldi	r0, queue+11
	stb	r0, r3
	ldi	r0, queue+12
	stb	r0, r3
	ldi	r0, queue+13
	stb	r0, r3
	ldi	r0, queue+14
	stb	r0, r3
	ldi	r0, queue+15
	stb	r0, r3
	ldi	r0, queue+16
	stb	r0, r3
	ldi	r0, queue+17
	stb	r0, r3
	ldi	r0, queue+18
	stb	r0, r3
	ldi	r0, queue+19
	stb	r0, r3
	ldi	r0, queue+20
	stb	r0, r3
	ldi	r0, queue+21
	stb	r0, r3
	ldi	r0, queue+22
	stb	r0, r3
	ldi	r0, queue+23
	stb	r0, r3
	ldi	r0, queue+24
	stb	r0, r3
	ldi	r0, queue+25
	stb	r0, r3
	ldi	r0, queue+26
	stb	r0, r3
	ldi	r0, queue+27
	stb	r0, r3
	ldi	r0, queue+28
	stb	r0, r3
	ldi	r0, queue+29
	stb	r0, r3
	ldi	r0, queue+30
	stb	r0, r3
	ldi	r0, queue+31
	stb	r0, r3
	ldi	r0, head
	stw	r0, r3
	ldi	r0, end
	stw	r0, r3
	ldi	r0, 32
__LBB30_8:                              # %while.cond12
                                        # =>This Inner Loop Header: Depth=1
	ldb	r6, r1
	cmp	r1, r0
	beq	__LBB30_11
	br	__LBB30_9
__LBB30_11:                             # %while.body16
                                        #   in Loop: Header=BB30_8 Depth=1
	add	r6, 1
	br	__LBB30_8
__LBB30_9:                              # %while.cond12
	ldi	r2, 0
	cmp	r1, r2
	ldi	r5, CURR_CHAR
	beq	__LBB30_118
	br	__LBB30_10
__LBB30_10:                             # %land.lhs.true.preheader
	ldi	r5, 1
	movens	r2, r4
	br	__LBB30_12
__LBB30_12:                             # %land.lhs.true
                                        # =>This Inner Loop Header: Depth=1
	ldi	r3, 255
	and r1, r3, r3
	cmp	r3, r2
	beq	__LBB30_16
	br	__LBB30_13
__LBB30_13:                             # %land.lhs.true
                                        #   in Loop: Header=BB30_12 Depth=1
	ldi	r3, 31
	cmp	r4, r3
	bhi	__LBB30_16
	br	__LBB30_14
__LBB30_14:                             # %while.body34
                                        #   in Loop: Header=BB30_12 Depth=1
	ldi	r3, -72
	add	r3, fp, r3
	stb	r3, r4, r1
	add r6, r4, r1
	ldb	r1, r5, r1
	add	r4, 1
	cmp	r1, r0
	bne	__LBB30_12
	br	__LBB30_15
__LBB30_15:                             # %while.end38split
	add r6, r4, r2
	br	__LBB30_17
__LBB30_16:                             # %land.lhs.true.while.end38_crit_edge
	add r6, r4, r2
__LBB30_17:                             # %while.end38
	ldi	r1, -72
	add	r1, fp, r3
	ldi	r1, 0
	stb	r3, r4, r1
__LBB30_18:                             # %while.cond40
                                        # =>This Inner Loop Header: Depth=1
	ldb	r2, r6
	cmp	r6, r0
	beq	__LBB30_21
	br	__LBB30_19
__LBB30_21:                             # %while.body44
                                        #   in Loop: Header=BB30_18 Depth=1
	add	r2, 1
	br	__LBB30_18
__LBB30_19:                             # %while.cond40
	cmp	r6, r1
	beq	__LBB30_38
	br	__LBB30_20
__LBB30_38:                             # %while.end28.i.loopexit463
	ldi	r5, 1
	ldi	r3, 0
	movens	r2, r4
__LBB30_39:                             # %while.end28.i
	add	r4, 1
__LBB30_40:                             # %while.cond29.i
                                        # =>This Inner Loop Header: Depth=1
	ldi	r1, 255
	and r6, r1, r1
	cmp	r1, r0
	beq	__LBB30_42
	br	__LBB30_41
__LBB30_42:                             # %while.body33.i
                                        #   in Loop: Header=BB30_40 Depth=1
	ldb	r4, r6
	add	r4, 1
	br	__LBB30_40
__LBB30_41:                             # %while.cond29.i
	ldi	r6, 0
	cmp	r1, r6
	beq	__LBB30_44
	br	__LBB30_43
__LBB30_44:                             # %parseArgs.exit.loopexit
	ssw	r3, -96                         # 2-byte Folded Spill
__LBB30_45:                             # %parseArgs.exit
	lsw	r1, -72
	ssw	r1, -94                         # 2-byte Folded Spill
	cmp	r1, r6
	beq	__LBB30_49
	br	__LBB30_46
__LBB30_46:                             # %land.rhs.i.preheader
	ldi	r4, 0
	ldi	r1, -72
	add	r1, fp, r5
	add	r5, 1
	lsw	r1, -94                         # 2-byte Folded Reload
	movens	r4, r6
__LBB30_47:                             # %land.rhs.i
                                        # =>This Inner Loop Header: Depth=1
	ldi	r2, __L.str.37
	ldb	r6, r2, r3
	ldi	r2, 255
	and r1, r2, r1
	cmp	r1, r3
	bne	__LBB30_51
	br	__LBB30_48
__LBB30_48:                             # %if.end.i159
                                        #   in Loop: Header=BB30_47 Depth=1
	ldb	r5, r6, r1
	add	r6, 1
	cmp	r1, r4
	bne	__LBB30_47
	br	__LBB30_49
__LBB30_49:                             # %StringCmp.exit
	ldi	r1, __L.str.37
	ldb	r6, r1, r1
	ldi	r2, 0
	cmp	r1, r2
	bne	__LBB30_51
	br	__LBB30_50
__LBB30_51:                             # %if.else
	ldi	r6, 0
	lsw	r1, -94                         # 2-byte Folded Reload
	cmp	r1, r6
	beq	__LBB30_55
	br	__LBB30_52
__LBB30_52:                             # %land.rhs.i164.preheader
	ldi	r4, 0
	ldi	r1, -72
	add	r1, fp, r5
	add	r5, 1
	lsw	r1, -94                         # 2-byte Folded Reload
	movens	r4, r6
__LBB30_53:                             # %land.rhs.i164
                                        # =>This Inner Loop Header: Depth=1
	ldi	r2, __L.str.42
	ldb	r6, r2, r3
	ldi	r2, 255
	and r1, r2, r1
	cmp	r1, r3
	bne	__LBB30_57
	br	__LBB30_54
__LBB30_54:                             # %if.end.i169
                                        #   in Loop: Header=BB30_53 Depth=1
	ldb	r5, r6, r1
	add	r6, 1
	cmp	r1, r4
	bne	__LBB30_53
	br	__LBB30_55
__LBB30_55:                             # %StringCmp.exit177
	ldi	r1, __L.str.42
	ldb	r6, r1, r1
	ldi	r2, 0
	cmp	r1, r2
	bne	__LBB30_57
	br	__LBB30_56
__LBB30_57:                             # %if.else57
	ldi	r6, 0
	lsw	r1, -94                         # 2-byte Folded Reload
	cmp	r1, r6
	beq	__LBB30_61
	br	__LBB30_58
__LBB30_58:                             # %land.rhs.i179.preheader
	ldi	r4, 0
	ldi	r1, -72
	add	r1, fp, r5
	add	r5, 1
	lsw	r1, -94                         # 2-byte Folded Reload
	movens	r4, r6
__LBB30_59:                             # %land.rhs.i179
                                        # =>This Inner Loop Header: Depth=1
	ldi	r2, __L.str.38
	ldb	r6, r2, r3
	ldi	r2, 255
	and r1, r2, r1
	cmp	r1, r3
	bne	__LBB30_66
	br	__LBB30_60
__LBB30_60:                             # %if.end.i184
                                        #   in Loop: Header=BB30_59 Depth=1
	ldb	r5, r6, r1
	add	r6, 1
	cmp	r1, r4
	bne	__LBB30_59
	br	__LBB30_61
__LBB30_61:                             # %StringCmp.exit192
	ldi	r1, __L.str.38
	ldb	r6, r1, r1
	ldi	r2, 0
	cmp	r1, r2
	bne	__LBB30_66
	br	__LBB30_62
__LBB30_66:                             # %if.else63
	ldi	r6, 0
	lsw	r1, -94                         # 2-byte Folded Reload
	cmp	r1, r6
	beq	__LBB30_70
	br	__LBB30_67
__LBB30_67:                             # %land.rhs.i196.preheader
	ldi	r4, 0
	ldi	r1, -72
	add	r1, fp, r5
	add	r5, 1
	lsw	r1, -94                         # 2-byte Folded Reload
	movens	r4, r6
__LBB30_68:                             # %land.rhs.i196
                                        # =>This Inner Loop Header: Depth=1
	ldi	r2, __L.str.39
	ldb	r6, r2, r3
	ldi	r2, 255
	and r1, r2, r1
	cmp	r1, r3
	bne	__LBB30_72
	br	__LBB30_69
__LBB30_69:                             # %if.end.i201
                                        #   in Loop: Header=BB30_68 Depth=1
	ldb	r5, r6, r1
	add	r6, 1
	cmp	r1, r4
	bne	__LBB30_68
	br	__LBB30_70
__LBB30_70:                             # %StringCmp.exit209
	ldi	r1, __L.str.39
	ldb	r6, r1, r1
	ldi	r2, 0
	cmp	r1, r2
	bne	__LBB30_72
	br	__LBB30_71
__LBB30_72:                             # %if.else69
	ldi	r6, 0
	lsw	r1, -94                         # 2-byte Folded Reload
	cmp	r1, r6
	beq	__LBB30_76
	br	__LBB30_73
__LBB30_73:                             # %land.rhs.i211.preheader
	ldi	r4, 0
	ldi	r1, -72
	add	r1, fp, r5
	add	r5, 1
	lsw	r1, -94                         # 2-byte Folded Reload
	movens	r4, r6
__LBB30_74:                             # %land.rhs.i211
                                        # =>This Inner Loop Header: Depth=1
	ldi	r2, __L.str.40
	ldb	r6, r2, r3
	ldi	r2, 255
	and r1, r2, r1
	cmp	r1, r3
	bne	__LBB30_78
	br	__LBB30_75
__LBB30_75:                             # %if.end.i216
                                        #   in Loop: Header=BB30_74 Depth=1
	ldb	r5, r6, r1
	add	r6, 1
	cmp	r1, r4
	bne	__LBB30_74
	br	__LBB30_76
__LBB30_76:                             # %StringCmp.exit224
	ldi	r1, __L.str.40
	ldb	r6, r1, r1
	ldi	r2, 0
	cmp	r1, r2
	bne	__LBB30_78
	br	__LBB30_77
__LBB30_78:                             # %if.else75
	ldi	r6, 0
	lsw	r1, -94                         # 2-byte Folded Reload
	cmp	r1, r6
	beq	__LBB30_82
	br	__LBB30_79
__LBB30_79:                             # %land.rhs.i226.preheader
	ldi	r4, 0
	ldi	r1, -72
	add	r1, fp, r5
	add	r5, 1
	lsw	r1, -94                         # 2-byte Folded Reload
	movens	r4, r6
__LBB30_80:                             # %land.rhs.i226
                                        # =>This Inner Loop Header: Depth=1
	ldi	r2, __L.str.41
	ldb	r6, r2, r3
	ldi	r2, 255
	and r1, r2, r1
	cmp	r1, r3
	bne	__LBB30_84
	br	__LBB30_81
__LBB30_81:                             # %if.end.i231
                                        #   in Loop: Header=BB30_80 Depth=1
	ldb	r5, r6, r1
	add	r6, 1
	cmp	r1, r4
	bne	__LBB30_80
	br	__LBB30_82
__LBB30_82:                             # %StringCmp.exit239
	ldi	r1, __L.str.41
	ldb	r6, r1, r1
	ldi	r2, 0
	cmp	r1, r2
	bne	__LBB30_84
	br	__LBB30_83
__LBB30_84:                             # %if.else81
	ldi	r6, 0
	lsw	r1, -94                         # 2-byte Folded Reload
	cmp	r1, r6
	beq	__LBB30_88
	br	__LBB30_85
__LBB30_85:                             # %land.rhs.i241.preheader
	ldi	r4, 0
	ldi	r1, -72
	add	r1, fp, r5
	add	r5, 1
	lsw	r1, -94                         # 2-byte Folded Reload
	movens	r4, r6
__LBB30_86:                             # %land.rhs.i241
                                        # =>This Inner Loop Header: Depth=1
	ldi	r2, __L.str.47
	ldb	r6, r2, r3
	ldi	r2, 255
	and r1, r2, r1
	cmp	r1, r3
	bne	__LBB30_90
	br	__LBB30_87
__LBB30_87:                             # %if.end.i246
                                        #   in Loop: Header=BB30_86 Depth=1
	ldb	r5, r6, r1
	add	r6, 1
	cmp	r1, r4
	bne	__LBB30_86
	br	__LBB30_88
__LBB30_88:                             # %StringCmp.exit254
	ldi	r1, __L.str.47
	ldb	r6, r1, r1
	ldi	r2, 0
	cmp	r1, r2
	bne	__LBB30_90
	br	__LBB30_89
__LBB30_90:                             # %if.else87
	ldi	r6, 0
	lsw	r1, -94                         # 2-byte Folded Reload
	cmp	r1, r6
	beq	__LBB30_94
	br	__LBB30_91
__LBB30_91:                             # %land.rhs.i256.preheader
	ldi	r4, 0
	ldi	r1, -72
	add	r1, fp, r5
	add	r5, 1
	lsw	r1, -94                         # 2-byte Folded Reload
	movens	r4, r6
__LBB30_92:                             # %land.rhs.i256
                                        # =>This Inner Loop Header: Depth=1
	ldi	r2, __L.str.43
	ldb	r6, r2, r3
	ldi	r2, 255
	and r1, r2, r1
	cmp	r1, r3
	bne	__LBB30_96
	br	__LBB30_93
__LBB30_93:                             # %if.end.i261
                                        #   in Loop: Header=BB30_92 Depth=1
	ldb	r5, r6, r1
	add	r6, 1
	cmp	r1, r4
	bne	__LBB30_92
	br	__LBB30_94
__LBB30_94:                             # %StringCmp.exit269
	ldi	r1, __L.str.43
	ldb	r6, r1, r1
	ldi	r2, 0
	cmp	r1, r2
	bne	__LBB30_96
	br	__LBB30_95
__LBB30_96:                             # %if.else93
	ldi	r6, 0
	lsw	r1, -94                         # 2-byte Folded Reload
	cmp	r1, r6
	beq	__LBB30_100
	br	__LBB30_97
__LBB30_97:                             # %land.rhs.i271.preheader
	ldi	r4, 0
	ldi	r1, -72
	add	r1, fp, r5
	add	r5, 1
	lsw	r1, -94                         # 2-byte Folded Reload
	movens	r4, r6
__LBB30_98:                             # %land.rhs.i271
                                        # =>This Inner Loop Header: Depth=1
	ldi	r2, __L.str.44
	ldb	r6, r2, r3
	ldi	r2, 255
	and r1, r2, r1
	cmp	r1, r3
	bne	__LBB30_102
	br	__LBB30_99
__LBB30_99:                             # %if.end.i276
                                        #   in Loop: Header=BB30_98 Depth=1
	ldb	r5, r6, r1
	add	r6, 1
	cmp	r1, r4
	bne	__LBB30_98
	br	__LBB30_100
__LBB30_100:                            # %StringCmp.exit284
	ldi	r1, __L.str.44
	ldb	r6, r1, r1
	ldi	r2, 0
	cmp	r1, r2
	bne	__LBB30_102
	br	__LBB30_101
__LBB30_102:                            # %if.else99
	ldi	r6, 0
	lsw	r1, -94                         # 2-byte Folded Reload
	cmp	r1, r6
	beq	__LBB30_106
	br	__LBB30_103
__LBB30_103:                            # %land.rhs.i286.preheader
	ldi	r4, 0
	ldi	r1, -72
	add	r1, fp, r5
	add	r5, 1
	lsw	r1, -94                         # 2-byte Folded Reload
	movens	r4, r6
__LBB30_104:                            # %land.rhs.i286
                                        # =>This Inner Loop Header: Depth=1
	ldi	r2, __L.str.45
	ldb	r6, r2, r3
	ldi	r2, 255
	and r1, r2, r1
	cmp	r1, r3
	bne	__LBB30_108
	br	__LBB30_105
__LBB30_105:                            # %if.end.i291
                                        #   in Loop: Header=BB30_104 Depth=1
	ldb	r5, r6, r1
	add	r6, 1
	cmp	r1, r4
	bne	__LBB30_104
	br	__LBB30_106
__LBB30_106:                            # %StringCmp.exit299
	ldi	r1, __L.str.45
	ldb	r6, r1, r1
	ldi	r2, 0
	cmp	r1, r2
	bne	__LBB30_108
	br	__LBB30_107
__LBB30_108:                            # %if.else105
	ldi	r6, 0
	lsw	r1, -94                         # 2-byte Folded Reload
	cmp	r1, r6
	beq	__LBB30_112
	br	__LBB30_109
__LBB30_109:                            # %land.rhs.i301.preheader
	ldi	r4, 0
	ldi	r1, -72
	add	r1, fp, r5
	add	r5, 1
	lsw	r1, -94                         # 2-byte Folded Reload
	movens	r4, r6
__LBB30_110:                            # %land.rhs.i301
                                        # =>This Inner Loop Header: Depth=1
	ldi	r2, __L.str.46
	ldb	r6, r2, r3
	ldi	r2, 255
	and r1, r2, r1
	cmp	r1, r3
	bne	__LBB30_114
	br	__LBB30_111
__LBB30_111:                            # %if.end.i306
                                        #   in Loop: Header=BB30_110 Depth=1
	ldb	r5, r6, r1
	add	r6, 1
	cmp	r1, r4
	bne	__LBB30_110
	br	__LBB30_112
__LBB30_112:                            # %StringCmp.exit314
	ldi	r1, __L.str.46
	ldb	r6, r1, r1
	ldi	r2, 0
	cmp	r1, r2
	bne	__LBB30_114
	br	__LBB30_113
__LBB30_114:                            # %if.else111
	ldi	r1, 69
	ldi	r5, CURR_CHAR
	stw	r5, r1
	ldi	r2, 114
	stw	r5, r2
	stw	r5, r2
	ldi	r1, 111
	stw	r5, r1
	stw	r5, r2
	ldi	r2, 58
	stw	r5, r2
	stw	r5, r0
	ldi	r2, 85
	stw	r5, r2
	ldi	r2, 110
	stw	r5, r2
	ldi	r3, 107
	stw	r5, r3
	stw	r5, r2
	stw	r5, r1
	ldi	r3, 119
	stw	r5, r3
	stw	r5, r2
	stw	r5, r0
	ldi	r3, 99
	stw	r5, r3
	stw	r5, r1
	ldi	r1, 109
	stw	r5, r1
	stw	r5, r1
	ldi	r1, 97
	stw	r5, r1
	stw	r5, r2
	ldi	r1, 100
	stw	r5, r1
	stw	r5, r0
	ldi	r1, 39
	stw	r5, r1
	ldi	r2, 0
	lsw	r4, -94                         # 2-byte Folded Reload
	cmp	r4, r2
	beq	__LBB30_117
	br	__LBB30_115
__LBB30_115:                            # %while.body.i322.preheader
	ldi	r3, -72
	add	r3, fp, r3
	add	r3, 1
__LBB30_116:                            # %while.body.i322
                                        # =>This Inner Loop Header: Depth=1
	sxt	r4, r4
	stw	r5, r4
	ldb	r3, r4
	add	r3, 1
	cmp	r4, r2
	bne	__LBB30_116
	br	__LBB30_117
__LBB30_117:                            # %print.exit328
	stw	r5, r1
	ldi	r2, 46
	stw	r5, r2
	stw	r5, r0
	ldi	r3, 84
	stw	r5, r3
	ldi	r3, 121
	stw	r5, r3
	ldi	r3, 112
	stw	r5, r3
	ldi	r4, 101
	stw	r5, r4
	stw	r5, r0
	stw	r5, r1
	ldi	r0, 104
	stw	r5, r0
	stw	r5, r4
	ldi	r0, 108
	stw	r5, r0
	stw	r5, r3
	stw	r5, r1
	stw	r5, r2
	ldi	r0, 10
	stw	r5, r0
__LBB30_118:                            # %cleanup124.sink.split
	ldi	r0, 62
	stw	r5, r0
	ldi	r0, 32
	stw	r5, r0
__LBB30_119:                            # %cleanup124
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	104
	pop	fp
	rts
__LBB30_20:                             # %while.cond2.preheader.i.preheader
	ssw	r1, -94                         # 2-byte Folded Spill
	br	__LBB30_22
__LBB30_24:                             # %while.body6.i
                                        #   in Loop: Header=BB30_22 Depth=1
	ldb	r2, r5, r6
	add	r2, 1
	br	__LBB30_22
__LBB30_22:                             # %while.cond2.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB30_26 Depth 2
	ldi	r3, 255
	and r6, r3, r4
	cmp	r4, r0
	beq	__LBB30_24
	br	__LBB30_23
__LBB30_23:                             # %while.cond2.i
                                        #   in Loop: Header=BB30_22 Depth=1
	cmp	r4, r1
	beq	__LBB30_36
	br	__LBB30_25
__LBB30_25:                             # %if.end.i
                                        #   in Loop: Header=BB30_22 Depth=1
	ldi	r3, -92
	add	r3, fp, r3
	lsw	r6, -94                         # 2-byte Folded Reload
	shl	r6, r4, 1
	stb	r3, r4, r2
	add r3, r4, r3
	shr	r2, r4, 8
	stb	r3, r5, r4
	movens	r6, r3
	add	r3, 1
	ssw	r3, -96                         # 2-byte Folded Spill
	movens	r2, r4
__LBB30_26:                             # %while.cond10.i
                                        #   Parent Loop BB30_22 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	ldb	r4, r2
	cmp	r2, r0
	beq	__LBB30_32
	br	__LBB30_27
__LBB30_27:                             # %while.cond10.i
                                        #   in Loop: Header=BB30_26 Depth=2
	cmp	r2, r1
	bne	__LBB30_31
	br	__LBB30_28
__LBB30_31:                             # %while.body19.i
                                        #   in Loop: Header=BB30_26 Depth=2
	add	r4, 1
	br	__LBB30_26
__LBB30_32:                             # %if.end27.i
                                        #   in Loop: Header=BB30_22 Depth=1
	ldi	r2, 9
	lsw	r3, -94                         # 2-byte Folded Reload
	cmp	r3, r2
	ssw	r5, -98                         # 2-byte Folded Spill
	blo	__LBB30_34
# %bb.33:                               # %if.end27.i
                                        #   in Loop: Header=BB30_22 Depth=1
	ssw	r1, -98                         # 2-byte Folded Spill
__LBB30_34:                             # %if.end27.i
                                        #   in Loop: Header=BB30_22 Depth=1
	stb	r4, r1
	ldb	r4, r5, r6
	cmp	r6, r1
	beq	__LBB30_37
	br	__LBB30_35
__LBB30_35:                             # %if.end27.i
                                        #   in Loop: Header=BB30_22 Depth=1
	movens	r4, r2
	add	r2, 1
	ldi	r1, 9
	lsw	r3, -94                         # 2-byte Folded Reload
	cmp	r3, r1
	ldi	r1, 0
	lsw	r3, -96                         # 2-byte Folded Reload
	ssw	r3, -94                         # 2-byte Folded Spill
	blo	__LBB30_22
	br	__LBB30_37
__LBB30_37:                             # %while.end28.i.loopexit462
	add	r4, 1
	lsw	r3, -96                         # 2-byte Folded Reload
	lsw	r5, -98                         # 2-byte Folded Reload
	br	__LBB30_39
__LBB30_43:                             # %land.lhs.true.i
	add r3, r5, r3
	ssw	r3, -96                         # 2-byte Folded Spill
	br	__LBB30_45
__LBB30_36:                             # %while.end28.i.loopexit
	ldi	r5, 1
	lsw	r3, -94                         # 2-byte Folded Reload
	movens	r2, r4
	br	__LBB30_39
__LBB30_50:                             # %if.then50
	ldi	r0, -92
	add	r0, fp, r0
	lsw	r1, -96                         # 2-byte Folded Reload
	jsr	SetCmdWrapper
	ldi	r5, CURR_CHAR
	br	__LBB30_118
__LBB30_56:                             # %if.then55
	ldi	r0, -92
	add	r0, fp, r0
	lsw	r1, -96                         # 2-byte Folded Reload
	jsr	RuleCmdWrapper
	ldi	r5, CURR_CHAR
	br	__LBB30_118
__LBB30_28:                             # %if.end27.thread.i
	ldi	r6, 0
	ldi	r5, 1
	ldi	r1, 9
	lsw	r2, -94                         # 2-byte Folded Reload
	cmp	r2, r1
	blo	__LBB30_30
# %bb.29:                               # %if.end27.thread.i
	movens	r6, r5
__LBB30_30:                             # %if.end27.thread.i
	lsw	r3, -96                         # 2-byte Folded Reload
	br	__LBB30_39
__LBB30_62:                             # %if.then61
	ldi	r1, 0
	lsw	r2, -96                         # 2-byte Folded Reload
	cmp	r2, r1
	beq	__LBB30_64
	br	__LBB30_63
__LBB30_63:                             # %while.body.i.preheader.i
	ldi	r1, 69
	ldi	r5, CURR_CHAR
	stw	r5, r1
	ldi	r1, 114
	stw	r5, r1
	stw	r5, r1
	ldi	r3, 111
	stw	r5, r3
	ssw	r1, -96                         # 2-byte Folded Spill
	stw	r5, r1
	ldi	r1, 58
	stw	r5, r1
	stw	r5, r0
	ldi	r1, 39
	stw	r5, r1
	ldi	r2, 115
	stw	r5, r2
	ldi	r2, 116
	stw	r5, r2
	stw	r5, r3
	ldi	r2, 112
	stw	r5, r2
	stw	r5, r1
	stw	r5, r0
	ldi	r1, 99
	stw	r5, r1
	stw	r5, r3
	ldi	r1, 109
	stw	r5, r1
	ssw	r1, -98                         # 2-byte Folded Spill
	stw	r5, r1
	ldi	r6, 97
	stw	r5, r6
	ldi	r4, 110
	stw	r5, r4
	ldi	r1, 100
	stw	r5, r1
	stw	r5, r0
	ldi	r1, 116
	ssw	r1, -100                        # 2-byte Folded Spill
	stw	r5, r1
	stw	r5, r6
	ldi	r1, 107
	stw	r5, r1
	ldi	r2, 101
	stw	r5, r2
	ldi	r1, 115
	ssw	r1, -94                         # 2-byte Folded Spill
	stw	r5, r1
	stw	r5, r0
	ldi	r1, 117
	ssw	r1, -102                        # 2-byte Folded Spill
	ldi	r1, 103
	ssw	r1, -104                        # 2-byte Folded Spill
	movens	r4, r1
	br	__LBB30_65
__LBB30_71:                             # %if.then67
	lsw	r1, -96                         # 2-byte Folded Reload
	jsr	StartCmdWrapper
	ldi	r5, CURR_CHAR
	br	__LBB30_118
__LBB30_77:                             # %if.then73
	ldi	r0, -92
	add	r0, fp, r0
	lsw	r1, -96                         # 2-byte Folded Reload
	jsr	FillCmdWrapper
	ldi	r5, CURR_CHAR
	br	__LBB30_118
__LBB30_83:                             # %if.then79
	lsw	r1, -96                         # 2-byte Folded Reload
	jsr	CleanCmdWrapper
	ldi	r5, CURR_CHAR
	br	__LBB30_118
__LBB30_64:                             # %if.end.i194
	ldi	r0, START_STOP
	stw	r0, r1
	ldi	r0, gmState
	stw	r0, r1
	ldi	r0, 100
	ssw	r0, -94                         # 2-byte Folded Spill
	ldi	r2, 112
	ldi	r0, 111
	ssw	r0, -98                         # 2-byte Folded Spill
	ldi	r0, 116
	ssw	r0, -102                        # 2-byte Folded Spill
	ldi	r0, 115
	ssw	r0, -104                        # 2-byte Folded Spill
	ldi	r0, 32
	ssw	r0, -96                         # 2-byte Folded Spill
	ldi	r6, 101
	ldi	r0, 109
	ldi	r3, 97
	ldi	r4, 71
	movens	r2, r1
	ssw	r6, -100                        # 2-byte Folded Spill
	ldi	r5, CURR_CHAR
__LBB30_65:                             # %StopCmdWrapper.exit
	stw	r5, r4
	stw	r5, r3
	stw	r5, r0
	stw	r5, r6
	lsw	r0, -96                         # 2-byte Folded Reload
	stw	r5, r0
	lsw	r0, -104                        # 2-byte Folded Reload
	stw	r5, r0
	lsw	r0, -102                        # 2-byte Folded Reload
	stw	r5, r0
	lsw	r0, -98                         # 2-byte Folded Reload
	stw	r5, r0
	stw	r5, r2
	stw	r5, r1
	lsw	r0, -100                        # 2-byte Folded Reload
	stw	r5, r0
	lsw	r0, -94                         # 2-byte Folded Reload
	stw	r5, r0
	ldi	r0, 46
	stw	r5, r0
	ldi	r0, 10
	stw	r5, r0
	br	__LBB30_118
__LBB30_89:                             # %if.then85
	ldi	r0, -92
	add	r0, fp, r0
	lsw	r1, -96                         # 2-byte Folded Reload
	jsr	HelpCmdWrapper
	ldi	r5, CURR_CHAR
	br	__LBB30_118
__LBB30_95:                             # %if.then91
	ldi	r0, -92
	add	r0, fp, r0
	lsw	r1, -96                         # 2-byte Folded Reload
	jsr	SetGliderCmdWrapper
	ldi	r5, CURR_CHAR
	br	__LBB30_118
__LBB30_101:                            # %if.then97
	ldi	r0, -92
	add	r0, fp, r0
	lsw	r1, -96                         # 2-byte Folded Reload
	jsr	SetBeeQueenCmdWrapper
	ldi	r5, CURR_CHAR
	br	__LBB30_118
__LBB30_107:                            # %if.then103
	ldi	r0, -92
	add	r0, fp, r0
	lsw	r1, -96                         # 2-byte Folded Reload
	jsr	SetLWSSCmdWrapper
	ldi	r5, CURR_CHAR
	br	__LBB30_118
__LBB30_113:                            # %if.then109
	ldi	r0, -92
	add	r0, fp, r0
	lsw	r1, -96                         # 2-byte Folded Reload
	jsr	SetHWSSCmdWrapper
	ldi	r5, CURR_CHAR
	br	__LBB30_118
                                        # -- End function
main>                                   # -- Begin function main
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	0
	jsr	parse
	ldi	r0, 0
	addsp	0
	pop	fp
	rts
                                        # -- End function
### SECTION: .bss
gmState>                                # @gmState
	dc	0                               # 0x0

### SECTION: .data
mainHelp>                               # @mainHelp
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
	db	32
	db	32
	db	32
	db	32
	db	32
	db	45
	db	32
	db	83
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
	db	32
	db	111
	db	114
	db	32
	db	49
	db	41
	db	10
	db	32
	db	114
	db	117
	db	108
	db	101
	db	32
	db	98
	db	60
	db	110
	db	117
	db	109
	db	115
	db	62
	db	32
	db	115
	db	60
	db	110
	db	117
	db	109
	db	115
	db	62
	db	32
	db	32
	db	32
	db	45
	db	32
	db	83
	db	101
	db	116
	db	32
	db	66
	db	47
	db	83
	db	32
	db	114
	db	117
	db	108
	db	101
	db	115
	db	32
	db	40
	db	101
	db	46
	db	103
	db	46
	db	44
	db	32
	db	114
	db	117
	db	108
	db	101
	db	32
	db	98
	db	51
	db	32
	db	115
	db	50
	db	51
	db	41
	db	10
	db	32
	db	115
	db	116
	db	111
	db	112
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	45
	db	32
	db	83
	db	116
	db	111
	db	112
	db	32
	db	116
	db	104
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
	db	10
	db	32
	db	115
	db	116
	db	97
	db	114
	db	116
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	45
	db	32
	db	83
	db	116
	db	97
	db	114
	db	116
	db	32
	db	116
	db	104
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
	db	10
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
	db	70
	db	105
	db	108
	db	108
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
	db	40
	db	105
	db	110
	db	99
	db	108
	db	117
	db	115
	db	105
	db	118
	db	101
	db	41
	db	10
	db	32
	db	99
	db	108
	db	101
	db	97
	db	110
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	45
	db	32
	db	67
	db	108
	db	101
	db	97
	db	114
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
	db	32
	db	40
	db	102
	db	105
	db	108
	db	108
	db	32
	db	119
	db	105
	db	116
	db	104
	db	32
	db	48
	db	41
	db	10
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
	db	32
	db	32
	db	32
	db	32
	db	45
	db	32
	db	80
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
	db	116
	db	111
	db	112
	db	45
	db	108
	db	101
	db	102
	db	116
	db	32
	db	40
	db	120
	db	44
	db	121
	db	41
	db	10
	db	32
	db	115
	db	101
	db	116
	db	45
	db	98
	db	101
	db	101
	db	45
	db	113
	db	117
	db	101
	db	101
	db	110
	db	32
	db	60
	db	120
	db	62
	db	32
	db	60
	db	121
	db	62
	db	32
	db	32
	db	45
	db	32
	db	80
	db	108
	db	97
	db	99
	db	101
	db	32
	db	97
	db	32
	db	39
	db	98
	db	101
	db	101
	db	45
	db	113
	db	117
	db	101
	db	101
	db	110
	db	39
	db	32
	db	97
	db	116
	db	32
	db	116
	db	111
	db	112
	db	45
	db	108
	db	101
	db	102
	db	116
	db	32
	db	40
	db	120
	db	44
	db	121
	db	41
	db	10
	db	32
	db	115
	db	101
	db	116
	db	45
	db	108
	db	119
	db	115
	db	115
	db	32
	db	60
	db	120
	db	62
	db	32
	db	60
	db	121
	db	62
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	45
	db	32
	db	80
	db	108
	db	97
	db	99
	db	101
	db	32
	db	97
	db	32
	db	108
	db	105
	db	103
	db	104
	db	116
	db	45
	db	119
	db	101
	db	105
	db	103
	db	104
	db	116
	db	32
	db	115
	db	112
	db	97
	db	99
	db	101
	db	115
	db	104
	db	105
	db	112
	db	32
	db	97
	db	116
	db	32
	db	116
	db	111
	db	112
	db	45
	db	108
	db	101
	db	102
	db	116
	db	32
	db	40
	db	120
	db	44
	db	121
	db	41
	db	10
	db	32
	db	115
	db	101
	db	116
	db	45
	db	104
	db	119
	db	115
	db	115
	db	32
	db	60
	db	120
	db	62
	db	32
	db	60
	db	121
	db	62
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	45
	db	32
	db	80
	db	108
	db	97
	db	99
	db	101
	db	32
	db	97
	db	32
	db	104
	db	101
	db	97
	db	118
	db	121
	db	45
	db	119
	db	101
	db	105
	db	103
	db	104
	db	116
	db	32
	db	115
	db	112
	db	97
	db	99
	db	101
	db	115
	db	104
	db	105
	db	112
	db	32
	db	97
	db	116
	db	32
	db	116
	db	111
	db	112
	db	45
	db	108
	db	101
	db	102
	db	116
	db	32
	db	40
	db	120
	db	44
	db	121
	db	41
	db	10
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
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	45
	db	32
	db	83
	db	104
	db	111
	db	119
	db	32
	db	116
	db	104
	db	105
	db	115
	db	32
	db	104
	db	101
	db	108
	db	112
	db	32
	db	111
	db	114
	db	32
	db	104
	db	101
	db	108
	db	112
	db	32
	db	102
	db	111
	db	114
	db	32
	db	97
	db	32
	db	99
	db	111
	db	109
	db	109
	db	97
	db	110
	db	100
	db	10
	db	0

setHelp>                                # @setHelp
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
	db	116
	db	104
	db	101
	db	32
	db	99
	db	101
	db	108
	db	108
	db	32
	db	97
	db	116
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
	db	40
	db	120
	db	44
	db	121
	db	41
	db	32
	db	116
	db	111
	db	32
	db	116
	db	104
	db	101
	db	32
	db	115
	db	112
	db	101
	db	99
	db	105
	db	102
	db	105
	db	101
	db	100
	db	32
	db	118
	db	97
	db	108
	db	117
	db	101
	db	10
	db	32
	db	40
	db	48
	db	32
	db	102
	db	111
	db	114
	db	32
	db	100
	db	101
	db	97
	db	100
	db	44
	db	32
	db	49
	db	32
	db	102
	db	111
	db	114
	db	32
	db	97
	db	108
	db	105
	db	118
	db	101
	db	41
	db	46
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
	db	97
	db	114
	db	101
	db	32
	db	48
	db	45
	db	105
	db	110
	db	100
	db	101
	db	120
	db	101
	db	100
	db	32
	db	91
	db	48
	db	45
	db	51
	db	49
	db	93
	db	46
	db	10
	db	0

stopHelp>                               # @stopHelp
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
	db	32
	db	102
	db	114
	db	111
	db	109
	db	32
	db	97
	db	100
	db	118
	db	97
	db	110
	db	99
	db	105
	db	110
	db	103
	db	32
	db	116
	db	111
	db	32
	db	116
	db	104
	db	101
	db	32
	db	110
	db	101
	db	120
	db	116
	db	32
	db	103
	db	101
	db	110
	db	101
	db	114
	db	97
	db	116
	db	105
	db	111
	db	110
	db	46
	db	10
	db	0

startHelp>                              # @startHelp
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
	db	32
	db	111
	db	114
	db	32
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
	db	44
	db	32
	db	97
	db	100
	db	118
	db	97
	db	110
	db	99
	db	105
	db	110
	db	103
	db	32
	db	103
	db	101
	db	110
	db	101
	db	114
	db	97
	db	116
	db	105
	db	111
	db	110
	db	115
	db	32
	db	97
	db	99
	db	99
	db	111
	db	114
	db	100
	db	105
	db	110
	db	103
	db	32
	db	116
	db	111
	db	32
	db	116
	db	104
	db	101
	db	32
	db	99
	db	117
	db	114
	db	114
	db	101
	db	110
	db	116
	db	32
	db	114
	db	117
	db	108
	db	101
	db	115
	db	46
	db	10
	db	0

fillHelp>                               # @fillHelp
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
	db	97
	db	32
	db	114
	db	101
	db	99
	db	116
	db	97
	db	110
	db	103
	db	117
	db	108
	db	97
	db	114
	db	32
	db	97
	db	114
	db	101
	db	97
	db	32
	db	119
	db	105
	db	116
	db	104
	db	32
	db	116
	db	104
	db	101
	db	32
	db	115
	db	112
	db	101
	db	99
	db	105
	db	102
	db	105
	db	101
	db	100
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
	db	32
	db	40
	db	120
	db	49
	db	44
	db	121
	db	49
	db	41
	db	32
	db	105
	db	115
	db	32
	db	116
	db	104
	db	101
	db	32
	db	116
	db	111
	db	112
	db	45
	db	108
	db	101
	db	102
	db	116
	db	32
	db	99
	db	111
	db	114
	db	110
	db	101
	db	114
	db	44
	db	32
	db	40
	db	120
	db	50
	db	44
	db	121
	db	50
	db	41
	db	32
	db	105
	db	115
	db	32
	db	116
	db	104
	db	101
	db	32
	db	98
	db	111
	db	116
	db	116
	db	111
	db	109
	db	45
	db	114
	db	105
	db	103
	db	104
	db	116
	db	32
	db	99
	db	111
	db	114
	db	110
	db	101
	db	114
	db	32
	db	40
	db	105
	db	110
	db	99
	db	108
	db	117
	db	115
	db	105
	db	118
	db	101
	db	41
	db	46
	db	10
	db	32
	db	82
	db	101
	db	113
	db	117
	db	105
	db	114
	db	101
	db	115
	db	32
	db	120
	db	49
	db	32
	db	60
	db	61
	db	32
	db	120
	db	50
	db	32
	db	97
	db	110
	db	100
	db	32
	db	121
	db	49
	db	32
	db	60
	db	61
	db	32
	db	121
	db	50
	db	44
	db	32
	db	97
	db	110
	db	100
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
	db	119
	db	105
	db	116
	db	104
	db	105
	db	110
	db	32
	db	91
	db	48
	db	45
	db	51
	db	49
	db	93
	db	46
	db	10
	db	0

cleanHelp>                              # @cleanHelp
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
	db	32
	db	98
	db	121
	db	32
	db	115
	db	101
	db	116
	db	116
	db	105
	db	110
	db	103
	db	32
	db	97
	db	108
	db	108
	db	32
	db	99
	db	101
	db	108
	db	108
	db	115
	db	32
	db	116
	db	111
	db	32
	db	48
	db	32
	db	40
	db	100
	db	101
	db	97
	db	100
	db	41
	db	46
	db	10
	db	32
	db	69
	db	113
	db	117
	db	105
	db	118
	db	97
	db	108
	db	101
	db	110
	db	116
	db	32
	db	116
	db	111
	db	32
	db	39
	db	102
	db	105
	db	108
	db	108
	db	32
	db	48
	db	32
	db	48
	db	32
	db	51
	db	49
	db	32
	db	51
	db	49
	db	32
	db	48
	db	39
	db	46
	db	10
	db	0

ruleHelp>                               # @ruleHelp
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
	db	98
	db	60
	db	100
	db	105
	db	103
	db	105
	db	116
	db	115
	db	62
	db	32
	db	115
	db	60
	db	100
	db	105
	db	103
	db	105
	db	116
	db	115
	db	62
	db	10
	db	32
	db	83
	db	101
	db	116
	db	115
	db	32
	db	116
	db	104
	db	101
	db	32
	db	66
	db	105
	db	114
	db	116
	db	104
	db	32
	db	97
	db	110
	db	100
	db	32
	db	83
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
	db	102
	db	111
	db	114
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
	db	46
	db	10
	db	32
	db	60
	db	100
	db	105
	db	103
	db	105
	db	116
	db	115
	db	62
	db	32
	db	97
	db	114
	db	101
	db	32
	db	116
	db	104
	db	101
	db	32
	db	110
	db	117
	db	109
	db	98
	db	101
	db	114
	db	115
	db	32
	db	111
	db	102
	db	32
	db	110
	db	101
	db	105
	db	103
	db	104
	db	98
	db	111
	db	117
	db	114
	db	115
	db	32
	db	114
	db	101
	db	113
	db	117
	db	105
	db	114
	db	101
	db	100
	db	32
	db	40
	db	48
	db	45
	db	56
	db	41
	db	46
	db	10
	db	32
	db	69
	db	120
	db	97
	db	109
	db	112
	db	108
	db	101
	db	58
	db	32
	db	39
	db	114
	db	117
	db	108
	db	101
	db	32
	db	98
	db	51
	db	32
	db	115
	db	50
	db	51
	db	39
	db	32
	db	40
	db	115
	db	116
	db	97
	db	110
	db	100
	db	97
	db	114
	db	100
	db	32
	db	67
	db	111
	db	110
	db	119
	db	97
	db	121
	db	32
	db	114
	db	117
	db	108
	db	101
	db	115
	db	41
	db	46
	db	10
	db	32
	db	68
	db	105
	db	103
	db	105
	db	116
	db	115
	db	32
	db	99
	db	97
	db	110
	db	32
	db	98
	db	101
	db	32
	db	114
	db	101
	db	112
	db	101
	db	97
	db	116
	db	101
	db	100
	db	32
	db	111
	db	114
	db	32
	db	111
	db	117
	db	116
	db	32
	db	111
	db	102
	db	32
	db	111
	db	114
	db	100
	db	101
	db	114
	db	32
	db	40
	db	101
	db	46
	db	103
	db	46
	db	44
	db	32
	db	98
	db	51
	db	51
	db	49
	db	32
	db	105
	db	115
	db	32
	db	115
	db	97
	db	109
	db	101
	db	32
	db	97
	db	115
	db	32
	db	98
	db	49
	db	51
	db	41
	db	46
	db	10
	db	0

setGliderHelp>                          # @setGliderHelp
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
	db	32
	db	112
	db	97
	db	116
	db	116
	db	101
	db	114
	db	110
	db	32
	db	119
	db	105
	db	116
	db	104
	db	32
	db	105
	db	116
	db	115
	db	32
	db	116
	db	111
	db	112
	db	45
	db	108
	db	101
	db	102
	db	116
	db	32
	db	98
	db	111
	db	117
	db	110
	db	100
	db	105
	db	110
	db	103
	db	32
	db	98
	db	111
	db	120
	db	32
	db	99
	db	111
	db	114
	db	110
	db	101
	db	114
	db	10
	db	32
	db	97
	db	116
	db	32
	db	40
	db	120
	db	44
	db	121
	db	41
	db	32
	db	91
	db	48
	db	45
	db	51
	db	49
	db	93
	db	46
	db	32
	db	84
	db	104
	db	101
	db	32
	db	112
	db	97
	db	116
	db	116
	db	101
	db	114
	db	110
	db	32
	db	119
	db	114
	db	97
	db	112
	db	115
	db	32
	db	97
	db	114
	db	111
	db	117
	db	110
	db	100
	db	32
	db	116
	db	104
	db	101
	db	32
	db	101
	db	100
	db	103
	db	101
	db	115
	db	32
	db	105
	db	102
	db	32
	db	110
	db	101
	db	99
	db	101
	db	115
	db	115
	db	97
	db	114
	db	121
	db	46
	db	10
	db	32
	db	80
	db	97
	db	116
	db	116
	db	101
	db	114
	db	110
	db	58
	db	10
	db	32
	db	32
	db	32
	db	46
	db	88
	db	46
	db	10
	db	32
	db	32
	db	32
	db	46
	db	46
	db	88
	db	10
	db	32
	db	32
	db	32
	db	88
	db	88
	db	88
	db	10
	db	0

setBeeQueenHelp>                        # @setBeeQueenHelp
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
	db	98
	db	101
	db	101
	db	45
	db	113
	db	117
	db	101
	db	101
	db	110
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
	db	39
	db	98
	db	101
	db	101
	db	45
	db	113
	db	117
	db	101
	db	101
	db	110
	db	39
	db	32
	db	112
	db	97
	db	116
	db	116
	db	101
	db	114
	db	110
	db	32
	db	119
	db	105
	db	116
	db	104
	db	32
	db	105
	db	116
	db	115
	db	32
	db	116
	db	111
	db	112
	db	45
	db	108
	db	101
	db	102
	db	116
	db	32
	db	98
	db	111
	db	117
	db	110
	db	100
	db	105
	db	110
	db	103
	db	32
	db	98
	db	111
	db	120
	db	32
	db	99
	db	111
	db	114
	db	110
	db	101
	db	114
	db	10
	db	32
	db	97
	db	116
	db	32
	db	40
	db	120
	db	44
	db	121
	db	41
	db	32
	db	91
	db	48
	db	45
	db	51
	db	49
	db	93
	db	46
	db	32
	db	80
	db	97
	db	116
	db	116
	db	101
	db	114
	db	110
	db	58
	db	10
	db	32
	db	32
	db	32
	db	88
	db	88
	db	46
	db	46
	db	10
	db	32
	db	32
	db	32
	db	46
	db	46
	db	88
	db	46
	db	10
	db	32
	db	32
	db	32
	db	46
	db	46
	db	46
	db	88
	db	10
	db	32
	db	32
	db	32
	db	46
	db	46
	db	46
	db	88
	db	10
	db	32
	db	32
	db	32
	db	46
	db	46
	db	46
	db	88
	db	10
	db	32
	db	32
	db	32
	db	46
	db	46
	db	88
	db	46
	db	10
	db	32
	db	32
	db	32
	db	88
	db	88
	db	46
	db	46
	db	10
	db	0

setLWSSHelp>                            # @setLWSSHelp
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
	db	108
	db	119
	db	115
	db	115
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
	db	108
	db	105
	db	103
	db	104
	db	116
	db	45
	db	119
	db	101
	db	105
	db	103
	db	104
	db	116
	db	32
	db	115
	db	112
	db	97
	db	99
	db	101
	db	115
	db	104
	db	105
	db	112
	db	32
	db	112
	db	97
	db	116
	db	116
	db	101
	db	114
	db	110
	db	32
	db	119
	db	105
	db	116
	db	104
	db	32
	db	105
	db	116
	db	115
	db	32
	db	116
	db	111
	db	112
	db	45
	db	108
	db	101
	db	102
	db	116
	db	32
	db	98
	db	111
	db	117
	db	110
	db	100
	db	105
	db	110
	db	103
	db	32
	db	98
	db	111
	db	120
	db	32
	db	99
	db	111
	db	114
	db	110
	db	101
	db	114
	db	10
	db	32
	db	97
	db	116
	db	32
	db	40
	db	120
	db	44
	db	121
	db	41
	db	32
	db	91
	db	48
	db	45
	db	51
	db	49
	db	93
	db	46
	db	32
	db	80
	db	97
	db	116
	db	116
	db	101
	db	114
	db	110
	db	58
	db	10
	db	32
	db	32
	db	32
	db	46
	db	88
	db	88
	db	88
	db	88
	db	10
	db	32
	db	32
	db	32
	db	88
	db	46
	db	46
	db	46
	db	88
	db	10
	db	32
	db	32
	db	32
	db	46
	db	46
	db	46
	db	46
	db	88
	db	10
	db	32
	db	32
	db	32
	db	88
	db	46
	db	46
	db	88
	db	10
	db	0

setHWSSHelp>                            # @setHWSSHelp
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
	db	104
	db	119
	db	115
	db	115
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
	db	104
	db	101
	db	97
	db	118
	db	121
	db	45
	db	119
	db	101
	db	105
	db	103
	db	104
	db	116
	db	32
	db	115
	db	112
	db	97
	db	99
	db	101
	db	115
	db	104
	db	105
	db	112
	db	32
	db	112
	db	97
	db	116
	db	116
	db	101
	db	114
	db	110
	db	32
	db	119
	db	105
	db	116
	db	104
	db	32
	db	105
	db	116
	db	115
	db	32
	db	116
	db	111
	db	112
	db	45
	db	108
	db	101
	db	102
	db	116
	db	32
	db	98
	db	111
	db	117
	db	110
	db	100
	db	105
	db	110
	db	103
	db	32
	db	98
	db	111
	db	120
	db	32
	db	99
	db	111
	db	114
	db	110
	db	101
	db	114
	db	10
	db	32
	db	97
	db	116
	db	32
	db	40
	db	120
	db	44
	db	121
	db	41
	db	32
	db	91
	db	48
	db	45
	db	51
	db	49
	db	93
	db	46
	db	32
	db	80
	db	97
	db	116
	db	116
	db	101
	db	114
	db	110
	db	58
	db	10
	db	32
	db	32
	db	32
	db	46
	db	46
	db	88
	db	88
	db	46
	db	46
	db	46
	db	10
	db	32
	db	32
	db	32
	db	88
	db	46
	db	46
	db	46
	db	46
	db	88
	db	46
	db	10
	db	32
	db	32
	db	32
	db	46
	db	46
	db	46
	db	46
	db	46
	db	46
	db	88
	db	10
	db	32
	db	32
	db	32
	db	88
	db	46
	db	46
	db	46
	db	46
	db	46
	db	88
	db	10
	db	32
	db	32
	db	32
	db	46
	db	88
	db	88
	db	88
	db	88
	db	88
	db	88
	db	10
	db	0

helpHelp>                               # @helpHelp
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
	db	104
	db	101
	db	108
	db	112
	db	32
	db	40
	db	105
	db	102
	db	32
	db	110
	db	111
	db	32
	db	99
	db	111
	db	109
	db	109
	db	97
	db	110
	db	100
	db	32
	db	115
	db	112
	db	101
	db	99
	db	105
	db	102
	db	105
	db	101
	db	100
	db	41
	db	10
	db	32
	db	111
	db	114
	db	32
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
	db	32
	db	102
	db	111
	db	114
	db	32
	db	116
	db	104
	db	101
	db	32
	db	103
	db	105
	db	118
	db	101
	db	110
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
	db	46
	db	10
	db	0

### SECTION: .bss
queue>                                  # @queue
	ds	32

head>                                   # @head
	dc	0                               # 0x0

end>                                    # @end
	dc	0                               # 0x0

### SECTION: .rodata.str1.1
__L.str.10:                             # @.str.10
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
	db	32
	db	119
	db	104
	db	101
	db	114
	db	101
	db	32
	db	120
	db	49
	db	60
	db	61
	db	120
	db	50
	db	44
	db	32
	db	121
	db	49
	db	60
	db	61
	db	121
	db	50
	db	46
	db	10
	db	0

__L.str.14:                             # @.str.14
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
	db	110
	db	117
	db	109
	db	98
	db	101
	db	114
	db	32
	db	111
	db	102
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
	db	10
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
	db	98
	db	60
	db	100
	db	105
	db	103
	db	105
	db	116
	db	115
	db	62
	db	32
	db	115
	db	60
	db	100
	db	105
	db	103
	db	105
	db	116
	db	115
	db	62
	db	10
	db	0

__L.str.15:                             # @.str.15
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
	db	102
	db	111
	db	114
	db	109
	db	97
	db	116
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
	db	10
	db	32
	db	77
	db	117
	db	115
	db	116
	db	32
	db	98
	db	101
	db	32
	db	39
	db	98
	db	60
	db	100
	db	105
	db	103
	db	105
	db	116
	db	115
	db	62
	db	32
	db	115
	db	60
	db	100
	db	105
	db	103
	db	105
	db	116
	db	115
	db	62
	db	39
	db	46
	db	10
	db	0

__L.str.17:                             # @.str.17
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
	db	110
	db	117
	db	109
	db	98
	db	101
	db	114
	db	32
	db	111
	db	102
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
	db	10
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

__L.str.18:                             # @.str.18
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
	db	10
	db	32
	db	69
	db	110
	db	115
	db	117
	db	114
	db	101
	db	32
	db	120
	db	44
	db	32
	db	121
	db	44
	db	32
	db	118
	db	97
	db	108
	db	32
	db	97
	db	114
	db	101
	db	32
	db	118
	db	97
	db	108
	db	105
	db	100
	db	32
	db	105
	db	110
	db	116
	db	101
	db	103
	db	101
	db	114
	db	115
	db	46
	db	10
	db	0

__L.str.19:                             # @.str.19
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
	db	110
	db	117
	db	109
	db	98
	db	101
	db	114
	db	32
	db	111
	db	102
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
	db	10
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

__L.str.20:                             # @.str.20
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
	db	10
	db	32
	db	69
	db	110
	db	115
	db	117
	db	114
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
	db	97
	db	110
	db	100
	db	32
	db	118
	db	97
	db	108
	db	117
	db	101
	db	32
	db	97
	db	114
	db	101
	db	32
	db	118
	db	97
	db	108
	db	105
	db	100
	db	32
	db	105
	db	110
	db	116
	db	101
	db	103
	db	101
	db	114
	db	115
	db	46
	db	10
	db	0

__L.str.23:                             # @.str.23
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
	db	110
	db	117
	db	109
	db	98
	db	101
	db	114
	db	32
	db	111
	db	102
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
	db	10
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

__L.str.24:                             # @.str.24
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
	db	10
	db	32
	db	69
	db	110
	db	115
	db	117
	db	114
	db	101
	db	32
	db	120
	db	32
	db	97
	db	110
	db	100
	db	32
	db	121
	db	32
	db	97
	db	114
	db	101
	db	32
	db	118
	db	97
	db	108
	db	105
	db	100
	db	32
	db	105
	db	110
	db	116
	db	101
	db	103
	db	101
	db	114
	db	115
	db	46
	db	10
	db	0

__L.str.27:                             # @.str.27
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
	db	110
	db	117
	db	109
	db	98
	db	101
	db	114
	db	32
	db	111
	db	102
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
	db	98
	db	101
	db	101
	db	45
	db	113
	db	117
	db	101
	db	101
	db	110
	db	39
	db	46
	db	10
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
	db	98
	db	101
	db	101
	db	45
	db	113
	db	117
	db	101
	db	101
	db	110
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

__L.str.28:                             # @.str.28
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
	db	98
	db	101
	db	101
	db	45
	db	113
	db	117
	db	101
	db	101
	db	110
	db	39
	db	46
	db	10
	db	32
	db	69
	db	110
	db	115
	db	117
	db	114
	db	101
	db	32
	db	120
	db	32
	db	97
	db	110
	db	100
	db	32
	db	121
	db	32
	db	97
	db	114
	db	101
	db	32
	db	118
	db	97
	db	108
	db	105
	db	100
	db	32
	db	105
	db	110
	db	116
	db	101
	db	103
	db	101
	db	114
	db	115
	db	46
	db	10
	db	0

__L.str.31:                             # @.str.31
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
	db	110
	db	117
	db	109
	db	98
	db	101
	db	114
	db	32
	db	111
	db	102
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
	db	108
	db	119
	db	115
	db	115
	db	39
	db	46
	db	10
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
	db	108
	db	119
	db	115
	db	115
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

__L.str.32:                             # @.str.32
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
	db	108
	db	119
	db	115
	db	115
	db	39
	db	46
	db	10
	db	32
	db	69
	db	110
	db	115
	db	117
	db	114
	db	101
	db	32
	db	120
	db	32
	db	97
	db	110
	db	100
	db	32
	db	121
	db	32
	db	97
	db	114
	db	101
	db	32
	db	118
	db	97
	db	108
	db	105
	db	100
	db	32
	db	105
	db	110
	db	116
	db	101
	db	103
	db	101
	db	114
	db	115
	db	46
	db	10
	db	0

__L.str.35:                             # @.str.35
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
	db	110
	db	117
	db	109
	db	98
	db	101
	db	114
	db	32
	db	111
	db	102
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
	db	104
	db	119
	db	115
	db	115
	db	39
	db	46
	db	10
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
	db	104
	db	119
	db	115
	db	115
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
	db	115
	db	101
	db	116
	db	45
	db	104
	db	119
	db	115
	db	115
	db	39
	db	46
	db	10
	db	32
	db	69
	db	110
	db	115
	db	117
	db	114
	db	101
	db	32
	db	120
	db	32
	db	97
	db	110
	db	100
	db	32
	db	121
	db	32
	db	97
	db	114
	db	101
	db	32
	db	118
	db	97
	db	108
	db	105
	db	100
	db	32
	db	105
	db	110
	db	116
	db	101
	db	103
	db	101
	db	114
	db	115
	db	46
	db	10
	db	0

__L.str.37:                             # @.str.37
	db	115
	db	101
	db	116
	db	0

__L.str.38:                             # @.str.38
	db	115
	db	116
	db	111
	db	112
	db	0

__L.str.39:                             # @.str.39
	db	115
	db	116
	db	97
	db	114
	db	116
	db	0

__L.str.40:                             # @.str.40
	db	102
	db	105
	db	108
	db	108
	db	0

__L.str.41:                             # @.str.41
	db	99
	db	108
	db	101
	db	97
	db	110
	db	0

__L.str.42:                             # @.str.42
	db	114
	db	117
	db	108
	db	101
	db	0

__L.str.43:                             # @.str.43
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

__L.str.44:                             # @.str.44
	db	115
	db	101
	db	116
	db	45
	db	98
	db	101
	db	101
	db	45
	db	113
	db	117
	db	101
	db	101
	db	110
	db	0

__L.str.45:                             # @.str.45
	db	115
	db	101
	db	116
	db	45
	db	108
	db	119
	db	115
	db	115
	db	0

__L.str.46:                             # @.str.46
	db	115
	db	101
	db	116
	db	45
	db	104
	db	119
	db	115
	db	115
	db	0

__L.str.47:                             # @.str.47
	db	104
	db	101
	db	108
	db	112
	db	0

end.
