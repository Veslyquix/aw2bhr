	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072020
sub_08072020: @ 0x08072020
	push {lr}
	adds r1, r0, #0
	movs r0, #0x40
	bl sub_080115F8
	pop {r0}
	bx r0
	.align 2, 0

