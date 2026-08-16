	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08054B54
sub_08054B54: @ 0x08054B54
	ldr r0, _08054B70 @ =0x04000208
	movs r2, #1
	strh r2, [r0]
	ldr r1, _08054B74 @ =0x04000200
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	ldrh r0, [r1]
	movs r2, #8
	orrs r0, r2
	strh r0, [r1]
	ldr r0, _08054B78 @ =0x04000004
	strh r2, [r0]
	bx lr
	.align 2, 0
_08054B70: .4byte 0x04000208
_08054B74: .4byte 0x04000200
_08054B78: .4byte 0x04000004

