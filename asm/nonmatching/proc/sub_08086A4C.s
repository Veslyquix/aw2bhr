	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08086A4C
sub_08086A4C: @ 0x08086A4C
	push {lr}
	bl sub_0802481C
	pop {r0}
	bx r0
	.align 2, 0

