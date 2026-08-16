	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004818
sub_08004818: @ 0x08004818
	push {lr}
	movs r0, #1
	bl sub_0800056C
	pop {r0}
	bx r0

