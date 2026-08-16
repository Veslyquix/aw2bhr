	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08028580
sub_08028580: @ 0x08028580
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	ldr r3, _08028644 @ =gUnknown_08499FA0
	adds r7, r0, #0
	adds r7, #0x64
	movs r0, #0
	ldrsh r1, [r7, r0]
	ldr r4, _08028648 @ =gUnknown_08090B50
	ldr r2, [r4]
	mov r8, r2
	ldr r2, [r2]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1a]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	movs r1, #0
	movs r2, #0
	bl sub_08019818
	ldr r0, [sp]
	adds r0, #0x66
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #2
	bne _0802865C
	ldr r0, _0802864C @ =gUnknown_08499590
	ldr r5, [r0]
	movs r6, #0
	ldrsh r4, [r7, r6]
	mov r1, r8
	ldr r0, [r1]
	lsls r2, r4, #4
	subs r2, r2, r4
	lsls r2, r2, #2
	adds r2, r2, r0
	adds r0, r2, #0
	adds r0, #0x2e
	ldrb r3, [r0]
	movs r1, #0x7f
	adds r0, r1, #0
	ands r0, r3
	lsls r0, r0, #1
	ldr r6, _08028650 @ =0x0000417A
	adds r3, r5, r6
	adds r3, r3, r0
	adds r2, #0x2d
	ldrb r2, [r2]
	adds r0, r1, #0
	ands r0, r2
	ldrh r3, [r3]
	adds r0, r0, r3
	ldr r2, _08028654 @ =0x00001432
	adds r5, r5, r2
	adds r5, r5, r0
	ldrb r0, [r5]
	lsrs r0, r0, #5
	mov sb, r0
	ldr r6, _08028658 @ =gUnknown_084995F4
	lsls r4, r4, #1
	adds r4, r4, r6
	ldrb r2, [r4]
	movs r0, #8
	orrs r0, r2
	strb r0, [r5]
	movs r0, #0
	ldrsh r3, [r7, r0]
	mov r2, r8
	ldr r0, [r2]
	lsls r2, r3, #4
	subs r2, r2, r3
	lsls r2, r2, #2
	adds r2, r2, r0
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r4, [r0]
	adds r0, r1, #0
	ands r0, r4
	adds r2, #0x2e
	ldrb r2, [r2]
	ands r1, r2
	lsls r3, r3, #1
	adds r3, r3, r6
	ldrb r2, [r3]
	bl sub_080240B4
	bl sub_080219AC
	b _08028660
	.align 2, 0
_08028644: .4byte gUnknown_08499FA0
_08028648: .4byte gUnknown_08090B50
_0802864C: .4byte gUnknown_08499590
_08028650: .4byte 0x0000417A
_08028654: .4byte 0x00001432
_08028658: .4byte gUnknown_084995F4
_0802865C:
	movs r3, #0
	mov sb, r3
_08028660:
	movs r6, #0
	mov r8, r6
	ldr r1, _08028740 @ =gUnknown_03003150
	ldrb r0, [r1]
	ldr r2, [sp]
	adds r2, #0x68
	str r2, [sp, #4]
	cmp r0, #0xff
	bne _08028674
	b _080287A6
_08028674:
	mov sl, r1
	mov r3, sb
	lsls r0, r3, #1
	ldr r6, _08028744 @ =gUnknown_084995F4
	adds r5, r0, r6
_0802867E:
	mov r0, r8
	lsls r2, r0, #2
	mov r1, sl
	adds r4, r2, r1
	ldrb r3, [r4]
	movs r1, #0xe0
	ldr r0, [sp]
	adds r0, #0x64
	movs r6, #0
	ldrsh r0, [r0, r6]
	lsls r0, r0, #1
	ldr r6, _08028744 @ =gUnknown_084995F4
	adds r0, r0, r6
	ands r1, r3
	adds r6, r2, #0
	ldrh r0, [r0]
	cmp r1, r0
	bne _0802878C
	ldr r0, _08028748 @ =gUnknown_08499590
	ldr r2, [r0]
	ldrb r1, [r4, #2]
	lsls r1, r1, #1
	ldr r3, _0802874C @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r1, [r0]
	ldrb r0, [r4, #1]
	adds r1, r1, r0
	adds r2, #0x12
	adds r2, r2, r1
	ldrb r4, [r2]
	ldr r7, _08028750 @ =gUnknown_08090B54
	cmp r4, #0
	beq _080286FA
	lsrs r2, r4, #6
	ldr r0, _08028754 @ =gUnknown_08499598
	ldr r3, [r0]
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	adds r1, #0x66
	mov r2, sb
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x2a
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bne _080286FA
	ldr r1, _08028758 @ =gUnknown_08499594
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r2, [r1, #5]
	movs r0, #7
	ands r0, r2
	strb r0, [r1, #5]
_080286FA:
	mov r3, sl
	adds r4, r6, r3
	ldrb r0, [r4]
	movs r3, #0x1f
	ands r3, r0
	cmp r3, #8
	bne _08028760
	ldr r0, [r7]
	ldr r2, [r0]
	ldrb r1, [r4, #2]
	lsls r1, r1, #1
	ldr r6, _0802874C @ =0x0000417A
	adds r0, r2, r6
	adds r0, r0, r1
	ldrh r1, [r0]
	ldrb r0, [r4, #1]
	adds r1, r1, r0
	ldr r0, _0802875C @ =0x00001432
	adds r2, r2, r0
	adds r2, r2, r1
	ldrb r1, [r5]
	movs r0, #6
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r4, #1]
	ldrb r1, [r4, #2]
	movs r2, #0
	bl sub_0802419C
	ldrb r0, [r4, #1]
	ldrb r1, [r4, #2]
	ldrb r2, [r5]
	bl sub_080240B4
	b _0802878C
	.align 2, 0
_08028740: .4byte gUnknown_03003150
_08028744: .4byte gUnknown_084995F4
_08028748: .4byte gUnknown_08499590
_0802874C: .4byte 0x0000417A
_08028750: .4byte gUnknown_08090B54
_08028754: .4byte gUnknown_08499598
_08028758: .4byte gUnknown_08499594
_0802875C: .4byte 0x00001432
_08028760:
	ldr r0, [r7]
	ldr r2, [r0]
	ldrb r1, [r4, #2]
	lsls r1, r1, #1
	ldr r6, _080287C8 @ =0x0000417A
	adds r0, r2, r6
	adds r0, r0, r1
	ldrh r1, [r0]
	ldrb r0, [r4, #1]
	adds r1, r1, r0
	ldr r0, _080287CC @ =0x00001432
	adds r2, r2, r0
	adds r2, r2, r1
	ldrb r1, [r5]
	adds r0, r3, #0
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r4, #1]
	ldrb r1, [r4, #2]
	ldrb r2, [r5]
	bl sub_080240B4
_0802878C:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	cmp r0, #0x5b
	bhi _080287A6
	lsls r0, r0, #2
	add r0, sl
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080287A6
	b _0802867E
_080287A6:
	bl sub_08024268
	bl sub_080219AC
	bl sub_08026D68
	movs r0, #1
	ldr r1, [sp, #4]
	strh r0, [r1]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080287C8: .4byte 0x0000417A
_080287CC: .4byte 0x00001432

