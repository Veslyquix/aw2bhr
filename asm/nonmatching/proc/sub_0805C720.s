	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805C720
sub_0805C720: @ 0x0805C720
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
_0805C742:
	ldr r0, _0805C7C8 @ =gUnknown_08499598
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
	bne _0805C764
	b _0805C952
_0805C764:
	lsls r2, r2, #6
	mov r8, r2
	mov r0, r8
	adds r0, #0x40
	adds r1, r2, #0
	str r1, [sp, #0x24]
	cmp r8, r0
	blt _0805C776
	b _0805C952
_0805C776:
	mov r3, r8
	lsls r0, r3, #1
	add r0, r8
	lsls r0, r0, #2
	ldr r4, _0805C7CC @ =gUnknown_08499594
	ldr r1, [r4]
	adds r4, r1, r0
	ldrb r0, [r4]
	adds r3, #1
	str r3, [sp, #0x18]
	cmp r0, #0
	bne _0805C790
	b _0805C944
_0805C790:
	movs r0, #0
	str r0, [sp, #0x10]
	movs r0, #0xff
	bl sub_0801F838
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	movs r2, #2
	movs r3, #0
	bl sub_0801F9C0
	movs r1, #0
	str r1, [sp, #8]
	ldr r2, _0805C7D0 @ =gUnknown_08499590
	ldr r0, [r2]
	ldr r3, [sp, #0x10]
	ldrh r0, [r0, #2]
	cmp r3, r0
	blt _0805C7B8
	b _0805C932
_0805C7B8:
	movs r6, #0
	ldr r4, _0805C7D0 @ =gUnknown_08499590
	ldr r0, [r4]
	ldr r1, [sp, #8]
	adds r1, #1
	str r1, [sp, #0x20]
	b _0805C91A
	.align 2, 0
_0805C7C8: .4byte gUnknown_08499598
_0805C7CC: .4byte gUnknown_08499594
_0805C7D0: .4byte gUnknown_08499590
_0805C7D4:
	ldr r1, _0805C8D8 @ =gUnknown_03003340
	ldr r3, [sp, #8]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0805C7EC
	b _0805C914
_0805C7EC:
	ldr r4, _0805C8DC @ =gUnknown_08499590
	ldr r1, [r4]
	lsls r5, r3, #1
	ldr r0, _0805C8E0 @ =0x0000417A
	mov sl, r0
	adds r0, r1, r0
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r0, r0, r6
	ldr r2, _0805C8E4 @ =0x0000051A
	mov sb, r2
	add r1, sb
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _0805C80E
	b _0805C914
_0805C80E:
	ldr r3, [sp, #4]
	cmp r3, #0
	beq _0805C82E
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
	beq _0805C914
_0805C82E:
	ldr r4, _0805C8DC @ =gUnknown_08499590
	ldr r2, [r4]
	mov r1, sl
	adds r0, r2, r1
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r3, r0, r6
	mov r4, sb
	adds r0, r2, r4
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _0805C8E8 @ =gUnknown_08499594
	ldr r1, [r4]
	adds r4, r1, r0
	ldrb r0, [r4]
	cmp r0, #0x18
	bne _0805C872
	ldrb r1, [r4, #1]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0805C914
	adds r0, r2, #0
	adds r0, #0x12
	adds r0, r0, r3
	ldrb r0, [r0]
	bl sub_080257C0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805C914
_0805C872:
	ldrb r0, [r4, #4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	cmp r0, #0xa
	bls _0805C914
	movs r7, #1
	ldr r2, _0805C8EC @ =gUnknown_085D5ABC
	ldrb r1, [r4]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #0xe]
	cmp r0, #1
	bls _0805C890
	movs r7, #2
_0805C890:
	ldr r0, _0805C8DC @ =gUnknown_08499590
	ldr r1, [r0]
	mov r2, sl
	adds r0, r1, r2
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r0, r0, r6
	add r1, sb
	adds r1, r1, r0
	ldrb r1, [r1]
	lsrs r1, r1, #6
	adds r1, #1
	ldr r0, [sp]
	bl sub_08026F28
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0805C8F4
	ldr r0, _0805C8F0 @ =gUnknown_030033EC
	ldrh r0, [r0]
	ldrb r1, [r4]
	bl sub_08042C9C
	ldrb r4, [r4, #4]
	lsls r4, r4, #0x19
	lsrs r4, r4, #0x19
	movs r1, #0xa
	bl __divsi3
	muls r0, r4, r0
	muls r0, r7, r0
	ldr r3, [sp, #0x10]
	subs r3, r3, r0
	str r3, [sp, #0x10]
	b _0805C914
	.align 2, 0
_0805C8D8: .4byte gUnknown_03003340
_0805C8DC: .4byte gUnknown_08499590
_0805C8E0: .4byte 0x0000417A
_0805C8E4: .4byte 0x0000051A
_0805C8E8: .4byte gUnknown_08499594
_0805C8EC: .4byte gUnknown_085D5ABC
_0805C8F0: .4byte gUnknown_030033EC
_0805C8F4:
	ldr r0, _0805C96C @ =gUnknown_030033EC
	ldrh r0, [r0]
	ldrb r1, [r4]
	bl sub_08042C9C
	ldrb r4, [r4, #4]
	lsls r4, r4, #0x19
	lsrs r4, r4, #0x19
	movs r1, #0xa
	bl __divsi3
	muls r0, r4, r0
	muls r0, r7, r0
	ldr r4, [sp, #0x10]
	adds r4, r4, r0
	str r4, [sp, #0x10]
_0805C914:
	adds r6, #1
	ldr r1, _0805C970 @ =gUnknown_08499590
	ldr r0, [r1]
_0805C91A:
	ldrh r0, [r0]
	cmp r6, r0
	bge _0805C922
	b _0805C7D4
_0805C922:
	ldr r2, [sp, #0x20]
	str r2, [sp, #8]
	ldr r3, _0805C970 @ =gUnknown_08499590
	ldr r0, [r3]
	ldrh r0, [r0, #2]
	cmp r2, r0
	bge _0805C932
	b _0805C7B8
_0805C932:
	ldr r4, [sp, #0x10]
	ldr r0, [sp, #0xc]
	cmp r4, r0
	ble _0805C944
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	str r4, [sp, #0xc]
_0805C944:
	ldr r2, [sp, #0x18]
	mov r8, r2
	ldr r0, [sp, #0x24]
	adds r0, #0x40
	cmp r8, r0
	bge _0805C952
	b _0805C776
_0805C952:
	ldr r2, [sp, #0x1c]
	cmp r2, #3
	bgt _0805C95A
	b _0805C742
_0805C95A:
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
_0805C96C: .4byte gUnknown_030033EC
_0805C970: .4byte gUnknown_08499590

