	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B688
sub_0803B688: @ 0x0803B688
	push {lr}
	movs r0, #3
	bl sub_0803B3B0
	bl sub_0803B3C8
	pop {r0}
	bx r0

