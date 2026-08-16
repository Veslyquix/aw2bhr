	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803A190
sub_0803A190: @ 0x0803A190
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	mov r8, r1
	lsls r5, r5, #0x18
	lsrs r0, r5, #0x18
	str r0, [sp, #8]
	ldr r6, _0803A2A0 @ =gUnknown_08090F70
	ldr r0, [r6]
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	ldr r1, _0803A2A4 @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r4, [r1, #0x1a]
	subs r4, #1
	bl sub_08042DE0
	subs r0, #1
	ldr r3, _0803A2A8 @ =gUnknown_0849DC18
	mov r1, r8
	ldrb r2, [r1]
	lsls r1, r2, #4
	subs r1, r1, r2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r3, #0x14
	adds r1, r1, r3
	ldr r0, [r1]
	ldr r1, _0803A2AC @ =gUnknown_0200FD50
	bl sub_08011CAC
	ldr r0, _0803A2B0 @ =sub_0803A174
	bl sub_08011AAC
	ldr r2, _0803A2B4 @ =gUnknown_08555D30
	mov r0, r8
	ldrb r1, [r0]
	subs r1, #1
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x40
	bl sub_08013618
	movs r2, #0
	mov sb, r6
	ldr r1, [sp, #8]
	adds r1, #0x60
	mov sl, r1
	lsrs r7, r5, #0x1b
	ldr r6, _0803A2B8 @ =gUnknown_08499578
	movs r5, #0
_0803A212:
	movs r1, #0
	lsls r4, r2, #0x10
	asrs r0, r4, #0xb
	adds r3, r0, r7
_0803A21A:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r1, r3, r0
	ldr r2, [r6]
	lsls r1, r1, #1
	adds r1, r1, r2
	strh r5, [r1]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xe
	ble _0803A21A
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r4, r2
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x13
	ble _0803A212
	mov r0, sb
	ldr r0, [r0]
	mov sb, r0
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	mov r2, r8
	ldrb r1, [r2]
	bl sub_08042D1C
	adds r3, r0, #0
	mov r0, sl
	lsrs r4, r0, #3
	ldr r6, _0803A2B8 @ =gUnknown_08499578
	ldr r2, [r6]
	movs r7, #0x80
	lsls r7, r7, #8
	str r7, [sp]
	movs r5, #0
	str r5, [sp, #4]
	adds r0, r4, #0
	movs r1, #1
	bl sub_08014B0C
	mov r1, sb
	ldr r0, [r1]
	ldrb r0, [r0, #8]
	mov r2, r8
	ldrb r1, [r2]
	bl sub_08042D84
	adds r3, r0, #0
	ldr r2, [r6]
	str r7, [sp]
	str r5, [sp, #4]
	adds r0, r4, #0
	movs r1, #3
	bl sub_08014B0C
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803A2A0: .4byte gUnknown_08090F70
_0803A2A4: .4byte gUnknown_08499598
_0803A2A8: .4byte gUnknown_0849DC18
_0803A2AC: .4byte gUnknown_0200FD50
_0803A2B0: .4byte sub_0803A174
_0803A2B4: .4byte gUnknown_08555D30
_0803A2B8: .4byte gUnknown_08499578

