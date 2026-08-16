	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801C2DC
sub_0801C2DC: @ 0x0801C2DC
	push {r4, r5, lr}
	adds r3, r0, #0
	cmp r3, #0
	beq _0801C35A
	ldr r0, [r3]
	cmp r0, #0
	beq _0801C35A
	ldrh r0, [r3, #0x1a]
	cmp r0, #0
	beq _0801C3E2
	ldrh r1, [r3, #0x18]
	movs r2, #0x18
	ldrsh r0, [r3, r2]
	cmp r0, #0
	beq _0801C30E
	subs r0, r1, #1
	strh r0, [r3, #0x18]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _0801C3E2
	movs r0, #0
	strh r0, [r3, #0x18]
	ldr r0, [r3, #0xc]
	adds r0, #4
	str r0, [r3, #0xc]
_0801C30E:
	ldr r4, [r3, #0xc]
	ldrh r1, [r4]
	adds r2, r4, #0
	cmp r1, #0
	beq _0801C33C
	ldr r0, _0801C338 @ =0x0000FFFF
	cmp r1, r0
	beq _0801C35E
	ldrh r0, [r3, #0x1a]
	muls r0, r1, r0
	ldrh r2, [r3, #0x1c]
	adds r1, r0, r2
	strh r1, [r3, #0x1c]
	lsls r2, r1, #0x10
	lsrs r0, r2, #0x10
	cmp r0, #0xff
	bhi _0801C372
	movs r0, #1
	strh r0, [r3, #0x18]
	b _0801C366
	.align 2, 0
_0801C338: .4byte 0x0000FFFF
_0801C33C:
	ldrh r0, [r4, #2]
	cmp r0, #1
	beq _0801C354
	cmp r0, #1
	bgt _0801C34C
	cmp r0, #0
	beq _0801C35A
	b _0801C35E
_0801C34C:
	cmp r0, #0xff
	bne _0801C35E
	ldr r0, [r3, #8]
	b _0801C364
_0801C354:
	adds r0, r3, #0
	bl sub_0801C240
_0801C35A:
	movs r0, #0
	b _0801C3E4
_0801C35E:
	ldrh r0, [r2, #2]
	strh r0, [r3, #0x28]
	adds r0, r2, #4
_0801C364:
	str r0, [r3, #0xc]
_0801C366:
	adds r0, r3, #0
	bl sub_0801C2DC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0801C3E4
_0801C372:
	lsrs r0, r2, #0x18
	strh r0, [r3, #0x18]
	movs r0, #0xff
	ands r1, r0
	strh r1, [r3, #0x1c]
	adds r2, r3, #0
	adds r2, #0x20
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	beq _0801C3A0
	ldrh r0, [r4, #2]
	ldr r1, [r3, #4]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsrs r0, r0, #1
	lsls r0, r0, #1
	adds r1, r1, r0
	str r1, [r3, #0x10]
	b _0801C3AC
_0801C3A0:
	ldr r0, [r3, #4]
	ldrh r1, [r4, #2]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [r3, #0x10]
_0801C3AC:
	ldr r2, [r3, #0x10]
	ldrh r4, [r2]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0801C3D8
	str r2, [r3, #0x14]
	ldr r1, _0801C3D4 @ =0x00007FFF
	ands r1, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, #2
	adds r0, r2, r0
	str r0, [r3, #0x10]
	b _0801C3DA
	.align 2, 0
_0801C3D4: .4byte 0x00007FFF
_0801C3D8:
	str r0, [r3, #0x14]
_0801C3DA:
	ldrb r1, [r5]
	movs r0, #1
	orrs r0, r1
	strb r0, [r5]
_0801C3E2:
	movs r0, #1
_0801C3E4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

