	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08089F90
sub_08089F90: @ 0x08089F90
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #4]
	adds r4, r0, #0
	adds r4, #0x48
	ldrh r0, [r4]
	movs r1, #0x18
	bl DivRem
	cmp r0, #0xb
	bgt _08089FBA
	ldrh r0, [r4]
	movs r1, #0x18
	bl DivRem
	adds r4, r0, #0
	b _08089FC6
_08089FBA:
	ldrh r0, [r4]
	movs r1, #0x18
	bl DivRem
	movs r1, #0x18
	subs r4, r1, r0
_08089FC6:
	movs r0, #0xc0
	movs r1, #0x18
	bl Div
	muls r0, r4, r0
	movs r1, #0x80
	lsls r1, r1, #1
	adds r4, r0, r1
	ldr r5, _0808A154 @ =gSinLut
	adds r0, r5, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r7, r0, #4
	adds r1, r4, #0
	cmp r4, #0
	bne _08089FEA
	movs r1, #2
_08089FEA:
	adds r0, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r0, #0
	ldrsh r5, [r5, r0]
	rsbs r0, r5, #0
	lsls r0, r0, #4
	mov sl, r0
	adds r1, r4, #0
	cmp r4, #0
	bne _0808A008
	movs r1, #2
_0808A008:
	mov r0, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	lsls r5, r5, #4
	mov sb, r5
	adds r1, r4, #0
	cmp r4, #0
	bne _0808A01E
	movs r1, #2
_0808A01E:
	mov r0, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	adds r1, r4, #0
	cmp r1, #0
	bne _0808A030
	movs r1, #2
