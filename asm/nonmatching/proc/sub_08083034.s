	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08083034
sub_08083034: @ 0x08083034
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	mov sb, r1
	mov r1, r8
	adds r1, #0x4e
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _08083124
	movs r7, #1
	rsbs r7, r7, #0
	str r1, [sp, #4]
	movs r3, #0x52
	add r3, r8
	mov sl, r3
_0808305C:
	ldr r1, [sp, #4]
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r0, #1
	subs r0, r7, r0
	lsls r0, r0, #1
	ldr r3, _08083110 @ =gUnknown_08616972
	adds r0, r0, r3
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r6, r7, #1
	lsls r4, r6, #1
	adds r0, r4, r3
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r0, #0xa
	str r0, [sp]
	movs r0, #4
	mov r3, sb
	bl sub_08074234
	mov r1, r8
	str r0, [r1, #0x2c]
	ldr r2, [sp, #4]
	movs r3, #0
	ldrsh r0, [r2, r3]
	subs r0, #1
	subs r0, r7, r0
	lsls r0, r0, #1
	ldr r1, _08083114 @ =gUnknown_08616980
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r3, _08083114 @ =gUnknown_08616980
	adds r4, r4, r3
	movs r0, #0
	ldrsh r2, [r4, r0]
	movs r3, #0xa
	str r3, [sp]
	movs r0, #4
	mov r3, sb
	bl sub_08074234
	mov r1, r8
	str r0, [r1, #0x30]
	mov r2, sl
	ldrh r0, [r2]
	adds r5, r7, #6
	adds r0, r0, r5
	movs r1, #6
	bl DivRem
	adds r4, r0, #0
	mov r3, sl
	ldrh r0, [r3]
	adds r0, r0, r5
	movs r1, #6
	bl DivRem
	ldr r1, _08083118 @ =gUnknown_0861696C
	adds r4, r4, r1
	ldrb r3, [r4]
	adds r3, #2
	lsls r3, r3, #0xc
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #5
	movs r1, #0xec
	lsls r1, r1, #1
	adds r0, r0, r1
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	orrs r3, r0
	mov r2, r8
	ldr r1, [r2, #0x2c]
	ldr r0, _0808311C @ =0x000001FF
	ands r1, r0
	ldr r2, [r2, #0x30]
	movs r0, #0xff
	ands r2, r0
	str r3, [sp]
	movs r0, #2
	ldr r3, _08083120 @ =gUnknown_08615C84
	bl sub_0801BEBC
	adds r7, r6, #0
	cmp r7, #4
	ble _0808305C
	b _080831D8
	.align 2, 0
_08083110: .4byte gUnknown_08616972
_08083114: .4byte gUnknown_08616980
_08083118: .4byte gUnknown_0861696C
_0808311C: .4byte 0x000001FF
_08083120: .4byte gUnknown_08615C84
_08083124:
	movs r7, #0
	movs r3, #0x52
	add r3, r8
	mov sl, r3
	adds r6, r1, #0
_0808312E:
	movs r1, #0
	ldrsh r0, [r6, r1]
	subs r0, #1
	subs r0, r7, r0
	lsls r0, r0, #1
	ldr r2, _080831E8 @ =gUnknown_08616972
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r5, r7, #1
	lsls r4, r5, #1
	adds r0, r4, r2
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r0, #0xa
	str r0, [sp]
	movs r0, #4
	mov r3, sb
	bl sub_08074234
	mov r1, r8
	str r0, [r1, #0x2c]
	movs r2, #0
	ldrsh r0, [r6, r2]
	subs r0, #1
	subs r0, r7, r0
	lsls r0, r0, #1
	ldr r3, _080831EC @ =gUnknown_08616980
	adds r0, r0, r3
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r4, r4, r3
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r0, #0xa
	str r0, [sp]
	movs r0, #4
	mov r3, sb
	bl sub_08074234
	mov r1, r8
	str r0, [r1, #0x30]
	mov r2, sl
	ldrh r0, [r2]
	adds r0, r0, r7
	movs r1, #6
	bl DivRem
	adds r4, r0, #0
	mov r3, sl
	ldrh r0, [r3]
	adds r0, r0, r7
	movs r1, #6
	bl DivRem
	ldr r1, _080831F0 @ =gUnknown_0861696C
	adds r4, r4, r1
	ldrb r3, [r4]
	adds r3, #2
	lsls r3, r3, #0xc
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #5
	movs r1, #0xec
	lsls r1, r1, #1
	adds r0, r0, r1
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	orrs r3, r0
	mov r2, r8
	ldr r1, [r2, #0x2c]
	ldr r0, _080831F4 @ =0x000001FF
	ands r1, r0
	ldr r2, [r2, #0x30]
	movs r0, #0xff
	ands r2, r0
	str r3, [sp]
	movs r0, #2
	ldr r3, _080831F8 @ =gUnknown_08615C84
	bl sub_0801BEBC
	adds r7, r5, #0
	cmp r7, #5
	ble _0808312E
_080831D8:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080831E8: .4byte gUnknown_08616972
_080831EC: .4byte gUnknown_08616980
_080831F0: .4byte gUnknown_0861696C
_080831F4: .4byte 0x000001FF
_080831F8: .4byte gUnknown_08615C84

