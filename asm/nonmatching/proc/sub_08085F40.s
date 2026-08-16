	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08085F40
sub_08085F40: @ 0x08085F40
	ldr r2, _08085F78 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08085F7C @ =gUnknown_03002020
	movs r0, #0xc
	strh r0, [r1]
	ldr r0, _08085F80 @ =gUnknown_03002B28
	movs r3, #4
	strh r3, [r0]
	ldr r1, _08085F84 @ =gUnknown_03001FFC
	movs r0, #0
	strh r0, [r1]
	ldrh r1, [r2]
	ldr r0, _08085F88 @ =0x0000FFE0
	ands r0, r1
	orrs r0, r3
	ldr r1, _08085F8C @ =0x0000E0FF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_08085F78: .4byte gUnknown_030030E0
_08085F7C: .4byte gUnknown_03002020
_08085F80: .4byte gUnknown_03002B28
_08085F84: .4byte gUnknown_03001FFC
_08085F88: .4byte 0x0000FFE0
_08085F8C: .4byte 0x0000E0FF

