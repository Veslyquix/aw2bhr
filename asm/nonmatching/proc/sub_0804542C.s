	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804542C
sub_0804542C: @ 0x0804542C
	ldr r1, _08045440 @ =gUnknown_03001418
	ldrh r0, [r1]
	subs r0, #0x14
	strh r0, [r1]
	ldr r1, _08045444 @ =gUnknown_03001FF8
	ldrh r0, [r1]
	adds r0, #0xe
	strh r0, [r1]
	bx lr
	.align 2, 0
_08045440: .4byte gUnknown_03001418
_08045444: .4byte gUnknown_03001FF8

