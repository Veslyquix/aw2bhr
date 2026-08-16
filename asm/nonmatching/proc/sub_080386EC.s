	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080386EC
sub_080386EC: @ 0x080386EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r2, _08038798 @ =gUnknown_0849D5F8
	ldr r1, [r2]
	adds r3, r1, #0
	adds r3, #0x45
	movs r1, #0
	ldrsb r1, [r3, r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _0803870E
	b _08038824
_0803870E:
	subs r0, #1
	strb r0, [r3]
	ldr r3, [r2]
	adds r0, r3, #0
	adds r0, #0x45
	movs r1, #0
	ldrsb r1, [r0, r1]
	subs r0, #0xd
	adds r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x44
	ldrb r1, [r1]
	strb r1, [r0]
	movs r3, #1
	ldr r0, [r2]
	adds r0, #0x45
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r3, r0
	bgt _08038824
	mov r8, r2
	ldr r1, _0803879C @ =gUnknown_03003FC0
	mov ip, r1
	ldr r2, _080387A0 @ =gUnknown_03003F38
	mov sl, r2
	ldr r7, _080387A4 @ =gUnknown_085D5ABC
	mov sb, r7
_08038746:
	mov r0, r8
	ldr r1, [r0]
	lsls r4, r3, #0x18
	asrs r0, r4, #0x18
	adds r1, #0x38
	adds r2, r1, r0
	str r2, [sp]
	subs r0, #1
	adds r6, r1, r0
	mov r3, ip
	adds r3, #0x2c
	mov r7, sl
	ldrb r1, [r7]
	lsrs r1, r1, #6
	ldr r0, _080387A8 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r2
	adds r0, r2, #0
	adds r0, #0x5a
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	ldrb r3, [r3]
	adds r0, r0, r3
	lsls r3, r0, #2
	mov r1, ip
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _080387AC
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #6
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r3, r0
	b _080387B2
	.align 2, 0
_08038798: .4byte gUnknown_0849D5F8
_0803879C: .4byte gUnknown_03003FC0
_080387A0: .4byte gUnknown_03003F38
_080387A4: .4byte gUnknown_085D5ABC
_080387A8: .4byte gUnknown_08499598
_080387AC:
	movs r2, #0x82
	lsls r2, r2, #1
	adds r0, r3, r2
_080387B2:
	ldr r7, _08038834 @ =gUnknown_085D3E20
	adds r0, r7, r0
	ldr r5, [r0]
	ldr r0, _08038838 @ =gUnknown_08499590
	ldr r3, [r0]
	mov r0, r8
	ldr r2, [r0]
	asrs r4, r4, #0x18
	adds r0, r2, #0
	adds r0, #0x2c
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	ldr r7, _0803883C @ =0x0000417A
	adds r1, r3, r7
	adds r1, r1, r0
	adds r2, #0x20
	adds r2, r2, r4
	movs r0, #0
	ldrsb r0, [r2, r0]
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r1, _08038840 @ =0x00001432
	adds r3, r3, r1
	adds r3, r3, r0
	ldrb r0, [r3]
	movs r2, #0x1f
	ands r2, r0
	ldr r0, _08038844 @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r1, [r0]
	movs r0, #0x5c
	muls r0, r1, r0
	add r0, sb
	ldrb r0, [r0, #0x19]
	lsls r0, r0, #5
	adds r2, r2, r0
	adds r5, r5, r2
	ldrb r0, [r6]
	ldrb r1, [r5]
	subs r0, r0, r1
	ldr r2, [sp]
	strb r0, [r2]
	adds r4, #1
	lsls r4, r4, #0x18
	mov r7, r8
	ldr r0, [r7]
	adds r0, #0x45
	lsrs r3, r4, #0x18
	asrs r4, r4, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	ble _08038746
_08038824:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038834: .4byte gUnknown_085D3E20
_08038838: .4byte gUnknown_08499590
_0803883C: .4byte 0x0000417A
_08038840: .4byte 0x00001432
_08038844: .4byte gUnknown_030040D8

