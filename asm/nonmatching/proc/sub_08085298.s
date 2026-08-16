	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08085298
sub_08085298: @ 0x08085298
	push {lr}
	bl sub_08013C00
	bl sub_08013AEC
	pop {r0}
	bx r0
	.align 2, 0

