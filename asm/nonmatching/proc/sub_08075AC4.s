	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08075AC4
sub_08075AC4: @ 0x08075AC4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r6, r1, #0
	movs r0, #9
	mov sl, r0
	ldr r0, _08075B2C @ =gUnknown_0200B614
	movs r1, #0xf9
	lsls r1, r1, #1
	mov sb, r1
	adds r1, #0xf9
	adds r1, r1, r0
	mov r8, r1
_08075AE6:
	ldr r0, _08075B30 @ =gUnknown_0200B5F4
	ldrb r0, [r0, #0xf]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08075B34
	mov r0, r8
	movs r1, #0
	ldrsb r1, [r0, r1]
	str r6, [sp]
	movs r0, #0
	movs r2, #0x1f
	adds r3, r7, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r0, r8
	movs r1, #1
	ldrsb r1, [r0, r1]
	str r6, [sp]
	movs r0, #0
	movs r2, #0x1f
	adds r3, r7, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov r0, r8
	movs r1, #2
	ldrsb r1, [r0, r1]
	str r6, [sp]
	movs r0, #0
	movs r2, #0x1f
	b _08075B6C
	.align 2, 0
_08075B2C: .4byte gUnknown_0200B614
_08075B30: .4byte gUnknown_0200B5F4
_08075B34:
	mov r1, r8
	movs r2, #0
	ldrsb r2, [r1, r2]
	str r6, [sp]
	movs r0, #0
	movs r1, #0x1f
	adds r3, r7, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r0, r8
	movs r2, #1
	ldrsb r2, [r0, r2]
	str r6, [sp]
	movs r0, #0
	movs r1, #0x1f
	adds r3, r7, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov r1, r8
	movs r2, #2
	ldrsb r2, [r1, r2]
	str r6, [sp]
	movs r0, #0
	movs r1, #0x1f
_08075B6C:
	adds r3, r7, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _08075B80
	movs r5, #0x1f
_08075B80:
	lsls r0, r5, #0x10
	cmp r0, #0
	bge _08075B88
	movs r5, #0
_08075B88:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _08075B92
	movs r4, #0x1f
_08075B92:
	lsls r0, r4, #0x10
	cmp r0, #0
	bge _08075B9A
	movs r4, #0
_08075B9A:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _08075BA4
	movs r1, #0x1f
_08075BA4:
	lsls r0, r1, #0x10
	cmp r0, #0
	bge _08075BAC
	movs r1, #0
_08075BAC:
	ldr r2, _08075BF0 @ =gPal
	add r2, sb
	lsls r1, r1, #0x10
	asrs r1, r1, #6
	lsls r0, r4, #0x10
	asrs r0, r0, #0xb
	adds r1, r1, r0
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	strh r0, [r2]
	movs r0, #2
	rsbs r0, r0, #0
	add sb, r0
	movs r1, #3
	rsbs r1, r1, #0
	add r8, r1
	adds r0, #1
	add sl, r0
	mov r1, sl
	cmp r1, #0
	blt _08075BDA
	b _08075AE6
_08075BDA:
	bl sub_080135A4
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075BF0: .4byte gPal

