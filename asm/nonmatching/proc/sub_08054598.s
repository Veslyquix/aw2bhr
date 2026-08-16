	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08054598
sub_08054598: @ 0x08054598
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	ldr r0, _0805463C @ =gUnknown_020298E0
	mov sb, r0
	lsls r0, r7, #3
	adds r0, r0, r7
	lsls r6, r0, #4
	mov r1, sb
	adds r3, r6, r1
	ldrh r0, [r3, #0x16]
	adds r0, #1
	strh r0, [r3, #0x16]
	movs r5, #0
	ldr r0, _08054640 @ =gUnknown_08552148
	lsls r4, r7, #1
	adds r0, r0, r4
	mov ip, r0
	ldrh r0, [r0]
	cmp r8, r0
	beq _080545F2
	ldr r2, _08054644 @ =gUnknown_02029A10
	mov r0, r8
	lsls r1, r0, #3
	add r1, r8
	lsls r1, r1, #2
	movs r0, #0xb4
	muls r0, r7, r0
	adds r1, r1, r0
	adds r1, r1, r2
	ldrb r2, [r1]
	ldrb r0, [r1, #1]
	subs r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	subs r2, r2, r5
	strb r2, [r1]
_080545F2:
	ldrh r0, [r3, #0x16]
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r6
	mov r1, sb
	adds r1, #0x1a
	adds r0, r0, r1
	ldrh r0, [r0]
	str r4, [sp]
	ldr r1, _08054648 @ =gUnknown_08136144
	mov sl, r1
	cmp r0, #0xff
	bne _0805467C
	movs r4, #0
	mov sb, ip
	ldr r0, _08054644 @ =gUnknown_02029A10
	mov ip, r0
	movs r0, #0xb4
	adds r6, r7, #0
	muls r6, r0, r6
_0805461A:
	mov r1, sb
	ldrh r1, [r1]
	cmp r4, r1
	beq _0805464C
	lsls r1, r4, #3
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r6
	add r1, ip
	ldrb r2, [r1]
	ldrb r0, [r1, #1]
	subs r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	subs r2, r2, r3
	strb r2, [r1]
	b _0805466C
	.align 2, 0
_0805463C: .4byte gUnknown_020298E0
_08054640: .4byte gUnknown_08552148
_08054644: .4byte gUnknown_02029A10
_08054648: .4byte gUnknown_08136144
_0805464C:
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r6
	mov r1, ip
	adds r2, r0, r1
	ldrb r0, [r2, #1]
	cmp r0, #1
	bne _08054672
	ldrb r0, [r2]
	ldrb r1, [r2, #1]
	subs r1, r0, r1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	subs r0, r0, r3
	strb r0, [r2]
_0805466C:
	adds r0, r5, r3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_08054672:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	bls _0805461A
_0805467C:
	cmp r5, #0
	beq _08054692
	ldr r0, _080546B8 @ =gUnknown_03004580
	lsls r1, r7, #4
	adds r0, #0xa
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0
	beq _08054692
	subs r0, r0, r5
	strh r0, [r1]
_08054692:
	mov r1, sl
	ldr r0, [r1]
	ldr r1, [sp]
	adds r0, r1, r0
	movs r1, #1
	strh r1, [r0]
	adds r0, r7, #0
	mov r1, r8
	bl sub_08050F24
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080546B8: .4byte gUnknown_03004580

