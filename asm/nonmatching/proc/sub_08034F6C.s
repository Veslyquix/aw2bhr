	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034F6C
sub_08034F6C: @ 0x08034F6C
	ldr r0, _08034F78 @ =gUnknown_030030F0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_08034F78: .4byte gUnknown_030030F0

