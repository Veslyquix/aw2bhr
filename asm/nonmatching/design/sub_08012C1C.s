	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08012C1C
sub_08012C1C: @ 0x08012C1C
	lsrs r1, r1, #0xb
	movs r2, #0x1f
	ands r1, r2
	ldrb r3, [r0, #1]
	movs r2, #0x20
	rsbs r2, r2, #0
	ands r2, r3
	orrs r2, r1
	strb r2, [r0, #1]
	bx lr

