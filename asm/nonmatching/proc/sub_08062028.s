	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08062028
sub_08062028: @ 0x08062028
	push {lr}
	bl sub_08061B4C
	bl sub_0805AC88
	pop {r0}
	bx r0
	.align 2, 0

