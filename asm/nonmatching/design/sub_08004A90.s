	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004A90
sub_08004A90: @ 0x08004A90
	push {lr}
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_08004A30
	pop {r0}
	bx r0
	.align 2, 0

