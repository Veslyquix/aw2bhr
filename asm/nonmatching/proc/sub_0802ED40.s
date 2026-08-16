	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802ED40
sub_0802ED40: @ 0x0802ED40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	movs r0, #0
	mov r8, r0
	ldr r0, _0802EE34 @ =gUnknown_02023894
	movs r6, #1
	str r6, [r0]
	ldr r3, _0802EE38 @ =gUnknown_08090C68
	ldr r5, [r3]
	ldr r0, [r5]
	ldrb r1, [r0, #0x1a]
	mov r1, r8
	strb r1, [r0, #0x1a]
	ldr r2, _0802EE3C @ =gUnknown_08090C6C
	ldr r0, [r2]
	str r6, [r0]
	ldr r0, _0802EE40 @ =0x0400010E
	mov r1, r8
	strh r1, [r0]
	ldr r4, [r5]
	ldr r1, _0802EE44 @ =gUnknown_0300056C
	ldr r7, _0802EE48 @ =0x04000128
	ldrh r0, [r7]
	strh r0, [r1]
	ldrh r0, [r1]
	ldrh r1, [r4, #2]
	strh r0, [r4, #2]
	ldrh r0, [r4, #4]
	mov sl, r3
	cmp r0, #6
	beq _0802ED92
	ldrh r0, [r4, #2]
	lsrs r0, r0, #4
	movs r1, #3
	ands r0, r1
	ldrb r1, [r4, #6]
	strb r0, [r4, #6]
_0802ED92:
	ldr r0, _0802EE4C @ =0x04000120
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _0802EE50 @ =gUnknown_03000560
	ldr r0, [r0]
	movs r2, #0xc0
	lsls r2, r2, #7
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7]
	ldr r1, _0802EE54 @ =0x0400012A
	ldr r3, _0802EE58 @ =0x00007FFF
	adds r0, r3, #0
	strh r0, [r1]
	ldr r1, _0802EE5C @ =gUnknown_03000570
	ldr r0, [r1]
	cmp r0, #0
	bne _0802EDBC
	b _0802F012
_0802EDBC:
	movs r0, #2
	str r0, [r1]
	ldr r2, [r5]
	ldrb r0, [r2, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r6, #0
	lsls r1, r0
	ldrb r0, [r2, #8]
	strb r1, [r2, #8]
	movs r4, #0
	ldr r0, _0802EE60 @ =0x0000FFFF
	mov sb, r0
	mov r5, sp
	movs r7, #0
_0802EDDA:
	ldrh r0, [r5]
	cmp r0, sb
	beq _0802EE04
	mov r1, sl
	ldr r2, [r1]
	ldr r0, [r2]
	adds r0, #0xa
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	bne _0802EDF6
	ldrb r0, [r1]
	movs r0, #1
	strb r0, [r1]
_0802EDF6:
	ldr r2, [r2]
	movs r1, #1
	lsls r1, r4
	ldrb r0, [r2, #8]
	orrs r1, r0
	ldrb r0, [r2, #8]
	strb r1, [r2, #8]
_0802EE04:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	bl sub_0802F460
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0802EE70
	mov r2, sl
	ldr r0, [r2]
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0xe
	adds r0, r0, r7
	ldrh r0, [r0]
	cmp r0, sb
	bne _0802EE64
	adds r0, r1, #0
	adds r0, #0x16
	adds r0, r0, r4
	ldrb r1, [r0]
	adds r1, #1
	ldrb r2, [r0]
	b _0802EE6E
	.align 2, 0
_0802EE34: .4byte gUnknown_02023894
_0802EE38: .4byte gUnknown_08090C68
_0802EE3C: .4byte gUnknown_08090C6C
_0802EE40: .4byte 0x0400010E
_0802EE44: .4byte gUnknown_0300056C
_0802EE48: .4byte 0x04000128
_0802EE4C: .4byte 0x04000120
_0802EE50: .4byte gUnknown_03000560
_0802EE54: .4byte 0x0400012A
_0802EE58: .4byte 0x00007FFF
_0802EE5C: .4byte gUnknown_03000570
_0802EE60: .4byte 0x0000FFFF
_0802EE64:
	adds r0, r1, #0
	adds r0, #0x16
	adds r0, r0, r4
	ldrb r1, [r0]
	movs r1, #0
_0802EE6E:
	strb r1, [r0]
_0802EE70:
	mov r3, sl
	ldr r0, [r3]
	ldr r6, [r0]
	adds r0, r6, #0
	adds r0, #0xe
	adds r0, r0, r7
	ldrh r1, [r5]
	ldrh r2, [r0]
	strh r1, [r0]
	ldr r2, _0802EED0 @ =gUnknown_03003F48
	adds r2, r7, r2
	ldrh r0, [r2]
	lsls r0, r0, #3
	adds r0, r7, r0
	ldr r1, _0802EED4 @ =gUnknown_02025C18
	adds r0, r0, r1
	ldrh r1, [r5]
	ldrh r3, [r0]
	strh r1, [r0]
	ldrh r0, [r2]
	adds r0, #1
	ldrh r1, [r2]
	strh r0, [r2]
	ldrh r1, [r2]
	ldr r3, _0802EED8 @ =0x000003FF
	adds r0, r3, #0
	ands r1, r0
	ldrh r0, [r2]
	strh r1, [r2]
	adds r5, #2
	adds r7, #2
	adds r4, #1
	cmp r4, #3
	ble _0802EDDA
	adds r1, r6, #0
	ldrh r0, [r1, #4]
	cmp r0, #4
	bhi _0802EEBE
	b _0802F012
_0802EEBE:
	ldrb r0, [r1, #1]
	cmp r0, #2
	beq _0802EF54
	cmp r0, #2
	bgt _0802EEDC
	cmp r0, #1
	beq _0802EEE2
	b _0802F012
	.align 2, 0
_0802EED0: .4byte gUnknown_03003F48
_0802EED4: .4byte gUnknown_02025C18
_0802EED8: .4byte 0x000003FF
_0802EEDC:
	cmp r0, #3
	beq _0802EFB8
	b _0802F012
_0802EEE2:
	ldr r0, _0802EF38 @ =gUnknown_0300410C
	ldr r3, _0802EF3C @ =gUnknown_030040CC
	ldrh r1, [r0]
	ldrh r0, [r3]
	cmp r1, r0
	beq _0802EF10
	ldr r1, _0802EF40 @ =gUnknown_02025818
	ldrh r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	add r0, sp, #8
	strh r1, [r0]
	ldrh r1, [r3]
	adds r1, #1
	strh r1, [r3]
	ldrh r2, [r3]
	ldr r1, _0802EF44 @ =0x000001FF
	ands r1, r2
	strh r1, [r3]
	movs r1, #1
	bl sub_0802F8FC
_0802EF10:
	ldr r0, _0802EF48 @ =gUnknown_03000564
	ldr r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, r1
	bne _0802F012
	ldr r0, _0802EF4C @ =gUnknown_0300055C
	ldr r0, [r0]
	cmp r0, #0
	bne _0802F012
	ldr r0, _0802EF50 @ =gUnknown_03003F6C
	ldr r1, [r0]
	ldrh r0, [r1, #0xa]
	cmp r0, #0
	beq _0802F012
	bl sub_0802ECEC
	b _0802F012
	.align 2, 0
_0802EF38: .4byte gUnknown_0300410C
_0802EF3C: .4byte gUnknown_030040CC
_0802EF40: .4byte gUnknown_02025818
_0802EF44: .4byte 0x000001FF
_0802EF48: .4byte gUnknown_03000564
_0802EF4C: .4byte gUnknown_0300055C
_0802EF50: .4byte gUnknown_03003F6C
_0802EF54:
	ldrb r0, [r1, #6]
	ldr r6, _0802EFAC @ =gUnknown_08090C70
	cmp r0, #0
	beq _0802EF70
	ldr r4, [r6]
	ldr r0, [r4]
	adds r0, #6
	movs r1, #1
	bl sub_0802F8FC
	ldr r1, [r4]
	ldrh r0, [r1, #6]
	ldr r0, _0802EFB0 @ =0x00005FFF
	strh r0, [r1, #6]
_0802EF70:
	movs r4, #0
	ldr r5, _0802EFB4 @ =gUnknown_0849B01C
	mov r3, sp
_0802EF76:
	ldr r1, [r5]
	lsls r2, r4, #1
	ldrb r0, [r1, #4]
	lsls r0, r0, #3
	adds r2, r2, r0
	adds r1, #8
	adds r1, r1, r2
	ldrh r0, [r3]
	ldrh r2, [r1]
	strh r0, [r1]
	adds r3, #2
	adds r4, #1
	cmp r4, #3
	ble _0802EF76
	ldr r2, [r6]
	ldr r1, [r2]
	ldrb r0, [r1, #4]
	adds r0, #1
	ldrb r3, [r1, #4]
	strb r0, [r1, #4]
	ldr r1, [r2]
	ldrb r2, [r1, #4]
	movs r0, #0x3f
	ands r0, r2
	ldrb r2, [r1, #4]
	strb r0, [r1, #4]
	b _0802F012
	.align 2, 0
_0802EFAC: .4byte gUnknown_08090C70
_0802EFB0: .4byte 0x00005FFF
_0802EFB4: .4byte gUnknown_0849B01C
_0802EFB8:
	ldrb r0, [r6, #6]
	cmp r0, #0
	beq _0802EFD2
	ldr r4, _0802F028 @ =gUnknown_0849B01C
	ldr r0, [r4]
	adds r0, #6
	movs r1, #1
	bl sub_0802F8FC
	ldr r1, [r4]
	ldrh r0, [r1, #6]
	ldr r0, _0802F02C @ =0x00005FFF
	strh r0, [r1, #6]
_0802EFD2:
	movs r4, #0
	ldr r6, _0802F030 @ =0x00009ABC
	mov r5, sp
_0802EFD8:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	bl sub_0802F460
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802EFF6
	ldrh r0, [r5]
	cmp r0, r6
	beq _0802EFF6
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
_0802EFF6:
	adds r5, #2
	adds r4, #1
	cmp r4, #3
	ble _0802EFD8
	mov r0, r8
	cmp r0, #0
	bne _0802F012
	ldr r0, _0802F028 @ =gUnknown_0849B01C
	ldr r0, [r0]
	ldr r1, _0802F034 @ =0x00000212
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r1, #1
	strh r1, [r0]
_0802F012:
	ldr r1, _0802F038 @ =gUnknown_0300333C
	movs r0, #0
	str r0, [r1]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802F028: .4byte gUnknown_0849B01C
_0802F02C: .4byte 0x00005FFF
_0802F030: .4byte 0x00009ABC
_0802F034: .4byte 0x00000212
_0802F038: .4byte gUnknown_0300333C

