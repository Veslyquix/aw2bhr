	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08062C94
sub_08062C94: @ 0x08062C94
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x38
	ldr r0, _08062D24 @ =gUnknown_0816DB38
	mov sb, r0
	movs r3, #0
	ldr r2, _08062D28 @ =gUnknown_02029C20
	add r1, sp, #4
	movs r4, #0x18
_08062CAC:
	ldrh r0, [r2]
	strh r3, [r2]
	strh r3, [r1]
	adds r2, #2
	adds r1, #2
	subs r4, #1
	cmp r4, #0
	bge _08062CAC
	movs r5, #0
	ldr r1, _08062D2C @ =gUnknown_0816DB3C
	mov ip, r1
	ldr r2, [r1]
	mov sl, r2
_08062CC6:
	ldr r3, _08062D30 @ =gUnknown_030033EC
	ldrh r1, [r3]
	mov r2, sb
	ldr r0, [r2]
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x2c
	ldrb r0, [r0]
	asrs r0, r5
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08062D34
	lsls r4, r5, #6
	adds r3, r4, #0
	adds r3, #0x40
	adds r6, r5, #1
	cmp r4, r3
	bge _08062D78
	mov r0, sl
	ldr r1, [r0]
	lsls r0, r5, #7
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r2, r0, r1
	subs r4, r3, r4
_08062D00:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08062D1A
	lsls r0, r0, #1
	mov r1, sp
	adds r1, r1, r0
	adds r1, #4
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	ldrh r3, [r1]
	adds r0, r0, r3
	strh r0, [r1]
_08062D1A:
	adds r2, #0xc
	subs r4, #1
	cmp r4, #0
	bne _08062D00
	b _08062D78
	.align 2, 0
_08062D24: .4byte gUnknown_0816DB38
_08062D28: .4byte gUnknown_02029C20
_08062D2C: .4byte gUnknown_0816DB3C
_08062D30: .4byte gUnknown_030033EC
_08062D34:
	lsls r4, r5, #6
	adds r1, r4, #0
	adds r1, #0x40
	adds r6, r5, #1
	cmp r4, r1
	bge _08062D78
	mov r0, ip
	ldr r0, [r0]
	mov r8, r0
	ldr r7, _08062DE8 @ =gUnknown_02029C20
	lsls r0, r5, #7
	adds r0, r0, r4
	lsls r3, r0, #2
	subs r4, r1, r4
_08062D50:
	mov r1, r8
	ldr r0, [r1]
	adds r1, r3, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _08062D70
	adds r2, r0, #0
	lsls r2, r2, #1
	adds r2, r2, r7
	ldrb r0, [r1, #4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	ldrh r1, [r2]
	adds r1, r1, r0
	ldrh r0, [r2]
	strh r1, [r2]
_08062D70:
	adds r3, #0xc
	subs r4, #1
	cmp r4, #0
	bne _08062D50
_08062D78:
	adds r5, r6, #0
	cmp r5, #3
	ble _08062CC6
	movs r4, #1
	ldr r2, _08062DE8 @ =gUnknown_02029C20
	mov sl, r2
_08062D84:
	lsls r0, r4, #1
	mov r3, sl
	adds r1, r0, r3
	ldrh r0, [r1]
	adds r2, r4, #1
	mov r8, r2
	cmp r0, #0
	beq _08062DD2
	movs r5, #1
	adds r6, r1, #0
	mov r7, sp
	adds r7, #6
_08062D9C:
	ldr r0, _08062DEC @ =gUnknown_030033EC
	ldrh r2, [r0]
	mov r3, sb
	ldr r0, [r3]
	ldr r0, [r0]
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #0x1d]
	ldrb r1, [r1, #0x1e]
	movs r2, #0
	str r2, [sp]
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_08043070
	ldrh r1, [r7]
	muls r1, r0, r1
	ldrh r0, [r6]
	subs r0, r0, r1
	ldrh r1, [r6]
	strh r0, [r6]
	adds r7, #2
	adds r5, #1
	cmp r5, #0x18
	ble _08062D9C
_08062DD2:
	mov r4, r8
	cmp r4, #0x18
	ble _08062D84
	add sp, #0x38
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08062DE8: .4byte gUnknown_02029C20
_08062DEC: .4byte gUnknown_030033EC

