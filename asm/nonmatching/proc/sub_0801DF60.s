	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801DF60
sub_0801DF60: @ 0x0801DF60
	ldr r2, _0801DF6C @ =gUnknown_03002520
	ldr r1, _0801DF70 @ =0x000003FF
	ands r1, r0
	adds r1, r1, r2
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_0801DF6C: .4byte gUnknown_03002520
_0801DF70: .4byte 0x000003FF

