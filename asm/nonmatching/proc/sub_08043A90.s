	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043A90
sub_08043A90: @ 0x08043A90
	ldr r1, _08043A9C @ =gUnknown_084A06F0
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08043A9C: .4byte gUnknown_084A06F0

