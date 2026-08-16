	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071FD0
sub_08071FD0: @ 0x08071FD0
	push {lr}
	adds r1, r0, #0
	movs r0, #0x10
	bl sub_080115E0
	pop {r0}
	bx r0
	.align 2, 0

