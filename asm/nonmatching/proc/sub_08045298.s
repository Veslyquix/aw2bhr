	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045298
sub_08045298: @ 0x08045298
	push {lr}
	bl sub_08013C00
	bl sub_08013AEC
	pop {r0}
	bx r0
	.align 2, 0

