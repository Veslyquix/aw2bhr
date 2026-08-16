	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801E294
sub_0801E294: @ 0x0801E294
	ldr r3, _0801E2A0 @ =gUnknown_0200F720
	lsls r0, r0, #4
	adds r0, r0, r3
	strh r1, [r0, #0xc]
	strh r2, [r0, #0xe]
	bx lr
	.align 2, 0
_0801E2A0: .4byte gUnknown_0200F720

