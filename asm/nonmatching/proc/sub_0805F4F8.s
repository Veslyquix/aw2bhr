	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805F4F8
sub_0805F4F8: @ 0x0805F4F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _0805F660 @ =gUnknown_03003F20
	ldr r4, [r0]
	movs r0, #0x7f
	str r0, [sp, #8]
	ldr r0, _0805F664 @ =gUnknown_030046B8
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0805F51C
	bl sub_0805F7B8
_0805F51C:
	ldr r2, _0805F668 @ =gUnknown_085767A0
	ldr r1, _0805F66C @ =gUnknown_0816DAAC
	ldr r5, [r1]
	ldr r0, [r5]
	ldrb r0, [r0]
	subs r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805F534
	bl sub_0805F7B8
_0805F534:
	ldr r2, [r5]
	ldrb r1, [r2, #9]
	movs r0, #0x39
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x18
	orrs r0, r1
	strb r0, [r2, #9]
	bl sub_0805FB70
	adds r0, r4, #0
	bl sub_0805A6DC
	cmp r0, #0
	bne _0805F556
	bl sub_0805F7B8
_0805F556:
	adds r0, r4, #0
	bl sub_0805A744
	ldr r4, _0805F670 @ =gUnknown_030013EC
	ldr r2, [r5]
	ldrb r0, [r2, #2]
	ldrb r1, [r2, #3]
	ldrb r2, [r2]
	movs r3, #0
	str r3, [sp]
	ldr r4, [r4]
	movs r3, #0x78
	bl _call_via_r4
	ldr r1, _0805F674 @ =0xFFFF0000
	ldr r0, [sp, #4]
	ands r0, r1
	ldr r1, _0805F678 @ =0x0000270F
	orrs r0, r1
	str r0, [sp, #4]
	movs r1, #0
	ldr r0, _0805F67C @ =gUnknown_08499590
	ldr r2, [r0]
	ldrh r3, [r2, #2]
	cmp r1, r3
	bge _0805F628
	mov sb, r2
_0805F58C:
	movs r5, #0
	adds r0, r1, #1
	mov sl, r0
	mov r2, sb
	ldrh r2, [r2]
	cmp r5, r2
	bge _0805F61E
	lsls r0, r1, #2
	ldr r3, _0805F680 @ =gUnknown_03003340
	adds r7, r0, r3
	lsls r0, r1, #1
	mov r8, r0
	lsls r1, r1, #0x10
	mov ip, r1
_0805F5A8:
	ldr r0, [r7]
	adds r4, r0, r5
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	blt _0805F612
	ldr r1, _0805F67C @ =gUnknown_08499590
	ldr r2, [r1]
	ldr r3, _0805F684 @ =0x0000417A
	adds r0, r2, r3
	mov r1, r8
	adds r6, r0, r1
	ldrh r0, [r6]
	adds r3, r0, r5
	ldr r1, _0805F688 @ =0x00001432
	adds r0, r2, r1
	adds r0, r0, r3
	ldrb r0, [r0]
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0xd
	beq _0805F5D8
	cmp r1, #0xb
	bne _0805F612
_0805F5D8:
	ldr r0, _0805F68C @ =0x00003C72
	adds r2, r2, r0
	adds r1, r2, r3
	ldrb r0, [r1]
	cmp r0, #0x7f
	beq _0805F612
	movs r0, #0
	ldrsb r0, [r4, r0]
	ldrb r1, [r1]
	adds r0, r0, r1
	ldr r1, [sp, #8]
	cmp r0, r1
	bge _0805F612
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	mov r3, ip
	orrs r0, r3
	str r0, [sp, #4]
	ldr r1, [r7]
	adds r1, r1, r5
	ldrh r0, [r6]
	adds r0, r0, r5
	adds r0, r2, r0
	ldrb r0, [r0]
	ldrb r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
_0805F612:
	adds r5, #1
	ldr r1, _0805F67C @ =gUnknown_08499590
	ldr r0, [r1]
	ldrh r0, [r0]
	cmp r5, r0
	blt _0805F5A8
_0805F61E:
	mov r1, sl
	mov r2, sb
	ldrh r2, [r2, #2]
	cmp r1, r2
	blt _0805F58C
_0805F628:
	add r0, sp, #4
	ldrh r1, [r0]
	ldr r0, _0805F678 @ =0x0000270F
	cmp r1, r0
	bne _0805F636
	bl sub_0805F7B8
_0805F636:
	ldr r1, _0805F680 @ =gUnknown_03003340
	ldr r0, [sp, #4]
	lsrs r0, r0, #0x10
	lsls r0, r0, #2
	adds r0, r0, r1
	add r1, sp, #4
	ldrh r1, [r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r4, #0
	ldrsb r4, [r0, r4]
	ldr r5, _0805F690 @ =gUnknown_030040D8
	ldr r0, [r5]
	bl sub_08058224
	cmp r4, r0
	ble _0805F694
	add r0, sp, #4
	bl sub_080591E4
	b _0805F6C2
	.align 2, 0
_0805F660: .4byte gUnknown_03003F20
_0805F664: .4byte gUnknown_030046B8
_0805F668: .4byte gUnknown_085767A0
_0805F66C: .4byte gUnknown_0816DAAC
_0805F670: .4byte gUnknown_030013EC
_0805F674: .4byte 0xFFFF0000
_0805F678: .4byte 0x0000270F
_0805F67C: .4byte gUnknown_08499590
_0805F680: .4byte gUnknown_03003340
_0805F684: .4byte 0x0000417A
_0805F688: .4byte 0x00001432
_0805F68C: .4byte 0x00003C72
_0805F690: .4byte gUnknown_030040D8
_0805F694:
	ldr r0, [r5]
	bl sub_080202A4
	add r4, sp, #4
	adds r0, r4, #0
	bl sub_0805A854
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805F6AC
	bl sub_0805F7B8
_0805F6AC:
	add r0, sp, #4
	movs r3, #0
	ldrsh r0, [r0, r3]
	movs r2, #2
	ldrsh r1, [r4, r2]
	movs r2, #0
	str r2, [sp]
	movs r2, #2
	movs r3, #0
	bl sub_0805D648
_0805F6C2:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

