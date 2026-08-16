	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806A8E4
sub_0806A8E4: @ 0x0806A8E4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #0x5c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0806A900
	ldr r0, _0806A938 @ =gUnknown_085815E8
	adds r1, r6, #0
	bl Proc_Start
_0806A900:
	ldr r0, _0806A93C @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0806A90E
	b _0806AA16
_0806A90E:
	ldr r0, _0806A940 @ =gUnknown_08581608
	adds r3, r6, #0
	adds r3, #0x5a
	movs r2, #0
	ldrsh r1, [r3, r2]
	lsls r1, r1, #1
	adds r2, r1, r0
	movs r5, #0
	ldrsb r5, [r2, r5]
	adds r1, #1
	adds r1, r1, r0
	movs r4, #0
	ldrsb r4, [r1, r4]
	cmp r4, #0x5a
	ble _0806A944
	movs r4, #0
	movs r5, #0
	adds r0, r6, #0
	bl Proc_Break
	b _0806A94A
	.align 2, 0
_0806A938: .4byte gUnknown_085815E8
_0806A93C: .4byte gUnknown_03004008
_0806A940: .4byte gUnknown_08581608
_0806A944:
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
_0806A94A:
	ldr r0, _0806A9A8 @ =gUnknown_08499590
	ldr r1, [r0]
	adds r0, r6, #0
	adds r0, #0x5e
	ldrh r0, [r0]
	adds r0, r0, r5
	strh r0, [r1, #4]
	adds r0, r6, #0
	adds r0, #0x60
	ldrh r0, [r0]
	adds r0, r0, r4
	strh r0, [r1, #6]
	bl sub_08023860
	bl sub_0801237C
	ldr r1, _0806A9AC @ =gUnknown_030030CC
	ldrb r0, [r1, #1]
	movs r3, #0x20
	orrs r0, r3
	strb r0, [r1, #1]
	ldr r2, _0806A9B0 @ =gUnknown_030030A4
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	orrs r0, r3
	strb r0, [r2]
	cmp r5, #0
	bgt _0806A9BC
	ldr r1, _0806A9B4 @ =gUnknown_03002B40
	adds r0, r5, #0
	cmp r5, #0
	bge _0806A99E
	rsbs r0, r5, #0
_0806A99E:
	strb r0, [r1]
	ldr r1, _0806A9B8 @ =gUnknown_03002B4C
	movs r0, #0xf0
	b _0806A9CC
	.align 2, 0
_0806A9A8: .4byte gUnknown_08499590
_0806A9AC: .4byte gUnknown_030030CC
_0806A9B0: .4byte gUnknown_030030A4
_0806A9B4: .4byte gUnknown_03002B40
_0806A9B8: .4byte gUnknown_03002B4C
_0806A9BC:
	ldr r1, _0806A9E4 @ =gUnknown_03002B40
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0806A9E8 @ =gUnknown_03002B4C
	movs r3, #0x10
	rsbs r3, r3, #0
	adds r0, r3, #0
	subs r0, r0, r5
_0806A9CC:
	strb r0, [r1]
	cmp r4, #0
	bgt _0806A9F4
	ldr r1, _0806A9EC @ =gUnknown_03002EFC
	adds r0, r4, #0
	cmp r4, #0
	bge _0806A9DC
	rsbs r0, r4, #0
_0806A9DC:
	strb r0, [r1]
	ldr r1, _0806A9F0 @ =gUnknown_03002B44
	movs r0, #0xa0
	b _0806AA04
	.align 2, 0
_0806A9E4: .4byte gUnknown_03002B40
_0806A9E8: .4byte gUnknown_03002B4C
_0806A9EC: .4byte gUnknown_03002EFC
_0806A9F0: .4byte gUnknown_03002B44
_0806A9F4:
	ldr r1, _0806AA50 @ =gUnknown_03002EFC
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0806AA54 @ =gUnknown_03002B44
	movs r2, #0x60
	rsbs r2, r2, #0
	adds r0, r2, #0
	subs r0, r0, r4
_0806AA04:
	strb r0, [r1]
	lsls r1, r5, #0xc
	ldr r0, [r6, #0x38]
	subs r0, r0, r1
	str r0, [r6, #0x40]
	lsls r1, r4, #0xc
	ldr r0, [r6, #0x3c]
	subs r0, r0, r1
	str r0, [r6, #0x44]
_0806AA16:
	ldr r1, _0806AA58 @ =gUnknown_0300060C
	ldr r0, [r6, #0x40]
	asrs r0, r0, #0xc
	strh r0, [r1]
	ldr r2, _0806AA5C @ =gUnknown_0202F210
	ldr r0, [r6, #0x44]
	asrs r0, r0, #0xc
	strh r0, [r2]
	movs r3, #0
	ldrsh r0, [r1, r3]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	movs r3, #0
	ldrsh r1, [r2, r3]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	movs r2, #0xff
	ands r1, r2
	ldr r2, _0806AA60 @ =gUnknown_085815C0
	movs r3, #0
	bl sub_0801BD00
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806AA50: .4byte gUnknown_03002EFC
_0806AA54: .4byte gUnknown_03002B44
_0806AA58: .4byte gUnknown_0300060C
_0806AA5C: .4byte gUnknown_0202F210
_0806AA60: .4byte gUnknown_085815C0

