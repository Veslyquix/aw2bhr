	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080355CC
sub_080355CC: @ 0x080355CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #4]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	bl sub_0803649C
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r7, r0
	bne _08035604
	movs r0, #0
	b _08035724
_08035604:
	ldr r0, _08035670 @ =gUnknown_03003124
	adds r0, r7, r0
	movs r5, #0
	movs r1, #1
	mov sb, r1
	mov r2, sb
	strb r2, [r0]
	mov r0, sl
	bl sub_08035B68
	adds r4, r0, #0
	ldr r0, _08035674 @ =gUnknown_0849BE38
	movs r1, #5
	bl Proc_Start
	adds r6, r0, #0
	adds r0, r4, #0
	movs r1, #2
	movs r2, #1
	bl sub_0801C210
	str r0, [r6, #0x2c]
	adds r0, r6, #0
	adds r0, #0x3a
	strb r7, [r0]
	bl sub_080364C4
	str r0, [r6, #0x48]
	str r5, [r6, #0x30]
	adds r0, r6, #0
	adds r0, #0x35
	mov r1, sb
	strb r1, [r0]
	ldr r2, [sp]
	lsls r0, r2, #4
	adds r1, r6, #0
	adds r1, #0x42
	strh r0, [r1]
	ldr r0, [sp, #4]
	lsls r1, r0, #4
	adds r0, r6, #0
	adds r0, #0x44
	strh r1, [r0]
	mov r1, r8
	cmp r1, #0
	beq _08035664
	cmp r1, #2
	bne _08035678
_08035664:
	adds r0, r6, #0
	adds r0, #0x38
	mov r2, sb
	strb r2, [r0]
	adds r4, r0, #0
	b _08035682
	.align 2, 0
_08035670: .4byte gUnknown_03003124
_08035674: .4byte gUnknown_0849BE38
_08035678:
	adds r1, r6, #0
	adds r1, #0x38
	movs r0, #0
	strb r0, [r1]
	adds r4, r1, #0
_08035682:
	movs r1, #0
	movs r0, #0
	strh r0, [r6, #0x3e]
	adds r0, r6, #0
	adds r0, #0x39
	strb r1, [r0]
	subs r0, #3
	mov r1, sl
	strb r1, [r0]
	ldrb r0, [r0]
	bl sub_08035B00
	adds r1, r6, #0
	adds r1, #0x40
	strh r0, [r1]
	adds r7, r6, #0
	adds r7, #0x37
	mov r2, r8
	strb r2, [r7]
	ldr r0, [r6, #0x2c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	bl sub_0801C4D4
	ldr r1, [r6, #0x2c]
	ldr r0, [r6, #0x48]
	str r0, [r1, #0x24]
	adds r5, r6, #0
	adds r5, #0x3a
	movs r0, #0
	ldrsb r0, [r5, r0]
	bl sub_08035AE8
	ldr r3, [r6, #0x2c]
	movs r2, #0
	ldrsb r2, [r5, r2]
	lsls r1, r2, #3
	adds r1, r1, r2
	ldr r2, _08035734 @ =0x0000029A
	adds r1, r1, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #4
	orrs r1, r0
	strh r1, [r3, #0x22]
	ldr r3, _08035738 @ =gUnknown_0810EA60
	ldrb r1, [r7]
	ldr r0, _0803573C @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x56
	ldrb r4, [r0]
	subs r4, #1
	lsls r4, r4, #5
	adds r4, r4, r3
	movs r0, #0
	ldrsb r0, [r5, r0]
	bl sub_08035AE8
	adds r1, r0, #0
	lsls r1, r1, #0x15
	movs r0, #0x80
	lsls r0, r0, #0x12
	adds r1, r1, r0
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	movs r2, #0x20
	bl sub_08013618
	adds r0, r6, #0
	bl sub_080359A4
	adds r0, r6, #0
	bl sub_08035B3C
	ldr r1, [r6, #0x48]
	bl sub_08011CAC
	adds r0, r6, #0
_08035724:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08035734: .4byte 0x0000029A
_08035738: .4byte gUnknown_0810EA60
_0803573C: .4byte gUnknown_08499598

