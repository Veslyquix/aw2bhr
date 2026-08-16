	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BD54
sub_0803BD54: @ 0x0803BD54
	ldr r1, _0803BD5C @ =gUnknown_030030F0
	movs r0, #1
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_0803BD5C: .4byte gUnknown_030030F0

