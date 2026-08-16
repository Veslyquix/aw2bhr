	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08039850
sub_08039850: @ 0x08039850
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r1, _080398B0 @ =gUnknown_0849D62C
	ldr r0, _080398B4 @ =gUnknown_03003FC0
	ldrb r0, [r0, #2]
	subs r0, #0x8a
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r5, [r0]
	cmp r5, #0
	beq _080398C6
	movs r0, #1
	ldrsb r0, [r5, r0]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080398C6
	adds r7, r1, #0
_08039874:
	movs r2, #1
	ldrsb r2, [r5, r2]
	ldr r3, [r6, #0x54]
	ldr r0, _080398B8 @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r3, #4
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0x1d]
	cmp r2, r0
	bne _080398BC
	ldrb r4, [r5, #2]
	adds r0, r3, #0
	bl sub_08044374
	cmp r4, r0
	bne _080398BC
	ldrb r0, [r5]
	cmp r0, #0
	beq _080398A6
	adds r1, r0, #0
	ldr r0, [r6, #0x54]
	cmp r1, r0
	bne _080398BC
_080398A6:
	ldrh r0, [r5, #4]
	bl sub_080397F4
	movs r0, #1
	b _080398C8
	.align 2, 0
_080398B0: .4byte gUnknown_0849D62C
_080398B4: .4byte gUnknown_03003FC0
_080398B8: .4byte gUnknown_08499598
_080398BC:
	adds r5, #8
	movs r0, #1
	ldrsb r0, [r5, r0]
	cmp r0, r7
	bne _08039874
_080398C6:
	movs r0, #0
_080398C8:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

