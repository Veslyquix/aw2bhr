	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072000
sub_08072000: @ 0x08072000
	push {lr}
	adds r1, r0, #0
	movs r0, #0x10
	bl sub_080115F8
	pop {r0}
	bx r0
	.align 2, 0

