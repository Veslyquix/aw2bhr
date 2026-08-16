	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037448
sub_08037448: @ 0x08037448
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	bl sub_08026340
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _080374D0 @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #2
	beq _08037474
	cmp r0, #4
	beq _08037474
	adds r0, r6, #0
	bl sub_0803CA9C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080374E0
_08037474:
	movs r5, #0
	movs r4, #0
	lsls r6, r6, #0x10
	ldr r0, _080374D4 @ =gUnknown_085C77A0
	mov sb, r0
	ldr r0, _080374D8 @ =gUnknown_02027F78
	mov r8, r0
_08037482:
	movs r0, #0x5c
	muls r0, r4, r0
	add r0, sb
	ldrh r1, [r0, #0x1a]
	lsrs r0, r6, #0x10
	cmp r1, r0
	bne _080374AA
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_080373F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080374AA
	adds r1, r5, #0
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	add r1, r8
	strb r4, [r1]
_080374AA:
	cmp r5, #0x31
	bhi _080374B8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xbf
	bls _08037482
_080374B8:
	cmp r5, #0
	beq _080374E0
	ldr r0, _080374DC @ =gUnknown_02027F74
	adds r2, r0, #0
	adds r2, #0x36
	movs r1, #0
	strb r1, [r2]
	subs r1, r5, #1
	adds r0, #0x37
	strb r1, [r0]
	movs r0, #1
	b _080374E2
	.align 2, 0
_080374D0: .4byte gUnknown_03003FC0
_080374D4: .4byte gUnknown_085C77A0
_080374D8: .4byte gUnknown_02027F78
_080374DC: .4byte gUnknown_02027F74
_080374E0:
	movs r0, #0
_080374E2:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

