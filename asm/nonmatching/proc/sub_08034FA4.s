	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034FA4
sub_08034FA4: @ 0x08034FA4
	ldr r1, _08034FAC @ =gUnknown_030030F0
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08034FAC: .4byte gUnknown_030030F0

