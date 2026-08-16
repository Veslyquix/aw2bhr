	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801306C
sub_0801306C: @ 0x0801306C
	push {r4, lr}
	adds r4, r0, #0
	asrs r2, r2, #1
	rsbs r3, r2, #0
	cmp r4, r3
	blt _0801308A
	adds r0, r2, #0
	adds r0, #0xf0
	cmp r0, r4
	blt _0801308A
	cmp r1, r3
	blt _0801308A
	subs r0, #0x50
	cmp r0, r1
	bge _0801308E
_0801308A:
	movs r0, #0
	b _08013090
_0801308E:
	movs r0, #1
_08013090:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

