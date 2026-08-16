	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034F7C
sub_08034F7C: @ 0x08034F7C
	ldr r1, _08034F88 @ =gUnknown_030030F0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_08034F88: .4byte gUnknown_030030F0

