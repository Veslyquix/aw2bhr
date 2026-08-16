	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802CD00
sub_0802CD00: @ 0x0802CD00
	push {lr}
	bl sub_0801A614
	bl sub_0801A168
	bl sub_0802D4B0
	pop {r0}
	bx r0
	.align 2, 0

