	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806C7B4
sub_0806C7B4: @ 0x0806C7B4
	push {r4, r5, lr}
	ldr r4, _0806C80C @ =gUnknown_030030E0
	ldrb r2, [r4]
	movs r1, #0x3f
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r4]
	ldr r1, _0806C810 @ =gUnknown_03002020
	movs r3, #0x10
	strh r3, [r1]
	ldr r2, _0806C814 @ =gUnknown_03002B28
	movs r1, #0
	strh r1, [r2]
	ldr r2, _0806C818 @ =gUnknown_03001FFC
	ldrh r1, [r2]
	strh r1, [r2]
	ldrh r2, [r4]
	ldr r1, _0806C81C @ =0x0000FFE0
	ands r1, r2
	orrs r1, r3
	strh r1, [r4]
	ldrb r2, [r4]
	movs r3, #0x21
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r1, r2
	strb r1, [r4]
	ldrh r2, [r4]
	ldr r1, _0806C820 @ =0x0000E0FF
	ands r1, r2
	movs r5, #0xf0
	lsls r5, r5, #4
	adds r2, r5, #0
	orrs r1, r2
	strh r1, [r4]
	ldrb r1, [r4, #1]
	ands r3, r1
	strb r3, [r4, #1]
	movs r1, #0
	str r1, [r0, #0x58]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806C80C: .4byte gUnknown_030030E0
_0806C810: .4byte gUnknown_03002020
_0806C814: .4byte gUnknown_03002B28
_0806C818: .4byte gUnknown_03001FFC
_0806C81C: .4byte 0x0000FFE0
_0806C820: .4byte 0x0000E0FF

