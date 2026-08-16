	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045ED4
sub_08045ED4: @ 0x08045ED4
	push {lr}
	bl sub_08013378
	pop {r0}
	bx r0
	.align 2, 0

