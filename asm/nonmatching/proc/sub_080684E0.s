	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080684E0
sub_080684E0: @ 0x080684E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	movs r4, #0x80
	lsls r4, r4, #1
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, #0x4f
	ldrb r3, [r0]
	movs r0, #6
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	bl Interpolate
	str r0, [sp, #4]
	ldrh r0, [r7, #0x2c]
	subs r0, #1
	mov r8, r0
	cmp r0, #0
	bge _08068514
	b _080686A6
_08068514:
	lsls r0, r0, #3
	add r0, r8
	lsls r0, r0, #2
	str r0, [sp, #0xc]
_0806851C:
	movs r1, #0x36
	ldrsh r0, [r7, r1]
	ldr r2, [sp, #0xc]
	adds r0, r0, r2
	adds r0, #0x20
	ldr r1, _08068638 @ =0x0000010F
	cmp r0, r1
	bls _0806852E
	b _08068692
_0806852E:
	ldr r4, _0806863C @ =gSinLut
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	mov sb, r0
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r4, [r4, r2]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	str r0, [sp, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #4
	mov sl, r4
	mov r0, sl
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sb
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, r8
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	adds r0, r7, #0
	adds r0, #0x38
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	beq _08068692
	adds r0, r7, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	cmp r0, r8
	bne _080685EC
	mov r0, sb
	ldr r1, [sp, #4]
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r0, sl
	ldr r1, [sp, #4]
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sb
	ldr r1, [sp, #4]
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, r8
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
_080685EC:
	adds r0, r7, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	cmp r0, #0
	bne _08068648
	movs r0, #0x36
	ldrsh r4, [r7, r0]
	ldr r1, [sp, #0xc]
	adds r4, r4, r1
	ldr r0, _08068640 @ =0x000001FF
	ands r4, r0
	mov r2, r8
	lsls r0, r2, #9
	orrs r4, r0
	ldrh r5, [r7, #0x30]
	adds r0, r7, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	mov r0, r8
	bl __modsi3
	lsls r0, r0, #4
	adds r5, r5, r0
	adds r0, r7, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0xc
	adds r5, r5, r0
	str r5, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0xcc
	lsls r2, r2, #2
	ldr r3, _08068644 @ =gUnknown_08581208
	bl PutSpriteExt
	b _08068692
	.align 2, 0
_08068638: .4byte 0x0000010F
_0806863C: .4byte gSinLut
_08068640: .4byte 0x000001FF
_08068644: .4byte gUnknown_08581208
_08068648:
	adds r0, r7, #0
	adds r0, #0x2a
	ldrb r4, [r0]
	mov r1, r8
	mvns r0, r1
	ldrh r2, [r7, #0x2c]
	adds r0, r0, r2
	adds r1, r4, #0
	bl __modsi3
	subs r4, r4, r0
	subs r4, #1
	lsls r4, r4, #0x10
	movs r0, #0x36
	ldrsh r1, [r7, r0]
	ldr r2, [sp, #0xc]
	adds r1, r1, r2
	ldr r0, _080686E0 @ =0x000001FF
	ands r1, r0
	mov r2, r8
	lsls r0, r2, #9
	orrs r1, r0
	lsrs r4, r4, #0xc
	ldrh r0, [r7, #0x30]
	adds r4, r4, r0
	adds r0, r7, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0xc
	adds r4, r4, r0
	str r4, [sp]
	movs r0, #0
	movs r2, #0xcc
	lsls r2, r2, #2
	ldr r3, _080686E4 @ =gUnknown_08581208
	bl PutSpriteExt
_08068692:
	ldr r1, [sp, #0xc]
	subs r1, #0x24
	str r1, [sp, #0xc]
	movs r2, #1
	rsbs r2, r2, #0
	add r8, r2
	mov r4, r8
	cmp r4, #0
	blt _080686A6
	b _0806851C
_080686A6:
	adds r2, r7, #0
	adds r2, #0x4f
	ldrb r0, [r2]
	adds r0, #1
	movs r3, #0
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #6
	bne _080686D0
	adds r0, r7, #0
	adds r0, #0x4c
	adds r1, r7, #0
	adds r1, #0x38
	ldrb r4, [r0]
	adds r1, r1, r4
	strb r3, [r1]
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	strb r3, [r2]
_080686D0:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080686E0: .4byte 0x000001FF
_080686E4: .4byte gUnknown_08581208

