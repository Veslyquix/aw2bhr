	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08068AC4
sub_08068AC4: @ 0x08068AC4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	ldr r2, _08068BB4 @ =gUnknown_0202F204
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_080674F4
	mov r1, r8
	str r0, [r1, #0x2c]
	bl sub_0801237C
	bl sub_08012358
	ldr r0, _08068BB8 @ =gUnknown_085813D4
	bl sub_08012C58
	ldr r5, _08068BBC @ =gUnknown_030030CC
	ldrb r0, [r5]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r5]
	ldrb r0, [r5, #1]
	movs r4, #1
	orrs r0, r4
	movs r6, #2
	orrs r0, r6
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r5, #1]
	ldr r3, _08068BC0 @ =gUnknown_0300251C
	ldrb r2, [r3]
	adds r1, #0xd
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3]
	ldr r3, _08068BC4 @ =gUnknown_030030B4
	ldrb r2, [r3]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r4
	strb r0, [r3]
	ldr r2, _08068BC8 @ =gUnknown_03001FE8
	ldrb r0, [r2]
	ands r1, r0
	orrs r1, r6
	strb r1, [r2]
	ldr r2, _08068BCC @ =gUnknown_03002B6C
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	ldr r4, _08068BD0 @ =gUnknown_0817DA18
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #0x20
	bl sub_08013618
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl sub_08013618
	ldr r0, _08068BD4 @ =gUnknown_0817C408
	ldr r1, _08068BD8 @ =0x06008000
	bl sub_08011CAC
	ldr r0, _08068BDC @ =gUnknown_08499584
	ldr r0, [r0]
	movs r1, #0x83
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, _08068BE0 @ =gUnknown_0817D874
	movs r2, #0
	bl sub_080718F8
	bl sub_08013B1C
	movs r0, #0
	mov r1, r8
	bl sub_0806775C
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	ldrb r1, [r5]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r5]
	movs r0, #0
	mov r1, r8
	str r0, [r1, #0x30]
	movs r0, #0x96
	lsls r0, r0, #1
	bl sub_0803B524
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08068BB4: .4byte gUnknown_0202F204
_08068BB8: .4byte gUnknown_085813D4
_08068BBC: .4byte gUnknown_030030CC
_08068BC0: .4byte gUnknown_0300251C
_08068BC4: .4byte gUnknown_030030B4
_08068BC8: .4byte gUnknown_03001FE8
_08068BCC: .4byte gUnknown_03002B6C
_08068BD0: .4byte gUnknown_0817DA18
_08068BD4: .4byte gUnknown_0817C408
_08068BD8: .4byte 0x06008000
_08068BDC: .4byte gUnknown_08499584
_08068BE0: .4byte gUnknown_0817D874

