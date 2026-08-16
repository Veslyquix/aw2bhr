	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801C78C
sub_0801C78C: @ 0x0801C78C
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	ldr r0, [r0, #0x50]
	strh r3, [r0, #0x22]
	bx lr
	.align 2, 0

