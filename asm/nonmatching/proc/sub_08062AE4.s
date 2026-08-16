	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08062AE4
sub_08062AE4: @ 0x08062AE4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	movs r1, #0
_08062AF2:
	movs r0, #0
	mov sb, r0
	lsls r2, r1, #2
	str r2, [sp, #0x10]
	lsls r0, r1, #5
	adds r3, r1, #1
	str r3, [sp, #8]
	adds r0, r0, r1
	lsls r0, r0, #4
	str r0, [sp]
_08062B06:
	movs r6, #0
	mov r8, r6
	movs r7, #0
	ldr r2, [sp, #0x10]
	adds r0, r2, #4
	mov r1, sb
	adds r1, #1
	str r1, [sp, #4]
	cmp r2, r0
	bge _08062BDC
	mov r3, sb
	lsls r3, r3, #2
	str r3, [sp, #0xc]
	ldr r1, _08062B90 @ =gUnknown_0202DAD8
	movs r0, #0x2c
	mov r6, sb
	muls r6, r0, r6
	adds r0, r6, #0
	ldr r3, [sp]
	adds r0, r0, r3
	adds r0, r0, r1
	str r0, [sp, #0x14]
_08062B32:
	mov r6, sb
	lsls r4, r6, #2
	adds r0, r4, #4
	adds r1, r2, #1
	mov sl, r1
	cmp r4, r0
	bge _08062BD2
	lsls r5, r2, #1
_08062B42:
	ldr r2, _08062B94 @ =gUnknown_08499590
	ldr r1, [r2]
	ldr r3, _08062B98 @ =0x0000417A
	adds r0, r1, r3
	adds r3, r0, r5
	ldrh r0, [r3]
	adds r0, r0, r4
	ldr r6, _08062B9C @ =0x00001432
	adds r2, r1, r6
	adds r0, r2, r0
	ldrb r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	ldr r1, _08062BA0 @ =gUnknown_085767D5
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08062BC8
	ldr r6, [sp, #0x14]
	ldrh r0, [r6, #0x2a]
	adds r0, #1
	strh r0, [r6, #0x2a]
	ldr r0, _08062BA4 @ =gUnknown_03003F2C
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldrh r1, [r3]
	adds r1, r1, r4
	adds r1, r2, r1
	ldrb r1, [r1]
	bl sub_08026FD0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08062BA8
	movs r2, #1
	add r8, r2
	b _08062BC8
	.align 2, 0
_08062B90: .4byte gUnknown_0202DAD8
_08062B94: .4byte gUnknown_08499590
_08062B98: .4byte 0x0000417A
_08062B9C: .4byte 0x00001432
_08062BA0: .4byte gUnknown_085767D5
_08062BA4: .4byte gUnknown_03003F2C
_08062BA8:
	ldr r3, _08062C18 @ =gUnknown_08499590
	ldr r1, [r3]
	ldr r6, _08062C1C @ =0x0000417A
	adds r0, r1, r6
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r2, _08062C20 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r1, [r1]
	movs r0, #0xe0
	ands r0, r1
	cmp r0, #0
	beq _08062BC8
	adds r7, #1
_08062BC8:
	adds r4, #1
	ldr r0, [sp, #0xc]
	adds r0, #4
	cmp r4, r0
	blt _08062B42
_08062BD2:
	mov r2, sl
	ldr r0, [sp, #0x10]
	adds r0, #4
	cmp r2, r0
	blt _08062B32
_08062BDC:
	movs r0, #0x2c
	mov r3, sb
	muls r3, r0, r3
	adds r0, r3, #0
	ldr r6, [sp]
	adds r0, r0, r6
	ldr r2, _08062C24 @ =gUnknown_0202DAD8
	adds r1, r0, r2
	movs r3, #0x2a
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _08062C54
	mov r6, r8
	cmn r6, r7
	beq _08062C54
	cmp r8, r7
	ble _08062C28
	movs r0, #0x64
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	movs r3, #0x2a
	ldrsh r1, [r1, r3]
	bl __divsi3
	movs r1, #6
	bl __divsi3
	subs r1, r0, #1
	b _08062C42
	.align 2, 0
_08062C18: .4byte gUnknown_08499590
_08062C1C: .4byte 0x0000417A
_08062C20: .4byte 0x00001432
_08062C24: .4byte gUnknown_0202DAD8
_08062C28:
	movs r0, #0x64
	muls r0, r7, r0
	movs r6, #0x2a
	ldrsh r1, [r1, r6]
	bl __divsi3
	movs r1, #6
	bl __divsi3
	subs r1, r0, #1
	movs r0, #0x80
	lsls r0, r0, #8
	orrs r1, r0
_08062C42:
	movs r0, #0x2c
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	ldr r3, [sp]
	adds r0, r0, r3
	ldr r6, _08062C78 @ =gUnknown_0202DAD8
	adds r0, r0, r6
	strh r1, [r0, #0x28]
_08062C54:
	ldr r0, [sp, #4]
	mov sb, r0
	cmp r0, #0xb
	bgt _08062C5E
	b _08062B06
_08062C5E:
	ldr r1, [sp, #8]
	cmp r1, #9
	bgt _08062C66
	b _08062AF2
_08062C66:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08062C78: .4byte gUnknown_0202DAD8

