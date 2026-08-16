	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08020984
sub_08020984: @ 0x08020984
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r2, _08020A9C @ =gUnknown_08090954
	ldr r3, [r2]
	ldr r1, [r3]
	movs r0, #0
	strb r0, [r1, #0x1c]
	movs r4, #1
	ldr r0, _08020AA0 @ =gUnknown_08090958
	mov sl, r0
	movs r2, #0
_080209A0:
	ldr r0, [r3]
	lsls r1, r4, #4
	subs r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r0
	strb r2, [r1, #0x1c]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	bls _080209A0
	ldr r2, _08020AA4 @ =gUnknown_08090944
	mov r1, sl
	ldr r0, [r1]
	ldrh r3, [r0]
	ldr r0, _08020AA8 @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r3, #4
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0x1b]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r6, [r0]
	cmp r6, #1
	bne _080209E4
	adds r0, r3, #0
	bl sub_08020864
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080209E4
	movs r6, #3
_080209E4:
	mov r0, sl
	ldr r3, [r0]
	ldrh r1, [r3]
	ldr r0, _08020AA8 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strb r6, [r0, #0x1c]
	movs r4, #1
	adds r7, r3, #0
_080209FC:
	ldrh r0, [r7]
	adds r0, r0, r4
	cmp r0, #4
	ble _08020A06
	subs r0, #4
_08020A06:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r5, r0, #0
	ldrh r0, [r7]
	adds r1, r5, #0
	bl sub_08020824
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bne _08020A2A
	ldr r0, _08020AA8 @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r5, #4
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	strb r6, [r0, #0x1c]
_08020A2A:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #3
	bls _080209FC
	mov r1, sl
	ldr r0, [r1]
	ldrh r0, [r0]
	bl sub_080208C8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08020AF4
	movs r4, #1
	movs r0, #3
	eors r6, r0
	mov r8, r6
_08020A4C:
	mov r1, sl
	ldr r0, [r1]
	ldrh r0, [r0]
	adds r0, r0, r4
	cmp r0, #4
	ble _08020A5A
	subs r0, #4
_08020A5A:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r5, r0, #0
	mov r1, sl
	ldr r0, [r1]
	ldrh r0, [r0]
	adds r1, r5, #0
	bl sub_08020824
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, #1
	mov sb, r4
	cmp r0, #1
	bne _08020AEA
	ldr r2, _08020AA8 @ =gUnknown_08499598
	ldr r0, [r2]
	lsls r1, r5, #4
	subs r1, r1, r5
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #0x1b]
	cmp r0, #1
	bne _08020AEA
	mov r0, r8
	strb r0, [r1, #0x1c]
	movs r6, #1
	adds r7, r2, #0
_08020A92:
	adds r4, r5, r6
	cmp r4, #4
	bgt _08020AAC
	lsls r0, r4, #0x10
	b _08020AB0
	.align 2, 0
_08020A9C: .4byte gUnknown_08090954
_08020AA0: .4byte gUnknown_08090958
_08020AA4: .4byte gUnknown_08090944
_08020AA8: .4byte gUnknown_08499598
_08020AAC:
	subs r0, r4, #4
	lsls r0, r0, #0x10
_08020AB0:
	lsrs r1, r0, #0x10
	adds r0, r5, #0
	bl sub_08020824
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bne _08020AE0
	cmp r4, #4
	bgt _08020AD0
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	ldr r1, [r7]
	adds r0, r1, r0
	b _08020ADC
_08020AD0:
	subs r0, r4, #4
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r7]
	adds r0, r0, r1
_08020ADC:
	mov r1, r8
	strb r1, [r0, #0x1c]
_08020AE0:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #3
	bls _08020A92
_08020AEA:
	mov r1, sb
	lsls r0, r1, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #3
	bls _08020A4C
_08020AF4:
	movs r4, #1
	ldr r6, _08020B18 @ =gUnknown_08499598
_08020AF8:
	cmp r4, #4
	bls _08020B1C
	mov r1, sl
	ldr r0, [r1]
	ldrh r0, [r0]
	ldr r2, [r6]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0x1c]
	movs r0, #2
	orrs r0, r2
	strb r0, [r1, #0x1c]
	b _08020B66
	.align 2, 0
_08020B18: .4byte gUnknown_08499598
_08020B1C:
	lsls r0, r4, #0x18
	lsrs r5, r0, #0x18
	adds r0, r5, #0
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08020B3C
	ldr r0, [r6]
	lsls r1, r4, #4
	subs r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #0x1b]
	cmp r0, #1
	beq _08020B66
_08020B3C:
	adds r0, r5, #0
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08020B5C
	ldr r1, [r6]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x1c]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08020B66
_08020B5C:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #5
	bls _08020AF8
_08020B66:
	ldr r1, _08020B80 @ =gUnknown_03004070
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08020B84 @ =gUnknown_03004088
	movs r0, #1
	strh r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08020B80: .4byte gUnknown_03004070
_08020B84: .4byte gUnknown_03004088

