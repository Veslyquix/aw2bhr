	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803D54C
sub_0803D54C: @ 0x0803D54C
	ldr r1, _0803D554 @ =gUnknown_03003FC0
	movs r0, #0xb4
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_0803D554: .4byte gUnknown_03003FC0

