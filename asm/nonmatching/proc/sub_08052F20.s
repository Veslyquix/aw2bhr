	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08052F20
sub_08052F20: @ 0x08052F20
	push {lr}
	bl sub_0803B588
	bl sub_080546F0
	bl sub_08054B14
	bl sub_08057270
	bl sub_080116E8
	pop {r0}
	bx r0
	.align 2, 0

