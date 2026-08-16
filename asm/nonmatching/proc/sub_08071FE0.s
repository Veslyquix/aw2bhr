	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071FE0
sub_08071FE0: @ 0x08071FE0
	push {lr}
	adds r1, r0, #0
	movs r0, #4
	bl sub_080115E0
	pop {r0}
	bx r0
	.align 2, 0

