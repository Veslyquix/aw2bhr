	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08036B28
sub_08036B28: @ 0x08036B28
	ldr r1, _08036B30 @ =gUnknown_030043F4
	movs r0, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_08036B30: .4byte gUnknown_030043F4

