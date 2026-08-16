	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08030574
sub_08030574: @ 0x08030574
	ldr r0, _08030580 @ =gUnknown_0849B018
	ldr r1, [r0]
	ldrh r0, [r1, #4]
	movs r0, #5
	strh r0, [r1, #4]
	bx lr
	.align 2, 0
_08030580: .4byte gUnknown_0849B018

