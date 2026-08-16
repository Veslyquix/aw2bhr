	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D0A4
sub_0802D0A4: @ 0x0802D0A4
	push {lr}
	bl sub_08042C10
	bl sub_0801A168
	pop {r0}
	bx r0
	.align 2, 0

