	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08047190
sub_08047190: @ 0x08047190
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x64
	adds r7, r0, #0
	str r1, [sp, #0x40]
	movs r0, #0
	mov sb, r0
	mov sl, r0
	movs r3, #0
	movs r1, #0
	ldr r6, _080472B4 @ =gUnknown_081BA068
	mov r8, r6
_080471AE:
	lsls r0, r1, #0x18
	asrs r2, r0, #0x18
	adds r1, r2, r6
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r5, r0, #0
	adds r0, r7, #0
	adds r0, #0x21
	str r0, [sp, #0x60]
	cmp r1, #0
	ble _080471E4
	movs r4, #1
	mov r0, r8
	adds r1, r2, r0
	movs r2, #0
	ldrsb r2, [r1, r2]
_080471D0:
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	cmp r2, r0
	ble _080471DA
	ldrb r3, [r1]
_080471DA:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x3f
	bls _080471D0
_080471E4:
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r5, r1
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x18
	ble _080471AE
	ldr r0, _080472B8 @ =gUnknown_02028E18
	ldrb r0, [r0]
	cmp r0, #0
	beq _080471FC
	b _080473A8
_080471FC:
	movs r2, #1
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	adds r0, #1
	cmp r2, r0
	bge _08047280
	str r0, [sp, #0x44]
_0804720A:
	movs r1, #0
	lsls r6, r2, #0x18
	asrs r3, r6, #0x18
	str r3, [sp, #0x48]
_08047212:
	lsls r0, r1, #0x18
	asrs r2, r0, #0x18
	ldr r3, _080472B4 @ =gUnknown_081BA068
	adds r1, r2, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r5, r0, #0
	ldr r0, [sp, #0x48]
	cmp r1, r0
	bne _08047266
	movs r4, #1
	ldr r1, _080472BC @ =gUnknown_08499594
	mov r8, r1
	ldr r3, _080472C0 @ =gUnknown_03003F2C
	mov ip, r3
	ldr r7, _080472C4 @ =gUnknown_02028DD8
_08047234:
	mov r1, ip
	ldrh r0, [r1]
	adds r0, r0, r4
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	mov r3, r8
	ldr r0, [r3]
	adds r3, r0, r1
	ldrb r0, [r3]
	cmp r0, r2
	bne _0804725C
	mov r1, sb
	adds r0, r1, r7
	strb r4, [r0]
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_0804725C:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x3f
	bls _08047234
_08047266:
	movs r3, #0x80
	lsls r3, r3, #0x11
	adds r0, r5, r3
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x18
	ble _08047212
	adds r0, r6, r3
	lsrs r2, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [sp, #0x44]
	cmp r0, r1
	blt _0804720A
_08047280:
	ldr r3, _080472C4 @ =gUnknown_02028DD8
	mov r0, sb
	adds r1, r0, r3
	movs r0, #0xff
	strb r0, [r1]
	mov r0, sb
	ldr r1, [sp, #0x60]
	strb r0, [r1]
	ldr r1, [sp, #0x40]
	cmp r1, #0
	bne _080472C8
	movs r2, #0
	cmp r2, sb
	blo _0804729E
	b _08047548
_0804729E:
	mov r0, sp
	adds r1, r0, r2
	adds r0, r2, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, sb
	blo _0804729E
	b _08047548
	.align 2, 0
_080472B4: .4byte gUnknown_081BA068
_080472B8: .4byte gUnknown_02028E18
_080472BC: .4byte gUnknown_08499594
_080472C0: .4byte gUnknown_03003F2C
_080472C4: .4byte gUnknown_02028DD8
_080472C8:
	movs r1, #0
_080472CA:
	movs r2, #0
	lsls r5, r1, #0x18
	cmp r2, sb
	bhs _08047398
	ldr r0, _08047344 @ =gUnknown_08499594
	ldr r0, [r0]
	str r0, [sp, #0x4c]
	mov ip, r5
	asrs r6, r5, #0x18
	ldr r7, _08047348 @ =gUnknown_085D5ABC
	ldr r0, _0804734C @ =gUnknown_03003F2C
	ldrh r0, [r0]
	mov r8, r0
_080472E4:
	ldr r1, _08047350 @ =gUnknown_02028DD8
	adds r0, r2, r1
	ldrb r4, [r0]
	mov r3, r8
	adds r1, r3, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [sp, #0x4c]
	adds r3, r1, r0
	ldr r0, [sp, #0x40]
	cmp r0, #1
	bne _08047308
	ldrb r0, [r3, #4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	cmp r0, r6
	bne _0804738E
_08047308:
	ldr r1, [sp, #0x40]
	cmp r1, #2
	bne _08047318
	ldrb r0, [r3, #6]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	cmp r0, r6
	bne _0804738E
_08047318:
	ldr r0, [sp, #0x40]
	cmp r0, #3
	bne _0804737E
	mov r0, ip
	asrs r1, r0, #0x18
	cmp r1, #0
	bne _08047354
	ldrh r1, [r3, #4]
	movs r0, #0xf0
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0804738E
	ldrb r1, [r3]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r7
	ldrb r0, [r0, #0x11]
	cmp r0, #0
	beq _0804738E
	b _0804737E
	.align 2, 0
_08047344: .4byte gUnknown_08499594
_08047348: .4byte gUnknown_085D5ABC
_0804734C: .4byte gUnknown_03003F2C
_08047350: .4byte gUnknown_02028DD8
_08047354:
	cmp r1, #0x64
	bne _08047374
	ldrh r1, [r3, #4]
	movs r0, #0xf0
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0804738E
	ldrb r1, [r3]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r7
	ldrb r0, [r0, #0x11]
	cmp r0, #0
	bne _0804738E
	b _0804737E
_08047374:
	ldrh r0, [r3, #4]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1c
	cmp r0, r1
	bne _0804738E
_0804737E:
	mov r0, sp
	add r0, sl
	strb r4, [r0]
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
_0804738E:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, sb
	blo _080472E4
_08047398:
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r5, r1
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x64
	ble _080472CA
	b _08047548
_080473A8:
	adds r2, r3, #0
	lsls r0, r2, #0x18
	cmp r0, #0
	ble _08047426
_080473B0:
	movs r1, #0
	lsls r6, r2, #0x18
	asrs r3, r6, #0x18
	str r3, [sp, #0x50]
_080473B8:
	lsls r0, r1, #0x18
	asrs r2, r0, #0x18
	ldr r3, _0804745C @ =gUnknown_081BA068
	adds r1, r2, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r5, r0, #0
	ldr r0, [sp, #0x50]
	cmp r1, r0
	bne _0804740C
	movs r4, #1
	ldr r1, _08047460 @ =gUnknown_08499594
	mov r8, r1
	ldr r3, _08047464 @ =gUnknown_03003F2C
	mov ip, r3
	ldr r7, _08047468 @ =gUnknown_02028DD8
_080473DA:
	mov r1, ip
	ldrh r0, [r1]
	adds r0, r0, r4
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	mov r3, r8
	ldr r0, [r3]
	adds r3, r0, r1
	ldrb r0, [r3]
	cmp r0, r2
	bne _08047402
	mov r1, sb
	adds r0, r1, r7
	strb r4, [r0]
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_08047402:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x3f
	bls _080473DA
_0804740C:
	movs r3, #0x80
	lsls r3, r3, #0x11
	adds r0, r5, r3
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x18
	ble _080473B8
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r6, r1
	lsrs r2, r0, #0x18
	cmp r0, #0
	bgt _080473B0
_08047426:
	ldr r3, _08047468 @ =gUnknown_02028DD8
	mov r0, sb
	adds r1, r0, r3
	movs r0, #0xff
	strb r0, [r1]
	mov r0, sb
	ldr r1, [sp, #0x60]
	strb r0, [r1]
	ldr r1, [sp, #0x40]
	cmp r1, #0
	bne _0804746C
	movs r2, #0
	cmp r2, sb
	blo _08047444
	b _08047548
_08047444:
	mov r0, sp
	adds r1, r0, r2
	adds r0, r2, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, sb
	blo _08047444
	b _08047548
	.align 2, 0
_0804745C: .4byte gUnknown_081BA068
_08047460: .4byte gUnknown_08499594
_08047464: .4byte gUnknown_03003F2C
_08047468: .4byte gUnknown_02028DD8
_0804746C:
	movs r1, #0x64
_0804746E:
	movs r2, #0
	lsls r5, r1, #0x18
	cmp r2, sb
	bhs _0804753C
	ldr r0, _080474E8 @ =gUnknown_08499594
	ldr r0, [r0]
	str r0, [sp, #0x54]
	mov ip, r5
	asrs r6, r5, #0x18
	ldr r7, _080474EC @ =gUnknown_085D5ABC
	ldr r0, _080474F0 @ =gUnknown_03003F2C
	ldrh r0, [r0]
	mov r8, r0
_08047488:
	ldr r1, _080474F4 @ =gUnknown_02028DD8
	adds r0, r2, r1
	ldrb r4, [r0]
	mov r3, r8
	adds r1, r3, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [sp, #0x54]
	adds r3, r1, r0
	ldr r0, [sp, #0x40]
	cmp r0, #1
	bne _080474AC
	ldrb r0, [r3, #4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	cmp r0, r6
	bne _08047532
_080474AC:
	ldr r1, [sp, #0x40]
	cmp r1, #2
	bne _080474BC
	ldrb r0, [r3, #6]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	cmp r0, r6
	bne _08047532
_080474BC:
	ldr r0, [sp, #0x40]
	cmp r0, #3
	bne _08047522
	mov r0, ip
	asrs r1, r0, #0x18
	cmp r1, #0
	bne _080474F8
	ldrh r1, [r3, #4]
	movs r0, #0xf0
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08047532
	ldrb r1, [r3]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r7
	ldrb r0, [r0, #0x11]
	cmp r0, #0
	beq _08047532
	b _08047522
	.align 2, 0
_080474E8: .4byte gUnknown_08499594
_080474EC: .4byte gUnknown_085D5ABC
_080474F0: .4byte gUnknown_03003F2C
_080474F4: .4byte gUnknown_02028DD8
_080474F8:
	cmp r1, #0x64
	bne _08047518
	ldrh r1, [r3, #4]
	movs r0, #0xf0
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08047532
	ldrb r1, [r3]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r7
	ldrb r0, [r0, #0x11]
	cmp r0, #0
	bne _08047532
	b _08047522
_08047518:
	ldrh r0, [r3, #4]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1c
	cmp r0, r1
	bne _08047532
_08047522:
	mov r0, sp
	add r0, sl
	strb r4, [r0]
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
_08047532:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, sb
	blo _08047488
_0804753C:
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r5, r1
	lsrs r1, r0, #0x18
	cmp r0, #0
	bge _0804746E
_08047548:
	movs r3, #0
	mov sl, r3
	movs r2, #0
	cmp sl, sb
	blo _08047554
	b _08047672
_08047554:
	mov r0, sp
	adds r5, r0, r2
	ldrb r4, [r5]
	adds r2, #1
	str r2, [sp, #0x5c]
	cmp r4, #0xff
	bne _08047564
	b _08047666
_08047564:
	ldr r2, _0804768C @ =gUnknown_0812A124
	ldr r6, [r2]
	ldrh r0, [r6]
	adds r0, r0, r4
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r3, _08047690 @ =gUnknown_08499594
	ldr r0, [r3]
	adds r3, r0, r1
	ldrb r1, [r3, #1]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08047666
	ldr r0, _08047694 @ =gUnknown_02028DD8
	add r0, sl
	strb r4, [r0]
	movs r0, #0xff
	strb r0, [r5]
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldrb r1, [r3, #1]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08047666
	ldrb r0, [r3, #7]
	ldrh r1, [r6]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrb r0, [r3, #8]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r2, #0
	cmp r2, sb
	bhs _08047666
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x58]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
_080475C4:
	mov r0, sp
	adds r4, r0, r2
	ldrb r1, [r4]
	ldr r3, [sp, #0x58]
	cmp r1, r3
	beq _080475D6
	adds r5, r2, #1
	cmp r1, r8
	bne _0804765E
_080475D6:
	ldr r0, _08047694 @ =gUnknown_02028DD8
	add r0, sl
	strb r1, [r0]
	ldr r6, _08047698 @ =gUnknown_03003F2C
	ldrh r1, [r6]
	ldrb r0, [r0]
	adds r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _08047690 @ =gUnknown_08499594
	ldr r1, [r3]
	adds r3, r1, r0
	movs r0, #0xff
	strb r0, [r4]
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldrb r1, [r3, #1]
	movs r0, #0x10
	ands r0, r1
	adds r5, r2, #1
	cmp r0, #0
	beq _0804765E
	ldrb r0, [r3, #7]
	ldrh r1, [r6]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrb r0, [r3, #8]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r2, #0
	cmp r2, sb
	bhs _0804765E
	lsls r0, r4, #0x10
	asrs r6, r0, #0x10
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	ldr r0, _08047694 @ =gUnknown_02028DD8
	mov ip, r0
	movs r7, #0xff
_08047630:
	mov r3, sp
	adds r1, r3, r2
	ldrb r3, [r1]
	cmp r3, r6
	beq _0804763E
	cmp r3, r4
	bne _08047654
_0804763E:
	mov r0, sl
	add r0, ip
	strb r3, [r0]
	ldrb r0, [r1]
	orrs r0, r7
	strb r0, [r1]
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
_08047654:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, sb
	blo _08047630
_0804765E:
	lsls r0, r5, #0x18
	lsrs r2, r0, #0x18
	cmp r2, sb
	blo _080475C4
_08047666:
	ldr r1, [sp, #0x5c]
	lsls r0, r1, #0x18
	lsrs r2, r0, #0x18
	cmp r2, sb
	bhs _08047672
	b _08047554
_08047672:
	ldr r0, _08047694 @ =gUnknown_02028DD8
	add r0, sl
	movs r1, #0xff
	strb r1, [r0]
	add sp, #0x64
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804768C: .4byte gUnknown_0812A124
_08047690: .4byte gUnknown_08499594
_08047694: .4byte gUnknown_02028DD8
_08047698: .4byte gUnknown_03003F2C

