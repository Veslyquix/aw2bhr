	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800483C
sub_0800483C: @ 0x0800483C
	push {lr}
	bl sub_0801A168
	movs r0, #1
	bl sub_0800056C
	pop {r0}
	bx r0

