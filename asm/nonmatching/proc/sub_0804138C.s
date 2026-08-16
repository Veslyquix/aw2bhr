	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804138C
sub_0804138C: @ 0x0804138C
	ldr r1, _08041394 @ =gUnknown_030040A8
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_08041394: .4byte gUnknown_030040A8

