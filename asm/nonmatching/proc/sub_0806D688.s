	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806D688
sub_0806D688: @ 0x0806D688
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _0806D6AC @ =gUnknown_0816E19C
	ldr r0, [r1]
	ldr r0, [r0]
	adds r0, #0x30
	ldrb r2, [r0]
	ldr r0, [r4, #0x2c]
	adds r7, r1, #0
	ldr r6, _0806D6B0 @ =gUnknown_0816E1A0
	cmp r0, r2
	beq _0806D6C0
	cmp r2, #0
	bne _0806D6B4
	ldr r0, [r6]
	b _0806D6B6
	.align 2, 0
_0806D6AC: .4byte gUnknown_0816E19C
_0806D6B0: .4byte gUnknown_0816E1A0
_0806D6B4:
	ldr r0, _0806D6E4 @ =gUnknown_08581F04
_0806D6B6:
	str r0, [r4, #0x3c]
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0xe
	strh r0, [r1]
_0806D6C0:
	ldr r0, [r7]
	ldr r0, [r0]
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806D6EC
	ldr r2, _0806D6E8 @ =gUnknown_08581F20
	adds r1, r4, #0
	adds r1, #0x44
	movs r3, #0
	ldrsh r0, [r1, r3]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r3, [r0, r2]
	adds r5, r1, #0
	b _0806D704
	.align 2, 0
_0806D6E4: .4byte gUnknown_08581F04
_0806D6E8: .4byte gUnknown_08581F20
_0806D6EC:
	ldr r1, _0806D738 @ =gUnknown_08581F20
	adds r2, r4, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r0, #0xc0
	subs r3, r0, r1
	adds r5, r2, #0
_0806D704:
	str r3, [r4, #0x24]
	movs r0, #0xc0
	subs r0, r0, r3
	cmp r0, #0
	bge _0806D710
	adds r0, #0xf
_0806D710:
	asrs r0, r0, #4
	adds r2, r0, #0
	adds r2, #0x14
	str r2, [r4, #0x28]
	ldr r1, [r6]
	ldr r0, [r4, #0x3c]
	cmp r0, r1
	bne _0806D740
	ldr r0, _0806D73C @ =0x000001FF
	ands r3, r0
	movs r0, #0xff
	ands r2, r0
	movs r0, #1
	str r0, [sp]
	movs r0, #0x8c
	adds r1, r3, #0
	movs r3, #0
	bl sub_0801F34C
	b _0806D756
	.align 2, 0
_0806D738: .4byte gUnknown_08581F20
_0806D73C: .4byte 0x000001FF
_0806D740:
	ldr r0, _0806D778 @ =0x000001FF
	ands r3, r0
	movs r0, #0xff
	ands r2, r0
	movs r0, #1
	str r0, [sp]
	movs r0, #0x8d
	adds r1, r3, #0
	movs r3, #0
	bl sub_0801F34C
_0806D756:
	ldr r0, [r7]
	ldr r0, [r0]
	adds r0, #0x30
	ldrb r0, [r0]
	str r0, [r4, #0x2c]
	ldrh r1, [r5]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, #0
	beq _0806D76E
	subs r0, r1, #1
	strh r0, [r5]
_0806D76E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D778: .4byte 0x000001FF

