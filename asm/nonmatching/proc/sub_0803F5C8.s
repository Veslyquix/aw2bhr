	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803F5C8
sub_0803F5C8: @ 0x0803F5C8
	ldr r1, _0803F5D0 @ =gUnknown_02028360
	lsls r0, r0, #3
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0803F5D0: .4byte gUnknown_02028360

