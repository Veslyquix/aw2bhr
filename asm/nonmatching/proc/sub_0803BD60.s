	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BD60
sub_0803BD60: @ 0x0803BD60
	ldr r1, _0803BD68 @ =gUnknown_030030F0
	movs r0, #0
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_0803BD68: .4byte gUnknown_030030F0

