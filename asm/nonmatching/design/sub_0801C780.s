	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801C780
sub_0801C780: @ 0x0801C780
	push {lr}
	ldr r0, [r0, #0x50]
	bl sub_0801C240
	pop {r0}
	bx r0

