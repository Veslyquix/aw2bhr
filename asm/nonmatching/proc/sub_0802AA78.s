	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802AA78
sub_0802AA78: @ 0x0802AA78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x4c
	bl sub_0802B868
	ldr r4, _0802AB00 @ =gUnknown_03003130
	ldrb r7, [r4, #0x10]
	ldrb r0, [r4, #0x11]
	mov r8, r0
	adds r0, r7, #0
	mov r1, r8
	bl sub_0802B6C8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	ldr r6, _0802AB04 @ =gUnknown_08090B98
	ldr r1, [r6]
	mov sb, r1
	ldr r5, _0802AB08 @ =gUnknown_08090B9C
	ldr r0, [r5]
	ldr r1, [r0]
	mov r3, r8
	lsls r2, r3, #1
	ldr r3, _0802AB0C @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r7
	adds r1, #0x12
	adds r1, r1, r0
	ldrb r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r2, sb
	ldr r1, [r2]
	adds r0, r0, r1
	mov sl, r0
	subs r1, r0, r1
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
	str r0, [sp, #0x1c]
	ldrh r2, [r4, #0xc]
	movs r3, #0xc
	ldrsh r0, [r4, r3]
	ldr r1, _0802AB10 @ =gUnknown_0849A2BE
	ldrh r4, [r1]
	cmp r0, r4
	bgt _0802AB14
	ldrh r1, [r1, #2]
	str r1, [sp, #0x10]
	movs r4, #0
	b _0802AB1A
	.align 2, 0
_0802AB00: .4byte gUnknown_03003130
_0802AB04: .4byte gUnknown_08090B98
_0802AB08: .4byte gUnknown_08090B9C
_0802AB0C: .4byte 0x0000417A
_0802AB10: .4byte gUnknown_0849A2BE
_0802AB14:
	ldrh r1, [r1, #6]
	str r1, [sp, #0x10]
	movs r4, #1
_0802AB1A:
	ldr r0, _0802ABE4 @ =gUnknown_03002F90
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _0802AB34
	ldr r0, _0802ABE8 @ =gUnknown_0300309C
	ldrh r0, [r0]
	adds r0, #0xa0
	ldr r3, [sp, #0x10]
	subs r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
_0802AB34:
	lsls r0, r7, #0x10
	str r0, [sp, #0x20]
	asrs r6, r0, #0x10
	mov r1, r8
	lsls r1, r1, #0x10
	str r1, [sp, #0x24]
	asrs r5, r1, #0x10
	lsls r2, r2, #0x10
	str r2, [sp, #0x28]
	asrs r2, r2, #0x10
	mov r8, r2
	ldr r2, [sp, #0x10]
	lsls r2, r2, #0x10
	str r2, [sp, #0x2c]
	asrs r3, r2, #0x10
	lsls r7, r4, #0x10
	asrs r4, r7, #0x10
	str r4, [sp]
	adds r0, r6, #0
	adds r1, r5, #0
	mov r2, r8
	bl sub_0802A8DC
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0803EED4
	movs r6, #0x1f
	ldr r2, _0802ABEC @ =gUnknown_0849A2A6
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r5, [r1]
	ldr r3, _0802ABF0 @ =gUnknown_08090BA0
	ldr r1, [r3]
	add r5, r8
	ldrb r4, [r1, #0x18]
	adds r5, r5, r4
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldrb r4, [r1, #0x19]
	ldr r1, [sp, #0x10]
	adds r4, r4, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r1, _0802ABF4 @ =gUnknown_085D583C
	ands r6, r0
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r1, #0x10
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	movs r1, #0xa
	bl Div
	adds r2, r0, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0802BAFC
	movs r2, #0
	str r2, [sp, #0x18]
	subs r6, #6
	lsls r6, r6, #0x10
	asrs r0, r6, #0x10
	ldr r3, [sp, #0x24]
	str r3, [sp, #0x38]
	ldr r4, [sp, #0x20]
	str r4, [sp, #0x34]
	ldr r1, [sp, #0x28]
	str r1, [sp, #0x3c]
	ldr r2, [sp, #0x2c]
	str r2, [sp, #0x40]
	str r7, [sp, #0x48]
	cmp r0, #0xe
	bhi _0802AC3C
	lsls r0, r0, #2
	ldr r1, _0802ABF8 @ =_0802ABFC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802ABE4: .4byte gUnknown_03002F90
_0802ABE8: .4byte gUnknown_0300309C
_0802ABEC: .4byte gUnknown_0849A2A6
_0802ABF0: .4byte gUnknown_08090BA0
_0802ABF4: .4byte gUnknown_085D583C
_0802ABF8: .4byte _0802ABFC
_0802ABFC: @ jump table
	.4byte _0802AC38 @ case 0
	.4byte _0802AC3C @ case 1
	.4byte _0802AC38 @ case 2
	.4byte _0802AC3C @ case 3
	.4byte _0802AC38 @ case 4
	.4byte _0802AC38 @ case 5
	.4byte _0802AC3C @ case 6
	.4byte _0802AC3C @ case 7
	.4byte _0802AC38 @ case 8
	.4byte _0802AC3C @ case 9
	.4byte _0802AC3C @ case 10
	.4byte _0802AC3C @ case 11
	.4byte _0802AC3C @ case 12
	.4byte _0802AC3C @ case 13
	.4byte _0802AC38 @ case 14
_0802AC38:
	movs r3, #0x14
	str r3, [sp, #0x18]
_0802AC3C:
	ldr r4, [sp, #0x14]
	lsls r0, r4, #0x10
	str r0, [sp, #0x44]
	cmp r0, #0
	bne _0802AC48
	b _0802B0AC
_0802AC48:
	mov r1, sl
	ldrb r0, [r1]
	ldr r2, [sp, #0x3c]
	asrs r6, r2, #0x10
	ldr r3, [sp, #0x40]
	asrs r3, r3, #0x10
	mov r8, r3
	ldr r1, [sp, #0x48]
	asrs r4, r1, #0x10
	adds r1, r6, #0
	mov r2, r8
	adds r3, r4, #0
	bl sub_0802AA14
	ldr r2, _0802AD18 @ =gUnknown_0810E6E0
	ldr r0, _0802AD1C @ =gUnknown_08499598
	ldr r1, [r0]
	ldr r3, [sp, #0x1c]
	lsls r0, r3, #4
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0x1a]
	subs r0, #1
	lsls r0, r0, #5
	adds r0, r0, r2
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, _0802AD20 @ =gUnknown_0849A2A6
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r1, #2
	adds r5, r0, r1
	ldrh r0, [r5]
	ldr r7, _0802AD24 @ =gUnknown_0849A284
	adds r0, r0, r6
	ldrb r4, [r7]
	adds r0, r0, r4
	ldr r2, _0802AD28 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	ldrb r1, [r7, #1]
	ldr r3, [sp, #0x10]
	adds r1, r1, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r4, sl
	ldrb r2, [r4]
	ldrb r3, [r4, #7]
	mov sb, r3
	ldrb r3, [r4, #8]
	mov r4, sb
	orrs r3, r4
	str r3, [sp]
	mov r4, sl
	ldrb r3, [r4, #5]
	lsrs r3, r3, #3
	str r3, [sp, #4]
	ldrb r3, [r4, #1]
	str r3, [sp, #8]
	movs r3, #0
	mov sb, r3
	str r3, [sp, #0xc]
	ldr r3, [sp, #0x1c]
	bl sub_0802B91C
	ldr r3, _0802AD2C @ =gUnknown_08090BA4
	ldr r2, [r3]
	ldrb r1, [r4]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r4, [r0, #0xb]
	cmp r4, #0
	beq _0802AD38
	ldr r0, _0802AD30 @ =gUnknown_081243C4
	movs r4, #0
	ldrsh r3, [r5, r4]
	adds r3, r6, r3
	ldrb r1, [r7, #4]
	adds r3, r3, r1
	ldr r1, _0802AD28 @ =0x000001FF
	ands r3, r1
	ldrb r1, [r7, #5]
	add r1, r8
	movs r2, #0xff
	ands r1, r2
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r1, r2
	str r1, [sp]
	ldr r1, _0802AD34 @ =0x00001352
	str r1, [sp, #4]
	mov r2, sb
	str r2, [sp, #8]
	movs r1, #3
	movs r2, #1
	bl sub_0801C7DC
	b _0802AD66
	.align 2, 0
_0802AD18: .4byte gUnknown_0810E6E0
_0802AD1C: .4byte gUnknown_08499598
_0802AD20: .4byte gUnknown_0849A2A6
_0802AD24: .4byte gUnknown_0849A284
_0802AD28: .4byte 0x000001FF
_0802AD2C: .4byte gUnknown_08090BA4
_0802AD30: .4byte gUnknown_081243C4
_0802AD34: .4byte 0x00001352
_0802AD38:
	ldr r0, _0802ADF4 @ =gUnknown_081243C4
	movs r1, #0
	ldrsh r3, [r5, r1]
	adds r3, r6, r3
	ldrb r2, [r7, #4]
	adds r3, r3, r2
	ldr r1, _0802ADF8 @ =0x000001FF
	ands r3, r1
	ldrb r1, [r7, #5]
	add r1, r8
	movs r2, #0xff
	ands r1, r2
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r1, r2
	str r1, [sp]
	ldr r1, _0802ADFC @ =0x00001352
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #4
	movs r2, #1
	bl sub_0801C7DC
_0802AD66:
	ldr r4, _0802AE00 @ =gUnknown_08090BA8
	ldr r0, [r4]
	ldrh r0, [r0]
	ldr r5, _0802AE04 @ =gUnknown_08499594
	ldr r2, [r5]
	mov r3, sl
	subs r2, r3, r2
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r2, r1, #4
	adds r1, r1, r2
	lsls r2, r1, #8
	adds r1, r1, r2
	lsls r2, r1, #0x10
	adds r1, r1, r2
	rsbs r1, r1, #0
	asrs r1, r1, #8
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_08026F28
	lsls r0, r0, #0x18
	adds r7, r4, #0
	cmp r0, #0
	bne _0802AE10
	ldr r1, [r5]
	mov r4, sl
	subs r1, r4, r1
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
	bl sub_08043050
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0802AE10
	ldr r2, _0802AE08 @ =gUnknown_0849A2A6
	ldr r0, [sp, #0x48]
	asrs r1, r0, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r2, #2
	adds r0, r0, r2
	ldr r2, [sp, #0x3c]
	asrs r1, r2, #0x10
	ldrh r0, [r0]
	adds r1, r1, r0
	ldr r2, _0802AE0C @ =gUnknown_0849A284
	ldrb r0, [r2, #6]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r2, #7]
	ldr r3, [sp, #0x10]
	adds r1, r1, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_0802BB74
	b _0802AE6E
	.align 2, 0
_0802ADF4: .4byte gUnknown_081243C4
_0802ADF8: .4byte 0x000001FF
_0802ADFC: .4byte 0x00001352
_0802AE00: .4byte gUnknown_08090BA8
_0802AE04: .4byte gUnknown_08499594
_0802AE08: .4byte gUnknown_0849A2A6
_0802AE0C: .4byte gUnknown_0849A284
_0802AE10:
	ldr r2, _0802AE5C @ =gUnknown_0849A2A6
	ldr r4, [sp, #0x48]
	asrs r1, r4, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r2, #2
	adds r0, r0, r2
	ldr r2, [sp, #0x3c]
	asrs r1, r2, #0x10
	ldrh r0, [r0]
	adds r1, r1, r0
	ldr r2, _0802AE60 @ =gUnknown_0849A284
	ldrb r0, [r2, #6]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldrb r0, [r2, #7]
	ldr r3, [sp, #0x10]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r4, sl
	ldrb r1, [r4, #4]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _0802AE64
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r0, #1
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	b _0802AE66
	.align 2, 0
_0802AE5C: .4byte gUnknown_0849A2A6
_0802AE60: .4byte gUnknown_0849A284
_0802AE64:
	movs r2, #0
_0802AE66:
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0802BAFC
_0802AE6E:
	ldr r4, _0802AF50 @ =gUnknown_0849A2A6
	ldr r0, [sp, #0x48]
	asrs r1, r0, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	str r0, [sp, #0x30]
	adds r0, r4, #2
	ldr r1, [sp, #0x30]
	adds r6, r1, r0
	ldrh r0, [r6]
	ldr r2, [sp, #0x3c]
	asrs r2, r2, #0x10
	mov sb, r2
	ldr r3, _0802AF54 @ =gUnknown_0849A284
	mov r8, r3
	add r0, sb
	ldrb r1, [r3, #8]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r3, #9]
	ldr r2, [sp, #0x10]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r3, sl
	ldrb r2, [r3, #6]
	lsls r2, r2, #0x19
	lsrs r2, r2, #0x19
	bl sub_0802BAFC
	mov r1, sl
	ldrb r0, [r1]
	movs r5, #0x5c
	muls r0, r5, r0
	ldr r2, _0802AF58 @ =gUnknown_085D5ABC
	adds r0, r0, r2
	ldrb r0, [r0, #0xb]
	cmp r0, #0
	beq _0802AEE6
	ldrh r0, [r6]
	add r0, sb
	mov r3, r8
	ldrb r3, [r3, #0xa]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r2, r8
	ldrb r1, [r2, #0xb]
	ldr r3, [sp, #0x10]
	adds r1, r1, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r3, sl
	ldrh r2, [r3, #4]
	lsls r2, r2, #0x15
	lsrs r2, r2, #0x1c
	bl sub_0802BAFC
_0802AEE6:
	mov r1, sl
	ldrb r0, [r1]
	ldr r1, [r7]
	ldrh r1, [r1]
	ldr r2, _0802AF5C @ =gUnknown_08499594
	ldr r3, [r2]
	mov r2, sl
	subs r3, r2, r3
	lsls r2, r3, #2
	adds r2, r2, r3
	lsls r3, r2, #4
	adds r2, r2, r3
	lsls r3, r2, #8
	adds r2, r2, r3
	lsls r3, r2, #0x10
	adds r2, r2, r3
	rsbs r2, r2, #0
	asrs r2, r2, #8
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl sub_0802706C
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0
	beq _0802AFB0
	mov r3, sl
	ldrb r0, [r3]
	muls r0, r5, r0
	ldr r1, _0802AF58 @ =gUnknown_085D5ABC
	adds r1, #0x14
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #1
	bne _0802AF64
	adds r0, r4, #4
	ldr r4, [sp, #0x30]
	adds r0, r4, r0
	ldrh r0, [r0]
	add r0, sb
	mov r1, r8
	ldrb r1, [r1, #0xc]
	adds r0, r0, r1
	ldr r2, _0802AF60 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	mov r3, r8
	ldrb r1, [r3, #0xd]
	ldr r4, [sp, #0x10]
	adds r1, r1, r4
	b _0802AFA0
	.align 2, 0
_0802AF50: .4byte gUnknown_0849A2A6
_0802AF54: .4byte gUnknown_0849A284
_0802AF58: .4byte gUnknown_085D5ABC
_0802AF5C: .4byte gUnknown_08499594
_0802AF60: .4byte 0x000001FF
_0802AF64:
	adds r4, #4
	ldr r0, [sp, #0x30]
	adds r4, r0, r4
	ldrh r0, [r4]
	add r0, sb
	mov r1, r8
	ldrb r1, [r1, #0xe]
	adds r0, r0, r1
	ldr r2, _0802AFAC @ =0x000001FF
	adds r5, r2, #0
	ands r0, r5
	mov r3, r8
	ldrb r1, [r3, #0xf]
	ldr r2, [sp, #0x10]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #2
	bl sub_0802B8C4
	ldrh r0, [r4]
	add r0, sb
	mov r3, r8
	ldrb r3, [r3, #0x10]
	adds r0, r0, r3
	ands r0, r5
	mov r4, r8
	ldrb r1, [r4, #0x11]
	ldr r2, [sp, #0x10]
	adds r1, r1, r2
_0802AFA0:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #1
	bl sub_0802B8C4
	b _0802B09C
	.align 2, 0
_0802AFAC: .4byte 0x000001FF
_0802AFB0:
	mov r3, sl
	ldrb r6, [r3, #8]
	cmp r6, #0
	beq _0802B04C
	ldrb r1, [r3, #7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r2, _0802B044 @ =gUnknown_08499594
	ldr r1, [r2]
	adds r3, r1, r0
	adds r5, r4, #4
	ldr r4, [sp, #0x30]
	adds r5, r4, r5
	ldrh r0, [r5]
	add r0, sb
	mov r1, r8
	ldrb r1, [r1, #0xe]
	adds r0, r0, r1
	ldr r2, _0802B048 @ =0x000001FF
	adds r6, r2, #0
	ands r0, r6
	mov r4, r8
	ldrb r1, [r4, #0xf]
	ldr r2, [sp, #0x10]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrb r2, [r3]
	ldrb r4, [r3, #7]
	ldrb r3, [r3, #8]
	orrs r3, r4
	str r3, [sp]
	str r7, [sp, #4]
	str r7, [sp, #8]
	movs r3, #1
	str r3, [sp, #0xc]
	ldr r3, [sp, #0x1c]
	bl sub_0802B91C
	mov r3, sl
	ldrb r1, [r3, #8]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _0802B044 @ =gUnknown_08499594
	ldr r1, [r4]
	adds r3, r1, r0
	ldrh r0, [r5]
	add r0, sb
	mov r1, r8
	ldrb r1, [r1, #0x10]
	adds r0, r0, r1
	ands r0, r6
	mov r2, r8
	ldrb r1, [r2, #0x11]
	ldr r4, [sp, #0x10]
	adds r1, r1, r4
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrb r2, [r3]
	ldrb r4, [r3, #7]
	ldrb r3, [r3, #8]
	orrs r3, r4
	str r3, [sp]
	str r7, [sp, #4]
	str r7, [sp, #8]
	movs r3, #2
	str r3, [sp, #0xc]
	ldr r3, [sp, #0x1c]
	bl sub_0802B91C
	b _0802B09C
	.align 2, 0
_0802B044: .4byte gUnknown_08499594
_0802B048: .4byte 0x000001FF
_0802B04C:
	mov r1, sl
	ldrb r0, [r1, #7]
	cmp r0, #0
	beq _0802B09C
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r2, _0802B10C @ =gUnknown_08499594
	ldr r1, [r2]
	adds r3, r1, r0
	adds r0, r4, #4
	ldr r4, [sp, #0x30]
	adds r0, r4, r0
	ldrh r0, [r0]
	add r0, sb
	mov r1, r8
	ldrb r1, [r1, #0xc]
	adds r0, r0, r1
	ldr r2, _0802B110 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	mov r4, r8
	ldrb r1, [r4, #0xd]
	ldr r2, [sp, #0x10]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrb r2, [r3]
	ldrb r4, [r3, #7]
	ldrb r3, [r3, #8]
	orrs r3, r4
	str r3, [sp]
	str r6, [sp, #4]
	str r6, [sp, #8]
	movs r3, #1
	str r3, [sp, #0xc]
	ldr r3, [sp, #0x1c]
	bl sub_0802B91C
_0802B09C:
	mov r3, sl
	ldrb r0, [r3, #5]
	lsrs r0, r0, #3
	ldr r4, [sp, #0x18]
	subs r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x18]
_0802B0AC:
	ldr r0, [sp, #0x3c]
	asrs r4, r0, #0x10
	ldr r1, [sp, #0x40]
	asrs r5, r1, #0x10
	ldr r2, [sp, #0x48]
	asrs r6, r2, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_0802B4D4
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_0802B3AC
	ldr r2, _0802B114 @ =gDispIo
	ldrb r0, [r2, #1]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r7, _0802B118 @ =gUnknown_03002B40
	movs r1, #0
	strb r1, [r7]
	ldr r5, _0802B11C @ =gUnknown_08090BAC
	ldr r0, [r5]
	strb r1, [r0]
	ldr r3, _0802B120 @ =gUnknown_08090BB0
	ldr r2, [r3]
	ldr r0, [sp, #0x44]
	lsrs r1, r0, #0xf
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r2
	ldrh r0, [r1]
	adds r0, #1
	adds r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r6, r4, #0x10
	asrs r4, r4, #0x10
	adds r1, r3, #0
	cmp r4, #0xef
	ble _0802B124
	movs r0, #0xef
	strb r0, [r7]
	b _0802B12A
	.align 2, 0
_0802B10C: .4byte gUnknown_08499594
_0802B110: .4byte 0x000001FF
_0802B114: .4byte gDispIo
_0802B118: .4byte gUnknown_03002B40
_0802B11C: .4byte gUnknown_08090BAC
_0802B120: .4byte gUnknown_08090BB0
_0802B124:
	cmp r4, #0
	ble _0802B12A
	strb r6, [r7]
_0802B12A:
	ldr r2, [sp, #0x3c]
	asrs r3, r2, #0x10
	ldr r4, [r1]
	ldr r0, [sp, #0x44]
	lsrs r2, r0, #0xf
	ldr r0, [sp, #0x48]
	asrs r1, r0, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r2, r0
	adds r0, r0, r4
	adds r3, #1
	ldrh r0, [r0]
	adds r3, r3, r0
	ldr r0, _0802B164 @ =gUnknown_0849A2A0
	adds r2, r2, r0
	ldrh r0, [r2]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xef
	ble _0802B168
	ldr r1, [r5]
	movs r0, #0xef
	strb r0, [r1]
	b _0802B170
	.align 2, 0
_0802B164: .4byte gUnknown_0849A2A0
_0802B168:
	cmp r0, #0
	ble _0802B170
	ldr r0, [r5]
	strb r6, [r0]
_0802B170:
	ldr r0, _0802B26C @ =gUnknown_03002EFC
	mov r1, sp
	ldrb r1, [r1, #0x10]
	strb r1, [r0]
	ldr r1, _0802B270 @ =gUnknown_03002B44
	ldr r0, [sp, #0x10]
	adds r0, #0x38
	strb r0, [r1]
	ldr r2, _0802B274 @ =gUnknown_030030A4
	ldrb r0, [r2]
	movs r3, #1
	mov r8, r3
	mov r4, r8
	orrs r0, r4
	movs r6, #2
	orrs r0, r6
	movs r5, #4
	orrs r0, r5
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	ldr r2, _0802B278 @ =gUnknown_030030DC
	ldrb r0, [r2]
	mov r1, r8
	orrs r0, r1
	orrs r0, r6
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2]
	movs r6, #0
	ldr r2, [sp, #0x34]
	asrs r4, r2, #0x10
	ldr r3, [sp, #0x38]
	asrs r5, r3, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0803DF54
	cmp r0, #0
	beq _0802B1D2
	ldrb r6, [r0, #4]
_0802B1D2:
	ldr r2, _0802B27C @ =gUnknown_020288B4
	ldr r0, _0802B280 @ =gUnknown_08499590
	ldr r0, [r0]
	lsls r1, r5, #1
	ldr r3, _0802B284 @ =0x0000417A
	adds r0, r0, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, r0, r4
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _0802B1EE
	adds r6, r0, #0
_0802B1EE:
	lsls r0, r6, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	beq _0802B2A0
	ldr r0, _0802B288 @ =gUnknown_081243C4
	ldr r1, [sp, #0x3c]
	asrs r7, r1, #0x10
	ldr r3, _0802B28C @ =gUnknown_0849A2A6
	ldr r1, [sp, #0x48]
	asrs r2, r1, #0x10
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r6, r1, r3
	movs r2, #0
	ldrsh r3, [r6, r2]
	ldr r5, _0802B290 @ =gUnknown_0849A284
	adds r3, r7, r3
	ldrb r1, [r5, #0x16]
	adds r3, r3, r1
	ldr r1, _0802B294 @ =0x000001FF
	ands r3, r1
	ldr r2, [sp, #0x40]
	asrs r1, r2, #0x10
	ldrb r2, [r5, #0x17]
	adds r1, r1, r2
	movs r2, #0xff
	ands r1, r2
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r1, r2
	str r1, [sp]
	ldr r1, _0802B298 @ =0x00001352
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #2
	movs r2, #1
	bl sub_0801C7DC
	ldr r0, _0802B29C @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #0x1e
	bl __umodsi3
	cmp r0, #9
	bhi _0802B24E
	b _0802B386
_0802B24E:
	ldrh r0, [r6]
	adds r0, r0, r7
	ldrb r3, [r5, #0x1a]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r5, #0x1b]
	ldr r2, [sp, #0x10]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r2, r4, #0
	bl sub_0802BAFC
	b _0802B386
	.align 2, 0
_0802B26C: .4byte gUnknown_03002EFC
_0802B270: .4byte gUnknown_03002B44
_0802B274: .4byte gUnknown_030030A4
_0802B278: .4byte gUnknown_030030DC
_0802B27C: .4byte gUnknown_020288B4
_0802B280: .4byte gUnknown_08499590
_0802B284: .4byte 0x0000417A
_0802B288: .4byte gUnknown_081243C4
_0802B28C: .4byte gUnknown_0849A2A6
_0802B290: .4byte gUnknown_0849A284
_0802B294: .4byte 0x000001FF
_0802B298: .4byte 0x00001352
_0802B29C: .4byte gUnknown_03004008
_0802B2A0:
	ldr r3, [sp, #0x18]
	lsls r0, r3, #0x10
	asrs r7, r0, #0x10
	cmp r7, #0
	beq _0802B340
	ldr r0, _0802B328 @ =gUnknown_081243C4
	ldr r1, [sp, #0x3c]
	asrs r1, r1, #0x10
	mov r8, r1
	ldr r3, _0802B32C @ =gUnknown_0849A2A6
	ldr r1, [sp, #0x48]
	asrs r2, r1, #0x10
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r6, r1, r3
	movs r2, #0
	ldrsh r3, [r6, r2]
	ldr r5, _0802B330 @ =gUnknown_0849A284
	add r3, r8
	ldrb r1, [r5, #0x16]
	adds r3, r3, r1
	ldr r1, _0802B334 @ =0x000001FF
	ands r3, r1
	ldr r2, [sp, #0x40]
	asrs r1, r2, #0x10
	ldrb r2, [r5, #0x17]
	adds r1, r1, r2
	movs r2, #0xff
	ands r1, r2
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r1, r2
	str r1, [sp]
	ldr r1, _0802B338 @ =0x00001352
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r2, #1
	bl sub_0801C7DC
	subs r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x12
	bhi _0802B30A
	ldr r0, _0802B33C @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #0x1e
	bl __umodsi3
	cmp r0, #9
	bls _0802B386
_0802B30A:
	ldrh r0, [r6]
	add r0, r8
	ldrb r3, [r5, #0x1a]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r5, #0x1b]
	ldr r4, [sp, #0x10]
	adds r1, r1, r4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r2, r7, #0
	bl sub_0802BAFC
	b _0802B386
	.align 2, 0
_0802B328: .4byte gUnknown_081243C4
_0802B32C: .4byte gUnknown_0849A2A6
_0802B330: .4byte gUnknown_0849A284
_0802B334: .4byte 0x000001FF
_0802B338: .4byte 0x00001352
_0802B33C: .4byte gUnknown_03004008
_0802B340:
	ldr r0, _0802B398 @ =gUnknown_081243C4
	ldr r1, [sp, #0x3c]
	asrs r3, r1, #0x10
	ldr r4, _0802B39C @ =gUnknown_0849A2A6
	ldr r1, [sp, #0x48]
	asrs r2, r1, #0x10
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r2, #0
	ldrsh r1, [r1, r2]
	ldr r2, _0802B3A0 @ =gUnknown_0849A284
	adds r3, r3, r1
	ldrb r4, [r2, #0x16]
	adds r3, r3, r4
	ldr r1, _0802B3A4 @ =0x000001FF
	ands r3, r1
	ldr r4, [sp, #0x40]
	asrs r1, r4, #0x10
	ldrb r2, [r2, #0x17]
	adds r1, r1, r2
	movs r2, #0xff
	ands r1, r2
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r1, r2
	str r1, [sp]
	ldr r1, _0802B3A8 @ =0x00001352
	str r1, [sp, #4]
	str r7, [sp, #8]
	movs r1, #0
	movs r2, #1
	bl sub_0801C7DC
_0802B386:
	add sp, #0x4c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B398: .4byte gUnknown_081243C4
_0802B39C: .4byte gUnknown_0849A2A6
_0802B3A0: .4byte gUnknown_0849A284
_0802B3A4: .4byte 0x000001FF
_0802B3A8: .4byte 0x00001352

