### SECTION: .text
rsect ___src_main_c_41

BORN: ext


macro movens/2
push $1
pop $2
mend

main>                                   # -- Begin function main
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-2
	ldi	r0, 0
	ssw	r0, -2
	ldi	r2, BORN
	ldi	r1, 1
	stw	r2, r1
	addsp	2
	pop	fp
	rts
                                        # -- End function
end.
