	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043A80
sub_08043A80: @ 0x08043A80
	ldr r1, _08043A8C @ =gUnknown_084A06F0
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08043A8C: .4byte gUnknown_084A06F0

