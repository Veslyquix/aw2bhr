	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08005548
sub_08005548: @ 0x08005548
	push {lr}
	movs r0, #1
	bl sub_08005474
	pop {r1}
	bx r1

