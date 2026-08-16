	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08020EDC
sub_08020EDC: @ 0x08020EDC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r3, [sp, #8]
	ldr r3, [sp, #0x3c]
	ldr r4, [sp, #0x40]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0xc]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0x10]
	lsrs r0, r2, #0x10
	str r0, [sp, #4]
	asrs r4, r2, #0x10
	cmp r4, #0
	bne _08020F40
	ldr r0, _08020F38 @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r0, r5, #0x10
	asrs r0, r0, #0xf
	ldr r2, _08020F3C @ =0x0000417A
	adds r1, r1, r2
	adds r1, r1, r0
	ldr r3, [sp]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r4, [sp, #8]
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r2, [sp, #0xc]
	adds r1, r1, r2
	strb r1, [r0]
	b _080210A4
	.align 2, 0
_08020F38: .4byte gUnknown_08499590
_08020F3C: .4byte 0x0000417A
_08020F40:
	rsbs r0, r4, #0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r2, r5, #0x10
	asrs r1, r2, #0x10
	subs r0, r1, r4
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r3, r5, #0x10
	asrs r0, r3, #0x10
	adds r1, r1, r4
	str r2, [sp, #0x18]
	cmp r0, r1
	ble _08020F5E
	b _080210A4
_08020F5E:
	asrs r2, r3, #0x10
	ldr r3, [sp, #4]
	lsls r3, r3, #0x10
	mov sl, r3
	lsls r5, r5, #0x10
	mov r8, r5
	lsls r6, r6, #0x10
	mov sb, r6
	cmp r2, #0
	bge _08020F74
	b _08021080
_08020F74:
	ldr r4, _08020F9C @ =gUnknown_08499590
	ldr r0, [r4]
	ldrh r0, [r0, #2]
	cmp r2, r0
	blt _08020F80
	b _08021080
_08020F80:
	ldr r0, [sp]
	lsls r2, r0, #0x10
	asrs r1, r2, #0x10
	asrs r0, r3, #0x10
	subs r1, r1, r0
	asrs r0, r6, #0x10
	str r2, [sp, #0x14]
	cmp r0, #0
	bge _08020F94
	rsbs r0, r0, #0
_08020F94:
	adds r0, r1, r0
	lsls r0, r0, #0x10
	b _0802105E
	.align 2, 0
_08020F9C: .4byte gUnknown_08499590
_08020FA0:
	cmp r4, #0
	blt _08021056
	ldr r1, _08020FDC @ =gUnknown_08499590
	ldr r0, [r1]
	ldrh r0, [r0]
	cmp r4, r0
	bge _08021056
	ldr r0, [sp, #0x10]
	bl sub_08043050
	movs r1, #8
	ands r1, r0
	cmp r1, #0
	bne _08021036
	subs r3, r4, r5
	cmp r3, #0
	bge _08020FC4
	subs r3, r5, r4
_08020FC4:
	mov r4, r8
	asrs r2, r4, #0x10
	ldr r0, [sp, #0x18]
	asrs r1, r0, #0x10
	subs r0, r2, r1
	cmp r0, #0
	blt _08020FE0
	adds r0, r3, r0
	cmp r0, #1
	bgt _08020FE8
	b _08021036
	.align 2, 0
_08020FDC: .4byte gUnknown_08499590
_08020FE0:
	subs r0, r1, r2
	adds r0, r3, r0
	cmp r0, #1
	ble _08021036
_08020FE8:
	ldr r1, _080210B4 @ =gUnknown_08499590
	ldr r3, [r1]
	mov r2, r8
	asrs r1, r2, #0xf
	ldr r4, _080210B8 @ =0x0000417A
	adds r0, r3, r4
	adds r0, r0, r1
	asrs r1, r7, #0x10
	ldrh r0, [r0]
	adds r1, r1, r0
	ldr r2, _080210BC @ =0x00001432
	adds r0, r3, r2
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r2, #0x1f
	ands r2, r0
	cmp r2, #4
	beq _08021010
	cmp r2, #0x13
	bne _08021036
_08021010:
	ldr r4, _080210C0 @ =0x0000051A
	adds r0, r3, r4
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _08021056
	ldr r2, _080210C4 @ =gUnknown_08499594
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r1, r1, r0
	ldrb r0, [r1]
	subs r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _08021056
_08021036:
	ldr r1, _080210B4 @ =gUnknown_08499590
	ldr r0, [r1]
	mov r2, r8
	asrs r1, r2, #0xf
	ldr r3, _080210B8 @ =0x0000417A
	adds r0, r0, r3
	adds r0, r0, r1
	asrs r1, r7, #0x10
	ldrh r0, [r0]
	adds r1, r1, r0
	ldr r4, [sp, #8]
	adds r1, r4, r1
	ldrb r0, [r1]
	ldr r2, [sp, #0xc]
	adds r0, r0, r2
	strb r0, [r1]
_08021056:
	lsls r0, r6, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
_0802105E:
	lsrs r6, r0, #0x10
	lsls r1, r6, #0x10
	asrs r4, r1, #0x10
	ldr r0, [sp, #0x14]
	asrs r5, r0, #0x10
	mov r2, sl
	asrs r0, r2, #0x10
	adds r2, r5, r0
	mov r3, sb
	asrs r0, r3, #0x10
	adds r7, r1, #0
	cmp r0, #0
	bge _0802107A
	rsbs r0, r0, #0
_0802107A:
	subs r0, r2, r0
	cmp r4, r0
	ble _08020FA0
_08021080:
	movs r0, #0x80
	lsls r0, r0, #9
	add r0, r8
	lsrs r5, r0, #0x10
	movs r0, #0x80
	lsls r0, r0, #9
	add r0, sb
	lsrs r6, r0, #0x10
	lsls r3, r5, #0x10
	asrs r2, r3, #0x10
	ldr r4, [sp, #0x18]
	asrs r0, r4, #0x10
	mov r4, sl
	asrs r1, r4, #0x10
	adds r0, r0, r1
	cmp r2, r0
	bgt _080210A4
	b _08020F5E
_080210A4:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080210B4: .4byte gUnknown_08499590
_080210B8: .4byte 0x0000417A
_080210BC: .4byte 0x00001432
_080210C0: .4byte 0x0000051A
_080210C4: .4byte gUnknown_08499594

