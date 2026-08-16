	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072040
sub_08072040: @ 0x08072040
	push {lr}
	adds r1, r0, #0
	movs r0, #4
	bl sub_0801163C
	pop {r0}
	bx r0
	.align 2, 0

