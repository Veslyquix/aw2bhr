	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808177C
sub_0808177C: @ 0x0808177C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r3, r7, #0
	adds r3, #0x4c
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #3
	bgt _080817A6
	movs r1, #0x80
	lsls r1, r1, #1
	adds r3, r0, #0
	movs r0, #4
	str r0, [sp]
	movs r0, #1
	movs r2, #8
	b _080817B8
_080817A6:
	movs r2, #0x80
	lsls r2, r2, #1
	movs r4, #0
	ldrsh r3, [r3, r4]
	subs r3, #4
	movs r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #8
_080817B8:
	bl sub_08074234
	str r0, [r7, #0x38]
	ldr r4, _08081898 @ =gUnknown_0808F100
	adds r0, r4, #0
	adds r0, #0x80
	movs r5, #0
	ldrsh r0, [r0, r5]
	lsls r5, r0, #4
	movs r0, #0x80
	lsls r0, r0, #1
	mov r8, r0
	adds r0, r5, #0
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	movs r1, #0
	ldrsh r4, [r4, r1]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	ldr r1, [r7, #0x38]
	cmp r1, #0
	bne _080817EE
	movs r1, #2
_080817EE:
	bl Div
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	lsls r0, r4, #4
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	ldr r1, [r7, #0x38]
	cmp r1, #0
	bne _0808180A
	movs r1, #2
_0808180A:
	adds r0, r5, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	mov r1, sb
	adds r2, r6, #0
	adds r3, r4, #0
	bl sub_0801E108
	movs r5, #0
	movs r2, #0x4c
	adds r2, r2, r7
	mov sb, r2
	movs r3, #0x52
	adds r3, r3, r7
	mov sl, r3
	mov r6, sl
	ldr r4, _0808189C @ =gUnknown_0861696C
	mov r8, r4
_08081836:
	cmp r5, #2
	bne _08081904
	mov r5, sb
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #3
	bgt _080818B0
	ldrh r0, [r6]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r4, r0, #0
	ldrh r0, [r6]
	adds r0, #2
	movs r1, #6
	bl DivRem
	add r4, r8
	ldrb r3, [r4]
	adds r3, #2
	lsls r3, r3, #0xc
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #5
	movs r2, #0xec
	lsls r2, r2, #1
	adds r0, r0, r2
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	orrs r3, r0
	ldr r4, _080818A0 @ =gUnknown_08616972
	ldrh r0, [r4, #6]
	ldr r5, _080818A4 @ =0x000001FF
	adds r1, r5, #0
	ands r1, r0
	ldr r0, _080818A8 @ =gUnknown_08616980
	ldrh r2, [r0, #6]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	orrs r2, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	str r3, [sp]
	movs r0, #2
	ldr r3, _080818AC @ =gUnknown_08615C84
	b _080818E6
	.align 2, 0
_08081898: .4byte gUnknown_0808F100
_0808189C: .4byte gUnknown_0861696C
_080818A0: .4byte gUnknown_08616972
_080818A4: .4byte 0x000001FF
_080818A8: .4byte gUnknown_08616980
_080818AC: .4byte gUnknown_08615C84
_080818B0:
	mov r5, sl
	ldrh r0, [r5]
	adds r0, #2
	movs r1, #6
	bl DivRem
	add r0, r8
	ldrb r3, [r0]
	adds r3, #2
	lsls r3, r3, #0xc
	ldr r0, _080818F0 @ =0x00000998
	orrs r3, r0
	ldr r1, _080818F4 @ =gUnknown_08616972
	ldrh r0, [r1, #6]
	ldr r2, _080818F8 @ =0x000001FF
	adds r1, r2, #0
	ands r1, r0
	ldr r0, _080818FC @ =gUnknown_08616980
	movs r4, #6
	ldrsh r2, [r0, r4]
	subs r2, #8
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r2, r0
	str r3, [sp]
	movs r0, #2
	ldr r3, _08081900 @ =gUnknown_08615C76
_080818E6:
	bl sub_0801BEFC
	movs r4, #3
	b _08081954
	.align 2, 0
_080818F0: .4byte 0x00000998
_080818F4: .4byte gUnknown_08616972
_080818F8: .4byte 0x000001FF
_080818FC: .4byte gUnknown_08616980
_08081900: .4byte gUnknown_08615C76
_08081904:
	ldrh r0, [r6]
	adds r0, r0, r5
	movs r1, #6
	bl DivRem
	adds r4, r0, #0
	ldrh r0, [r6]
	adds r0, r0, r5
	movs r1, #6
	bl DivRem
	add r4, r8
	ldrb r3, [r4]
	adds r3, #2
	lsls r3, r3, #0xc
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #5
	movs r1, #0xec
	lsls r1, r1, #1
	adds r0, r0, r1
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	orrs r3, r0
	adds r4, r5, #1
	lsls r2, r4, #1
	ldr r5, _08081970 @ =gUnknown_08616972
	adds r0, r2, r5
	movs r5, #0
	ldrsh r1, [r0, r5]
	ldr r0, _08081974 @ =gUnknown_08616980
	adds r2, r2, r0
	movs r0, #0
	ldrsh r2, [r2, r0]
	str r3, [sp]
	movs r0, #2
	ldr r3, _08081978 @ =gUnknown_08615C84
	bl sub_0801BEBC
_08081954:
	adds r5, r4, #0
	cmp r5, #4
	bgt _0808195C
	b _08081836
_0808195C:
	mov r2, sb
	ldrh r1, [r2]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0xb
	bgt _0808197C
	adds r0, r1, #1
	strh r0, [r2]
	b _08081988
	.align 2, 0
_08081970: .4byte gUnknown_08616972
_08081974: .4byte gUnknown_08616980
_08081978: .4byte gUnknown_08615C84
_0808197C:
	movs r0, #0
	mov r4, sb
	strh r0, [r4]
	adds r0, r7, #0
	bl Proc_Break
_08081988:
	adds r0, r7, #0
	bl sub_08084700
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

