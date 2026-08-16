	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801F4A4
sub_0801F4A4: @ 0x0801F4A4
	ldr r1, _0801F4AC @ =gUnknown_030013EC
	ldr r0, _0801F4B0 @ =sub_0801F4B4
	str r0, [r1]
	bx lr
	.align 2, 0
_0801F4AC: .4byte gUnknown_030013EC
_0801F4B0: .4byte sub_0801F4B4