_0808A030:
	adds r0, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	mov r1, r8
	adds r2, r6, #0
	adds r3, r5, #0
	bl SetObjAffine
	ldr r1, [sp, #4]
	adds r1, #0x4c
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xf
	ble _0808A056
	b _0808A2D2
_0808A056:
	adds r3, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x10
	bl Interpolate
	adds r4, r0, #0
	movs r5, #0x88
	lsls r5, r5, #1
	movs r1, #2
	cmp r4, r5
	beq _0808A076
	subs r1, r5, r4
_0808A076:
	adds r0, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r1, #2
	cmp r4, r5
	beq _0808A08A
	subs r1, r5, r4
_0808A08A:
	mov r0, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r1, #2
	cmp r4, r5
	beq _0808A09E
	subs r1, r5, r4
_0808A09E:
	mov r0, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	movs r1, #2
	cmp r4, r5
	beq _0808A0B0
	subs r1, r5, r4
_0808A0B0:
	adds r0, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #8]
	mov r2, r8
	adds r3, r6, #0
	bl SetObjAffine
	adds r0, r7, #0
	adds r1, r4, #0
	cmp r4, #0
	bne _0808A0D2
	movs r1, #2
_0808A0D2:
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	adds r1, r4, #0
	cmp r4, #0
	bne _0808A0E4
	movs r1, #2
_0808A0E4:
	mov r0, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	adds r1, r4, #0
	cmp r4, #0
	bne _0808A0F6
	movs r1, #2
_0808A0F6:
	mov r0, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	adds r1, r4, #0
	cmp r1, #0
	bne _0808A108
	movs r1, #2
_0808A108:
	adds r0, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #3
	mov r1, r8
	adds r2, r6, #0
	adds r3, r5, #0
	bl SetObjAffine
	movs r4, #0
	ldr r1, [sp, #4]
	adds r1, #0x48
	mov sl, r1
	ldr r2, _0808A158 @ =gUnknown_081D9474
	mov sb, r2
	movs r0, #4
	mov r8, r0
	movs r7, #0x28
	movs r6, #8
	movs r5, #0x83
_0808A136:
	mov r1, sb
	ldr r0, [r1]
	ldrb r0, [r0]
	cmp r4, r0
	bne _0808A15C
	mov r2, r8
	str r2, [sp]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #0
	bl sub_0801F34C
	b _0808A174
	.align 2, 0
_0808A154: .4byte gSinLut
_0808A158: .4byte gUnknown_081D9474
_0808A15C:
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r1, r6
	movs r2, #0x80
	lsls r2, r2, #1
	orrs r2, r7
	mov r0, r8
	str r0, [sp]
	adds r0, r5, #0
	movs r3, #0
	bl sub_0801F34C
_0808A174:
	adds r7, #6
	adds r6, #0x18
	adds r5, #1
	adds r4, #1
	cmp r4, #3
	ble _0808A136
	movs r4, #0
	movs r7, #4
	movs r6, #0x4a
	movs r5, #0x10
_0808A188:
	mov r1, sb
	ldr r0, [r1]
	ldrb r1, [r0]
	subs r0, r1, #4
	cmp r4, r0
	bne _0808A1A4
	adds r0, #0x87
	str r7, [sp]
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl sub_0801F34C
	b _0808A1BC
_0808A1A4:
	adds r0, r4, #0
	adds r0, #0x87
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r1, r5
	movs r2, #0x80
	lsls r2, r2, #1
	orrs r2, r6
	str r7, [sp]
	movs r3, #0
	bl sub_0801F34C
_0808A1BC:
	adds r6, #6
	adds r5, #0x18
	adds r4, #1
	cmp r4, #3
	ble _0808A188
	mov r2, sb
	ldr r4, [r2]
	ldrb r0, [r4]
	cmp r0, #3
	bhi _0808A234
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r1, r2, #3
	subs r1, #0x10
	ldr r5, _0808A218 @ =0x000001FF
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
	bhi _0808A21C
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r1, r2, #3
	adds r1, #0x20
	ands r1, r5
	movs r0, #0xc0
	lsls r0, r0, #3
	orrs r1, r0
	lsls r2, r2, #1
	adds r2, #0x28
	b _0808A280
	.align 2, 0
_0808A218: .4byte 0x000001FF
_0808A21C:
	ldrb r0, [r4]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r1, r2, #3
	subs r1, #0x20
	ands r1, r5
	movs r0, #0xc0
	lsls r0, r0, #3
	orrs r1, r0
	lsls r2, r2, #1
	adds r2, #0x28
	b _0808A280
_0808A234:
	ldrb r0, [r4]
	subs r0, #4
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r1, r2, #3
	subs r1, #8
	ldr r5, _0808A298 @ =0x000001FF
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
	bhi _0808A29C
	subs r0, #4
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r1, r2, #3
	adds r1, #0x28
	ands r1, r5
	movs r0, #0xc0
	lsls r0, r0, #3
	orrs r1, r0
	lsls r2, r2, #1
	adds r2, #0x4a
_0808A280:
	ands r2, r6
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r2, r0
	movs r0, #0
	str r0, [sp]
	movs r0, #0x4f
	movs r3, #0
	bl sub_0801F34C
	b _0808A2C8
	.align 2, 0
_0808A298: .4byte 0x000001FF
_0808A29C:
	ldrb r0, [r4]
	subs r0, #4
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r1, r2, #3
	subs r1, #0x18
	ands r1, r5
	movs r0, #0xc0
	lsls r0, r0, #3
	orrs r1, r0
	lsls r2, r2, #1
	adds r2, #0x4a
	ands r2, r6
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r2, r0
	movs r0, #0
	str r0, [sp]
	movs r0, #0x4f
	movs r3, #0
	bl sub_0801F34C
_0808A2C8:
	mov r1, sl
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0808A2DE
_0808A2D2:
	ldr r1, _0808A2F0 @ =gUnknown_03005908
	movs r0, #1
	str r0, [r1]
	ldr r0, [sp, #4]
	bl sub_08089464
_0808A2DE:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808A2F0: .4byte gUnknown_03005908

