	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004A60
sub_08004A60: @ 0x08004A60
	push {lr}
	movs r0, #7
	bl sub_08004A30
	pop {r0}
	bx r0

