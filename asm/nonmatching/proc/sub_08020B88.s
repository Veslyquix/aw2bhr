	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08020B88
sub_08020B88: @ 0x08020B88
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #8]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #0xc]
	lsls r5, r2, #0x10
	asrs r2, r5, #0x10
	rsbs r0, r5, #0
	lsrs r6, r0, #0x10
	lsrs r0, r1, #0x10
	str r0, [sp, #4]
	asrs r1, r1, #0x10
	subs r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r3, r4, #0x10
	asrs r0, r3, #0x10
	adds r1, r1, r2
	cmp r0, r1
	ble _08020BC8
	b _08020D30
_08020BC8:
	asrs r2, r3, #0x10
	ldr r1, [sp, #8]
	lsls r1, r1, #0x10
	str r1, [sp, #0x18]
	ldr r3, [sp, #4]
	lsls r3, r3, #0x10
	str r3, [sp, #0x14]
	lsls r4, r4, #0x10
	mov sl, r4
	lsls r6, r6, #0x10
	mov sb, r6
	cmp r2, #0
	bge _08020BE4
	b _08020D0C
_08020BE4:
	ldr r0, _08020C0C @ =gUnknown_08499590
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp r2, r0
	blt _08020BF0
	b _08020D0C
_08020BF0:
	ldr r0, [sp]
	lsls r2, r0, #0x10
	asrs r1, r2, #0x10
	asrs r0, r5, #0x10
	subs r1, r1, r0
	asrs r0, r6, #0x10
	str r2, [sp, #0x10]
	cmp r0, #0
	bge _08020C04
	rsbs r0, r0, #0
_08020C04:
	adds r0, r1, r0
	lsls r0, r0, #0x10
	b _08020CE8
	.align 2, 0
_08020C0C: .4byte gUnknown_08499590
_08020C10:
	cmp r6, #0
	blt _08020CDE
	ldr r4, _08020C80 @ =gUnknown_08499590
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r6, r0
	bge _08020CDE
	mov r1, sl
	asrs r7, r1, #0x10
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_0803DF54
	adds r3, r0, #0
	ldr r2, _08020C84 @ =gUnknown_020288B4
	ldr r4, [r4]
	lsls r1, r7, #1
	ldr r5, _08020C88 @ =0x0000417A
	adds r0, r4, r5
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r1, r0, r6
	adds r2, r1, r2
	ldrb r2, [r2]
	movs r0, #0
	cmp r3, #0
	beq _08020C4C
	ldrh r0, [r3, #2]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1c
_08020C4C:
	cmp r2, #0
	beq _08020C52
	movs r0, #6
_08020C52:
	cmp r0, #0
	beq _08020C9C
	ldr r0, _08020C8C @ =gUnknown_03003F38
	ldrb r0, [r0]
	movs r1, #0
	ldr r2, _08020C90 @ =gUnknown_03003100
	bl sub_080251BC
	ldr r0, _08020C94 @ =gUnknown_030013D0
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08020CDE
	ldr r0, _08020C98 @ =gUnknown_03003340
	lsls r1, r7, #2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, r0, r6
	mov r2, sp
	ldrb r2, [r2, #0xc]
	strb r2, [r0]
	b _08020CDE
	.align 2, 0
_08020C80: .4byte gUnknown_08499590
_08020C84: .4byte gUnknown_020288B4
_08020C88: .4byte 0x0000417A
_08020C8C: .4byte gUnknown_03003F38
_08020C90: .4byte gUnknown_03003100
_08020C94: .4byte gUnknown_030013D0
_08020C98: .4byte gUnknown_03003340
_08020C9C:
	adds r0, r4, #0
	adds r0, #0x12
	adds r0, r0, r1
	ldrb r4, [r0]
	cmp r4, #0
	beq _08020CDE
	ldr r5, _08020D40 @ =gUnknown_03003F38
	ldrb r0, [r5]
	adds r1, r4, #0
	bl sub_08026F9C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08020CDE
	ldrb r0, [r5]
	adds r1, r4, #0
	ldr r2, _08020D44 @ =gUnknown_03003100
	bl sub_080251BC
	ldr r0, _08020D48 @ =gUnknown_030013D0
	movs r3, #0x18
	ldrsh r0, [r0, r3]
	cmp r0, #0
	beq _08020CDE
	ldr r0, _08020D4C @ =gUnknown_03003340
	lsls r1, r7, #2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, r0, r6
	mov r5, sp
	ldrb r5, [r5, #0xc]
	strb r5, [r0]
_08020CDE:
	mov r1, r8
	lsls r0, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
_08020CE8:
	lsrs r0, r0, #0x10
	mov r8, r0
	mov r3, r8
	lsls r0, r3, #0x10
	asrs r6, r0, #0x10
	ldr r5, [sp, #0x10]
	asrs r1, r5, #0x10
	ldr r2, [sp, #0x18]
	asrs r0, r2, #0x10
	adds r1, r1, r0
	mov r3, sb
	asrs r0, r3, #0x10
	cmp r0, #0
	bge _08020D06
	rsbs r0, r0, #0
_08020D06:
	subs r0, r1, r0
	cmp r6, r0
	ble _08020C10
_08020D0C:
	movs r0, #0x80
	lsls r0, r0, #9
	add r0, sl
	lsrs r4, r0, #0x10
	movs r0, #0x80
	lsls r0, r0, #9
	add r0, sb
	lsrs r6, r0, #0x10
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	ldr r5, [sp, #0x14]
	asrs r1, r5, #0x10
	ldr r5, [sp, #0x18]
	asrs r0, r5, #0x10
	adds r1, r1, r0
	cmp r2, r1
	bgt _08020D30
	b _08020BC8
_08020D30:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08020D40: .4byte gUnknown_03003F38
_08020D44: .4byte gUnknown_03003100
_08020D48: .4byte gUnknown_030013D0
_08020D4C: .4byte gUnknown_03003340

