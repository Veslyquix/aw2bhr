	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08089C14
sub_08089C14: @ 0x08089C14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	mov r4, sb
	adds r4, #0x48
	ldrh r0, [r4]
	movs r1, #0x18
	bl DivRem
	cmp r0, #0xb
	bgt _08089C3E
	ldrh r0, [r4]
	movs r1, #0x18
	bl DivRem
	adds r4, r0, #0
	b _08089C4A
_08089C3E:
	ldrh r0, [r4]
	movs r1, #0x18
	bl DivRem
	movs r1, #0x18
	subs r4, r1, r0
_08089C4A:
	movs r0, #0xc0
	movs r1, #0x18
	bl Div
	muls r0, r4, r0
	movs r1, #0x80
	lsls r1, r1, #1
	adds r4, r0, r1
	ldr r1, _08089DEC @ =gUnknown_081D946C
	ldr r5, [r1]
	adds r0, r5, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r6, r0, #4
	adds r2, r4, #0
	cmp r4, #0
	bne _08089C70
	movs r2, #2
_08089C70:
	adds r0, r6, #0
	adds r1, r2, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r0, #0
	ldrsh r5, [r5, r0]
	rsbs r0, r5, #0
	lsls r0, r0, #4
	str r0, [sp, #4]
	adds r1, r4, #0
	cmp r4, #0
	bne _08089C90
	movs r1, #2
_08089C90:
	ldr r0, [sp, #4]
	bl Div
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	lsls r5, r5, #4
	mov sl, r5
	adds r1, r4, #0
	cmp r4, #0
	bne _08089CA6
	movs r1, #2
_08089CA6:
	mov r0, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	adds r1, r4, #0
	cmp r1, #0
	bne _08089CB8
	movs r1, #2
_08089CB8:
	adds r0, r6, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	mov r1, r8
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_0801E108
	mov r1, sb
	adds r1, #0x4c
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xf
	ble _08089CDE
	b _08089F6E
_08089CDE:
	adds r3, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x10
	bl sub_08074234
	adds r4, r0, #0
	adds r1, r4, #0
	cmp r4, #0
	bne _08089CFA
	movs r1, #2
_08089CFA:
	adds r0, r6, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	adds r1, r4, #0
	cmp r4, #0
	bne _08089D0E
	movs r1, #2
_08089D0E:
	ldr r0, [sp, #4]
	bl Div
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	adds r1, r4, #0
	cmp r4, #0
	bne _08089D20
	movs r1, #2
_08089D20:
	mov r0, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	adds r1, r4, #0
	cmp r4, #0
	bne _08089D32
	movs r1, #2
_08089D32:
	adds r0, r6, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #2
	mov r1, r8
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_0801E108
	movs r5, #0x88
	lsls r5, r5, #1
	movs r1, #2
	cmp r4, r5
	beq _08089D56
	subs r1, r5, r4
_08089D56:
	adds r0, r6, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	ldr r1, _08089DF0 @ =gUnknown_0808F100
	mov r8, r1
	movs r2, #0
	ldrsh r6, [r1, r2]
	rsbs r0, r6, #0
	lsls r0, r0, #4
	movs r1, #2
	cmp r4, r5
	beq _08089D76
	subs r1, r5, r4
_08089D76:
	bl Div
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	lsls r0, r6, #4
	movs r1, #2
	cmp r4, r5
	beq _08089D88
	subs r1, r5, r4
_08089D88:
	bl Div
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	mov r0, r8
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r1, #2
	cmp r4, r5
	beq _08089DA2
	subs r1, r5, r4
_08089DA2:
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #3
	mov r1, sl
	adds r2, r7, #0
	adds r3, r6, #0
	bl sub_0801E108
	movs r4, #0
	movs r2, #0x48
	add r2, sb
	mov sl, r2
	ldr r0, _08089DF4 @ =gUnknown_081D9470
	mov sb, r0
	movs r1, #4
	mov r8, r1
	movs r7, #0x28
	movs r6, #8
	movs r5, #0x83
_08089DCE:
	mov r2, sb
	ldr r0, [r2]
	ldrb r0, [r0]
	cmp r4, r0
	bne _08089DF8
	mov r0, r8
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #0
	bl sub_0801F34C
	b _08089E10
	.align 2, 0
_08089DEC: .4byte gUnknown_081D946C
_08089DF0: .4byte gUnknown_0808F100
_08089DF4: .4byte gUnknown_081D9470
_08089DF8:
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r1, r6
	movs r2, #0x80
	lsls r2, r2, #1
	orrs r2, r7
	mov r0, r8
	str r0, [sp]
	adds r0, r5, #0
	movs r3, #0
	bl sub_0801F34C
_08089E10:
	adds r7, #6
	adds r6, #0x18
	adds r5, #1
	adds r4, #1
	cmp r4, #3
	ble _08089DCE
	movs r4, #0
	movs r7, #4
	movs r6, #0x4a
	movs r5, #0x10
_08089E24:
	mov r1, sb
	ldr r0, [r1]
	ldrb r1, [r0]
	subs r0, r1, #4
	cmp r4, r0
	bne _08089E40
	adds r0, #0x87
	str r7, [sp]
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl sub_0801F34C
	b _08089E58
_08089E40:
	adds r0, r4, #0
	adds r0, #0x87
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r1, r5
	movs r2, #0x80
	lsls r2, r2, #1
	orrs r2, r6
	str r7, [sp]
	movs r3, #0
	bl sub_0801F34C
_08089E58:
	adds r6, #6
	adds r5, #0x18
	adds r4, #1
	cmp r4, #3
	ble _08089E24
	mov r2, sb
	ldr r4, [r2]
	ldrb r0, [r4]
	cmp r0, #3
	bhi _08089ED0
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r1, r2, #3
	subs r1, #0x10
	ldr r5, _08089EB4 @ =0x000001FF
	ands r1, r5
	movs r0, #0x80
	lsls r0, r0, #2
	orrs r1, r0
	lsls r2, r2, #1
	adds r2, #0x10
	movs r6, #0xff
	ands r2, r6
	movs r0, #0xc0
	lsls r0, r0, #2
	orrs r2, r0
	movs r0, #5
	str r0, [sp]
	movs r0, #0x8b
	movs r3, #0
	bl sub_0801F34C
	ldrb r0, [r4]
	cmp r0, #1
	bhi _08089EB8
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r1, r2, #3
	adds r1, #0x20
	ands r1, r5
	movs r0, #0xc0
	lsls r0, r0, #3
	orrs r1, r0
	lsls r2, r2, #1
	adds r2, #0x28
	b _08089F1C
	.align 2, 0
_08089EB4: .4byte 0x000001FF
_08089EB8:
	ldrb r0, [r4]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r1, r2, #3
	subs r1, #0x20
	ands r1, r5
	movs r0, #0xc0
	lsls r0, r0, #3
	orrs r1, r0
	lsls r2, r2, #1
	adds r2, #0x28
	b _08089F1C
_08089ED0:
	ldrb r0, [r4]
	subs r0, #4
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r1, r2, #3
	subs r1, #8
	ldr r5, _08089F34 @ =0x000001FF
	ands r1, r5
	movs r0, #0x80
	lsls r0, r0, #2
	orrs r1, r0
	lsls r2, r2, #1
	adds r2, #0x32
	movs r6, #0xff
	ands r2, r6
	movs r0, #0xc0
	lsls r0, r0, #2
	orrs r2, r0
	movs r0, #5
	str r0, [sp]
	movs r0, #0x8b
	movs r3, #0
	bl sub_0801F34C
	ldrb r0, [r4]
	cmp r0, #5
	bhi _08089F38
	subs r0, #4
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r1, r2, #3
	adds r1, #0x28
	ands r1, r5
	movs r0, #0xc0
	lsls r0, r0, #3
	orrs r1, r0
	lsls r2, r2, #1
	adds r2, #0x4a
_08089F1C:
	ands r2, r6
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r2, r0
	movs r0, #0
	str r0, [sp]
	movs r0, #0x4f
	movs r3, #0
	bl sub_0801F34C
	b _08089F64
	.align 2, 0
_08089F34: .4byte 0x000001FF
_08089F38:
	ldrb r0, [r4]
	subs r0, #4
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r1, r2, #3
	subs r1, #0x18
	ands r1, r5
	movs r0, #0xc0
	lsls r0, r0, #3
	orrs r1, r0
	lsls r2, r2, #1
	adds r2, #0x4a
	ands r2, r6
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r2, r0
	movs r0, #0
	str r0, [sp]
	movs r0, #0x4f
	movs r3, #0
	bl sub_0801F34C
_08089F64:
	mov r1, sl
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _08089F7A
_08089F6E:
	ldr r1, _08089F8C @ =gUnknown_03005908
	movs r0, #2
	str r0, [r1]
	mov r0, sb
	bl sub_080895E4
_08089F7A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089F8C: .4byte gUnknown_03005908

