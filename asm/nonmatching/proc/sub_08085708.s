	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08085708
sub_08085708: @ 0x08085708
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r1
	movs r0, #0
	mov r8, r0
_0808571A:
	mov r0, sb
	bl sub_080261E8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08085730
	ldr r1, _0808572C @ =gUnknown_08616B22
	b _08085732
	.align 2, 0
_0808572C: .4byte gUnknown_08616B22
_08085730:
	ldr r1, _0808580C @ =gUnknown_08616B4A
_08085732:
	mov r2, r8
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r6, [r0]
	cmp r6, #0
	bne _08085740
	b _0808586C
_08085740:
	mov r0, r8
	movs r1, #4
	bl DivRem
	movs r1, #0x36
	mov sl, r1
	mov r2, sl
	muls r2, r0, r2
	adds r0, r2, #0
	adds r0, #0x13
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r1, r8
	asrs r2, r1, #2
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r7, r1, #3
	adds r5, r7, #0
	adds r5, #0x28
	lsls r1, r5, #0x10
	lsrs r1, r1, #0x10
	str r6, [sp]
	movs r2, #2
	str r2, [sp, #4]
	movs r2, #0
	mov r3, sb
	bl sub_080859A0
	adds r0, r6, #0
	bl sub_080432E0
	cmp r0, #7
	beq _080857A8
	mov r0, sb
	adds r1, r6, #0
	bl sub_08085410
	adds r4, r0, #0
	mov r0, r8
	movs r1, #4
	bl DivRem
	mov r1, sl
	muls r1, r0, r1
	adds r1, #0x24
	movs r2, #1
	str r2, [sp]
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_0801F34C
_080857A8:
	ldr r5, _08085810 @ =gUnknown_08499598
	ldr r1, [r5]
	mov r2, sb
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r4, r0, #2
	adds r1, r4, r1
	ldrb r0, [r1, #0x1d]
	ldrb r1, [r1, #0x1e]
	adds r2, r6, #0
	bl sub_08043200
	cmp r0, #0
	beq _08085814
	mov r0, r8
	movs r1, #4
	bl DivRem
	mov r1, sl
	muls r1, r0, r1
	adds r1, #0x25
	adds r5, r7, #0
	adds r5, #0x30
	movs r0, #1
	str r0, [sp]
	movs r0, #0x94
	adds r2, r5, #0
	movs r3, #0
	bl sub_0801F34C
	mov r0, sb
	adds r1, r6, #0
	bl sub_080856A0
	adds r4, r0, #0
	mov r0, r8
	movs r1, #4
	bl DivRem
	mov r1, sl
	muls r1, r0, r1
	adds r1, #0x2d
	movs r2, #1
	str r2, [sp]
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_0801F34C
	b _0808586C
	.align 2, 0
_0808580C: .4byte gUnknown_08616B4A
_08085810: .4byte gUnknown_08499598
_08085814:
	ldr r1, [r5]
	adds r1, r4, r1
	ldrb r0, [r1, #0x1d]
	ldrb r1, [r1, #0x1e]
	adds r2, r6, #0
	bl sub_08043190
	cmp r0, #0
	beq _0808586C
	mov r0, r8
	movs r1, #4
	bl DivRem
	mov r1, sl
	muls r1, r0, r1
	adds r1, #0x25
	adds r5, r7, #0
	adds r5, #0x30
	movs r0, #1
	str r0, [sp]
	movs r0, #0x93
	adds r2, r5, #0
	movs r3, #0
	bl sub_0801F34C
	mov r0, sb
	adds r1, r6, #0
	bl sub_08085638
	adds r4, r0, #0
	mov r0, r8
	movs r1, #4
	bl DivRem
	mov r1, sl
	muls r1, r0, r1
	adds r1, #0x2d
	movs r2, #1
	str r2, [sp]
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_0801F34C
_0808586C:
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #0x13
	bgt _08085878
	b _0808571A
_08085878:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

