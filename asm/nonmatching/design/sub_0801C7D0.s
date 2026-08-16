	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801C7D0
sub_0801C7D0: @ 0x0801C7D0
	ldrh r2, [r0, #0x28]
	movs r1, #0
	strh r1, [r0, #0x28]
	adds r0, r2, #0
	bx lr
	.align 2, 0

