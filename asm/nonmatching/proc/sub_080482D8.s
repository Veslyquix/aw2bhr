	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080482D8
sub_080482D8: @ 0x080482D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0
	beq _08048310
	mov r0, sl
	bl sub_08047F70
	mov r0, sl
	ldrb r1, [r0, #0x1f]
	adds r0, #0x20
	ldrb r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x14
	movs r0, #0xd8
	lsls r0, r0, #0xe
	adds r1, r1, r0
	asrs r1, r1, #0x10
	movs r0, #0x1e
	movs r2, #3
	bl sub_0802323C
_08048310:
	mov r0, sl
	bl sub_08048158
	ldr r0, _080483D8 @ =gUnknown_030033EC
	ldrh r1, [r0]
	ldr r0, _080483DC @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1a]
	adds r0, #0x3d
	movs r4, #0
	str r4, [sp]
	movs r1, #0xf
	movs r2, #8
	movs r3, #0
	bl sub_0801F34C
	str r4, [sp]
	movs r0, #1
	movs r1, #0xaa
	movs r2, #8
	movs r3, #0
	bl sub_0801F34C
	movs r1, #0
	mov sb, r1
	ldr r1, _080483E0 @ =gUnknown_02028DD8
	mov r5, sl
	adds r5, #0x20
	ldrb r0, [r5]
	adds r0, r0, r1
	ldrb r0, [r0]
	str r5, [sp, #4]
	cmp r0, #0xff
	bne _0804835E
	b _080484AE
_0804835E:
	ldr r0, _080483E4 @ =gUnknown_0848B688
	mov r8, r0
_08048362:
	ldrb r0, [r5]
	add r0, sb
	ldr r1, _080483E0 @ =gUnknown_02028DD8
	adds r0, r0, r1
	ldrb r3, [r0]
	ldr r2, _080483E8 @ =gUnknown_08499594
	ldr r0, _080483EC @ =gUnknown_03003F2C
	ldrh r0, [r0]
	adds r0, r0, r3
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r2]
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0
	bne _08048386
	b _080484AE
_08048386:
	adds r7, r3, #0
	mov r0, sl
	adds r1, r7, #0
	bl sub_0804769C
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldrb r1, [r4, #1]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0804848E
	subs r2, r6, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldrb r3, [r5]
	add r3, sb
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r0, sl
	adds r1, r7, #0
	bl sub_08047740
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	beq _080483F4
	cmp r0, #2
	beq _0804843C
	adds r5, r6, #2
	lsls r5, r5, #3
	mov r0, sb
	lsls r4, r0, #4
	adds r4, #0x38
	ldr r1, _080483F0 @ =0x00008208
	str r1, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	b _0804841A
	.align 2, 0
_080483D8: .4byte gUnknown_030033EC
_080483DC: .4byte gUnknown_08499598
_080483E0: .4byte gUnknown_02028DD8
_080483E4: .4byte gUnknown_0848B688
_080483E8: .4byte gUnknown_08499594
_080483EC: .4byte gUnknown_03003F2C
_080483F0: .4byte 0x00008208
_080483F4:
	adds r5, r6, #2
	lsls r5, r5, #3
	mov r0, sb
	lsls r4, r0, #4
	adds r4, #0x38
	ldr r1, _08048434 @ =0x00008208
	str r1, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutSprite
	adds r2, r4, #0
	adds r2, #8
	ldr r0, _08048434 @ =0x00008208
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
_0804841A:
	mov r3, r8
	bl PutSprite
	adds r4, #4
	ldr r0, _08048438 @ =0x00008209
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutSprite
	b _0804848E
	.align 2, 0
_08048434: .4byte 0x00008208
_08048438: .4byte 0x00008209
_0804843C:
	adds r5, r6, #1
	lsls r5, r5, #3
	mov r1, sb
	lsls r4, r1, #4
	adds r4, #0x38
	ldr r0, _080484C0 @ =0x00008208
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutSprite
	adds r2, r4, #0
	adds r2, #8
	ldr r1, _080484C0 @ =0x00008208
	str r1, [sp]
	movs r0, #0
	adds r1, r5, #0
	mov r3, r8
	bl PutSprite
	adds r5, r6, #2
	lsls r5, r5, #3
	ldr r0, _080484C0 @ =0x00008208
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutSprite
	adds r4, #4
	ldr r0, _080484C4 @ =0x00008209
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutSprite
_0804848E:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	cmp r0, #5
	bhi _080484AE
	ldr r5, [sp, #4]
	ldrb r0, [r5]
	add r0, sb
	ldr r1, _080484C8 @ =gUnknown_02028DD8
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080484AE
	b _08048362
_080484AE:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080484C0: .4byte 0x00008208
_080484C4: .4byte 0x00008209
_080484C8: .4byte gUnknown_02028DD8

