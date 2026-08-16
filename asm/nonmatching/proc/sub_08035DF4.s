	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035DF4
sub_08035DF4: @ 0x08035DF4
	push {lr}
	movs r1, #1
	bl sub_08070610
	pop {r0}
	bx r0

