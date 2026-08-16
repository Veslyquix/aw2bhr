	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035548
sub_08035548: @ 0x08035548
	ldr r0, _08035554 @ =gUnknown_03003FC0
	adds r0, #0x2d
	movs r1, #2
	strb r1, [r0]
	bx lr
	.align 2, 0
_08035554: .4byte gUnknown_03003FC0

