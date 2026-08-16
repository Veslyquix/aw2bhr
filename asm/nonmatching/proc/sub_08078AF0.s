	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078AF0
sub_08078AF0: @ 0x08078AF0
	push {lr}
	bl sub_08013AEC
	bl sub_08013AFC
	bl sub_08013B0C
	bl sub_08013B1C
	pop {r0}
	bx r0
	.align 2, 0

