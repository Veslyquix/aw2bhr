	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078884
sub_08078884: @ 0x08078884
	push {lr}
	bl sub_08078864
	pop {r0}
	bx r0
	.align 2, 0

