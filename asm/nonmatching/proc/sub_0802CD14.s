	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802CD14
sub_0802CD14: @ 0x0802CD14
	push {lr}
	bl sub_0801A614
	bl sub_0801A168
	bl sub_0802D504
	pop {r0}
	bx r0
	.align 2, 0

