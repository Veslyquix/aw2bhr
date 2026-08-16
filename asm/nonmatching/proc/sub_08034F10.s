	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034F10
sub_08034F10: @ 0x08034F10
	ldr r1, _08034F18 @ =gUnknown_030032D8
	movs r0, #0x14
	strh r0, [r1]
	bx lr
	.align 2, 0
_08034F18: .4byte gUnknown_030032D8

