	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08014D7C
sub_08014D7C: @ 0x08014D7C
	adds r2, r0, #0
	adds r3, r1, #0
	cmp r3, #0x1f
	bls _08014DA0
	adds r0, #0xf
	movs r1, #0x10
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, r0, r2
	subs r3, r3, r1
	movs r2, #0
	str r2, [r0]
	adds r1, r3, #0
	subs r1, #0x10
	str r1, [r0, #4]
	str r2, [r0, #8]
	str r3, [r0, #0xc]
	b _08014DA4
_08014DA0:
	movs r0, #1
	rsbs r0, r0, #0
_08014DA4:
	bx lr
	.align 2, 0

