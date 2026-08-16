	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08042650
sub_08042650: @ 0x08042650
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, _08042680 @ =gUnknown_08091354
	ldr r0, [r1]
	ldr r0, [r0]
	ldrb r3, [r0, #4]
	movs r0, #0x7f
	ands r0, r3
	mov sl, r1
	cmp r0, #0
	beq _08042684
	lsls r0, r3, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r5, r0, #1
	b _08042686
	.align 2, 0
_08042680: .4byte gUnknown_08091354
_08042684:
	movs r5, #0
_08042686:
	ldr r0, _0804276C @ =gUnknown_030033EC
	mov r8, r0
	ldrh r0, [r0]
	bl sub_08042F14
	muls r0, r5, r0
	movs r1, #0x64
	bl Div
	adds r5, r0, #0
	ldr r1, _08042770 @ =gUnknown_08499590
	ldr r2, [r1]
	ldr r4, _08042774 @ =gUnknown_08091358
	ldr r6, [r4]
	ldrh r1, [r6, #2]
	lsls r1, r1, #1
	ldr r3, _08042778 @ =0x0000417A
	mov sb, r3
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r1, [r6]
	adds r0, r0, r1
	ldr r1, _0804277C @ =0x00001432
	adds r2, r2, r1
	adds r2, r2, r0
	ldrb r7, [r2]
	bl sub_080424BC
	bl sub_080424E4
	mov r2, sl
	ldr r0, [r2]
	ldr r0, [r0]
	ldrb r0, [r0, #5]
	lsrs r0, r0, #3
	adds r5, r5, r0
	cmp r5, #0x13
	ble _080426D6
	movs r5, #0x14
_080426D6:
	ldr r0, _08042780 @ =gUnknown_0809135C
	ldr r1, [r0]
	ldrb r1, [r1, #0xd]
	adds r3, r0, #0
	cmp r1, #0
	beq _0804271C
	mov r4, r8
	ldrh r1, [r4]
	ldr r0, _08042784 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #0x1c]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0804271C
	ldr r0, _08042770 @ =gUnknown_08499590
	ldr r2, [r0]
	ldrh r1, [r6, #2]
	lsls r1, r1, #1
	mov r4, sb
	adds r0, r2, r4
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r1, [r6]
	adds r0, r0, r1
	ldr r1, _08042788 @ =0x0000234A
	adds r2, r2, r1
	adds r2, r2, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _080427C6
_0804271C:
	ldr r0, [r3]
	ldrb r0, [r0, #9]
	cmp r0, #1
	beq _08042730
	movs r3, #0x1f
	ands r3, r7
	cmp r3, #8
	beq _08042730
	cmp r3, #0x14
	bne _08042794
_08042730:
	ldr r1, _0804278C @ =gUnknown_03003100
	ldrh r0, [r1]
	ldrh r1, [r1, #2]
	mov r3, sl
	ldr r2, [r3]
	ldr r4, [r2]
	ldrb r2, [r4, #5]
	lsrs r2, r2, #3
	ldr r3, _08042790 @ =gUnknown_08499594
	ldr r3, [r3]
	subs r4, r4, r3
	lsls r3, r4, #2
	adds r3, r3, r4
	lsls r4, r3, #4
	adds r3, r3, r4
	lsls r4, r3, #8
	adds r3, r3, r4
	lsls r4, r3, #0x10
	adds r3, r3, r4
	rsbs r3, r3, #0
	asrs r3, r3, #2
	movs r4, #0xc0
	ands r3, r4
	asrs r3, r3, #6
	adds r3, #1
	str r3, [sp]
	adds r3, r5, #0
	bl sub_080409E8
	b _080427C6
	.align 2, 0
_0804276C: .4byte gUnknown_030033EC
_08042770: .4byte gUnknown_08499590
_08042774: .4byte gUnknown_08091358
_08042778: .4byte 0x0000417A
_0804277C: .4byte 0x00001432
_08042780: .4byte gUnknown_0809135C
_08042784: .4byte gUnknown_08499598
_08042788: .4byte 0x0000234A
_0804278C: .4byte gUnknown_03003100
_08042790: .4byte gUnknown_08499594
_08042794:
	cmp r5, #0x13
	ble _080427C6
	mov r4, sl
	ldr r0, [r4]
	ldr r2, _08042858 @ =gUnknown_08499594
	ldr r1, [r0]
	ldr r0, [r2]
	subs r1, r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #2
	movs r1, #0xc0
	ands r0, r1
	asrs r0, r0, #6
	adds r0, #1
	adds r1, r3, #0
	bl sub_08041258
_080427C6:
	mov r0, sl
	ldr r6, [r0]
	ldr r2, [r6]
	lsls r3, r5, #3
	ldrb r1, [r2, #5]
	movs r5, #7
	adds r0, r5, #0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2, #5]
	ldr r2, [r6]
	ldrb r0, [r2, #5]
	lsrs r0, r0, #3
	cmp r0, #0x13
	bls _08042842
	ldr r0, _08042858 @ =gUnknown_08499594
	ldr r1, [r0]
	subs r1, r2, r1
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsrs r4, r7, #5
	adds r1, r4, #0
	bl sub_080265B0
	ldr r2, [r6]
	ldrb r1, [r2, #5]
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r2, #5]
	movs r0, #0x1f
	ands r0, r7
	cmp r0, #8
	beq _08042822
	cmp r0, #0x14
	bne _08042834
_08042822:
	ldr r0, _0804285C @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x32
	movs r1, #1
	strb r1, [r0]
_08042834:
	ldr r1, _08042860 @ =gUnknown_03003100
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r3, #2
	ldrsh r1, [r1, r3]
	bl sub_08024058
_08042842:
	bl sub_08028CD8
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08042858: .4byte gUnknown_08499594
_0804285C: .4byte gUnknown_08499598
_08042860: .4byte gUnknown_03003100

