	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801295C
sub_0801295C: @ 0x0801295C
	ldr r0, _08012968 @ =gUnknown_030020B4
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_08012968: .4byte gUnknown_030020B4

