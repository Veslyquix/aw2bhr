	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803A69C
sub_0803A69C: @ 0x0803A69C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	movs r0, #2
	bl sub_08023274
	ldr r2, _0803A6F0 @ =gUnknown_08090F78
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x60
	ands r0, r1
	adds r6, r2, #0
	ldr r1, _0803A6F4 @ =gUnknown_08090F7C
	mov sb, r1
	cmp r0, #0
	beq _0803A738
	movs r0, #0x67
	bl sub_0803B4DC
	mov r4, sb
	ldr r2, [r4]
	ldr r0, [r2]
	ldrb r1, [r0, #9]
	subs r1, #1
	strb r1, [r0, #9]
	ldr r1, [r2]
	movs r0, #9
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0803A6E2
	movs r0, #0xf
	strb r0, [r1, #9]
_0803A6E2:
	ldr r4, _0803A6F8 @ =gUnknown_0849E398
	ldr r0, [r2]
	movs r1, #9
	ldrsb r1, [r0, r1]
	lsls r1, r1, #1
	ldr r3, _0803A6FC @ =gUnknown_081BA068
	b _0803A71E
	.align 2, 0
_0803A6F0: .4byte gUnknown_08090F78
_0803A6F4: .4byte gUnknown_08090F7C
_0803A6F8: .4byte gUnknown_0849E398
_0803A6FC: .4byte gUnknown_081BA068
_0803A700:
	ldr r0, [r2]
	ldrb r1, [r0, #9]
	subs r1, #1
	strb r1, [r0, #9]
	ldr r1, [r2]
	movs r0, #9
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0803A716
	movs r0, #0xf
	strb r0, [r1, #9]
_0803A716:
	ldr r0, [r2]
	movs r1, #9
	ldrsb r1, [r0, r1]
	lsls r1, r1, #1
_0803A71E:
	ldr r0, [r0, #4]
	ldrb r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, #1
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r1, r1, r4
	ldrh r0, [r1]
	cmp r0, #0
	beq _0803A700
_0803A738:
	ldr r0, [r6]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x90
	ands r0, r1
	cmp r0, #0
	beq _0803A7C4
	movs r0, #0x67
	bl sub_0803B4DC
	mov r0, sb
	ldr r2, [r0]
	ldr r0, [r2]
	ldrb r1, [r0, #9]
	adds r1, #1
	strb r1, [r0, #9]
	ldr r1, [r2]
	movs r0, #9
	ldrsb r0, [r1, r0]
	cmp r0, #0xf
	ble _0803A766
	movs r0, #0
	strb r0, [r1, #9]
_0803A766:
	ldr r4, _0803A864 @ =gUnknown_0849E398
	ldr r0, [r2]
	movs r1, #9
	ldrsb r1, [r0, r1]
	lsls r1, r1, #1
	ldr r3, _0803A868 @ =gUnknown_081BA068
	ldr r0, [r0, #4]
	ldrb r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, #1
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r1, r1, r4
	ldrh r0, [r1]
	cmp r0, #0
	bne _0803A7C4
	movs r5, #0
_0803A78E:
	ldr r0, [r2]
	ldrb r1, [r0, #9]
	adds r1, #1
	strb r1, [r0, #9]
	ldr r1, [r2]
	movs r0, #9
	ldrsb r0, [r1, r0]
	cmp r0, #0xf
	ble _0803A7A2
	strb r5, [r1, #9]
_0803A7A2:
	ldr r0, [r2]
	movs r1, #9
	ldrsb r1, [r0, r1]
	lsls r1, r1, #1
	ldr r0, [r0, #4]
	ldrb r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, #1
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r1, r1, r4
	ldrh r0, [r1]
	cmp r0, #0
	beq _0803A78E
_0803A7C4:
	mov r1, sb
	ldr r5, [r1]
	ldr r2, [r5]
	movs r1, #0xa
	ldrsb r1, [r2, r1]
	ldrb r3, [r2, #9]
	movs r0, #9
	ldrsb r0, [r2, r0]
	cmp r1, r0
	beq _0803A870
	strb r3, [r2, #0xa]
	bl sub_08014878
	movs r4, #0
	ldr r0, _0803A86C @ =gUnknown_08090F80
	mov r8, r0
	mov ip, r5
	ldr r7, [r0]
	movs r6, #0
_0803A7EA:
	movs r3, #0
	adds r5, r4, #1
_0803A7EE:
	mov r0, ip
	ldr r1, [r0]
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	ldr r2, [r7]
	adds r0, r3, r0
	adds r1, r4, r1
	lsls r1, r1, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	adds r0, #0x42
	strh r6, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xd
	bls _0803A7EE
	lsls r0, r5, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _0803A7EA
	movs r0, #0
	bl sub_08013AD4
	mov r1, sb
	ldr r0, [r1]
	ldr r3, [r0]
	ldrb r0, [r3, #2]
	adds r0, #1
	ldrb r1, [r3, #3]
	adds r1, #1
	mov r4, r8
	ldr r2, [r4]
	ldr r2, [r2]
	ldr r6, _0803A864 @ =gUnknown_0849E398
	movs r4, #9
	ldrsb r4, [r3, r4]
	lsls r4, r4, #1
	ldr r5, _0803A868 @ =gUnknown_081BA068
	ldr r3, [r3, #4]
	ldrb r3, [r3]
	adds r3, r3, r5
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	subs r3, #1
	lsls r3, r3, #5
	adds r4, r4, r3
	adds r4, r4, r6
	ldrh r3, [r4]
	movs r4, #0x80
	lsls r4, r4, #8
	str r4, [sp]
	movs r4, #0xf8
	str r4, [sp, #4]
	bl sub_080146D4
	b _0803A8D6
	.align 2, 0
_0803A864: .4byte gUnknown_0849E398
_0803A868: .4byte gUnknown_081BA068
_0803A86C: .4byte gUnknown_08090F80
_0803A870:
	ldr r0, [r6]
	ldr r0, [r0]
	ldrh r2, [r0, #4]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0803A8A4
	movs r0, #0x66
	bl sub_0803B4DC
	bl sub_08014878
	bl sub_0803A59C
	ldr r0, _0803A89C @ =gUnknown_0849E2C0
	bl sub_0801537C
	ldr r0, _0803A8A0 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
	b _0803A8D6
	.align 2, 0
_0803A89C: .4byte gUnknown_0849E2C0
_0803A8A0: .4byte gUnknown_03001FBC
_0803A8A4:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0803A8D6
	bl sub_08014878
	bl sub_0803A59C
	ldr r0, _0803A8E4 @ =gUnknown_0849E2C0
	bl sub_0801537C
	ldr r0, _0803A8E8 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
	ldr r1, _0803A8EC @ =gUnknown_030033E4
	ldrh r0, [r1]
	ldrh r1, [r1, #2]
	bl sub_0803EED4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_080470F8
_0803A8D6:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803A8E4: .4byte gUnknown_0849E2C0
_0803A8E8: .4byte gUnknown_03001FBC
_0803A8EC: .4byte gUnknown_030033E4

