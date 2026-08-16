	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034838
sub_08034838: @ 0x08034838
	ldr r0, _08034844 @ =gUnknown_03003FC0
	adds r0, #0x32
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_08034844: .4byte gUnknown_03003FC0

