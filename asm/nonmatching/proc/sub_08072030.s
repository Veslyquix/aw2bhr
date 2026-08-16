	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072030
sub_08072030: @ 0x08072030
	push {lr}
	adds r1, r0, #0
	movs r0, #4
	bl sub_08011610
	pop {r0}
	bx r0
	.align 2, 0

