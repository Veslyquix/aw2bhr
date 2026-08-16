	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034F54
sub_08034F54: @ 0x08034F54
	ldr r1, _08034F5C @ =gUnknown_030030F0
	movs r0, #0
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_08034F5C: .4byte gUnknown_030030F0

