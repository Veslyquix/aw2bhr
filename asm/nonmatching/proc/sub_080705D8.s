	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080705D8
sub_080705D8: @ 0x080705D8
	push {lr}
	bl sub_080703B8
	pop {r0}
	bx r0
	.align 2, 0

