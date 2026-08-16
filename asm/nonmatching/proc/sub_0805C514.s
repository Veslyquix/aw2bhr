	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805C514
sub_0805C514: @ 0x0805C514
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #4]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x14]
	movs r2, #0
_0805C536:
	ldr r0, _0805C5B8 @ =gUnknown_08499598
	ldr r1, [r0]
	ldr r3, [sp]
	lsls r0, r3, #4
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x2c
	ldrb r1, [r0]
	asrs r1, r2
	movs r0, #1
	ands r1, r0
	adds r4, r2, #1
	str r4, [sp, #0x1c]
	cmp r1, #0
	bne _0805C558
	b _0805C6FC
_0805C558:
	lsls r7, r2, #6
	adds r0, r7, #0
	adds r0, #0x40
	str r7, [sp, #0x24]
	cmp r7, r0
	blt _0805C566
	b _0805C6FC
_0805C566:
	ldr r1, _0805C5BC @ =gUnknown_08499594
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #2
	ldr r1, [r1]
	adds r4, r1, r0
	ldrb r0, [r4]
	adds r1, r7, #1
	str r1, [sp, #0x18]
	cmp r0, #0
	bne _0805C57E
	b _0805C6F0
_0805C57E:
	movs r2, #0
	str r2, [sp, #0x10]
	movs r0, #0xff
	bl sub_0801F838
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	movs r2, #2
	movs r3, #0
	bl sub_0801F9C0
	movs r3, #0
	str r3, [sp, #8]
	ldr r4, _0805C5C0 @ =gUnknown_08499590
	ldr r0, [r4]
	ldr r1, [sp, #0x10]
	ldrh r0, [r0, #2]
	cmp r1, r0
	blt _0805C5A6
	b _0805C6E0
_0805C5A6:
	movs r6, #0
	ldr r2, _0805C5C4 @ =gUnknown_0816D9DC
	ldr r3, _0805C5C0 @ =gUnknown_08499590
	ldr r0, [r3]
	ldr r4, [sp, #8]
	adds r4, #1
	str r4, [sp, #0x20]
	b _0805C6C8
	.align 2, 0
_0805C5B8: .4byte gUnknown_08499598
_0805C5BC: .4byte gUnknown_08499594
_0805C5C0: .4byte gUnknown_08499590
_0805C5C4: .4byte gUnknown_0816D9DC
_0805C5C8:
	ldr r1, _0805C6A4 @ =gUnknown_03003340
	ldr r3, [sp, #8]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0805C6C0
	ldr r2, [r2]
	mov sl, r2
	ldr r1, [r2]
	lsls r5, r3, #1
	ldr r4, _0805C6A8 @ =0x0000417A
	mov sb, r4
	adds r0, r1, r4
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r0, r0, r6
	ldr r2, _0805C6AC @ =0x0000051A
	mov r8, r2
	add r1, r8
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0805C6C0
	ldr r3, [sp, #4]
	cmp r3, #0
	beq _0805C620
	ldr r4, [sp]
	lsls r0, r4, #0x18
	lsls r1, r6, #0x18
	lsrs r1, r1, #0x18
	ldr r3, [sp, #8]
	lsls r2, r3, #0x18
	lsrs r0, r0, #0x18
	lsrs r2, r2, #0x18
	bl sub_08020DBC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805C6C0
_0805C620:
	mov r4, sl
	ldr r2, [r4]
	mov r1, sb
	adds r0, r2, r1
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r3, r0, r6
	mov r4, r8
	adds r0, r2, r4
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _0805C6B0 @ =gUnknown_08499594
	ldr r1, [r4]
	adds r4, r1, r0
	ldrb r0, [r4]
	cmp r0, #0x18
	bne _0805C664
	ldrb r1, [r4, #1]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0805C6C0
	adds r0, r2, #0
	adds r0, #0x12
	adds r0, r0, r3
	ldrb r0, [r0]
	bl sub_080257C0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805C6C0
_0805C664:
	ldrb r0, [r4, #4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	cmp r0, #0xa
	bls _0805C6C0
	mov r0, sl
	ldr r1, [r0]
	mov r2, sb
	adds r0, r1, r2
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r0, r0, r6
	add r1, r8
	adds r1, r1, r0
	ldrb r1, [r1]
	lsrs r1, r1, #6
	adds r1, #1
	ldr r0, [sp]
	bl sub_08026F28
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0805C6B4
	ldrb r0, [r4, #4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	ldr r3, [sp, #0x10]
	subs r3, r3, r0
	str r3, [sp, #0x10]
	b _0805C6C0
	.align 2, 0
_0805C6A4: .4byte gUnknown_03003340
_0805C6A8: .4byte 0x0000417A
_0805C6AC: .4byte 0x0000051A
_0805C6B0: .4byte gUnknown_08499594
_0805C6B4:
	ldrb r0, [r4, #4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	ldr r4, [sp, #0x10]
	adds r4, r4, r0
	str r4, [sp, #0x10]
_0805C6C0:
	adds r6, #1
	ldr r2, _0805C718 @ =gUnknown_0816D9DC
	ldr r1, _0805C71C @ =gUnknown_08499590
	ldr r0, [r1]
_0805C6C8:
	ldrh r0, [r0]
	cmp r6, r0
	bge _0805C6D0
	b _0805C5C8
_0805C6D0:
	ldr r2, [sp, #0x20]
	str r2, [sp, #8]
	ldr r3, _0805C71C @ =gUnknown_08499590
	ldr r0, [r3]
	ldrh r0, [r0, #2]
	cmp r2, r0
	bge _0805C6E0
	b _0805C5A6
_0805C6E0:
	ldr r4, [sp, #0x10]
	ldr r0, [sp, #0xc]
	cmp r4, r0
	ble _0805C6F0
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	str r4, [sp, #0xc]
_0805C6F0:
	ldr r7, [sp, #0x18]
	ldr r0, [sp, #0x24]
	adds r0, #0x40
	cmp r7, r0
	bge _0805C6FC
	b _0805C566
_0805C6FC:
	ldr r2, [sp, #0x1c]
	cmp r2, #3
	bgt _0805C704
	b _0805C536
_0805C704:
	ldr r0, [sp, #0x14]
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805C718: .4byte gUnknown_0816D9DC
_0805C71C: .4byte gUnknown_08499590

