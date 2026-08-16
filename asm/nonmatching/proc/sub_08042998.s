	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08042998
sub_08042998: @ 0x08042998
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r4, _080429E4 @ =gUnknown_08499594
	ldr r0, _080429E8 @ =gUnknown_08499590
	ldr r2, [r0]
	ldr r3, _080429EC @ =gUnknown_03003100
	ldrh r1, [r3, #2]
	lsls r1, r1, #1
	ldr r5, _080429F0 @ =0x0000417A
	adds r0, r2, r5
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r1, [r3]
	adds r0, r0, r1
	ldr r1, _080429F4 @ =0x0000051A
	adds r2, r2, r1
	adds r2, r2, r0
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r4]
	adds r7, r1, r0
	ldrb r1, [r7, #4]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _080429F8
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r4, r0, #1
	b _080429FA
	.align 2, 0
_080429E4: .4byte gUnknown_08499594
_080429E8: .4byte gUnknown_08499590
_080429EC: .4byte gUnknown_03003100
_080429F0: .4byte 0x0000417A
_080429F4: .4byte 0x0000051A
_080429F8:
	movs r4, #0
_080429FA:
	ldr r1, _08042A24 @ =gUnknown_08091364
	ldr r0, [r1]
	ldr r0, [r0]
	ldrb r2, [r0, #4]
	movs r0, #0x7f
	ands r0, r2
	mov r8, r1
	cmp r0, #0
	beq _08042A28
	lsls r0, r2, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r1, r4, #1
	adds r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	b _08042A2C
	.align 2, 0
_08042A24: .4byte gUnknown_08091364
_08042A28:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
_08042A2C:
	adds r5, r0, #0
	cmp r5, #0xa
	bls _08042A52
	ldr r0, _08042AD4 @ =gUnknown_030033EC
	ldrh r4, [r0]
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	ldrb r1, [r0]
	adds r0, r4, #0
	bl sub_08042C9C
	adds r1, r5, #0
	subs r1, #0xa
	muls r1, r0, r1
	adds r0, r4, #0
	bl sub_08025B58
	movs r5, #0xa
_08042A52:
	mov r0, r8
	ldr r6, [r0]
	ldr r3, [r6]
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #1
	movs r0, #0x7f
	ands r1, r0
	ldrb r2, [r3, #4]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #4]
	ldr r3, [r6]
	ldrb r1, [r7, #5]
	lsrs r1, r1, #3
	lsls r1, r1, #3
	ldrb r2, [r3, #5]
	movs r0, #7
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #5]
	ldr r4, [r6]
	ldrb r3, [r4, #6]
	ldrb r0, [r7, #6]
	lsls r2, r0, #0x18
	lsrs r1, r3, #7
	lsrs r0, r2, #0x1f
	cmp r1, r0
	bhs _08042A9C
	adds r1, r0, #0
	lsls r1, r1, #7
	movs r0, #0x7f
	ands r0, r3
	orrs r0, r1
	strb r0, [r4, #6]
_08042A9C:
	ldr r5, [r6]
	ldrh r6, [r5, #4]
	lsls r1, r6, #0x15
	lsrs r1, r1, #0x1c
	ldrh r0, [r7, #4]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1c
	adds r4, r0, r1
	ldr r2, _08042AD8 @ =gUnknown_08091368
	ldr r3, [r2]
	ldrb r1, [r5]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r3
	mov sb, r2
	ldrb r1, [r0, #0xb]
	cmp r4, r1
	bls _08042AE0
	ldrb r0, [r0, #0xb]
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #7
	ldr r1, _08042ADC @ =0xFFFFF87F
	ands r1, r6
	orrs r1, r0
	strh r1, [r5, #4]
	b _08042AEE
	.align 2, 0
_08042AD4: .4byte gUnknown_030033EC
_08042AD8: .4byte gUnknown_08091368
_08042ADC: .4byte 0xFFFFF87F
_08042AE0:
	movs r0, #0xf
	ands r4, r0
	lsls r1, r4, #7
	ldr r0, _08042B44 @ =0xFFFFF87F
	ands r0, r6
	orrs r0, r1
	strh r0, [r5, #4]
_08042AEE:
	ldr r1, _08042B48 @ =gUnknown_03003FC0
	adds r0, r1, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	bne _08042B10
	ldrb r5, [r1, #0xd]
	cmp r5, #0
	bne _08042B10
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	ldr r4, _08042B4C @ =gUnknown_03004074
	ldrb r1, [r4]
	bl sub_08025B80
	strb r5, [r4]
_08042B10:
	mov r5, r8
	ldr r0, [r5]
	ldr r3, [r0]
	ldrb r5, [r3, #6]
	lsls r1, r5, #0x19
	lsrs r1, r1, #0x19
	ldrb r0, [r7, #6]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	adds r4, r0, r1
	mov r0, sb
	ldr r2, [r0]
	ldrb r1, [r3]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r2, [r0, #0x10]
	cmp r4, r2
	bls _08042B50
	movs r1, #0x7f
	ands r1, r2
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r5
	orrs r0, r1
	b _08042B5A
	.align 2, 0
_08042B44: .4byte 0xFFFFF87F
_08042B48: .4byte gUnknown_03003FC0
_08042B4C: .4byte gUnknown_03004074
_08042B50:
	movs r0, #0x7f
	ands r4, r0
	subs r0, #0xff
	ands r0, r5
	orrs r0, r4
_08042B5A:
	strb r0, [r3, #6]
	movs r0, #0
	strb r0, [r7]
	bl sub_080424E4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

