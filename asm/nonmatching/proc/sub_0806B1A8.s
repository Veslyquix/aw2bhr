	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806B1A8
sub_0806B1A8: @ 0x0806B1A8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	mov r8, r0
	bl sub_0801237C
	bl sub_08012358
	ldr r0, _0806B368 @ =gUnknown_0849D16C
	bl sub_08012C58
	ldr r2, _0806B36C @ =gUnknown_030030CC
	ldrb r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r2, #1]
	movs r4, #1
	orrs r0, r4
	movs r5, #2
	orrs r0, r5
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2, #1]
	ldr r3, _0806B370 @ =gUnknown_03002B6C
	ldrb r2, [r3]
	adds r1, #0xd
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3]
	ldr r3, _0806B374 @ =gUnknown_030030B4
	ldrb r2, [r3]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r4
	strb r0, [r3]
	ldr r2, _0806B378 @ =gUnknown_0300251C
	ldrb r0, [r2]
	ands r1, r0
	orrs r1, r5
	strb r1, [r2]
	ldr r2, _0806B37C @ =gUnknown_03001FE8
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	movs r0, #0
	str r0, [sp, #8]
	ldr r4, _0806B380 @ =gUnknown_0816E170
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r2, _0806B384 @ =0x01000200
	add r0, sp, #8
	bl CpuFastSet
	movs r5, #1
	mov sb, r4
	ldr r0, _0806B388 @ =gUnknown_030020C0
	movs r7, #0x88
	lsls r7, r7, #2
	movs r6, #0x88
	lsls r6, r6, #7
	adds r4, r0, #0
	adds r4, #0x22
	movs r0, #0x80
	lsls r0, r0, #3
	mov ip, r0
_0806B246:
	adds r3, r5, #0
	cmp r5, #7
	bgt _0806B24E
	asrs r3, r5, #1
_0806B24E:
	adds r2, r5, #0
	adds r2, #0x10
	lsls r0, r3, #0xa
	lsls r1, r3, #5
	adds r0, r0, r1
	adds r0, r0, r3
	strh r0, [r4]
	adds r0, r6, r7
	adds r0, r0, r2
	strh r0, [r4, #0x20]
	adds r7, #0x20
	add r6, ip
	adds r4, #2
	adds r5, #1
	cmp r5, #0xf
	ble _0806B246
	ldr r0, _0806B38C @ =gUnknown_081A3DA4
	ldr r1, _0806B390 @ =0x06005000
	bl sub_08011CAC
	movs r5, #0
	ldr r6, _0806B394 @ =gUnknown_08581984
	ldr r4, _0806B398 @ =gUnknown_0849957C
	movs r3, #0x1f
_0806B27E:
	adds r0, r5, #0
	ands r0, r3
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r1, [r0]
	movs r2, #0x8a
	lsls r2, r2, #6
	adds r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r1, #7
	bls _0806B29E
	ldr r1, _0806B39C @ =0xFFFFF000
	adds r0, r2, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_0806B29E:
	ldr r0, [r4]
	lsls r1, r5, #1
	adds r1, r1, r0
	strh r2, [r1]
	adds r5, #1
	ldr r0, _0806B3A0 @ =0x0000027F
	cmp r5, r0
	ble _0806B27E
	ldr r0, _0806B3A4 @ =gUnknown_0823BDE0
	movs r1, #0
	movs r2, #0x20
	bl sub_08013618
	ldr r0, _0806B3A8 @ =gUnknown_08194280
	movs r1, #0x80
	movs r2, #0x20
	bl sub_08013618
	ldr r0, _0806B3AC @ =gUnknown_081320AC
	movs r1, #0x60
	movs r2, #0x20
	bl sub_08013618
	ldr r0, _0806B3B0 @ =gUnknown_0823A3D4
	ldr r1, _0806B3B4 @ =0x06008000
	bl sub_08011CAC
	ldr r0, _0806B3B8 @ =gUnknown_081933F4
	ldr r1, _0806B3BC @ =0x0600CC00
	bl sub_08011CAC
	ldr r4, _0806B3C0 @ =gUnknown_081942A0
	ldr r0, _0806B3C4 @ =gUnknown_08499584
	ldr r1, [r0]
	adds r0, r4, #0
	bl sub_08011CAC
	ldr r0, _0806B3C8 @ =gUnknown_08499580
	ldr r1, [r0]
	adds r0, r4, #0
	bl sub_08011CAC
	mov r2, sb
	ldr r0, [r2]
	ldr r2, [r0]
	ldr r3, _0806B3CC @ =0x00000873
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0x40
	str r0, [sp, #4]
	movs r0, #4
	movs r1, #0x14
	bl sub_08014668
	bl sub_08013AEC
	bl sub_08013AFC
	bl sub_08013B0C
	bl sub_08013B1C
	movs r2, #0
	mov r0, r8
	str r2, [r0, #0x58]
	str r2, [r0, #0x5c]
	ldr r3, _0806B3D0 @ =gUnknown_030030E0
	ldrb r1, [r3]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	ldr r0, _0806B3D4 @ =gUnknown_03002020
	movs r1, #8
	strh r1, [r0]
	ldr r0, _0806B3D8 @ =gUnknown_03002B28
	strh r1, [r0]
	ldr r0, _0806B3DC @ =gUnknown_03001FFC
	strh r2, [r0]
	ldrh r1, [r3]
	ldr r0, _0806B3E0 @ =0x0000FFE0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	ldr r1, _0806B3E4 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3]
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806B368: .4byte gUnknown_0849D16C
_0806B36C: .4byte gUnknown_030030CC
_0806B370: .4byte gUnknown_03002B6C
_0806B374: .4byte gUnknown_030030B4
_0806B378: .4byte gUnknown_0300251C
_0806B37C: .4byte gUnknown_03001FE8
_0806B380: .4byte gUnknown_0816E170
_0806B384: .4byte 0x01000200
_0806B388: .4byte gUnknown_030020C0
_0806B38C: .4byte gUnknown_081A3DA4
_0806B390: .4byte 0x06005000
_0806B394: .4byte gUnknown_08581984
_0806B398: .4byte gUnknown_0849957C
_0806B39C: .4byte 0xFFFFF000
_0806B3A0: .4byte 0x0000027F
_0806B3A4: .4byte gUnknown_0823BDE0
_0806B3A8: .4byte gUnknown_08194280
_0806B3AC: .4byte gUnknown_081320AC
_0806B3B0: .4byte gUnknown_0823A3D4
_0806B3B4: .4byte 0x06008000
_0806B3B8: .4byte gUnknown_081933F4
_0806B3BC: .4byte 0x0600CC00
_0806B3C0: .4byte gUnknown_081942A0
_0806B3C4: .4byte gUnknown_08499584
_0806B3C8: .4byte gUnknown_08499580
_0806B3CC: .4byte 0x00000873
_0806B3D0: .4byte gUnknown_030030E0
_0806B3D4: .4byte gUnknown_03002020
_0806B3D8: .4byte gUnknown_03002B28
_0806B3DC: .4byte gUnknown_03001FFC
_0806B3E0: .4byte 0x0000FFE0
_0806B3E4: .4byte 0x0000E0FF

