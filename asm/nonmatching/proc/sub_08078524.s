	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078524
sub_08078524: @ 0x08078524
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08019260
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078538
	adds r0, r4, #0
	bl Proc_Break
_08078538:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

