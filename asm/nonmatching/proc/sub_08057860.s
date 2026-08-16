	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08057860
sub_08057860: @ 0x08057860
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	movs r0, #0
	mov r8, r0
	movs r3, #1
	mov sl, r3
	mov r0, sl
	ands r0, r1
	mov sl, r0
	lsls r3, r1, #3
	subs r3, r3, r1
	lsls r3, r3, #2
	ldr r0, _08057954 @ =gUnknown_08553A2C
	adds r6, r3, r0
	adds r0, #4
	adds r3, r3, r0
	ldrh r5, [r2]
	movs r4, #0
	ldrsb r4, [r6, r4]
	adds r4, r5, r4
	ldrh r1, [r2, #2]
	movs r0, #1
	ldrsb r0, [r6, r0]
	adds r0, r1, r0
	lsls r0, r0, #5
	adds r4, r4, r0
	str r4, [sp]
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r5, r5, r0
	movs r0, #1
	ldrsb r0, [r3, r0]
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r7, r5, r1
	ldr r5, _08057958 @ =gUnknown_03004580
	mov r2, sl
	lsls r4, r2, #4
	adds r0, r5, #0
	adds r0, #0xe
	adds r0, r4, r0
	ldrh r0, [r0]
	movs r1, #0xa
	bl Div
	adds r6, r0, #0
	adds r4, r4, r5
	ldrh r0, [r4]
	adds r0, #1
	bl sub_08027198
	bl sub_08043050
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	beq _080578E4
	asrs r0, r6, #1
	subs r6, r6, r0
	mov r8, r6
	adds r6, r0, #0
_080578E4:
	ldr r3, [sp]
	lsls r1, r3, #1
	add r1, sb
	ldr r4, _0805795C @ =gUnknown_08562124
	mov r0, sl
	lsls r2, r0, #1
	adds r3, r2, r4
	ldrh r0, [r3]
	lsls r0, r0, #0xc
	adds r0, #0x11
	strh r0, [r1]
	ldrh r0, [r3]
	lsls r0, r0, #0xc
	adds r0, #0x12
	strh r0, [r1, #2]
	adds r5, r2, #0
	mov r2, sl
	cmp r2, #0
	beq _08057960
	cmp r6, #0
	ble _08057928
	adds r2, r3, #0
	lsls r0, r7, #1
	mov r3, sb
	adds r1, r3, r0
	adds r3, r6, #0
_08057918:
	ldrh r0, [r2]
	lsls r0, r0, #0xc
	adds r0, #0x13
	strh r0, [r1]
	subs r1, #2
	subs r3, #1
	cmp r3, #0
	bne _08057918
_08057928:
	mov r0, r8
	cmp r0, #0
	beq _080579A2
	cmp r0, #0
	ble _080579A2
	ldr r0, _0805795C @ =gUnknown_08562124
	adds r2, r5, r0
	lsls r0, r7, #1
	adds r0, #0x40
	mov r3, sb
	adds r1, r3, r0
	mov r3, r8
_08057940:
	ldrh r0, [r2]
	lsls r0, r0, #0xc
	adds r0, #0x13
	strh r0, [r1]
	subs r1, #2
	subs r3, #1
	cmp r3, #0
	bne _08057940
	b _080579A2
	.align 2, 0
_08057954: .4byte gUnknown_08553A2C
_08057958: .4byte gUnknown_03004580
_0805795C: .4byte gUnknown_08562124
_08057960:
	cmp r6, #0
	ble _0805797C
	lsls r0, r7, #1
	mov r2, sb
	adds r1, r0, r2
	adds r3, r6, #0
_0805796C:
	ldrh r0, [r4]
	lsls r0, r0, #0xc
	adds r0, #0x13
	strh r0, [r1]
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne _0805796C
_0805797C:
	mov r3, r8
	cmp r3, #0
	beq _080579A2
	cmp r3, #0
	ble _080579A2
	ldr r0, _080579B4 @ =gUnknown_08562124
	adds r2, r5, r0
	lsls r1, r7, #1
	mov r0, sb
	adds r0, #0x40
	adds r1, r1, r0
_08057992:
	ldrh r0, [r2]
	lsls r0, r0, #0xc
	adds r0, #0x13
	strh r0, [r1]
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne _08057992
_080579A2:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080579B4: .4byte gUnknown_08562124

