	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08063528
sub_08063528: @ 0x08063528
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldrb r0, [r3, #0x18]
	cmp r0, #0xe0
	beq _08063544
	cmp r0, #0xe0
	blt _08063554
	cmp r0, #0xe8
	bgt _08063554
	cmp r0, #0xe7
	blt _08063554
	movs r4, #3
	ldrb r5, [r3, #0x1e]
	b _080635B4
_08063544:
	movs r1, #0
	movs r0, #0xe1
	strb r0, [r3, #0x18]
	str r1, [r3, #4]
	movs r0, #0x80
	lsls r0, r0, #0xd
	str r0, [r3]
	b _080635A6
_08063554:
	movs r4, #3
	ldrb r5, [r3, #0x1e]
	movs r6, #1
	ldr r1, _080635B0 @ =0x04000126
_0806355C:
	ldrh r0, [r1]
	adds r2, r0, #0
	adds r0, r5, #0
	asrs r0, r4
	ands r0, r6
	cmp r0, #0
	beq _08063570
	ldr r0, [r3, #4]
	cmp r2, r0
	bne _08063544
_08063570:
	subs r1, #2
	subs r4, #1
	cmp r4, #0
	bne _0806355C
	ldrb r0, [r3, #0x18]
	adds r0, #1
	strb r0, [r3, #0x18]
	ldr r1, [r3]
	ldrh r0, [r3]
	str r0, [r3, #4]
	cmp r1, #0
	bne _0806359E
	ldr r0, [r3, #0x28]
	adds r1, r0, #0
	adds r1, #0xac
	ldrb r1, [r1]
	adds r0, #0xad
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r1, r0
	str r1, [r3, #4]
	lsls r1, r1, #5
	str r1, [r3]
_0806359E:
	ldr r0, [r3]
	lsrs r0, r0, #5
	str r0, [r3]
_080635A4:
	ldrh r1, [r3]
_080635A6:
	adds r0, r3, #0
	bl sub_080633E4
	b _0806360C
	.align 2, 0
_080635B0: .4byte 0x04000126
_080635B4:
	lsls r0, r4, #1
	ldr r1, _080635FC @ =0x04000120
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r2, r0, #0
	adds r0, r5, #0
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080635D0
	ldr r0, [r3, #4]
	cmp r2, r0
	bne _08063600
_080635D0:
	subs r4, #1
	cmp r4, #0
	bne _080635B4
	ldrb r0, [r3, #0x18]
	adds r0, #1
	strb r0, [r3, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xe9
	beq _0806360A
	ldr r0, [r3, #0x28]
	adds r1, r0, #0
	adds r1, #0xae
	ldrb r1, [r1]
	adds r0, #0xaf
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r1, r0
	str r1, [r3]
	str r1, [r3, #4]
	b _080635A4
	.align 2, 0
_080635FC: .4byte 0x04000120
_08063600:
	adds r0, r3, #0
	bl sub_08062FB8
	movs r0, #0x71
	b _0806360C
_0806360A:
	movs r0, #0
_0806360C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

