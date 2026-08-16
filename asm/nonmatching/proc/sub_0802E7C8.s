	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802E7C8
sub_0802E7C8: @ 0x0802E7C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r2, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	mov r7, sb
	mov r6, r8
	movs r1, #0
	ldrsb r1, [r5, r1]
	cmp r1, #4
	bne _0802E7F6
	b _0802E90E
_0802E7F6:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0802E800
	b _0802E90E
_0802E800:
	ldr r0, _0802E818 @ =gUnknown_03003100
	mov sl, r0
_0802E804:
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #1
	beq _0802E834
	cmp r0, #1
	bgt _0802E81C
	cmp r0, #0
	beq _0802E826
	b _0802E852
	.align 2, 0
_0802E818: .4byte gUnknown_03003100
_0802E81C:
	cmp r0, #2
	beq _0802E840
	cmp r0, #3
	beq _0802E84A
	b _0802E852
_0802E826:
	lsls r0, r7, #0x10
	ldr r1, _0802E830 @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r7, r0, #0x10
	b _0802E852
	.align 2, 0
_0802E830: .4byte 0xFFFF0000
_0802E834:
	lsls r0, r7, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	lsrs r7, r0, #0x10
	b _0802E852
_0802E840:
	lsls r0, r6, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	b _0802E850
_0802E84A:
	lsls r0, r6, #0x10
	ldr r1, _0802E8D0 @ =0xFFFF0000
	adds r0, r0, r1
_0802E850:
	lsrs r6, r0, #0x10
_0802E852:
	ldr r0, _0802E8D4 @ =gUnknown_08499590
	ldr r2, [r0]
	lsls r4, r6, #0x10
	asrs r0, r4, #0xf
	ldr r3, _0802E8D8 @ =0x0000417A
	adds r1, r2, r3
	adds r1, r1, r0
	lsls r3, r7, #0x10
	asrs r0, r3, #0x10
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r1, _0802E8DC @ =0x0000051A
	adds r2, r2, r1
	adds r2, r2, r0
	ldrb r2, [r2]
	mov ip, r3
	cmp r2, #0
	beq _0802E8F0
	lsrs r2, r2, #6
	ldr r0, _0802E8E0 @ =gUnknown_08499598
	ldr r3, [r0]
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	adds r1, #0x66
	ldr r0, _0802E8E4 @ =gUnknown_030033EC
	ldrh r2, [r0]
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x2a
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	beq _0802E8F0
	movs r0, #0xa
	strb r0, [r5]
	mov r2, sp
	ldrb r2, [r2]
	strb r2, [r5, #1]
	mov r0, sb
	mov r3, sl
	strh r0, [r3]
	mov r1, r8
	strh r1, [r3, #2]
	mov r2, r8
	lsls r0, r2, #0x10
	asrs r0, r0, #0xe
	ldr r3, _0802E8E8 @ =gUnknown_03003340
	adds r0, r0, r3
	mov r2, sb
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r3, _0802E8EC @ =gUnknown_03004074
	strb r0, [r3]
	movs r0, #1
	b _0802E910
	.align 2, 0
_0802E8D0: .4byte 0xFFFF0000
_0802E8D4: .4byte gUnknown_08499590
_0802E8D8: .4byte 0x0000417A
_0802E8DC: .4byte 0x0000051A
_0802E8E0: .4byte gUnknown_08499598
_0802E8E4: .4byte gUnknown_030033EC
_0802E8E8: .4byte gUnknown_03003340
_0802E8EC: .4byte gUnknown_03004074
_0802E8F0:
	mov r0, ip
	lsrs r0, r0, #0x10
	mov sb, r0
	lsrs r4, r4, #0x10
	mov r8, r4
	adds r5, #1
	movs r1, #0
	ldrsb r1, [r5, r1]
	cmp r1, #4
	beq _0802E90E
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0802E90E
	b _0802E804
_0802E90E:
	movs r0, #0
_0802E910:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

