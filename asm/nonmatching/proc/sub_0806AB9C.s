	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806AB9C
sub_0806AB9C: @ 0x0806AB9C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r0, #0x44
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	movs r4, #0
	ldr r0, [r6, #0x48]
	cmp r4, r0
	bge _0806ABFE
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	movs r5, #0xf8
	lsls r5, r5, #0xd
	adds r0, r0, r5
	lsrs r5, r0, #0x10
_0806ABCE:
	cmp r5, #0xbe
	bhi _0806ABF6
	adds r0, r6, #0
	adds r0, #0x2f
	adds r0, r0, r4
	ldrb r1, [r0]
	movs r2, #0xff
	ands r2, r7
	lsls r2, r2, #0x10
	adds r3, r6, #0
	adds r3, #0x52
	lsls r0, r4, #3
	ldrh r3, [r3]
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #0
	asrs r2, r2, #0x10
	ldr r3, _0806ACF0 @ =gUnknown_08581730
	bl PutSpriteExt
_0806ABF6:
	adds r4, #1
	ldr r0, [r6, #0x48]
	cmp r4, r0
	blt _0806ABCE
_0806ABFE:
	mov r1, r8
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #0xe
	adds r5, r0, r1
	asrs r2, r5, #0x10
	movs r1, #0xf0
	lsls r1, r1, #0xc
	adds r0, r5, r1
	lsrs r0, r0, #0x10
	cmp r0, #0xae
	bhi _0806AC22
	ldr r3, _0806ACF4 @ =gUnknown_08581738
	movs r0, #0
	str r0, [sp]
	movs r1, #0x3a
	bl PutSprite
_0806AC22:
	movs r1, #0x6a
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x44
	str r0, [sp, #4]
	adds r7, r5, #0
	movs r5, #0x2c
	adds r5, r5, r6
	mov r8, r5
	movs r0, #1
	rsbs r0, r0, #0
	mov sl, r0
	ldr r5, _0806ACF8 @ =0x000001FF
	mov sb, r5
_0806AC3E:
	mov r0, r8
	adds r3, r0, r4
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsls r5, r1, #0x10
	cmp r0, sl
	beq _0806AC74
	asrs r2, r7, #0x10
	movs r1, #0xf0
	lsls r1, r1, #0xc
	adds r0, r7, r1
	lsrs r0, r0, #0x10
	cmp r0, #0xae
	bhi _0806AC74
	lsrs r1, r5, #0x10
	mov r0, sb
	ands r1, r0
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #0
	ldr r3, _0806ACFC @ =gUnknown_08581752
	bl PutSpriteExt
_0806AC74:
	movs r1, #0x80
	lsls r1, r1, #0xd
	adds r0, r5, r1
	lsrs r1, r0, #0x10
	adds r4, #1
	cmp r4, #2
	ble _0806AC3E
	movs r5, #0x80
	lsls r5, r5, #0xd
	adds r0, r7, r5
	asrs r4, r0, #0x10
	movs r1, #0x9e
	lsls r1, r1, #0xf
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	cmp r0, #0xee
	bhi _0806ACC4
	ldr r3, _0806AD00 @ =gUnknown_085816F0
	ldr r0, [r6, #0x4c]
	lsls r0, r0, #4
	adds r1, r0, r3
	movs r5, #0xc
	ldrsh r2, [r1, r5]
	adds r2, r4, r2
	adds r3, #8
	adds r0, r0, r3
	ldr r3, [r0]
	adds r0, r6, #0
	adds r0, #0x52
	ldrh r1, [r0]
	adds r1, #0x90
	subs r0, #2
	ldrh r0, [r0]
	lsls r0, r0, #0xc
	orrs r1, r0
	str r1, [sp]
	movs r0, #0
	movs r1, #0x58
	bl PutSprite
_0806ACC4:
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	movs r1, #0x7c
	rsbs r1, r1, #0
	cmp r0, r1
	bge _0806ACDE
	adds r0, r6, #0
	bl Proc_Break
_0806ACDE:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806ACF0: .4byte gUnknown_08581730
_0806ACF4: .4byte gUnknown_08581738
_0806ACF8: .4byte 0x000001FF
_0806ACFC: .4byte gUnknown_08581752
_0806AD00: .4byte gUnknown_085816F0

