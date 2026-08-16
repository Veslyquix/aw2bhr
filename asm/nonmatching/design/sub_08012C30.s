	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08012C30
sub_08012C30: @ 0x08012C30
	lsrs r1, r1, #0xe
	movs r2, #3
	ands r1, r2
	lsls r1, r1, #2
	ldrb r3, [r0]
	movs r2, #0xd
	rsbs r2, r2, #0
	ands r2, r3
	orrs r2, r1
	strb r2, [r0]
	bx lr
	.align 2, 0

