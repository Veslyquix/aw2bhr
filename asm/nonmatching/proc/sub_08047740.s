	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08047740
sub_08047740: @ 0x08047740
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp]
	movs r1, #0
	mov sl, r1
	cmp r2, #1
	bne _08047810
	movs r3, #0
	adds r0, #0x21
	ldrb r1, [r0]
	str r0, [sp, #0x14]
	cmp sl, r1
	blo _08047770
	b _0804790E
_08047770:
	ldr r0, _080477E8 @ =gUnknown_08499594
	ldr r0, [r0]
	mov sb, r0
	ldr r2, [sp, #0x14]
	mov ip, r2
	mov r8, r1
	ldr r0, _080477EC @ =gUnknown_03003F2C
	ldrh r5, [r0]
	ldr r7, _080477F0 @ =gUnknown_0812A128
_08047782:
	ldr r1, _080477F4 @ =gUnknown_02028DD8
	adds r0, r3, r1
	ldrb r1, [r0]
	adds r1, r5, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, sb
	adds r2, r1, r0
	ldrb r1, [r2, #1]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08047804
	ldrb r0, [r2, #7]
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrb r0, [r2, #8]
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r6, r4
	beq _080477B6
	cmp r6, r1
	bne _08047804
_080477B6:
	ldr r0, [sp]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	mov r2, ip
	ldrb r2, [r2]
	cmp r3, r2
	blo _080477C8
	b _0804790E
_080477C8:
	ldr r5, [r7]
	ldr r0, [sp, #0x14]
	ldrb r2, [r0]
_080477CE:
	adds r0, r3, r5
	ldrb r0, [r0]
	cmp r0, r4
	beq _080477DA
	cmp r0, r1
	bne _080477F8
_080477DA:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	b _0804790E
	.align 2, 0
_080477E8: .4byte gUnknown_08499594
_080477EC: .4byte gUnknown_03003F2C
_080477F0: .4byte gUnknown_0812A128
_080477F4: .4byte gUnknown_02028DD8
_080477F8:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r2
	blo _080477CE
	b _0804790E
_08047804:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r8
	blo _08047782
	b _0804790E
_08047810:
	movs r3, #0
	adds r0, #0x21
	ldrb r1, [r0]
	str r0, [sp, #0x14]
	cmp sl, r1
	bhs _0804790E
	ldr r0, _080478E0 @ =gUnknown_08499594
	ldr r2, _080478E4 @ =gUnknown_03003F2C
	ldrh r2, [r2]
	str r2, [sp, #8]
	ldr r0, [r0]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	str r0, [sp, #0x10]
	str r1, [sp, #4]
_0804782E:
	ldr r1, _080478E8 @ =gUnknown_02028DD8
	adds r0, r3, r1
	ldrb r4, [r0]
	ldr r2, [sp, #8]
	adds r1, r2, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [sp, #0xc]
	adds r2, r1, r0
	ldrb r1, [r2, #1]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08047902
	ldrb r0, [r2, #7]
	ldr r1, [sp, #8]
	subs r0, r0, r1
	cmp r6, r0
	beq _0804785E
	ldrb r0, [r2, #8]
	subs r0, r0, r1
	cmp r6, r0
	bne _08047902
_0804785E:
	adds r6, r4, #0
	movs r3, #0
	ldr r2, [sp, #0x10]
	ldrb r2, [r2]
	cmp r3, r2
	bhs _08047902
	ldr r0, _080478E0 @ =gUnknown_08499594
	ldr r0, [r0]
	mov sb, r0
	ldr r7, [sp, #0x14]
	ldrb r0, [r7]
	mov r8, r0
	ldr r1, _080478E4 @ =gUnknown_03003F2C
	ldrh r5, [r1]
	ldr r0, [sp]
	adds r0, #1
	lsls r0, r0, #0x10
	mov ip, r0
_08047882:
	ldr r2, _080478E8 @ =gUnknown_02028DD8
	adds r0, r3, r2
	ldrb r1, [r0]
	adds r1, r5, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, sb
	adds r2, r1, r0
	ldrb r1, [r2, #1]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080478F8
	ldrb r0, [r2, #7]
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrb r0, [r2, #8]
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r6, r4
	beq _080478B6
	cmp r6, r1
	bne _080478F8
_080478B6:
	mov r2, ip
	lsrs r3, r2, #0x10
	ldrb r7, [r7]
	cmp r3, r7
	bhs _08047902
	ldr r5, _080478E8 @ =gUnknown_02028DD8
	ldr r0, [sp, #0x10]
	ldrb r2, [r0]
_080478C6:
	adds r0, r3, r5
	ldrb r0, [r0]
	cmp r0, r4
	beq _080478D2
	cmp r0, r1
	bne _080478EC
_080478D2:
	mov r0, sl
	adds r0, #2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	b _08047902
	.align 2, 0
_080478E0: .4byte gUnknown_08499594
_080478E4: .4byte gUnknown_03003F2C
_080478E8: .4byte gUnknown_02028DD8
_080478EC:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r2
	blo _080478C6
	b _08047902
_080478F8:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r8
	blo _08047882
_08047902:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r1, [sp, #4]
	cmp r3, r1
	blo _0804782E
_0804790E:
	mov r0, sl
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

