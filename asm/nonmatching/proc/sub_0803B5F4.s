	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B5F4
sub_0803B5F4: @ 0x0803B5F4
	ldr r1, _0803B600 @ =gUnknown_030005CA
	ldr r2, _0803B604 @ =0x0000FFFF
	adds r0, r2, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_0803B600: .4byte gUnknown_030005CA
_0803B604: .4byte 0x0000FFFF

