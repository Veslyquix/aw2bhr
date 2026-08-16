	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067410
sub_08067410: @ 0x08067410
	ldr r3, _08067448 @ =gUnknown_030030E0
	ldrb r2, [r3]
	movs r1, #0x3f
	ands r1, r2
	movs r2, #0x80
	orrs r1, r2
	strb r1, [r3]
	ldr r1, _0806744C @ =gUnknown_03002020
	movs r2, #0
	strh r2, [r1]
	ldr r1, _08067450 @ =gUnknown_03002B28
	strh r2, [r1]
	ldr r1, _08067454 @ =gUnknown_03001FFC
	strh r2, [r1]
	ldrh r2, [r3]
	ldr r1, _08067458 @ =0x0000FFE0
	ands r1, r2
	movs r2, #0x1f
	orrs r1, r2
	strh r1, [r3]
	ldrb r1, [r3]
	movs r2, #0x20
	orrs r1, r2
	strb r1, [r3]
	movs r1, #0
	str r1, [r0, #0x58]
	bx lr
	.align 2, 0
_08067448: .4byte gUnknown_030030E0
_0806744C: .4byte gUnknown_03002020
_08067450: .4byte gUnknown_03002B28
_08067454: .4byte gUnknown_03001FFC
_08067458: .4byte 0x0000FFE0

