	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806E240
sub_0806E240: @ 0x0806E240
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldrh r0, [r7, #0x3c]
	ldrh r1, [r7, #0x3e]
	cmp r0, r1
	beq _0806E2EC
	ldr r4, _0806E2E4 @ =gUnknown_0808F100
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r2, [r0, r1]
	lsls r2, r2, #4
	mov r8, r2
	ldrh r1, [r7, #0x3c]
	mov r0, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r4, [r4, r2]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	ldrh r1, [r7, #0x3c]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #4
	ldrh r1, [r7, #0x3c]
	adds r0, r4, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldrh r1, [r7, #0x3c]
	mov r0, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r7, #0x44]
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_0801E108
	ldr r1, [r7, #0x2c]
	subs r1, #0x10
	ldr r0, _0806E2E8 @ =0x000001FF
	ands r1, r0
	ldr r0, [r7, #0x44]
	lsls r0, r0, #9
	orrs r1, r0
	ldr r2, [r7, #0x30]
	ldr r0, [r7, #0x34]
	subs r2, r2, r0
	movs r0, #0xff
	ands r2, r0
	movs r0, #0xc0
	lsls r0, r0, #2
	orrs r2, r0
	ldr r3, [r7, #0x38]
	adds r0, r7, #0
	adds r0, #0x40
	ldrh r0, [r0]
	str r0, [sp]
	movs r0, #0
	bl sub_0801BEFC
	ldrh r0, [r7, #0x3c]
	strh r0, [r7, #0x3e]
	b _0806E4A6
	.align 2, 0
_0806E2E4: .4byte gUnknown_0808F100
_0806E2E8: .4byte 0x000001FF
_0806E2EC:
	adds r1, r7, #0
	adds r1, #0x48
	ldrb r0, [r1]
	cmp r0, #0
	beq _0806E360
	movs r0, #0
	strb r0, [r1]
	movs r0, #0x10
	str r0, [r7, #0x4c]
	ldr r4, _0806E35C @ =gUnknown_0808F100
	adds r0, r4, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	mov sb, r1
	movs r0, #0x80
	lsls r0, r0, #2
	mov r8, r0
	mov r0, sb
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r4, [r4, r1]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #4
	adds r0, r4, #0
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sb
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r7, #0x44]
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	adds r2, r5, #0
	b _0806E3DE
	.align 2, 0
_0806E35C: .4byte gUnknown_0808F100
_0806E360:
	ldr r3, [r7, #0x4c]
	cmp r3, #0
	beq _0806E41C
	subs r3, #1
	str r3, [r7, #0x4c]
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0x10
	subs r3, r0, r3
	str r0, [sp]
	movs r0, #4
	bl sub_08074234
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r4, _0806E414 @ =gUnknown_0808F100
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r2, [r0, r1]
	lsls r2, r2, #4
	mov sb, r2
	mov r0, sb
	adds r1, r5, #0
	bl Div
	mov r8, r0
	mov r2, r8
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r8, r2
	movs r0, #0
	ldrsh r4, [r4, r0]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	adds r1, r5, #0
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	lsls r4, r4, #4
	adds r0, r4, #0
	adds r1, r5, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sb
	adds r1, r5, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r7, #0x44]
	str r0, [sp]
	adds r0, r1, #0
	mov r1, r8
	adds r2, r6, #0
_0806E3DE:
	adds r3, r4, #0
	bl sub_0801E108
	ldr r1, [r7, #0x2c]
	subs r1, #0x10
	ldr r0, _0806E418 @ =0x000001FF
	ands r1, r0
	ldr r0, [r7, #0x44]
	lsls r0, r0, #9
	orrs r1, r0
	ldr r2, [r7, #0x30]
	ldr r0, [r7, #0x34]
	subs r2, r2, r0
	movs r0, #0xff
	ands r2, r0
	movs r0, #0xc0
	lsls r0, r0, #2
	orrs r2, r0
	ldr r3, [r7, #0x38]
	adds r0, r7, #0
	adds r0, #0x40
	ldrh r0, [r0]
	str r0, [sp]
	movs r0, #0
	bl sub_0801BEFC
	b _0806E4A6
	.align 2, 0
_0806E414: .4byte gUnknown_0808F100
_0806E418: .4byte 0x000001FF
_0806E41C:
	ldr r4, _0806E4B4 @ =gUnknown_0808F100
	adds r0, r4, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	mov r8, r1
	ldrh r1, [r7, #0x3c]
	mov r0, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r0, #0
	ldrsh r4, [r4, r0]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	ldrh r1, [r7, #0x3c]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #4
	ldrh r1, [r7, #0x3c]
	adds r0, r4, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldrh r1, [r7, #0x3c]
	mov r0, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r7, #0x44]
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_0801E108
	ldr r1, [r7, #0x2c]
	subs r1, #0x10
	ldr r0, _0806E4B8 @ =0x000001FF
	ands r1, r0
	ldr r0, [r7, #0x44]
	lsls r0, r0, #9
	orrs r1, r0
	ldr r2, [r7, #0x30]
	ldr r0, [r7, #0x34]
	subs r2, r2, r0
	movs r0, #0xff
	ands r2, r0
	movs r0, #0xc0
	lsls r0, r0, #2
	orrs r2, r0
	ldr r3, [r7, #0x38]
	adds r0, r7, #0
	adds r0, #0x40
	ldrh r0, [r0]
	str r0, [sp]
	movs r0, #0
	bl sub_0801BEFC
_0806E4A6:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E4B4: .4byte gUnknown_0808F100
_0806E4B8: .4byte 0x000001FF

