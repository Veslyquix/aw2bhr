	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080375BC
sub_080375BC: @ 0x080375BC
	push {lr}
	bl sub_08013C54
	bl sub_08013AFC
	pop {r0}
	bx r0
	.align 2, 0

