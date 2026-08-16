	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034F60
sub_08034F60: @ 0x08034F60
	ldr r0, _08034F68 @ =gUnknown_030030F0
	ldrb r0, [r0, #1]
	bx lr
	.align 2, 0
_08034F68: .4byte gUnknown_030030F0

