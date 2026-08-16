	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08052F14
sub_08052F14: @ 0x08052F14
	push {lr}
	bl sub_08052F3C
	pop {r0}
	bx r0
	.align 2, 0

