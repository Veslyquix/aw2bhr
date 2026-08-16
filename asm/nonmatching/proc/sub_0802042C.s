	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802042C
sub_0802042C: @ 0x0802042C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r5, r0, #0
	adds r7, r1, #0
	mov sb, r2
	mov r0, sb
	str r0, [sp, #0x10]
	movs r1, #0
	mov sl, r1
	ldr r2, _08020480 @ =gUnknown_03004074
	ldr r3, _08020484 @ =gUnknown_03003340
	lsls r1, r7, #2
	adds r1, r1, r3
	ldr r0, [r1]
	adds r0, r0, r5
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, [r1]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08020466
	b _08020618
_08020466:
	mov r2, sp
	adds r2, #8
	str r2, [sp, #0x14]
_0802046C:
	ldr r0, _08020488 @ =gUnknown_08499590
	ldr r0, [r0]
	adds r6, r5, #1
	str r6, [sp, #0x18]
	ldrh r0, [r0]
	cmp r6, r0
	bne _0802048C
	movs r0, #0xff
	b _08020498
	.align 2, 0
_08020480: .4byte gUnknown_03004074
_08020484: .4byte gUnknown_03003340
_08020488: .4byte gUnknown_08499590
_0802048C:
	lsls r0, r7, #2
	ldr r6, _080204B0 @ =gUnknown_03003340
	adds r0, r0, r6
	ldr r0, [r0]
	adds r0, r5, r0
	ldrb r0, [r0, #1]
_08020498:
	ldr r1, [sp, #0x14]
	strh r0, [r1]
	add r2, sp, #8
	mov ip, r2
	cmp r5, #0
	bne _080204B4
	mov r1, sp
	adds r1, #0xa
	movs r0, #0xff
	strh r0, [r1]
	b _080204C8
	.align 2, 0
_080204B0: .4byte gUnknown_03003340
_080204B4:
	lsls r0, r7, #2
	ldr r6, _080204E0 @ =gUnknown_03003340
	adds r0, r0, r6
	ldr r0, [r0]
	adds r0, r5, r0
	subs r0, #1
	ldrb r1, [r0]
	mov r0, sp
	adds r0, #0xa
	strh r1, [r0]
_080204C8:
	ldr r0, _080204E4 @ =gUnknown_08499590
	ldr r0, [r0]
	adds r1, r7, #1
	mov r8, r1
	ldrh r0, [r0, #2]
	cmp r8, r0
	bne _080204E8
	mov r1, sp
	adds r1, #0xe
	movs r0, #0xff
	strh r0, [r1]
	b _080204FC
	.align 2, 0
_080204E0: .4byte gUnknown_03003340
_080204E4: .4byte gUnknown_08499590
_080204E8:
	mov r2, r8
	lsls r0, r2, #2
	ldr r6, _08020508 @ =gUnknown_03003340
	adds r0, r0, r6
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	mov r0, sp
	adds r0, #0xe
	strh r1, [r0]
_080204FC:
	cmp r7, #0
	bne _0802050C
	add r1, sp, #0xc
	movs r0, #0xff
	strh r0, [r1]
	b _0802051E
	.align 2, 0
_08020508: .4byte gUnknown_03003340
_0802050C:
	subs r0, r7, #1
	lsls r0, r0, #2
	ldr r1, _08020588 @ =gUnknown_03003340
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	add r0, sp, #0xc
	strh r1, [r0]
_0802051E:
	movs r4, #0x80
	lsls r4, r4, #1
	movs r2, #0
	str r2, [sp, #0x20]
	mov r6, sb
	adds r6, #1
	str r6, [sp, #0x1c]
	mov r2, ip
	movs r3, #3
_08020530:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r6, #0
	ldrsh r1, [r2, r6]
	cmp r0, r1
	ble _0802053E
	ldrh r4, [r2]
_0802053E:
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _08020530
	movs r3, #0
	lsls r0, r4, #0x10
	asrs r4, r0, #0x10
	mov r2, ip
_0802054E:
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r4, r0
	bne _0802056C
	ldr r0, [sp, #0x20]
	lsls r1, r0, #0x10
	movs r6, #0x80
	lsls r6, r6, #9
	adds r1, r1, r6
	lsrs r1, r1, #0x10
	str r1, [sp, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0xf
	add r0, sp
	strh r3, [r0]
_0802056C:
	adds r2, #2
	adds r3, #1
	cmp r3, #3
	ble _0802054E
	ldr r1, [sp, #0x20]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _0802059A
	cmp r0, #2
	bgt _0802058C
	cmp r0, #1
	beq _08020596
	b _080205CC
	.align 2, 0
_08020588: .4byte gUnknown_03003340
_0802058C:
	cmp r0, #3
	beq _080205AA
	cmp r0, #4
	beq _080205BA
	b _080205CC
_08020596:
	mov r0, sp
	b _080205C8
_0802059A:
	bl sub_080129E0
	lsrs r0, r0, #0xe
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #1
	add r0, sp
	b _080205C8
_080205AA:
	bl sub_080129E0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #1
	add r0, sp
	b _080205C8
_080205BA:
	bl sub_080129E0
	movs r1, #3
	ands r1, r0
	lsls r1, r1, #1
	mov r2, sp
	adds r0, r2, r1
_080205C8:
	ldrh r0, [r0]
	mov sl, r0
_080205CC:
	mov r0, sl
	mov r6, sb
	strb r0, [r6]
	ldr r1, [sp, #0x1c]
	mov sb, r1
	mov r2, sl
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _080205F8
	cmp r0, #1
	bgt _080205EA
	cmp r0, #0
	beq _080205F4
	b _08020602
_080205EA:
	cmp r0, #2
	beq _08020600
	cmp r0, #3
	beq _080205FC
	b _08020602
_080205F4:
	ldr r5, [sp, #0x18]
	b _08020602
_080205F8:
	subs r5, #1
	b _08020602
_080205FC:
	mov r7, r8
	b _08020602
_08020600:
	subs r7, #1
_08020602:
	lsls r0, r7, #2
	ldr r6, _08020630 @ =gUnknown_03003340
	adds r0, r0, r6
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08020618
	b _0802046C
_08020618:
	ldr r0, [sp, #0x10]
	mov r1, sb
	bl sub_08020634
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08020630: .4byte gUnknown_03003340

