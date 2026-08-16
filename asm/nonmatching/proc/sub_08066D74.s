	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08066D74
sub_08066D74: @ 0x08066D74
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	ldr r6, _08066E5C @ =gUnknown_08580934
	ldr r1, [r6]
	ldrh r0, [r1, #0x2a]
	adds r0, #1
	strh r0, [r1, #0x2a]
	bl sub_08066BF4
	ldr r1, [r6]
	adds r0, r1, #0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r1, #0x54
	adds r1, r1, r0
	ldr r0, [r1]
	bl sub_08066C70
	ldr r0, [r6]
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_08066B8C
	bl sub_08066D30
	ldr r0, [r6]
	movs r1, #0x2a
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r1, #0xb4
	lsls r1, r1, #1
	bl __modsi3
	bl sub_0801BA4C
	lsls r0, r0, #0x10
	asrs r0, r0, #0x19
	movs r1, #0x80
	lsls r1, r1, #1
	adds r4, r0, r1
	ldr r5, _08066E60 @ =gUnknown_0808F100
	adds r0, r5, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	mov r8, r0
	adds r1, r4, #0
	cmp r4, #0
	bne _08066DEA
	movs r1, #2
_08066DEA:
	mov r0, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	movs r0, #0
	ldrsh r5, [r5, r0]
	rsbs r0, r5, #0
	lsls r0, r0, #4
	adds r1, r4, #0
	cmp r4, #0
	bne _08066E06
	movs r1, #2
_08066E06:
	bl Div
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	lsls r0, r5, #4
	adds r1, r4, #0
	cmp r4, #0
	bne _08066E18
	movs r1, #2
_08066E18:
	bl Div
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	adds r1, r4, #0
	cmp r1, #0
	bne _08066E28
	movs r1, #2
_08066E28:
	mov r0, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	mov r1, sb
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_0801E108
	ldr r0, _08066E64 @ =gUnknown_03002EE0
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r4, #1
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08066E6C
	ldr r0, _08066E68 @ =gUnknown_08580DD8
	bl sub_0806377C
	bl sub_0803BD54
	b _08066EAE
	.align 2, 0
_08066E5C: .4byte gUnknown_08580934
_08066E60: .4byte gUnknown_0808F100
_08066E64: .4byte gUnknown_03002EE0
_08066E68: .4byte gUnknown_08580DD8
_08066E6C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08066EAE
	ldr r0, [r6]
	adds r0, #0x31
	strb r4, [r0]
	bl sub_080733B8
	movs r0, #2
	bl sub_08064B68
	ldr r0, [r6]
	adds r0, #0x30
	strb r4, [r0]
	movs r0, #0x66
	bl sub_0803B4DC
	ldr r1, [r6]
	ldrb r0, [r1, #8]
	cmp r0, #2
	bne _08066EA4
	adds r1, #0x26
	movs r0, #0
	strb r0, [r1]
	bl sub_0806540C
	b _08066EAE
_08066EA4:
	bl sub_0806530C
	ldr r0, [r6]
	adds r0, #0x26
	strb r4, [r0]
_08066EAE:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

