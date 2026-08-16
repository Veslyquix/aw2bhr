	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080815C0
sub_080815C0: @ 0x080815C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	mov r4, sl
	adds r4, #0x4c
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x2d
	bgt _080815F0
	adds r3, r0, #0
	movs r0, #0x30
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x30
	bl sub_08074234
	mov r1, sl
	adds r1, #0x48
	strh r0, [r1]
_080815F0:
	movs r7, #0
	str r4, [sp, #0xc]
	mov r3, sl
	adds r3, #0x48
	str r3, [sp, #8]
	str r3, [sp, #4]
	movs r4, #0x52
	add r4, sl
	mov r8, r4
_08081602:
	ldr r1, [sp, #4]
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #9
	bl Div
	adds r3, r7, #1
	mov sb, r3
	cmp r0, r7
	blt _080816BC
	ldr r4, [sp, #4]
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #9
	bl Div
	cmp r0, sb
	bge _080816BC
	movs r2, #0
	ldrsh r0, [r4, r2]
	movs r1, #9
	bl DivRem
	adds r3, r0, #0
	movs r6, #5
	subs r6, r6, r7
	lsls r6, r6, #1
	ldr r4, _080816A8 @ =gUnknown_08616972
	adds r0, r6, r4
	movs r1, #0
	ldrsh r2, [r0, r1]
	movs r0, #9
	str r0, [sp]
	movs r0, #4
	movs r1, #0x90
	rsbs r1, r1, #0
	bl sub_08074234
	mov r2, sl
	str r0, [r2, #0x2c]
	mov r3, r8
	ldrh r0, [r3]
	subs r5, r7, #4
	subs r0, r0, r5
	movs r1, #6
	bl DivRem
	adds r4, r0, #0
	mov r1, r8
	ldrh r0, [r1]
	subs r0, r0, r5
	movs r1, #6
	bl DivRem
	ldr r2, _080816AC @ =gUnknown_0861696C
	adds r4, r4, r2
	ldrb r3, [r4]
	adds r3, #2
	lsls r3, r3, #0xc
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #5
	movs r4, #0xec
	lsls r4, r4, #1
	adds r0, r0, r4
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	orrs r3, r0
	mov r0, sl
	ldr r1, [r0, #0x2c]
	ldr r0, _080816B0 @ =0x000001FF
	ands r1, r0
	ldr r0, _080816B4 @ =gUnknown_08616980
	adds r6, r6, r0
	movs r4, #0
	ldrsh r2, [r6, r4]
	str r3, [sp]
	movs r0, #2
	ldr r3, _080816B8 @ =gUnknown_08615C84
	bl sub_0801BEBC
	b _0808172A
	.align 2, 0
_080816A8: .4byte gUnknown_08616972
_080816AC: .4byte gUnknown_0861696C
_080816B0: .4byte 0x000001FF
_080816B4: .4byte gUnknown_08616980
_080816B8: .4byte gUnknown_08615C84
_080816BC:
	ldr r1, [sp, #8]
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #9
	bl Div
	cmp r0, sb
	blt _0808172A
	mov r3, r8
	ldrh r0, [r3]
	subs r5, r7, #4
	subs r0, r0, r5
	movs r1, #6
	bl DivRem
	adds r4, r0, #0
	mov r1, r8
	ldrh r0, [r1]
	subs r0, r0, r5
	movs r1, #6
	bl DivRem
	ldr r2, _08081748 @ =gUnknown_0861696C
	adds r4, r4, r2
	ldrb r3, [r4]
	adds r3, #2
	lsls r3, r3, #0xc
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #5
	movs r4, #0xec
	lsls r4, r4, #1
	adds r0, r0, r4
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	orrs r3, r0
	movs r0, #5
	subs r0, r0, r7
	lsls r0, r0, #1
	ldr r2, _0808174C @ =gUnknown_08616972
	adds r1, r0, r2
	ldrh r2, [r1]
	adds r4, #0x27
	adds r1, r4, #0
	ands r1, r2
	ldr r2, _08081750 @ =gUnknown_08616980
	adds r0, r0, r2
	movs r4, #0
	ldrsh r2, [r0, r4]
	str r3, [sp]
	movs r0, #2
	ldr r3, _08081754 @ =gUnknown_08615C84
	bl sub_0801BEBC
_0808172A:
	mov r7, sb
	cmp r7, #4
	bgt _08081732
	b _08081602
_08081732:
	ldr r0, [sp, #0xc]
	ldrh r1, [r0]
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0x2c
	bgt _08081758
	adds r0, r1, #1
	ldr r3, [sp, #0xc]
	strh r0, [r3]
	b _08081764
	.align 2, 0
_08081748: .4byte gUnknown_0861696C
_0808174C: .4byte gUnknown_08616972
_08081750: .4byte gUnknown_08616980
_08081754: .4byte gUnknown_08615C84
_08081758:
	movs r0, #0
	ldr r4, [sp, #0xc]
	strh r0, [r4]
	mov r0, sl
	bl Proc_Break
_08081764:
	mov r0, sl
	bl sub_08084700
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

