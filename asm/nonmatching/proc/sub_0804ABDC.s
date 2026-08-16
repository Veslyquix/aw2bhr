	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804ABDC
sub_0804ABDC: @ 0x0804ABDC
	push {r4, r5, r6, r7, lr}
	ldr r1, _0804AC84 @ =gUnknown_0812A290
	ldr r4, [r1]
	ldr r2, [r4]
	adds r0, r2, #0
	adds r0, #0x62
	ldrb r0, [r0]
	adds r7, r1, #0
	cmp r0, #0
	bne _0804ABF2
	b _0804AD92
_0804ABF2:
	movs r0, #0x20
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	ldrb r2, [r2, #0x1e]
	adds r0, r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0804A18C
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, [r4]
	movs r2, #0x22
	ldrsh r0, [r1, r2]
	cmp r0, #0x78
	ble _0804AC18
	movs r0, #0
	strh r0, [r1, #0x22]
_0804AC18:
	ldr r0, [r4]
	movs r3, #0x22
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bge _0804AC24
	adds r0, #3
_0804AC24:
	asrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	lsls r5, r0, #1
	ldr r4, _0804AC88 @ =gUnknown_0812A294
	ldr r0, [r4]
	adds r0, r5, r0
	ldr r1, _0804AC8C @ =0x000002FE
	movs r2, #2
	bl sub_08013664
	cmp r6, #0x40
	beq _0804AC4A
	cmp r6, #0x24
	beq _0804AC4A
	cmp r6, #0x25
	beq _0804AC4A
	cmp r6, #0x23
	bne _0804AC6E
_0804AC4A:
	movs r1, #0
	cmp r6, #0x40
	beq _0804AC5E
	movs r1, #1
	cmp r6, #0x24
	beq _0804AC5E
	movs r1, #2
	cmp r6, #0x25
	beq _0804AC5E
	movs r1, #3
_0804AC5E:
	ldr r0, _0804AC90 @ =gUnknown_08131D8C
	adds r0, r5, r0
	adds r1, #0x10
	lsls r1, r1, #5
	adds r1, #0xc
	movs r2, #2
	bl sub_08013664
_0804AC6E:
	ldr r0, [r7]
	ldr r1, [r0]
	ldrh r2, [r1, #0x24]
	movs r5, #0x24
	ldrsh r0, [r1, r5]
	cmp r0, #0
	beq _0804AC94
	subs r0, r2, #1
	strh r0, [r1, #0x24]
	b _0804AC9A
	.align 2, 0
_0804AC84: .4byte gUnknown_0812A290
_0804AC88: .4byte gUnknown_0812A294
_0804AC8C: .4byte 0x000002FE
_0804AC90: .4byte gUnknown_08131D8C
_0804AC94:
	ldrh r0, [r1, #0x22]
	adds r0, #1
	strh r0, [r1, #0x22]
_0804AC9A:
	ldr r2, [r7]
	ldr r1, [r2]
	movs r3, #0x26
	ldrsh r0, [r1, r3]
	cmp r0, #0x78
	ble _0804ACAA
	movs r0, #0
	strh r0, [r1, #0x26]
_0804ACAA:
	ldr r2, [r2]
	movs r5, #0x26
	ldrsh r0, [r2, r5]
	cmp r0, #0
	bge _0804ACB6
	adds r0, #3
_0804ACB6:
	asrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	lsls r5, r0, #1
	adds r0, r2, #0
	adds r0, #0x65
	ldrb r1, [r0]
	subs r0, #5
	ldrb r0, [r0]
	subs r0, #2
	cmp r1, r0
	bgt _0804ACDE
	adds r0, r2, #0
	adds r0, #0x5d
	ldrb r1, [r0]
	adds r0, #2
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	ble _0804ACF4
_0804ACDE:
	ldr r0, _0804ACEC @ =gUnknown_08131DEC
	adds r0, r5, r0
	ldr r1, _0804ACF0 @ =0x0000029E
	movs r2, #2
	bl sub_08013664
	b _0804AD00
	.align 2, 0
_0804ACEC: .4byte gUnknown_08131DEC
_0804ACF0: .4byte 0x0000029E
_0804ACF4:
	ldr r0, [r4]
	adds r0, r5, r0
	ldr r1, _0804AD14 @ =0x0000029E
	movs r2, #2
	bl sub_08013664
_0804AD00:
	ldr r0, [r7]
	ldr r1, [r0]
	ldrh r2, [r1, #0x28]
	movs r3, #0x28
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _0804AD18
	subs r0, r2, #1
	strh r0, [r1, #0x28]
	b _0804AD1E
	.align 2, 0
_0804AD14: .4byte 0x0000029E
_0804AD18:
	ldrh r0, [r1, #0x26]
	adds r0, #1
	strh r0, [r1, #0x26]
_0804AD1E:
	cmp r6, #0x23
	blt _0804AD2C
	ldr r4, _0804ADD0 @ =gUnknown_0812A298
	cmp r6, #0x25
	ble _0804AD5C
	cmp r6, #0x40
	beq _0804AD5C
_0804AD2C:
	ldr r1, _0804ADD4 @ =gUnknown_084C3D5C
	ldr r0, [r7]
	ldr r3, [r0]
	movs r5, #0x1e
	ldrsh r0, [r3, r5]
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r4, _0804ADD0 @ =gUnknown_0812A298
	ldr r1, [r4]
	ldrh r1, [r1]
	subs r1, #0x30
	subs r0, r0, r1
	ldr r1, _0804ADD8 @ =0x000001FF
	ands r0, r1
	ldr r2, _0804ADDC @ =gUnknown_084C3D14
	movs r5, #0x20
	ldrsh r1, [r3, r5]
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r1, #0x30
	ldr r2, _0804ADE0 @ =gUnknown_084C3B72
	ldr r3, _0804ADE4 @ =0x0000701D
	bl sub_0801BD00
_0804AD5C:
	ldr r0, [r7]
	ldr r3, [r0]
	adds r0, r3, #0
	adds r0, #0x65
	ldrb r2, [r0]
	subs r0, #5
	ldrb r0, [r0]
	subs r0, #8
	cmp r2, r0
	ble _0804AD74
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_0804AD74:
	adds r0, r3, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, [r4]
	ldrh r1, [r1]
	subs r0, r0, r1
	ldr r1, _0804ADD8 @ =0x000001FF
	ands r0, r1
	ldr r2, _0804ADE8 @ =gUnknown_0848B688
	ldr r3, _0804ADEC @ =0x0000401E
	movs r1, #0x20
	bl sub_0801BD00
_0804AD92:
	ldr r0, [r7]
	ldr r0, [r0]
	adds r0, #0x5c
	ldrb r0, [r0]
	ldr r4, _0804ADF0 @ =gUnknown_0812A29C
	cmp r0, #0
	beq _0804ADAE
	ldr r2, [r4]
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x7c
	movs r1, #0x80
	bl sub_0801BD00
_0804ADAE:
	ldr r4, [r4]
	ldr r3, _0804ADF4 @ =0x00002008
	movs r0, #0x9e
	movs r1, #0x80
	adds r2, r4, #0
	bl sub_0801BD00
	ldr r3, _0804ADF8 @ =0x00003010
	movs r0, #0xc0
	movs r1, #0x80
	adds r2, r4, #0
	bl sub_0801BD00
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804ADD0: .4byte gUnknown_0812A298
_0804ADD4: .4byte gUnknown_084C3D5C
_0804ADD8: .4byte 0x000001FF
_0804ADDC: .4byte gUnknown_084C3D14
_0804ADE0: .4byte gUnknown_084C3B72
_0804ADE4: .4byte 0x0000701D
_0804ADE8: .4byte gUnknown_0848B688
_0804ADEC: .4byte 0x0000401E
_0804ADF0: .4byte gUnknown_0812A29C
_0804ADF4: .4byte 0x00002008
_0804ADF8: .4byte 0x00003010

