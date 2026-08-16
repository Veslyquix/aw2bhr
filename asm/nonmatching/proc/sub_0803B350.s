	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B350
sub_0803B350: @ 0x0803B350
	ldr r1, _0803B358 @ =gUnknown_030005CC
	strh r0, [r1]
	bx lr
	.align 2, 0
_0803B358: .4byte gUnknown_030005CC

