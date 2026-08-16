	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08012C48
sub_08012C48: @ 0x08012C48
	lsls r1, r1, #6
	ldrb r3, [r0, #1]
	movs r2, #0x3f
	ands r2, r3
	orrs r2, r1
	strb r2, [r0, #1]
	bx lr
	.align 2, 0

