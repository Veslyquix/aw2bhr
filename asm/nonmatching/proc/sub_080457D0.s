	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080457D0
sub_080457D0: @ 0x080457D0
	push {lr}
	movs r0, #5
	bl sub_0803E388
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080457E2
	movs r0, #0
	b _080457E4
_080457E2:
	movs r0, #1
_080457E4:
	pop {r1}
	bx r1

