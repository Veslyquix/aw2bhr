	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072010
sub_08072010: @ 0x08072010
	push {lr}
	adds r1, r0, #0
	movs r0, #4
	bl sub_080115F8
	pop {r0}
	bx r0
	.align 2, 0

