	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004A20
sub_08004A20: @ 0x08004A20
	push {lr}
	bl sub_0801A168
	bl sub_0800485C
	pop {r0}
	bx r0
	.align 2, 0

