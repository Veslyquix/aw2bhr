	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800494C
sub_0800494C: @ 0x0800494C
	push {lr}
	movs r0, #4
	bl sub_0800056C
	pop {r0}
	bx r0

