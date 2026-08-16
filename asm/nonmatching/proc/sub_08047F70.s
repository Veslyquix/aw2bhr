	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08047F70
sub_08047F70: @ 0x08047F70
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	movs r7, #0
	ldr r2, _08047FB4 @ =gUnknown_0812A13C
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x40
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq _08047FCA
	ldrb r0, [r4, #0x1f]
	cmp r0, #0
	bne _08047F94
	b _0804814A
_08047F94:
	subs r0, #1
	strb r0, [r4, #0x1f]
	movs r7, #1
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x20
	adds r1, r0, #0
	ldrb r0, [r1]
	cmp r2, r0
	bne _08047FB8
	cmp r2, #0
	beq _08047FB8
	subs r0, r2, #1
	strb r0, [r1]
	b _08047FC4
	.align 2, 0
_08047FB4: .4byte gUnknown_0812A13C
_08047FB8:
	ldrb r2, [r4, #0x1f]
	ldrb r0, [r1]
	subs r0, #1
	cmp r2, r0
	bne _08047FC4
	strb r2, [r1]
_08047FC4:
	movs r0, #0x67
	bl sub_0803B4DC
_08047FCA:
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08048032
	ldrb r2, [r4, #0x1f]
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r0, [r1]
	subs r0, #1
	cmp r2, r0
	blt _08047FEA
	b _0804814A
_08047FEA:
	adds r0, r2, #1
	strb r0, [r4, #0x1f]
	movs r7, #1
	ldrb r0, [r1]
	cmp r0, #5
	bhi _08047FFA
	movs r5, #0
	b _08048002
_08047FFA:
	ldrb r0, [r1]
	subs r0, #6
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_08048002:
	ldrb r0, [r4, #0x1f]
	adds r1, r4, #0
	adds r1, #0x20
	ldrb r3, [r1]
	subs r2, r0, r3
	adds r6, r0, #0
	cmp r2, #5
	bne _08048020
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r3, r0
	bge _08048020
	adds r0, r3, #1
	strb r0, [r1]
	b _0804802C
_08048020:
	ldrb r0, [r1]
	adds r2, r0, #1
	subs r0, r6, r2
	cmp r0, #4
	ble _0804802C
	strb r2, [r1]
_0804802C:
	movs r0, #0x67
	bl sub_0803B4DC
_08048032:
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08048076
	adds r2, r4, #0
	adds r2, #0x20
	ldrb r0, [r2]
	cmp r0, #0
	beq _0804814A
	movs r7, #1
	ldrb r1, [r4, #0x1f]
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	subs r0, r1, r0
	cmp r0, #5
	bgt _08048066
	movs r0, #0
	strb r5, [r4, #0x1f]
	b _0804806E
_08048066:
	subs r0, r1, #6
	strb r0, [r4, #0x1f]
	ldrb r0, [r2]
	subs r0, #6
_0804806E:
	strb r0, [r2]
	movs r0, #0x67
	bl sub_0803B4DC
_08048076:
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080480C6
	adds r3, r4, #0
	adds r3, #0x20
	ldrb r5, [r3]
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r6, [r0]
	subs r2, r6, #6
	cmp r5, r2
	bge _0804814A
	movs r7, #1
	ldrb r1, [r4, #0x1f]
	subs r0, r1, r5
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	subs r0, r1, r0
	adds r0, #0xc
	cmp r0, r6
	ble _080480B6
	strb r2, [r3]
	adds r0, r2, r5
	strb r0, [r4, #0x1f]
	b _080480C0
_080480B6:
	adds r0, r1, #6
	strb r0, [r4, #0x1f]
	ldrb r0, [r3]
	adds r0, #6
	strb r0, [r3]
_080480C0:
	movs r0, #0x67
	bl sub_0803B4DC
_080480C6:
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080480EC
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	bne _080480E0
	movs r0, #3
	b _080480E2
_080480E0:
	subs r0, #1
_080480E2:
	strb r0, [r4, #0x1e]
	movs r7, #1
	movs r0, #0x67
	bl sub_0803B4DC
_080480EC:
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08048112
	ldrb r0, [r4, #0x1e]
	cmp r0, #2
	bls _08048106
	movs r0, #0
	b _08048108
_08048106:
	adds r0, #1
_08048108:
	strb r0, [r4, #0x1e]
	movs r7, #1
	movs r0, #0x67
	bl sub_0803B4DC
_08048112:
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0xc
	ands r0, r1
	cmp r0, #0
	beq _08048140
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804814A
	ldr r0, _08048154 @ =gUnknown_02028E18
	ldrb r1, [r0]
	adds r1, #1
	movs r2, #1
	ands r1, r2
	strb r1, [r0]
	movs r7, #1
	movs r0, #0x67
	bl sub_0803B4DC
_08048140:
	cmp r7, #1
	bne _0804814A
	adds r0, r4, #0
	bl sub_08047B98
_0804814A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048154: .4byte gUnknown_02028E18

