	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08041DC0
sub_08041DC0: @ 0x08041DC0
	push {lr}
	movs r0, #0xc0
	bl sub_0803B6E8
	pop {r0}
	bx r0

