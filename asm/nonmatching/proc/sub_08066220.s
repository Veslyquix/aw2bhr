	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08066220
sub_08066220: @ 0x08066220
	push {r4, r5, r6, r7, lr}
	ldr r6, _08066260 @ =gUnknown_0816E144
	ldr r4, [r6]
	ldr r0, [r4]
	ldrb r0, [r0, #8]
	bl sub_08065C9C
	ldr r5, _08066264 @ =gUnknown_0816E148
	ldr r7, [r5]
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	ldr r1, [r4]
	adds r1, #0x32
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r2, #1
	bl sub_080660BC
	bl sub_08066078
	ldr r0, [r4]
	ldrb r1, [r0, #8]
	cmp r1, #2
	bne _0806626E
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #1
	bne _08066268
	ldr r0, [r7]
	strh r1, [r0, #4]
	b _0806626E
	.align 2, 0
_08066260: .4byte gUnknown_0816E144
_08066264: .4byte gUnknown_0816E148
_08066268:
	ldr r1, [r7]
	movs r0, #1
	strh r0, [r1, #4]
_0806626E:
	ldr r0, [r5]
	ldr r0, [r0]
	ldrh r5, [r0, #4]
	movs r0, #2
	ands r0, r5
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _080662E8
	ldr r2, [r6]
	ldr r0, [r2]
	adds r0, #0x26
	movs r1, #0
	strb r1, [r0]
	ldr r1, [r2]
	adds r1, #0x32
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #1
	strb r0, [r1]
	ldr r0, _080662CC @ =gUnknown_08580AF0
	ldr r4, _080662D0 @ =sub_08066200
	adds r1, r4, #0
	bl sub_08063A00
	ldr r0, _080662D4 @ =gUnknown_08580B90
	adds r1, r4, #0
	bl sub_08063A00
	ldr r0, _080662D8 @ =gUnknown_08580BC8
	adds r1, r4, #0
	bl sub_08063A00
	ldr r0, _080662DC @ =gUnknown_08580A38
	ldr r4, _080662E0 @ =sub_08066210
	adds r1, r4, #0
	bl sub_08063A00
	ldr r0, _080662E4 @ =gUnknown_08580A08
	adds r1, r4, #0
	bl sub_08063A00
	movs r0, #0x66
	bl sub_0803B4DC
	b _08066306
	.align 2, 0
_080662CC: .4byte gUnknown_08580AF0
_080662D0: .4byte sub_08066200
_080662D4: .4byte gUnknown_08580B90
_080662D8: .4byte gUnknown_08580BC8
_080662DC: .4byte gUnknown_08580A38
_080662E0: .4byte sub_08066210
_080662E4: .4byte gUnknown_08580A08
_080662E8:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _08066306
	bl sub_080654E8
	bl sub_08064A44
	ldr r0, [r6]
	ldr r0, [r0]
	adds r0, #0x30
	strb r4, [r0]
	movs r0, #0x71
	bl sub_0803B4DC
_08066306:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

