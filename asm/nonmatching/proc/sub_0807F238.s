	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807F238
sub_0807F238: @ 0x0807F238
	push {r4, lr}
	ldr r2, _0807F2D0 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0807F2D4 @ =gUnknown_03002020
	movs r1, #8
	strh r1, [r0]
	ldr r0, _0807F2D8 @ =gUnknown_03002B28
	strh r1, [r0]
	ldr r1, _0807F2DC @ =gUnknown_03001FFC
	ldrh r0, [r1]
	strh r0, [r1]
	ldrh r1, [r2]
	ldr r0, _0807F2E0 @ =0x0000FFE0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strh r0, [r2]
	ldrb r1, [r2]
	movs r4, #0x21
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r1
	strb r0, [r2]
	ldrh r1, [r2]
	ldr r0, _0807F2E4 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xa0
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldrb r1, [r2, #1]
	adds r0, r4, #0
	ands r0, r1
	strb r0, [r2, #1]
	ldr r3, _0807F2E8 @ =gUnknown_03002B6C
	ldrb r1, [r3]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3]
	ldr r3, _0807F2EC @ =gUnknown_03001FE8
	ldrb r1, [r3]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3]
	ldr r1, _0807F2F0 @ =gUnknown_030030B4
	ldrb r0, [r1]
	ands r2, r0
	movs r0, #1
	orrs r2, r0
	strb r2, [r1]
	ldr r2, _0807F2F4 @ =gUnknown_0300251C
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0807F2F8 @ =gUnknown_030030DC
	ldrb r2, [r1]
	adds r0, r4, #0
	ands r0, r2
	strb r0, [r1]
	ldrb r0, [r1, #1]
	ands r4, r0
	strb r4, [r1, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F2D0: .4byte gUnknown_030030E0
_0807F2D4: .4byte gUnknown_03002020
_0807F2D8: .4byte gUnknown_03002B28
_0807F2DC: .4byte gUnknown_03001FFC
_0807F2E0: .4byte 0x0000FFE0
_0807F2E4: .4byte 0x0000E0FF
_0807F2E8: .4byte gUnknown_03002B6C
_0807F2EC: .4byte gUnknown_03001FE8
_0807F2F0: .4byte gUnknown_030030B4
_0807F2F4: .4byte gUnknown_0300251C
_0807F2F8: .4byte gUnknown_030030DC

