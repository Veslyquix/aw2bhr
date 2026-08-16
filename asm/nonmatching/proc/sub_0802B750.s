	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802B750
sub_0802B750: @ 0x0802B750
	ldr r2, _0802B760 @ =gUnknown_03003130
	ldr r1, _0802B764 @ =gUnknown_030033E4
	ldrh r0, [r1]
	strb r0, [r2, #0x10]
	ldrh r0, [r1, #2]
	strb r0, [r2, #0x11]
	bx lr
	.align 2, 0
_0802B760: .4byte gUnknown_03003130
_0802B764: .4byte gUnknown_030033E4

