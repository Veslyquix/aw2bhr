	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004A6C
sub_08004A6C: @ 0x08004A6C
	push {lr}
	movs r0, #1
	bl sub_08004A30
	pop {r0}
	bx r0

