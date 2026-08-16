	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08086CE0
sub_08086CE0: @ 0x08086CE0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	adds r4, r1, #0
	mov r8, r2
	ldr r5, _08086D50 @ =gUnknown_02027F74
	adds r0, r5, #0
	adds r0, #0x37
	ldrb r0, [r0]
	cmp r0, r4
	bge _08086CFC
	adds r4, r0, #1
_08086CFC:
	bl sub_08013AEC
	cmp r4, #2
	ble _08086D88
	cmp r4, #2
	ble _08086D88
	movs r7, #4
	adds r0, r5, r6
	adds r5, r0, #6
	subs r6, r4, #2
_08086D10:
	ldrb r0, [r5]
	bl sub_0803CB24
	lsls r0, r0, #0x18
	movs r4, #1
	cmp r0, #0
	beq _08086D20
	movs r4, #0
_08086D20:
	ldrb r0, [r5]
	cmp r0, #0xb3
	bhi _08086D5C
	bl sub_0803CA54
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _08086D5C
	mov r1, r8
	adds r1, #9
	adds r1, r7, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, _08086D54 @ =gUnknown_08499578
	ldr r2, [r0]
	str r3, [sp]
	str r4, [sp, #4]
	movs r0, #1
	ldr r3, _08086D58 @ =gUnknown_084C3F50
	bl sub_080149C0
	b _08086D7E
	.align 2, 0
_08086D50: .4byte gUnknown_02027F74
_08086D54: .4byte gUnknown_08499578
_08086D58: .4byte gUnknown_084C3F50
_08086D5C:
	ldrb r0, [r5]
	bl sub_08024944
	adds r3, r0, #0
	mov r1, r8
	adds r1, #9
	adds r1, r7, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, _08086D94 @ =gUnknown_08499578
	ldr r2, [r0]
	movs r0, #0
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #1
	bl sub_080149C0
_08086D7E:
	adds r7, #2
	adds r5, #1
	subs r6, #1
	cmp r6, #0
	bne _08086D10
_08086D88:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086D94: .4byte gUnknown_08499578

