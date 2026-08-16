	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08060718
sub_08060718: @ 0x08060718
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r2, _080607CC @ =gUnknown_0816DAD0
	ldr r1, [r2]
	movs r0, #0
	strb r0, [r1, #6]
	ldr r5, _080607D0 @ =gUnknown_03004674
	ldr r1, _080607D4 @ =gUnknown_030045D0
	mov ip, r1
	str r0, [r1]
	str r0, [r5]
	ldr r0, _080607D8 @ =gUnknown_03003F2C
	ldrh r3, [r0]
	adds r4, r3, #0
	adds r4, #0x40
	mov sl, r2
	cmp r3, r4
	bge _0806078A
	ldr r7, _080607DC @ =gUnknown_08499594
	ldr r1, [r7]
	adds r6, r5, #0
	ldr r0, _080607E0 @ =gUnknown_08576877
	mov r8, r0
	mov r5, ip
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r2, r0, r1
	adds r1, r0, #0
	subs r3, r4, r3
_08060760:
	ldrb r0, [r2]
	cmp r0, #0
	beq _0806076C
	ldr r0, [r6]
	adds r0, #1
	str r0, [r6]
_0806076C:
	ldr r0, [r7]
	adds r0, r1, r0
	ldrb r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	beq _08060780
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
_08060780:
	adds r2, #0xc
	adds r1, #0xc
	subs r3, #1
	cmp r3, #0
	bne _08060760
_0806078A:
	movs r0, #1
	bl sub_08057F00
	ldr r1, _080607E4 @ =gUnknown_030046D4
	str r0, [r1]
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	bl sub_08060894
	bl sub_08060930
	bl sub_08060AB0
	bl sub_08060A7C
	bl sub_08060D4C
	mov r1, sl
	ldr r0, [r1]
	ldrb r0, [r0, #6]
	cmp r0, #0
	beq _080607BC
	bl sub_080610D0
_080607BC:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080607CC: .4byte gUnknown_0816DAD0
_080607D0: .4byte gUnknown_03004674
_080607D4: .4byte gUnknown_030045D0
_080607D8: .4byte gUnknown_03003F2C
_080607DC: .4byte gUnknown_08499594
_080607E0: .4byte gUnknown_08576877
_080607E4: .4byte gUnknown_030046D4

