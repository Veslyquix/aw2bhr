	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045FBC
sub_08045FBC: @ 0x08045FBC
	push {lr}
	bl sub_08013378
	pop {r0}
	bx r0
	.align 2, 0

