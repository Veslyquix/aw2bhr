	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08024C58
sub_08024C58: @ 0x08024C58
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	mov sl, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	ldr r4, _08024CC8 @ =gUnknown_08090A34
	ldr r0, [r4]
	ldr r3, [r5]
	ldr r1, [r0]
	subs r1, r3, r1
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #8
	ldr r1, _08024CCC @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r0, r1, #0
	adds r0, #0x62
	movs r6, #0
	ldrsh r2, [r0, r6]
	mov sb, r2
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	mov r8, r0
	movs r6, #0x64
	ldrb r1, [r3, #4]
	movs r0, #0x7f
	ands r0, r1
	adds r7, r4, #0
	cmp r0, #0
	beq _08024CD0
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r4, r0, #1
	b _08024CD2
	.align 2, 0
_08024CC8: .4byte gUnknown_08090A34
_08024CCC: .4byte gUnknown_08499598
_08024CD0:
	movs r4, #0
_08024CD2:
	adds r0, r5, #0
	bl sub_08043304
	strh r0, [r5, #6]
	movs r1, #6
	ldrsh r0, [r5, r1]
	muls r0, r4, r0
	movs r1, #0xa
	bl Div
	strh r0, [r5, #0xe]
	ldr r7, [r7]
	ldr r2, [r5]
	ldr r1, [r7]
	subs r1, r2, r1
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #8
	adds r0, #1
	ldrb r1, [r2]
	bl sub_08042CF8
	ldrh r1, [r5, #0xe]
	adds r1, r1, r0
	add r1, r8
	strh r1, [r5, #0xe]
	ldrh r0, [r5, #0x10]
	strh r0, [r5, #0xc]
	mov r2, sl
	cmp r2, #1
	bne _08024D26
	adds r0, r5, #0
	bl sub_0804338C
	adds r6, r6, r0
_08024D26:
	adds r0, r5, #0
	bl sub_0804334C
	adds r6, r6, r0
	add r6, sb
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	muls r0, r6, r0
	movs r1, #0x64
	bl Div
	strh r0, [r5, #0xc]
	strh r0, [r5, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08024DC8
	ldr r0, _08024DD8 @ =gUnknown_03003FC0
	ldrb r0, [r0, #6]
	cmp r0, #0
	beq _08024D54
	ldr r2, [sp]
	cmp r2, #0
	beq _08024DC8
_08024D54:
	bl sub_080129E0
	adds r4, r0, #0
	ldr r1, [r5]
	ldr r0, [r7]
	subs r1, r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #8
	adds r0, #1
	bl sub_08042E64
	adds r1, r0, #0
	adds r0, r4, #0
	bl DivRem
	adds r6, r0, #0
	ldr r1, [r5]
	ldr r0, [r7]
	subs r1, r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #8
	adds r0, #1
	bl sub_08042EBC
	adds r4, r0, #0
	cmp r4, #0
	beq _08024DB6
	bl sub_080129E0
	adds r1, r4, #0
	bl DivRem
	adds r4, r0, #0
_08024DB6:
	ldrh r0, [r5, #0xc]
	adds r0, r0, r6
	subs r0, r0, r4
	strh r0, [r5, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08024DC8
	movs r0, #0
	strh r0, [r5, #0xc]
_08024DC8:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024DD8: .4byte gUnknown_03003FC0

