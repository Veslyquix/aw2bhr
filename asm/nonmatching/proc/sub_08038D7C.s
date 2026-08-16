	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08038D7C
sub_08038D7C: @ 0x08038D7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r3, _08038E00 @ =gUnknown_08090F1C
	ldr r1, [r3]
	ldr r2, _08038E04 @ =gUnknown_08090F20
	ldr r7, [r2]
	ldrh r6, [r7, #2]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldrh r4, [r7]
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	mov r8, r0
	ldr r0, _08038E08 @ =gUnknown_08090F24
	ldr r1, [r0]
	mov sb, r1
	ldr r5, [r1]
	movs r1, #0x1e
	ldrsb r1, [r5, r1]
	mov sl, r0
	cmp r1, r4
	bne _08038DBA
	movs r0, #0x1f
	ldrsb r0, [r5, r0]
	cmp r0, r6
	bne _08038DBA
	b _0803904C
_08038DBA:
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_080386DC
	mov r6, r8
	lsls r0, r6, #0x18
	asrs r0, r0, #0x18
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	bne _08038DD2
	b _0803904C
_08038DD2:
	movs r0, #0
	ldrsb r0, [r7, r0]
	movs r1, #2
	ldrsb r1, [r7, r1]
	bl sub_08038960
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r4
	beq _08038E10
	lsls r0, r1, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	asrs r0, r0, #0x18
	bl sub_080386EC
	ldr r3, _08038E0C @ =gUnknown_03004074
	mov r6, sb
	ldr r0, [r6]
	b _08038F9A
	.align 2, 0
_08038E00: .4byte gUnknown_08090F1C
_08038E04: .4byte gUnknown_08090F20
_08038E08: .4byte gUnknown_08090F24
_08038E0C: .4byte gUnknown_03004074
_08038E10:
	mov r1, sb
	ldr r0, [r1]
	adds r1, r0, #0
	adds r1, #0x45
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x38
	adds r7, r0, r1
	ldr r5, _08038E64 @ =gUnknown_085D3DD0
	ldr r3, _08038E68 @ =gUnknown_03003FC0
	adds r4, r3, #0
	adds r4, #0x2c
	ldr r0, _08038E6C @ =gUnknown_03003F38
	ldrb r1, [r0]
	lsrs r1, r1, #6
	ldr r0, _08038E70 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r2
	adds r0, r2, #0
	adds r0, #0x5a
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	ldrb r4, [r4]
	adds r0, r0, r4
	lsls r4, r0, #2
	ldrb r0, [r3, #8]
	cmp r0, #0
	beq _08038E74
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #6
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r4, r0
	b _08038E7A
	.align 2, 0
_08038E64: .4byte gUnknown_085D3DD0
_08038E68: .4byte gUnknown_03003FC0
_08038E6C: .4byte gUnknown_03003F38
_08038E70: .4byte gUnknown_08499598
_08038E74:
	movs r6, #0x82
	lsls r6, r6, #1
	adds r1, r4, r6
_08038E7A:
	adds r0, r5, #0
	adds r0, #0x50
	adds r0, r0, r1
	ldr r4, [r0]
	ldr r5, _08038EF0 @ =gUnknown_08090F28
	ldr r0, [r5]
	ldr r2, [r0]
	ldr r3, _08038EF4 @ =gUnknown_030033E4
	ldrh r1, [r3, #2]
	lsls r1, r1, #1
	ldr r6, _08038EF8 @ =0x0000417A
	adds r0, r2, r6
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r6, [r3]
	adds r0, r0, r6
	ldr r1, _08038EFC @ =0x00001432
	adds r2, r2, r1
	adds r2, r2, r0
	ldrb r0, [r2]
	movs r1, #0x1f
	ands r1, r0
	ldr r3, _08038F00 @ =gUnknown_085D5ABC
	ldr r0, _08038F04 @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r2, [r0]
	movs r0, #0x5c
	muls r0, r2, r0
	adds r0, r0, r3
	ldrb r0, [r0, #0x19]
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r4, r4, r1
	movs r1, #0
	ldrsb r1, [r7, r1]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bge _08038ECA
	b _08038FC0
_08038ECA:
	mov r1, sl
	ldr r0, [r1]
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x45
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x20
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r1, r0, r6
	cmp r1, #0
	blt _08038F08
	cmp r1, #1
	beq _08038F0E
	b _08038F2E
	.align 2, 0
_08038EF0: .4byte gUnknown_08090F28
_08038EF4: .4byte gUnknown_030033E4
_08038EF8: .4byte 0x0000417A
_08038EFC: .4byte 0x00001432
_08038F00: .4byte gUnknown_085D5ABC
_08038F04: .4byte gUnknown_030040D8
_08038F08:
	subs r0, r6, r0
	cmp r0, #1
	bne _08038F2E
_08038F0E:
	mov r6, sl
	ldr r0, [r6]
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x45
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x2c
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldr r0, _08038F58 @ =gUnknown_030033E4
	ldrh r0, [r0, #2]
	cmp r1, r0
	beq _08038F82
_08038F2E:
	mov r1, sl
	ldr r0, [r1]
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x45
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x2c
	adds r0, r0, r1
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r0, _08038F58 @ =gUnknown_030033E4
	ldrh r0, [r0, #2]
	subs r1, r2, r0
	cmp r1, #0
	blt _08038F5C
	cmp r1, #1
	beq _08038F62
	b _08038FC0
	.align 2, 0
_08038F58: .4byte gUnknown_030033E4
_08038F5C:
	subs r0, r0, r2
	cmp r0, #1
	bne _08038FC0
_08038F62:
	mov r6, sl
	ldr r0, [r6]
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x45
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x20
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldr r0, _08038FB8 @ =gUnknown_030033E4
	ldrh r0, [r0]
	cmp r1, r0
	bne _08038FC0
_08038F82:
	ldr r1, _08038FB8 @ =gUnknown_030033E4
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #2]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_08038848
	ldr r3, _08038FBC @ =gUnknown_03004074
	mov r1, sl
	ldr r0, [r1]
	ldr r0, [r0]
_08038F9A:
	adds r2, r0, #0
	adds r2, #0x44
	adds r1, r0, #0
	adds r1, #0x45
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x38
	adds r0, r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	subs r1, r1, r0
	strb r1, [r3]
	b _0803904C
	.align 2, 0
_08038FB8: .4byte gUnknown_030033E4
_08038FBC: .4byte gUnknown_03004074
_08038FC0:
	mov r6, sl
	ldr r0, [r6]
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x45
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x38
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08038FE4
	movs r0, #1
	bl sub_080386EC
_08038FE4:
	ldr r0, [r5]
	ldr r0, [r0]
	ldr r1, _08039018 @ =0x00002D5A
	adds r0, r0, r1
	bl sub_0801F92C
	bl sub_08038B84
	ldr r2, _0803901C @ =gUnknown_03003340
	ldr r1, _08039020 @ =gUnknown_030033E4
	ldrh r4, [r1, #2]
	lsls r0, r4, #2
	adds r0, r0, r2
	ldrh r3, [r1]
	ldr r0, [r0]
	adds r0, r0, r3
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08039024
	bl sub_08038BE0
	b _08039040
	.align 2, 0
_08039018: .4byte 0x00002D5A
_0803901C: .4byte gUnknown_03003340
_08039020: .4byte gUnknown_030033E4
_08039024:
	ldr r2, _0803905C @ =gUnknown_03003110
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_0802042C
	bl sub_080389D8
	bl sub_08038C08
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08039040
	bl sub_08038BE0
_08039040:
	ldr r0, [r5]
	ldr r0, [r0]
	ldr r6, _08039060 @ =0x00002852
	adds r0, r0, r6
	bl sub_0801F92C
_0803904C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803905C: .4byte gUnknown_03003110
_08039060: .4byte 0x00002852

