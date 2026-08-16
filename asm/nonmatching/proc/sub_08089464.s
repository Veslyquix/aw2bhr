	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08089464
sub_08089464: @ 0x08089464
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	mov r4, sb
	adds r4, #0x48
	ldrh r0, [r4]
	movs r1, #0x18
	bl DivRem
	cmp r0, #0xb
	bgt _0808948C
	ldrh r0, [r4]
	movs r1, #0x18
	bl DivRem
	adds r4, r0, #0
	b _08089498
_0808948C:
	ldrh r0, [r4]
	movs r1, #0x18
	bl DivRem
	movs r1, #0x18
	subs r4, r1, r0
_08089498:
	movs r0, #0xc0
	movs r1, #0x18
	bl Div
	muls r0, r4, r0
	movs r1, #0x80
	lsls r1, r1, #1
	adds r4, r0, r1
	ldr r5, _08089590 @ =gUnknown_0808F100
	adds r0, r5, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r7, r0, #4
	adds r1, r4, #0
	cmp r4, #0
	bne _080894BC
	movs r1, #2
_080894BC:
	adds r0, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r0, #0
	ldrsh r5, [r5, r0]
	rsbs r0, r5, #0
	lsls r0, r0, #4
	adds r1, r4, #0
	cmp r4, #0
	bne _080894D8
	movs r1, #2
_080894D8:
	bl Div
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	lsls r0, r5, #4
	adds r1, r4, #0
	cmp r4, #0
	bne _080894EA
	movs r1, #2
_080894EA:
	bl Div
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	adds r1, r4, #0
	cmp r1, #0
	bne _080894FA
	movs r1, #2
_080894FA:
	adds r0, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	mov r1, r8
	adds r2, r6, #0
	adds r3, r5, #0
	bl sub_0801E108
	movs r4, #0
	mov r7, sb
	adds r7, #0x48
	movs r6, #0x28
	movs r5, #8
_0808951C:
	adds r0, r4, #0
	adds r0, #0x83
	movs r1, #4
	str r1, [sp]
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl sub_0801F34C
	adds r6, #6
	adds r5, #0x18
	adds r4, #1
	cmp r4, #3
	ble _0808951C
	movs r4, #0
	movs r6, #0x4a
	movs r5, #0x10
_0808953E:
	adds r0, r4, #0
	adds r0, #0x87
	movs r1, #4
	str r1, [sp]
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl sub_0801F34C
	adds r6, #6
	adds r5, #0x18
	adds r4, #1
	cmp r4, #3
	ble _0808953E
	ldr r1, _08089594 @ =gUnknown_03005964
	ldrb r0, [r1]
	cmp r0, #3
	bhi _0808959C
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r1, r2, #3
	subs r1, #0x10
	ldr r0, _08089598 @ =0x000001FF
	ands r1, r0
	adds r0, #1
	orrs r1, r0
	lsls r2, r2, #1
	adds r2, #0x10
	movs r0, #0xff
	ands r2, r0
	movs r0, #0xc0
	lsls r0, r0, #2
	orrs r2, r0
	movs r0, #5
	str r0, [sp]
	movs r0, #0x8b
	movs r3, #0
	bl sub_0801F34C
	b _080895CA
	.align 2, 0
_08089590: .4byte gUnknown_0808F100
_08089594: .4byte gUnknown_03005964
_08089598: .4byte 0x000001FF
_0808959C:
	ldrb r0, [r1]
	subs r0, #4
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r1, r2, #3
	subs r1, #8
	ldr r0, _080895E0 @ =0x000001FF
	ands r1, r0
	adds r0, #1
	orrs r1, r0
	lsls r2, r2, #1
	adds r2, #0x32
	movs r0, #0xff
	ands r2, r0
	movs r0, #0xc0
	lsls r0, r0, #2
	orrs r2, r0
	movs r0, #5
	str r0, [sp]
	movs r0, #0x8b
	movs r3, #0
	bl sub_0801F34C
_080895CA:
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080895E0: .4byte 0x000001FF

