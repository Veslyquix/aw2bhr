	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019D00
sub_08019D00: @ 0x08019D00
	push {lr}
	bl sub_08019B50
	pop {r0}
	bx r0
	.align 2, 0

