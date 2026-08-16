	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08011CA0
sub_08011CA0: @ 0x08011CA0
	push {lr}
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0

