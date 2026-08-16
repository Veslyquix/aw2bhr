	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08024500
sub_08024500: @ 0x08024500
	push {r4, lr}
	ldr r3, _08024568 @ =gUnknown_03002B6C
	ldrb r1, [r3]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3]
	ldr r3, _0802456C @ =gUnknown_03001FE8
	ldrb r1, [r3]
	adds r0, r2, #0
	ands r0, r1
	movs r4, #1
	orrs r0, r4
	strb r0, [r3]
	ldr r1, _08024570 @ =gUnknown_030030B4
	ldrb r0, [r1]
	ands r2, r0
	strb r2, [r1]
	ldr r2, _08024574 @ =gUnknown_0300251C
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	bl sub_08012358
	ldr r2, _08024578 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	orrs r0, r4
	strb r0, [r2]
	ldrb r0, [r2, #1]
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r0, _0802457C @ =gUnknown_03002020
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, _08024580 @ =gUnknown_03002B28
	strh r1, [r0]
	bl sub_0801237C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024568: .4byte gUnknown_03002B6C
_0802456C: .4byte gUnknown_03001FE8
_08024570: .4byte gUnknown_030030B4
_08024574: .4byte gUnknown_0300251C
_08024578: .4byte gUnknown_030030E0
_0802457C: .4byte gUnknown_03002020
_08024580: .4byte gUnknown_03002B28

