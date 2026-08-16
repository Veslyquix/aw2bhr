	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08033C68
sub_08033C68: @ 0x08033C68
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r7, r0, #0
	movs r0, #0
	mov sb, r0
	ldr r1, _08033D1C @ =gUnknown_0808F100
	str r1, [sp, #4]
	movs r2, #0x80
	lsls r2, r2, #1
	mov sl, r2
	adds r4, r7, #0
	adds r4, #0x30
	str r4, [sp, #0xc]
	adds r6, r7, #0
	adds r6, #0x33
	str r6, [sp, #0x10]
_08033C90:
	ldr r0, [sp, #4]
	adds r0, #0x80
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	mov r8, r1
	mov r0, r8
	mov r1, sl
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldr r0, [sp, #4]
	movs r1, #0
	ldrsh r4, [r0, r1]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #4
	adds r0, r4, #0
	mov r1, sl
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	mov r1, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0xc
	add r2, sb
	mov r8, r2
	str r0, [sp]
	mov r0, r8
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_0801E108
	adds r0, r7, #0
	adds r0, #0x30
	add r0, sb
	adds r1, r7, #0
	adds r1, #0x33
	add r1, sb
	ldrb r0, [r0]
	mov r4, r8
	str r4, [sp, #8]
	ldrb r1, [r1]
	cmp r0, r1
	beq _08033DFE
	ldr r3, [r7, #0x4c]
	cmp r3, #4
	bhi _08033D20
	movs r0, #4
	str r0, [sp]
	movs r0, #0
	mov r1, sl
	movs r2, #0x10
	b _08033D30
	.align 2, 0
_08033D1C: .4byte gUnknown_0808F100
_08033D20:
	cmp r3, #8
	bhi _08033D36
	subs r3, #4
	movs r0, #4
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	mov r2, sl
_08033D30:
	bl sub_08074234
	strh r0, [r7, #0x3e]
_08033D36:
	ldr r0, [sp, #0xc]
	add r0, sb
	ldrb r0, [r0]
	cmp r0, #0
	beq _08033D9A
	ldr r0, [sp, #4]
	adds r0, #0x80
	movs r1, #0
	ldrsh r6, [r0, r1]
	lsls r6, r6, #4
	mov r8, r6
	mov r0, r8
	mov r1, sl
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldr r2, [sp, #4]
	movs r0, #0
	ldrsh r4, [r2, r0]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	ldrh r1, [r7, #0x3e]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #4
	adds r0, r4, #0
	mov r1, sl
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldrh r1, [r7, #0x3e]
	mov r0, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	ldr r0, [sp, #8]
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_0801E108
_08033D9A:
	ldr r0, [sp, #0x10]
	add r0, sb
	ldrb r0, [r0]
	cmp r0, #0
	beq _08033DFE
	ldr r0, [sp, #4]
	adds r0, #0x80
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	mov r8, r1
	mov r0, r8
	mov r1, sl
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldr r0, [sp, #4]
	movs r1, #0
	ldrsh r4, [r0, r1]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	ldrh r1, [r7, #0x3e]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #4
	adds r0, r4, #0
	mov r1, sl
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldrh r1, [r7, #0x3e]
	mov r0, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	ldr r0, [sp, #8]
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_0801E108
_08033DFE:
	ldr r0, [r7, #0x4c]
	cmp r0, #4
	bhi _08033E18
	ldr r0, [sp, #0x10]
	add r0, sb
	ldrb r0, [r0]
	lsls r0, r0, #2
	ldr r2, _08033E14 @ =gUnknown_0849BC30
	adds r0, r0, r2
	b _08033E24
	.align 2, 0
_08033E14: .4byte gUnknown_0849BC30
_08033E18:
	ldr r0, [sp, #0xc]
	add r0, sb
	ldrb r0, [r0]
	lsls r0, r0, #2
	ldr r4, _08033EBC @ =gUnknown_0849BC30
	adds r0, r0, r4
_08033E24:
	ldr r3, [r0]
	ldr r6, [sp, #8]
	lsls r1, r6, #9
	movs r0, #0x60
	orrs r1, r0
	ldr r2, _08033EC0 @ =gUnknown_0849BC38
	mov r4, sb
	lsls r0, r4, #1
	adds r0, r0, r2
	ldrb r2, [r0]
	mov r6, sl
	orrs r2, r6
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r3, [r0]
	adds r4, #1
	lsls r0, r4, #0xc
	str r0, [sp]
	movs r0, #0
	bl sub_0801BEFC
	mov sb, r4
	cmp r4, #2
	bgt _08033E56
	b _08033C90
_08033E56:
	ldr r0, [r7, #0x4c]
	adds r0, #1
	str r0, [r7, #0x4c]
	cmp r0, #8
	bls _08033EAC
	movs r0, #0
	str r0, [r7, #0x4c]
	mov sb, r0
	adds r5, r7, #0
	adds r5, #0x36
	mov r8, r0
	ldr r4, [sp, #0x10]
	ldr r2, [sp, #0xc]
	adds r3, r7, #0
	adds r3, #0x40
_08033E74:
	mov r0, r8
	stm r3!, {r0}
	mov r1, sb
	adds r0, r4, r1
	adds r1, r2, r1
	ldrb r1, [r1]
	strb r1, [r0]
	movs r6, #1
	add sb, r6
	mov r0, sb
	cmp r0, #2
	ble _08033E74
	ldrb r0, [r5]
	adds r1, r7, #0
	bl sub_0803388C
	ldr r1, _08033EC4 @ =gUnknown_0849BC3E
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0
	movs r2, #0x40
	bl sub_080315E8
	adds r0, r7, #0
	bl Proc_Break
_08033EAC:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033EBC: .4byte gUnknown_0849BC30
_08033EC0: .4byte gUnknown_0849BC38
_08033EC4: .4byte gUnknown_0849BC3E

