	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08003960
sub_08003960: @ 0x08003960
	push {lr}
	bl sub_080039E4
	pop {r0}
	bx r0
	.align 2, 0

