	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805F914
sub_0805F914: @ 0x0805F914
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _0805FAD4 @ =0x00007FFF
	str r0, [sp, #4]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	movs r3, #0
	str r3, [sp, #0x10]
	bl sub_08062474
	ldr r6, _0805FAD8 @ =gUnknown_0816DAB4
	ldr r2, [r6]
	ldr r5, _0805FADC @ =gUnknown_0816DAB8
	ldr r0, [r5]
	ldr r7, [r0]
	ldrb r1, [r7]
	movs r0, #0x5c
	adds r3, r1, #0
	muls r3, r0, r3
	adds r3, r3, r2
	mov sb, r3
	ldr r4, _0805FAE0 @ =gUnknown_0816DABC
	ldr r0, [r4]
	mov r8, r0
	ldr r2, [r0]
	ldrb r1, [r7, #3]
	lsls r1, r1, #1
	ldr r3, _0805FAE4 @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrb r1, [r7, #2]
	adds r0, r0, r1
	ldr r1, _0805FAE8 @ =0x00003262
	adds r2, r2, r1
	adds r2, r2, r0
	mov r3, sb
	ldrb r1, [r3, #0x1d]
	ldrb r0, [r2]
	ands r0, r1
	cmp r0, #0
	bne _0805F978
	b _0805FB60
_0805F978:
	adds r0, r7, #0
	bl sub_080202A4
	movs r6, #0
	mov r4, r8
	ldr r0, [r4]
	ldr r7, [sp, #0xc]
	ldrh r0, [r0, #2]
	cmp r7, r0
	bge _0805FA2A
_0805F98C:
	movs r5, #0
	mov r1, r8
	ldr r0, [r1]
	adds r2, r6, #1
	mov sb, r2
	ldrh r0, [r0]
	cmp r5, r0
	bge _0805FA1E
	ldr r1, _0805FAEC @ =gUnknown_03003340
	lsls r0, r6, #2
	adds r0, r0, r1
	str r0, [sp, #0x18]
	ldr r3, _0805FAF0 @ =gUnknown_085D5ABC
	mov sl, r3
_0805F9A8:
	ldr r4, [sp, #0x18]
	ldr r0, [r4]
	adds r4, r0, r5
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	blt _0805FA12
	ldr r0, _0805FAF4 @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r1, [r0]
	movs r0, #0x5c
	adds r3, r1, #0
	muls r3, r0, r3
	add r3, sl
	mov r7, r8
	ldr r1, [r7]
	lsls r2, r6, #1
	ldr r7, _0805FAE4 @ =0x0000417A
	adds r0, r1, r7
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	ldr r2, _0805FAE8 @ =0x00003262
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r2, [r3, #0x1d]
	ldrb r0, [r1]
	ands r0, r2
	cmp r0, #0
	bne _0805FA12
	movs r0, #0
	ldrsb r0, [r4, r0]
	ldr r3, [sp, #4]
	cmp r0, r3
	bgt _0805FA12
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	bl sub_08059674
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805FA12
	ldr r4, [sp, #0x18]
	ldr r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	str r5, [sp, #8]
	str r6, [sp, #0xc]
_0805FA12:
	adds r5, #1
	mov r7, r8
	ldr r0, [r7]
	ldrh r0, [r0]
	cmp r5, r0
	blt _0805F9A8
_0805FA1E:
	mov r6, sb
	mov r1, r8
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	cmp r6, r0
	blt _0805F98C
_0805FA2A:
	movs r7, #1
	rsbs r7, r7, #0
	ldr r2, [sp, #8]
	cmp r2, r7
	beq _0805FA4A
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	ldr r3, [sp, #0xc]
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	movs r2, #0
	str r2, [sp]
	movs r2, #2
	movs r3, #0
	bl sub_0805D648
_0805FA4A:
	ldr r0, _0805FAF8 @ =gUnknown_030045CC
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805FA58
	b _0805FB60
_0805FA58:
	str r7, [sp, #8]
	movs r6, #0
	ldr r1, _0805FAFC @ =gUnknown_08499590
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	cmp r6, r0
	bge _0805FB40
	adds r7, r1, #0
_0805FA68:
	movs r5, #0
	ldr r0, [r7]
	adds r4, r6, #1
	mov sb, r4
	ldrh r0, [r0]
	cmp r5, r0
	bge _0805FB36
	ldr r0, _0805FB00 @ =gUnknown_085D584C
	mov r8, r0
	ldr r3, _0805FAEC @ =gUnknown_03003340
_0805FA7C:
	lsls r0, r6, #2
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0805FB2C
	ldr r0, _0805FAF4 @ =gUnknown_030040D8
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, #0
	beq _0805FAA8
	ldr r2, _0805FAF0 @ =gUnknown_085D5ABC
	adds r1, r0, #0
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #0x1a]
	cmp r0, #0x10
	beq _0805FB08
_0805FAA8:
	ldr r1, [r7]
	lsls r2, r6, #1
	ldr r4, _0805FAE4 @ =0x0000417A
	adds r0, r1, r4
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	ldr r2, _0805FB04 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r1, #0x1f
	ands r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	ldr r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r4, r0, #1
	b _0805FB0A
	.align 2, 0
_0805FAD4: .4byte 0x00007FFF
_0805FAD8: .4byte gUnknown_0816DAB4
_0805FADC: .4byte gUnknown_0816DAB8
_0805FAE0: .4byte gUnknown_0816DABC
_0805FAE4: .4byte 0x0000417A
_0805FAE8: .4byte 0x00003262
_0805FAEC: .4byte gUnknown_03003340
_0805FAF0: .4byte gUnknown_085D5ABC
_0805FAF4: .4byte gUnknown_030040D8
_0805FAF8: .4byte gUnknown_030045CC
_0805FAFC: .4byte gUnknown_08499590
_0805FB00: .4byte gUnknown_085D584C
_0805FB04: .4byte 0x00001432
_0805FB08:
	movs r4, #0
_0805FB0A:
	ldr r0, [sp, #0x10]
	cmp r4, r0
	blt _0805FB2C
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	str r3, [sp, #0x14]
	bl sub_08059674
	lsls r0, r0, #0x18
	ldr r3, [sp, #0x14]
	cmp r0, #0
	beq _0805FB2C
	str r4, [sp, #0x10]
	str r5, [sp, #8]
	str r6, [sp, #0xc]
_0805FB2C:
	adds r5, #1
	ldr r0, [r7]
	ldrh r0, [r0]
	cmp r5, r0
	blt _0805FA7C
_0805FB36:
	mov r6, sb
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	cmp r6, r0
	blt _0805FA68
_0805FB40:
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, [sp, #8]
	cmp r1, r0
	beq _0805FB60
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r2, [sp, #0xc]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	movs r2, #0
	str r2, [sp]
	movs r2, #2
	movs r3, #0
	bl sub_0805D648
_0805FB60:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

