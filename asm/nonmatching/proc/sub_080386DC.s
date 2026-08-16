	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080386DC
sub_080386DC: @ 0x080386DC
	ldr r3, _080386E8 @ =gUnknown_0849D5F8
	ldr r2, [r3]
	strb r0, [r2, #0x1e]
	ldr r0, [r3]
	strb r1, [r0, #0x1f]
	bx lr
	.align 2, 0
_080386E8: .4byte gUnknown_0849D5F8

