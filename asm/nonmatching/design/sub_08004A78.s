	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004A78
sub_08004A78: @ 0x08004A78
	push {lr}
	movs r0, #3
	bl sub_08004A30
	pop {r0}
	bx r0

