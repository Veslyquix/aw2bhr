	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080829B0
sub_080829B0: @ 0x080829B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	mov sl, r1
	cmp r1, #1
	bgt _080829D6
	movs r5, #0x80
	lsls r5, r5, #1
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	adds r1, r5, #0
	movs r2, #8
	mov r3, sl
	b _080829EC
_080829D6:
	mov r4, sl
	cmp r4, #5
	bgt _08082A58
	movs r5, #0x80
	lsls r5, r5, #1
	mov r3, sl
	subs r3, #2
	movs r0, #4
	str r0, [sp]
	movs r1, #8
	adds r2, r5, #0
_080829EC:
	bl sub_08074234
	str r0, [r7, #0x38]
	ldr r4, _08082A54 @ =gUnknown_0808F100
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r6, r0, #4
	adds r0, r6, #0
	adds r1, r5, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	movs r2, #0
	ldrsh r4, [r4, r2]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	ldr r1, [r7, #0x38]
	cmp r1, #0
	bne _08082A1C
	movs r1, #2
_08082A1C:
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r4, #4
	adds r1, r5, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	ldr r1, [r7, #0x38]
	cmp r1, #0
	bne _08082A3A
	movs r1, #2
_08082A3A:
	adds r0, r6, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	mov r1, sb
	mov r2, r8
	adds r3, r4, #0
	bl sub_0801E108
	b _08082AC8
	.align 2, 0
_08082A54: .4byte gUnknown_0808F100
_08082A58:
	mov r4, sl
	cmp r4, #9
	bgt _08082AC8
	ldr r4, _08082B34 @ =gUnknown_0808F100
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r5, [r0, r1]
	lsls r5, r5, #4
	mov sb, r5
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r0, sb
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r5, #0
	ldrsh r4, [r4, r5]
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
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_0801E108
	mov r1, sl
	subs r1, #6
	adds r0, r7, #0
	bl sub_080831FC
_08082AC8:
	movs r5, #0
	adds r7, #0x52
	mov r8, r7
	mov r6, r8
	ldr r7, _08082B38 @ =gUnknown_0861696C
	ldr r0, _08082B3C @ =gUnknown_08616972
	mov sb, r0
_08082AD6:
	cmp r5, #2
	bne _08082B9C
	mov r1, sl
	cmp r1, #1
	bgt _08082B4C
	ldrh r0, [r6]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r4, r0, #0
	ldrh r0, [r6]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r4, r4, r7
	ldrb r3, [r4]
	adds r3, #2
	lsls r3, r3, #0xc
	adds r0, r0, r7
	ldrb r0, [r0]
	lsls r0, r0, #5
	movs r2, #0xec
	lsls r2, r2, #1
	adds r0, r0, r2
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	orrs r3, r0
	mov r4, sb
	ldrh r0, [r4, #6]
	ldr r5, _08082B40 @ =0x000001FF
	adds r1, r5, #0
	ands r1, r0
	ldr r0, _08082B44 @ =gUnknown_08616980
	ldrh r2, [r0, #6]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	orrs r2, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	str r3, [sp]
	movs r0, #2
	ldr r3, _08082B48 @ =gUnknown_08615C84
	b _08082B82
	.align 2, 0
_08082B34: .4byte gUnknown_0808F100
_08082B38: .4byte gUnknown_0861696C
_08082B3C: .4byte gUnknown_08616972
_08082B40: .4byte 0x000001FF
_08082B44: .4byte gUnknown_08616980
_08082B48: .4byte gUnknown_08615C84
_08082B4C:
	mov r5, r8
	ldrh r0, [r5]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r7
	ldrb r3, [r0]
	adds r3, #2
	lsls r3, r3, #0xc
	ldr r0, _08082B8C @ =0x00000998
	orrs r3, r0
	mov r1, sb
	ldrh r0, [r1, #6]
	ldr r2, _08082B90 @ =0x000001FF
	adds r1, r2, #0
	ands r1, r0
	ldr r0, _08082B94 @ =gUnknown_08616980
	movs r4, #6
	ldrsh r2, [r0, r4]
	subs r2, #8
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r2, r0
	str r3, [sp]
	movs r0, #2
	ldr r3, _08082B98 @ =gUnknown_08615C76
_08082B82:
	bl sub_0801BEFC
	movs r4, #3
	b _08082BEC
	.align 2, 0
_08082B8C: .4byte 0x00000998
_08082B90: .4byte 0x000001FF
_08082B94: .4byte gUnknown_08616980
_08082B98: .4byte gUnknown_08615C76
_08082B9C:
	ldrh r0, [r6]
	adds r0, r0, r5
	movs r1, #6
	bl DivRem
	adds r4, r0, #0
	ldrh r0, [r6]
	adds r0, r0, r5
	movs r1, #6
	bl DivRem
	adds r4, r4, r7
	ldrb r3, [r4]
	adds r3, #2
	lsls r3, r3, #0xc
	adds r0, r0, r7
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
	mov r5, sb
	adds r0, r2, r5
	movs r5, #0
	ldrsh r1, [r0, r5]
	ldr r0, _08082C04 @ =gUnknown_08616980
	adds r2, r2, r0
	movs r0, #0
	ldrsh r2, [r2, r0]
	str r3, [sp]
	movs r0, #2
	ldr r3, _08082C08 @ =gUnknown_08615C84
	bl sub_0801BEBC
_08082BEC:
	adds r5, r4, #0
	cmp r5, #4
	bgt _08082BF4
	b _08082AD6
_08082BF4:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082C04: .4byte gUnknown_08616980
_08082C08: .4byte gUnknown_08615C84

