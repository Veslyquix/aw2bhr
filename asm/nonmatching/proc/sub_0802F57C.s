	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802F57C
sub_0802F57C: @ 0x0802F57C
	ldr r0, _0802F584 @ =gUnknown_0849B018
	ldr r0, [r0]
	ldrh r0, [r0, #4]
	bx lr
	.align 2, 0
_0802F584: .4byte gUnknown_0849B018

