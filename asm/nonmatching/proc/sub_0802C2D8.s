	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C2D8
sub_0802C2D8: @ 0x0802C2D8
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_08024268
	ldr r0, _0802C370 @ =gUnknown_08499590
	ldr r1, [r0]
	ldrh r0, [r1, #4]
	movs r5, #0
	strh r0, [r4, #0x20]
	ldrh r0, [r1, #6]
	strh r0, [r4, #0x22]
	bl sub_0803D6D0
	ldr r4, _0802C374 @ =gUnknown_03002B6C
	ldr r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #0xe
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	ldr r1, _0802C378 @ =gUnknown_08499578
	ldr r1, [r1]
	movs r2, #1
	movs r3, #9
	bl sub_08037638
	movs r0, #0
	bl sub_08013AD4
	bl sub_0801237C
	bl sub_08012358
	ldrb r2, [r4]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4]
	ldr r3, _0802C37C @ =gUnknown_03001FE8
	ldrb r2, [r3]
	adds r0, r1, #0
	ands r0, r2
	movs r4, #2
	orrs r0, r4
	strb r0, [r3]
	ldr r2, _0802C380 @ =gUnknown_030030B4
	ldrb r0, [r2]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r2]
	ldr r2, _0802C384 @ =gUnknown_0300251C
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	bl sub_08012358
	ldr r2, _0802C388 @ =gUnknown_030030E0
	ldrb r0, [r2]
	movs r1, #0xc0
	orrs r0, r1
	orrs r0, r4
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0802C38C @ =gUnknown_03001FFC
	strh r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C370: .4byte gUnknown_08499590
_0802C374: .4byte gUnknown_03002B6C
_0802C378: .4byte gUnknown_08499578
_0802C37C: .4byte gUnknown_03001FE8
_0802C380: .4byte gUnknown_030030B4
_0802C384: .4byte gUnknown_0300251C
_0802C388: .4byte gUnknown_030030E0
_0802C38C: .4byte gUnknown_03001FFC

