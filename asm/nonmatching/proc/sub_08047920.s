	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08047920
sub_08047920: @ 0x08047920
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #0x10]
	ldr r1, _08047A20 @ =gUnknown_0812A12C
	add r0, sp, #0xc
	movs r2, #4
	bl sub_0808B6E8
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r3, _08047A24 @ =gUnknown_0812A130
	ldr r1, [r3]
	ldr r2, [sp, #0x10]
	adds r2, #0x20
	ldrb r0, [r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _08047950
	b _08047B80
_08047950:
	ldr r1, [r3]
	ldrb r0, [r2]
	ldr r2, [sp, #0x14]
	adds r0, r2, r0
	adds r0, r0, r1
	ldrb r4, [r0]
	ldr r1, _08047A28 @ =gUnknown_03003F2C
	ldrh r0, [r1]
	adds r0, r0, r4
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r2, _08047A2C @ =gUnknown_08499594
	ldr r0, [r2]
	adds r7, r0, r1
	ldrb r0, [r7]
	cmp r0, #0
	bne _08047976
	b _08047B80
_08047976:
	ldr r0, [sp, #0x10]
	adds r1, r4, #0
	bl sub_0804769C
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _08047A28 @ =gUnknown_03003F2C
	ldrh r3, [r0]
	adds r1, r4, r3
	ldr r4, _08047A2C @ =gUnknown_08499594
	ldr r2, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #1]
	movs r0, #1
	mov r8, r0
	ands r0, r1
	adds r4, r3, #0
	cmp r0, #0
	beq _080479A8
	movs r4, #0x80
	lsls r4, r4, #1
_080479A8:
	ldr r1, _08047A30 @ =gUnknown_08499578
	ldr r0, [r1]
	adds r1, r5, #3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, [sp, #0x14]
	lsls r6, r2, #1
	adds r5, r6, #7
	lsls r5, r5, #0x10
	lsrs r2, r5, #0x10
	ldrb r3, [r7]
	str r4, [sp]
	ldrb r4, [r7, #7]
	str r4, [sp, #4]
	ldrb r4, [r7, #5]
	lsrs r4, r4, #3
	str r4, [sp, #8]
	bl sub_0802239C
	ldrb r0, [r7, #1]
	lsrs r4, r0, #3
	mov r0, r8
	ands r4, r0
	asrs r5, r5, #0x10
	ldr r1, _08047A30 @ =gUnknown_08499578
	ldr r2, [r1]
	ldr r3, _08047A34 @ =gUnknown_085D5ABC
	ldrb r1, [r7]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r3
	ldrh r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	lsls r0, r4, #1
	add r0, sp
	adds r0, #0xc
	ldrh r0, [r0]
	str r0, [sp, #4]
	movs r0, #8
	adds r1, r5, #0
	bl sub_08014A5C
	ldrb r1, [r7, #4]
	movs r0, #0x7f
	ands r0, r1
	ldr r5, _08047A38 @ =gUnknown_0812A134
	ldr r2, _08047A3C @ =gUnknown_0812A138
	mov sb, r2
	cmp r0, #0
	beq _08047A40
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r3, r0, #1
	b _08047A42
	.align 2, 0
_08047A20: .4byte gUnknown_0812A12C
_08047A24: .4byte gUnknown_0812A130
_08047A28: .4byte gUnknown_03003F2C
_08047A2C: .4byte gUnknown_08499594
_08047A30: .4byte gUnknown_08499578
_08047A34: .4byte gUnknown_085D5ABC
_08047A38: .4byte gUnknown_0812A134
_08047A3C: .4byte gUnknown_0812A138
_08047A40:
	movs r3, #0
_08047A42:
	adds r0, r6, #7
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	ldr r5, [r5]
	ldr r2, [r5]
	movs r0, #0x80
	lsls r0, r0, #8
	mov r8, r0
	str r0, [sp]
	lsls r0, r4, #1
	mov r4, sp
	adds r4, r4, r0
	adds r4, #0xc
	ldrh r0, [r4]
	str r0, [sp, #4]
	movs r0, #0x10
	adds r1, r6, #0
	bl sub_08014B0C
	ldr r2, [r5]
	ldrb r3, [r7, #6]
	lsls r3, r3, #0x19
	lsrs r3, r3, #0x19
	mov r1, r8
	str r1, [sp]
	ldrh r0, [r4]
	str r0, [sp, #4]
	movs r0, #0x13
	adds r1, r6, #0
	bl sub_08014B0C
	ldr r2, [r5]
	mov r0, r8
	str r0, [sp]
	ldrh r0, [r4]
	str r0, [sp, #4]
	movs r0, #0x14
	adds r1, r6, #0
	ldr r3, _08047AEC @ =gUnknown_084C3F38
	bl sub_080149C0
	ldr r2, [r5]
	mov r1, sb
	ldr r1, [r1]
	mov sl, r1
	ldrb r0, [r7]
	movs r1, #0x5c
	mov sb, r1
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	add r0, sl
	ldrb r3, [r0, #0x10]
	mov r0, r8
	str r0, [sp]
	ldrh r0, [r4]
	str r0, [sp, #4]
	movs r0, #0x16
	adds r1, r6, #0
	bl sub_08014B0C
	ldrb r0, [r7]
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	mov r2, sl
	adds r1, r0, r2
	ldrb r0, [r1, #0xb]
	cmp r0, #0
	bne _08047B10
	ldrb r0, [r1, #0x11]
	cmp r0, #0
	beq _08047AF4
	ldr r2, [r5]
	mov r0, r8
	str r0, [sp]
	ldrh r0, [r4]
	str r0, [sp, #4]
	movs r0, #0x18
	adds r1, r6, #0
	ldr r3, _08047AF0 @ =0x00000962
	bl sub_08014A5C
	b _08047B5A
	.align 2, 0
_08047AEC: .4byte gUnknown_084C3F38
_08047AF0: .4byte 0x00000962
_08047AF4:
	ldr r2, [r5]
	mov r1, r8
	str r1, [sp]
	ldrh r0, [r4]
	str r0, [sp, #4]
	movs r0, #0x18
	adds r1, r6, #0
	ldr r3, _08047B0C @ =0x00000966
	bl sub_08014A5C
	b _08047B5A
	.align 2, 0
_08047B0C: .4byte 0x00000966
_08047B10:
	ldr r2, [r5]
	ldrh r3, [r7, #4]
	lsls r3, r3, #0x15
	lsrs r3, r3, #0x1c
	mov r0, r8
	str r0, [sp]
	ldrh r0, [r4]
	str r0, [sp, #4]
	movs r0, #0x19
	adds r1, r6, #0
	bl sub_08014B0C
	ldr r2, [r5]
	mov r1, r8
	str r1, [sp]
	ldrh r0, [r4]
	str r0, [sp, #4]
	movs r0, #0x1a
	adds r1, r6, #0
	ldr r3, _08047B90 @ =gUnknown_084C3F3C
	bl sub_080149C0
	ldr r2, [r5]
	ldrb r0, [r7]
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	add r0, sl
	ldrb r3, [r0, #0xb]
	mov r0, r8
	str r0, [sp]
	ldrh r0, [r4]
	str r0, [sp, #4]
	movs r0, #0x1b
	adds r1, r6, #0
	bl sub_08014B0C
_08047B5A:
	ldr r0, [sp, #0x14]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
	cmp r0, #5
	bhi _08047B80
	ldr r3, _08047B94 @ =gUnknown_0812A130
	ldr r0, [r3]
	ldr r2, [sp, #0x10]
	adds r2, #0x20
	ldrb r1, [r2]
	ldr r4, [sp, #0x14]
	adds r1, r4, r1
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _08047B80
	b _08047950
_08047B80:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047B90: .4byte gUnknown_084C3F3C
_08047B94: .4byte gUnknown_0812A130

