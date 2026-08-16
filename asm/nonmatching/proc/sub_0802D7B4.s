	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D7B4
sub_0802D7B4: @ 0x0802D7B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x1c]
	movs r0, #0
	mov r8, r0
	ldr r1, _0802D7D8 @ =gUnknown_08090C10
	ldr r3, [r1]
	ldr r0, [sp, #0x1c]
	lsls r2, r0, #0x10
	asrs r0, r2, #0xe
	adds r0, r0, r3
	b _0802D8E8
	.align 2, 0
_0802D7D8: .4byte gUnknown_08090C10
_0802D7DC:
	asrs r0, r2, #0x10
	add r0, r8
	lsls r0, r0, #2
	ldr r1, _0802D7F8 @ =gUnknown_02023830
	adds r0, r0, r1
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _0802D800
	movs r0, #0
	mov sl, r0
	ldr r0, _0802D7FC @ =gUnknown_03003F2C
	ldrh r0, [r0]
	b _0802D808
	.align 2, 0
_0802D7F8: .4byte gUnknown_02023830
_0802D7FC: .4byte gUnknown_03003F2C
_0802D800:
	movs r1, #1
	mov sl, r1
	movs r0, #0x80
	lsls r0, r0, #1
_0802D808:
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x1c]
	lsls r2, r1, #0x10
	asrs r0, r2, #0x10
	add r0, r8
	lsls r0, r0, #2
	ldr r1, _0802D904 @ =gUnknown_02023830
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x5c
	muls r0, r1, r0
	ldr r1, _0802D908 @ =gUnknown_085D5ABC
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #2
	ldr r1, _0802D90C @ =gUnknown_08610A38
	adds r0, r0, r1
	ldr r3, [r0]
	add r1, sp, #0xc
	movs r0, #0x19
	strb r0, [r1]
	movs r4, #0
	ldrb r0, [r3]
	mov sb, r2
	mov r1, r8
	lsls r5, r1, #1
	ldr r7, _0802D910 @ =gUnknown_08090C14
	adds r1, #1
	str r1, [sp, #0x24]
	cmp r0, #0
	beq _0802D85C
	adds r1, r3, #0
	mov r2, sp
	adds r2, #0xd
_0802D84C:
	ldrb r0, [r1]
	strb r0, [r2]
	adds r1, #1
	adds r2, #1
	adds r4, #1
	ldrb r0, [r1]
	cmp r0, #0
	bne _0802D84C
_0802D85C:
	adds r0, r4, #1
	add r0, sp
	adds r0, #0xc
	movs r1, #0
	strb r1, [r0]
	adds r5, #5
	lsls r5, r5, #0x10
	asrs r6, r5, #0x10
	ldr r0, _0802D914 @ =gUnknown_08499578
	ldr r2, [r0]
	movs r1, #0x80
	lsls r1, r1, #8
	str r1, [sp]
	mov r0, sl
	str r0, [sp, #4]
	movs r0, #4
	adds r1, r6, #0
	add r3, sp, #0xc
	bl sub_080149C0
	ldr r0, [r7]
	ldrh r0, [r0]
	mov r1, sb
	asrs r7, r1, #0x10
	mov r1, r8
	adds r4, r7, r1
	lsls r4, r4, #2
	ldr r1, _0802D904 @ =gUnknown_02023830
	adds r4, r4, r1
	ldrb r1, [r4]
	bl sub_08042C9C
	lsls r3, r0, #2
	adds r3, r3, r0
	lsls r3, r3, #1
	ldr r0, _0802D914 @ =gUnknown_08499578
	ldr r2, [r0]
	movs r1, #0x80
	lsls r1, r1, #8
	str r1, [sp]
	mov r0, sl
	str r0, [sp, #4]
	movs r0, #0xe
	adds r1, r6, #0
	bl sub_08014B0C
	ldr r1, _0802D914 @ =gUnknown_08499578
	ldr r0, [r1]
	lsrs r5, r5, #0x10
	ldrb r3, [r4]
	ldr r1, [sp, #0x20]
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #2
	adds r2, r5, #0
	bl sub_0802239C
	ldr r1, [sp, #0x24]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	cmp r0, #6
	bhi _0802D8F0
	mov r2, sb
	adds r0, r7, r0
	lsls r0, r0, #2
	ldr r1, _0802D904 @ =gUnknown_02023830
	adds r0, r0, r1
_0802D8E8:
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802D8F0
	b _0802D7DC
_0802D8F0:
	bl sub_08013AEC
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D904: .4byte gUnknown_02023830
_0802D908: .4byte gUnknown_085D5ABC
_0802D90C: .4byte gUnknown_08610A38
_0802D910: .4byte gUnknown_08090C14
_0802D914: .4byte gUnknown_08499578

