	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BCD0
sub_0803BCD0: @ 0x0803BCD0
	ldr r1, _0803BCD8 @ =gUnknown_03003FC0
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_0803BCD8: .4byte gUnknown_03003FC0

