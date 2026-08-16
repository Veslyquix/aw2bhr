	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004A84
sub_08004A84: @ 0x08004A84
	push {lr}
	movs r0, #4
	bl sub_08004A30
	pop {r0}
	bx r0

