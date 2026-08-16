	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035558
sub_08035558: @ 0x08035558
	ldr r0, _08035564 @ =gUnknown_03003FC0
	adds r0, #0x2d
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_08035564: .4byte gUnknown_03003FC0

