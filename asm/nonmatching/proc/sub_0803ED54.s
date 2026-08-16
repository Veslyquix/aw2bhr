	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803ED54
sub_0803ED54: @ 0x0803ED54
	ldr r1, _0803ED5C @ =gUnknown_02028360
	str r1, [r0, #0x2c]
	bx lr
	.align 2, 0
_0803ED5C: .4byte gUnknown_02028360

