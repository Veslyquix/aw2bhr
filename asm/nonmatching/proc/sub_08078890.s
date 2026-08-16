	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078890
sub_08078890: @ 0x08078890
	push {lr}
	bl sub_08078790
	pop {r0}
	bx r0
	.align 2, 0

