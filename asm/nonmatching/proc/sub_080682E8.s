	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080682E8
sub_080682E8: @ 0x080682E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, #0x4f
	ldrb r3, [r0]
	movs r0, #0x1a
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #1
	bl sub_08074234
	str r0, [sp, #4]
	ldrh r0, [r7, #0x2c]
	subs r0, #1
	mov r8, r0
	cmp r0, #0
	bge _0806831A
	b _080684A6
_0806831A:
	lsls r0, r0, #3
	add r0, r8
	lsls r0, r0, #2
	str r0, [sp, #0xc]
_08068322:
	movs r1, #0x36
	ldrsh r0, [r7, r1]
	ldr r2, [sp, #0xc]
	adds r0, r0, r2
	adds r0, #0x20
	ldr r1, _08068438 @ =0x0000010F
	cmp r0, r1
	bls _08068334
	b _08068492
_08068334:
	ldr r4, _0806843C @ =gUnknown_0808F100
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	mov sb, r0
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r4, [r4, r2]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	str r0, [sp, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #4
	mov sl, r4
	mov r0, sl
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sb
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, r8
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_0801E108
	adds r0, r7, #0
	adds r0, #0x38
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _080683EC
	mov r0, sb
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r0, sl
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sb
	ldr r1, [sp, #4]
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, r8
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_0801E108
_080683EC:
	adds r0, r7, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	cmp r0, #0
	bne _08068448
	movs r0, #0x36
	ldrsh r4, [r7, r0]
	ldr r1, [sp, #0xc]
	adds r4, r4, r1
	ldr r0, _08068440 @ =0x000001FF
	ands r4, r0
	mov r2, r8
	lsls r0, r2, #9
	orrs r4, r0
	ldrh r5, [r7, #0x30]
	adds r0, r7, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	mov r0, r8
	bl __modsi3
	lsls r0, r0, #4
	adds r5, r5, r0
	adds r0, r7, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0xc
	adds r5, r5, r0
	str r5, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0xa0
	lsls r2, r2, #1
	ldr r3, _08068444 @ =gUnknown_08581208
	bl sub_0801BEFC
	b _08068492
	.align 2, 0
_08068438: .4byte 0x0000010F
_0806843C: .4byte gUnknown_0808F100
_08068440: .4byte 0x000001FF
_08068444: .4byte gUnknown_08581208
_08068448:
	adds r0, r7, #0
	adds r0, #0x2a
	ldrb r4, [r0]
	mov r1, r8
	mvns r0, r1
	ldrh r2, [r7, #0x2c]
	adds r0, r0, r2
	adds r1, r4, #0
	bl __modsi3
	subs r4, r4, r0
	subs r4, #1
	lsls r4, r4, #0x10
	movs r0, #0x36
	ldrsh r1, [r7, r0]
	ldr r2, [sp, #0xc]
	adds r1, r1, r2
	ldr r0, _080684D8 @ =0x000001FF
	ands r1, r0
	mov r2, r8
	lsls r0, r2, #9
	orrs r1, r0
	lsrs r4, r4, #0xc
	ldrh r0, [r7, #0x30]
	adds r4, r4, r0
	adds r0, r7, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0xc
	adds r4, r4, r0
	str r4, [sp]
	movs r0, #0
	movs r2, #0xa0
	lsls r2, r2, #1
	ldr r3, _080684DC @ =gUnknown_08581208
	bl sub_0801BEFC
_08068492:
	ldr r1, [sp, #0xc]
	subs r1, #0x24
	str r1, [sp, #0xc]
	movs r2, #1
	rsbs r2, r2, #0
	add r8, r2
	mov r0, r8
	cmp r0, #0
	blt _080684A6
	b _08068322
_080684A6:
	adds r1, r7, #0
	adds r1, #0x4f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1a
	bne _080684C8
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r7, #0x36]
	subs r0, #0x10
	strh r0, [r7, #0x36]
	adds r0, r7, #0
	bl Proc_Break
_080684C8:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080684D8: .4byte 0x000001FF
_080684DC: .4byte gUnknown_08581208

