	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805EB58
sub_0805EB58: @ 0x0805EB58
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _0805EB98 @ =0x00007FFF
	str r0, [sp, #4]
	ldr r6, _0805EB9C @ =gUnknown_0816DA98
	ldr r5, [r6]
	ldr r0, [r5]
	ldr r1, _0805EBA0 @ =0x00002852
	adds r0, r0, r1
	bl sub_0801F92C
	ldr r4, _0805EBA4 @ =gUnknown_0816DA9C
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_080202A4
	ldr r1, _0805EBA8 @ =0xFFFF0000
	ldr r0, [sp]
	ands r0, r1
	ldr r1, _0805EBAC @ =0x0000270F
	orrs r0, r1
	str r0, [sp]
	movs r2, #0
	mov r8, r2
	ldr r0, [r5]
	mov sb, r6
	b _0805EC8A
	.align 2, 0
_0805EB98: .4byte 0x00007FFF
_0805EB9C: .4byte gUnknown_0816DA98
_0805EBA0: .4byte 0x00002852
_0805EBA4: .4byte gUnknown_0816DA9C
_0805EBA8: .4byte 0xFFFF0000
_0805EBAC: .4byte 0x0000270F
_0805EBB0:
	movs r4, #0
	mov r2, sb
	ldr r0, [r2]
	ldr r0, [r0]
	movs r3, #1
	add r3, r8
	mov sl, r3
	ldrh r0, [r0]
	cmp r4, r0
	bge _0805EC82
	ldr r1, _0805ECA4 @ =gUnknown_03003340
	mov r5, r8
	lsls r0, r5, #2
	adds r3, r0, r1
_0805EBCC:
	ldr r0, [r3]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0805EC74
	ldr r7, _0805ECA8 @ =gUnknown_08499590
	ldr r1, [r7]
	mov r0, r8
	lsls r5, r0, #1
	ldr r6, _0805ECAC @ =0x0000417A
	adds r0, r1, r6
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r2, r0, r4
	adds r0, r1, #0
	adds r0, #0x12
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805EC74
	ldr r0, _0805ECB0 @ =gUnknown_03003F38
	ldrb r0, [r0]
	ldr r7, _0805ECB4 @ =0x00001432
	adds r1, r1, r7
	adds r1, r1, r2
	ldrb r1, [r1]
	str r3, [sp, #8]
	bl sub_08026FD0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, [sp, #8]
	cmp r0, #1
	beq _0805EC74
	ldr r0, _0805ECB8 @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r1, [r0]
	movs r0, #0x5c
	muls r0, r1, r0
	ldr r1, _0805ECBC @ =gUnknown_085D5AD0
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r7, _0805ECA8 @ =gUnknown_08499590
	ldr r1, [r7]
	adds r0, r1, r6
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r5, _0805ECB4 @ =0x00001432
	adds r1, r1, r5
	adds r1, r1, r0
	ldrb r1, [r1]
	movs r0, #0x1f
	ands r0, r1
	adds r2, #0x1a
	adds r2, r2, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _0805EC74
	ldr r0, [r3]
	adds r0, r0, r4
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldr r7, [sp, #4]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bgt _0805EC74
	lsls r0, r4, #0x10
	mov r2, r8
	lsls r1, r2, #0x10
	lsrs r0, r0, #0x10
	orrs r0, r1
	str r0, [sp]
	ldr r0, [r3]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
_0805EC74:
	adds r4, #1
	mov r2, sb
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r4, r0
	blt _0805EBCC
_0805EC82:
	mov r8, sl
	mov r3, sb
	ldr r0, [r3]
	ldr r0, [r0]
_0805EC8A:
	ldrh r0, [r0, #2]
	cmp r8, r0
	blt _0805EBB0
	mov r0, sp
	ldrh r1, [r0]
	ldr r0, _0805ECC0 @ =0x0000270F
	cmp r1, r0
	beq _0805ECC4
	mov r0, sp
	bl sub_080591E4
	b _0805ECC8
	.align 2, 0
_0805ECA4: .4byte gUnknown_03003340
_0805ECA8: .4byte gUnknown_08499590
_0805ECAC: .4byte 0x0000417A
_0805ECB0: .4byte gUnknown_03003F38
_0805ECB4: .4byte 0x00001432
_0805ECB8: .4byte gUnknown_030040D8
_0805ECBC: .4byte gUnknown_085D5AD0
_0805ECC0: .4byte 0x0000270F
_0805ECC4:
	bl sub_0805F7B8
_0805ECC8:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

