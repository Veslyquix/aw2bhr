	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034F48
sub_08034F48: @ 0x08034F48
	ldr r1, _08034F50 @ =gUnknown_030030F0
	movs r0, #1
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_08034F50: .4byte gUnknown_030030F0

