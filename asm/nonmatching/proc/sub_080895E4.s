	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080895E4
sub_080895E4: @ 0x080895E4
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
	bgt _0808960C
	ldrh r0, [r4]
	movs r1, #0x18
	bl DivRem
	adds r4, r0, #0
	b _08089618
_0808960C:
	ldrh r0, [r4]
	movs r1, #0x18
	bl DivRem
	movs r1, #0x18
	subs r4, r1, r0
_08089618:
	movs r0, #0xc0
	movs r1, #0x18
	bl Div
	muls r0, r4, r0
	movs r1, #0x80
	lsls r1, r1, #1
	adds r4, r0, r1
	ldr r5, _080896F8 @ =gUnknown_0808F100
	adds r0, r5, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r7, r0, #4
	adds r1, r4, #0
	cmp r4, #0
	bne _0808963C
	movs r1, #2
_0808963C:
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
	bne _08089658
	movs r1, #2
_08089658:
	bl Div
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	lsls r0, r5, #4
	adds r1, r4, #0
	cmp r4, #0
	bne _0808966A
	movs r1, #2
_0808966A:
	bl Div
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	adds r1, r4, #0
	cmp r1, #0
	bne _0808967A
	movs r1, #2
_0808967A:
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
	ldr r4, _080896FC @ =gUnknown_03005964
	ldrb r0, [r4]
	cmp r0, #3
	bhi _08089716
	adds r1, r0, #0
	adds r0, #0x83
	lsls r2, r1, #1
	adds r2, r2, r1
	lsls r1, r2, #3
	adds r1, #8
	lsls r2, r2, #1
	adds r2, #0x28
	movs r3, #4
	str r3, [sp]
	movs r3, #0
	bl sub_0801F34C
	ldrb r0, [r4]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r1, r2, #3
	subs r1, #0x10
	ldr r5, _08089700 @ =0x000001FF
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
	bhi _08089704
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r1, r2, #3
	adds r1, #0x20
	ands r1, r5
	lsls r2, r2, #1
	adds r2, #0x28
	b _0808977A
	.align 2, 0
_080896F8: .4byte gUnknown_0808F100
_080896FC: .4byte gUnknown_03005964
_08089700: .4byte 0x000001FF
_08089704:
	ldrb r0, [r4]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r1, r2, #3
	subs r1, #0x20
	ands r1, r5
	lsls r2, r2, #1
	adds r2, #0x28
	b _0808977A
_08089716:
	ldrb r1, [r4]
	adds r0, r1, #0
	adds r0, #0x83
	subs r1, #4
	lsls r2, r1, #1
	adds r2, r2, r1
	lsls r1, r2, #3
	adds r1, #0x10
	lsls r2, r2, #1
	adds r2, #0x4a
	movs r3, #4
	str r3, [sp]
	movs r3, #0
	bl sub_0801F34C
	ldrb r0, [r4]
	subs r0, #4
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r1, r2, #3
	subs r1, #8
	ldr r5, _0808978C @ =0x000001FF
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
	bhi _08089790
	subs r0, #4
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r1, r2, #3
	adds r1, #0x28
	ands r1, r5
	lsls r2, r2, #1
	adds r2, #0x4a
_0808977A:
	ands r2, r6
	movs r0, #0
	str r0, [sp]
	movs r0, #0x4f
	movs r3, #0
	bl sub_0801F34C
	b _080897B0
	.align 2, 0
_0808978C: .4byte 0x000001FF
_08089790:
	ldrb r0, [r4]
	subs r0, #4
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r1, r2, #3
	subs r1, #0x18
	ands r1, r5
	lsls r2, r2, #1
	adds r2, #0x4a
	ands r2, r6
	movs r0, #0
	str r0, [sp]
	movs r0, #0x4f
	movs r3, #0
	bl sub_0801F34C
_080897B0:
	mov r1, sb
	adds r1, #0x48
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

