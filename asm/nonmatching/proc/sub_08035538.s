	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035538
sub_08035538: @ 0x08035538
	ldr r0, _08035544 @ =gUnknown_03003FC0
	adds r0, #0x2d
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_08035544: .4byte gUnknown_03003FC0

