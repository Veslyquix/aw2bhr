	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080184C8
sub_080184C8: @ 0x080184C8
	push {lr}
	bl sub_08012A74
	bl sub_0803B3EC
	pop {r0}
	bx r0
	.align 2, 0

