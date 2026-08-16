	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08028BAC
sub_08028BAC: @ 0x08028BAC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	movs r5, #1
_08028BB6:
	mov r0, sp
	adds r6, r0, r5
	movs r0, #0
	strb r0, [r6]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08028C04
	lsls r0, r5, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	bl sub_08028904
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08028C04
	adds r0, r5, #0
	bl sub_080289BC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08028C04
	adds r0, r4, #0
	bl sub_08028990
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08028C04
	adds r0, r4, #0
	bl sub_08028944
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08028C04
	movs r0, #1
	strb r0, [r6]
_08028C04:
	adds r5, #1
	cmp r5, #4
	ble _08028BB6
	ldr r0, _08028CB8 @ =gUnknown_03003FC0
	ldrb r1, [r0, #4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08028C6C
	movs r5, #1
_08028C18:
	mov r1, sp
	adds r0, r1, r5
	ldrb r1, [r0]
	adds r7, r0, #0
	adds r0, r5, #1
	mov r8, r0
	cmp r1, #0
	beq _08028C66
	movs r4, #1
	lsls r6, r5, #0x10
_08028C2C:
	cmp r5, r4
	beq _08028C60
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08028C60
	lsls r1, r4, #0x10
	lsrs r1, r1, #0x10
	lsrs r0, r6, #0x10
	bl sub_08026F28
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08028C60
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08028C60
	strb r0, [r7]
	adds r0, r5, #0
	bl sub_0802C154
_08028C60:
	adds r4, #1
	cmp r4, #4
	ble _08028C2C
_08028C66:
	mov r5, r8
	cmp r5, #4
	ble _08028C18
_08028C6C:
	movs r5, #1
	movs r0, #0x3c
	mov r8, r0
_08028C72:
	mov r1, sp
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _08028CC0
	movs r3, #0
	movs r4, #1
	ldr r7, _08028CBC @ =gUnknown_08499598
	mov r6, r8
	movs r2, #0x3c
_08028C86:
	cmp r5, r4
	beq _08028CA8
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08028CA8
	ldr r0, [r7]
	adds r1, r6, r0
	adds r1, #0x2a
	adds r0, r2, r0
	adds r0, #0x2a
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	beq _08028CA8
	adds r3, #1
_08028CA8:
	adds r2, #0x3c
	adds r4, #1
	cmp r4, #4
	ble _08028C86
	cmp r3, #0
	bne _08028CC0
	movs r0, #1
	b _08028CCC
	.align 2, 0
_08028CB8: .4byte gUnknown_03003FC0
_08028CBC: .4byte gUnknown_08499598
_08028CC0:
	movs r0, #0x3c
	add r8, r0
	adds r5, #1
	cmp r5, #4
	ble _08028C72
	movs r0, #0
_08028CCC:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

