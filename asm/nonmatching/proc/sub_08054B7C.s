	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08054B7C
sub_08054B7C: @ 0x08054B7C
	ldr r2, _08054B94 @ =gUnknown_03004538
	ldr r1, _08054B98 @ =gUnknown_03002040
	adds r0, r1, #0
	adds r0, #0x54
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r2, _08054B9C @ =gUnknown_03004518
	adds r1, #0x50
	ldrh r0, [r1]
	strh r0, [r2]
	bx lr
	.align 2, 0
_08054B94: .4byte gUnknown_03004538
_08054B98: .4byte gUnknown_03002040
_08054B9C: .4byte gUnknown_03004518

