	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801296C
sub_0801296C: @ 0x0801296C
	ldr r0, _08012978 @ =gUnknown_030030CC
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_08012978: .4byte gUnknown_030030CC

