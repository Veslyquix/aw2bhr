	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08022AD0
sub_08022AD0: @ 0x08022AD0
	ldr r2, _08022AD8 @ =gUnknown_030033E0
	strh r0, [r2]
	strh r1, [r2, #2]
	bx lr
	.align 2, 0
_08022AD8: .4byte gUnknown_030033E0

