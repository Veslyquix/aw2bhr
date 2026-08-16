	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080457E8
sub_080457E8: @ 0x080457E8
	push {lr}
	movs r0, #1
	bl sub_0803E388
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080457FA
	movs r0, #0
	b _080457FC
_080457FA:
	movs r0, #1
_080457FC:
	pop {r1}
	bx r1

