	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080255F4
sub_080255F4: @ 0x080255F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	movs r6, #0
	ldr r0, _080256FC @ =gUnknown_08499594
	ldr r1, [r0]
	subs r1, r3, r1
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #2
	lsls r2, r0, #0x10
	cmp r3, #0
	beq _08025710
	ldrb r1, [r3, #1]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08025710
	lsrs r1, r2, #0x16
	ldr r0, _08025700 @ =gUnknown_08499598
	ldr r3, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x58
	ldrb r1, [r0]
	movs r0, #2
	mov ip, r0
	ands r0, r1
	cmp r0, #0
	bne _08025710
	ldr r7, _08025704 @ =gUnknown_08499590
	ldr r2, [r7]
	lsls r0, r4, #0x10
	asrs r5, r0, #0x10
	lsls r1, r5, #1
	ldr r4, _08025708 @ =0x0000417A
	adds r0, r2, r4
	adds r0, r0, r1
	ldrh r1, [r0]
	mov r4, r8
	lsls r0, r4, #0x10
	asrs r4, r0, #0x10
	adds r1, r1, r4
	ldr r0, _0802570C @ =0x00001432
	adds r2, r2, r0
	adds r2, r2, r1
	ldrb r1, [r2]
	lsrs r1, r1, #5
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r1, [r0, #0x1c]
	mov r0, ip
	ands r0, r1
	cmp r0, #0
	bne _08025710
	cmp r4, #0
	ble _08025698
	subs r0, r4, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0
	bl sub_08025598
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_08025698:
	cmp r5, #0
	ble _080256B2
	subs r1, r5, #1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_08025598
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080256B2:
	ldr r0, [r7]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _080256D2
	adds r0, r4, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0
	bl sub_08025598
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080256D2:
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r5, r0
	bge _080256F2
	adds r1, r5, #1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_08025598
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080256F2:
	cmp r6, #0
	bne _08025710
	movs r0, #0
	b _08025712
	.align 2, 0
_080256FC: .4byte gUnknown_08499594
_08025700: .4byte gUnknown_08499598
_08025704: .4byte gUnknown_08499590
_08025708: .4byte 0x0000417A
_0802570C: .4byte 0x00001432
_08025710:
	movs r0, #1
_08025712:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

