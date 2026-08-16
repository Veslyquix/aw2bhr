	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08012A24
sub_08012A24: @ 0x08012A24
	ldr r0, _08012A30 @ =gUnknown_030020B4
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_08012A30: .4byte gUnknown_030020B4

