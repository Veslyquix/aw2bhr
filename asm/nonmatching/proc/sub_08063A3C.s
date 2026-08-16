	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08063A3C
sub_08063A3C: @ 0x08063A3C
	ldr r2, _08063A50 @ =gUnknown_03001470
	ldr r0, _08063A54 @ =gUnknown_03001FBC
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r2
	bx lr
	.align 2, 0
_08063A50: .4byte gUnknown_03001470
_08063A54: .4byte gUnknown_03001FBC

