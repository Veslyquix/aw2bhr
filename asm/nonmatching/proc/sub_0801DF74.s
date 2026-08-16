	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801DF74
sub_0801DF74: @ 0x0801DF74
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, _0801DF84 @ =gUnknown_03002520
	ldr r2, _0801DF88 @ =0x000003FF
	ands r2, r0
	adds r2, r2, r3
	strb r1, [r2]
	bx lr
	.align 2, 0
_0801DF84: .4byte gUnknown_03002520
_0801DF88: .4byte 0x000003FF

