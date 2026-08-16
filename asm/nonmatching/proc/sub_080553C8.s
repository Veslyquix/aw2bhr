	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080553C8
sub_080553C8: @ 0x080553C8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r6, _080554DC @ =gUnknown_0813614C
	ldr r7, [r6]
	ldrh r0, [r7, #6]
	ldrh r5, [r7, #0x16]
	movs r2, #0x1f
	adds r1, r0, #0
	ands r1, r2
	strh r1, [r7, #6]
	adds r1, r5, #0
	ands r1, r2
	strh r1, [r7, #0x16]
	bl sub_08024984
	ldr r4, _080554E0 @ =gUnknown_030045A8
	strh r0, [r4]
	adds r0, r5, #0
	bl sub_08024984
	strh r0, [r4, #2]
	ldr r1, _080554E4 @ =gUnknown_03004500
	ldrh r0, [r7]
	strb r0, [r1]
	ldrh r0, [r7, #0x10]
	strb r0, [r1, #1]
	ldr r1, _080554E8 @ =gUnknown_08553846
	ldrh r0, [r7]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r7]
	ldrh r0, [r7, #0x10]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r7, #0x10]
	ldr r0, _080554EC @ =gUnknown_03004504
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	mov r8, r6
	cmp r0, #0
	beq _08055436
	ldrh r0, [r7, #2]
	cmp r0, #0x12
	bne _0805542C
	movs r0, #3
	strh r0, [r7, #2]
_0805542C:
	ldrh r0, [r7, #0x12]
	cmp r0, #0x12
	bne _08055436
	movs r0, #3
	strh r0, [r7, #0x12]
_08055436:
	mov r0, r8
	ldr r2, [r0]
	ldrh r0, [r2, #2]
	cmp r0, #0x17
	bne _08055452
	ldr r0, _080554F0 @ =gUnknown_03004528
	ldr r0, [r0]
	ldrb r1, [r0, #1]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08055452
	movs r0, #0x11
	strh r0, [r2, #2]
_08055452:
	mov r1, r8
	ldr r2, [r1]
	ldrh r0, [r2, #0x12]
	cmp r0, #0x17
	bne _0805546E
	ldr r0, _080554F0 @ =gUnknown_03004528
	ldr r0, [r0, #4]
	ldrb r1, [r0, #1]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805546E
	movs r0, #0x11
	strh r0, [r2, #0x12]
_0805546E:
	mov r0, r8
	ldr r7, [r0]
	ldrh r0, [r7, #0xa]
	ldrh r1, [r7, #0xc]
	cmp r0, r1
	beq _08055480
	ldr r1, _080554F4 @ =gUnknown_02028E4C
	movs r0, #0
	strb r0, [r1, #5]
_08055480:
	ldrh r6, [r7, #0x1a]
	ldrh r0, [r7, #0x1c]
	cmp r6, r0
	beq _0805548E
	ldr r1, _080554F4 @ =gUnknown_02028E4C
	movs r0, #0
	strb r0, [r1, #0xd]
_0805548E:
	ldr r5, _080554F8 @ =gUnknown_08136150
	ldr r4, [r5]
	ldr r3, _080554FC @ =gUnknown_085D6A48
	ldrh r1, [r7, #4]
	lsls r1, r1, #1
	ldrh r2, [r7, #2]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r3, #0xa
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4]
	ldrh r1, [r7, #0x14]
	lsls r1, r1, #1
	ldrh r2, [r7, #0x12]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r4, #2]
	ldr r1, _08055500 @ =gUnknown_02029B78
	ldrh r0, [r7, #0xa]
	strh r0, [r1]
	strh r6, [r1, #2]
	lsls r0, r0, #0x10
	adds r4, r5, #0
	cmp r0, #0
	beq _08055504
	ldrh r0, [r7, #0xa]
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r0, #1
	b _08055506
	.align 2, 0
_080554DC: .4byte gUnknown_0813614C
_080554E0: .4byte gUnknown_030045A8
_080554E4: .4byte gUnknown_03004500
_080554E8: .4byte gUnknown_08553846
_080554EC: .4byte gUnknown_03004504
_080554F0: .4byte gUnknown_03004528
_080554F4: .4byte gUnknown_02028E4C
_080554F8: .4byte gUnknown_08136150
_080554FC: .4byte gUnknown_085D6A48
_08055500: .4byte gUnknown_02029B78
_08055504:
	movs r0, #0
_08055506:
	strh r0, [r7, #0xa]
	mov r1, r8
	ldr r5, [r1]
	ldrh r0, [r5, #0x1a]
	cmp r0, #0
	beq _0805551E
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r0, #1
	b _08055520
_0805551E:
	movs r0, #0
_08055520:
	strh r0, [r5, #0x1a]
	ldr r3, _08055548 @ =gUnknown_02029B7C
	mov r0, r8
	ldr r2, [r0]
	ldrh r1, [r2, #0xc]
	strh r1, [r3]
	ldrh r0, [r2, #0x1c]
	strh r0, [r3, #2]
	adds r5, r2, #0
	lsls r1, r1, #0x10
	cmp r1, #0
	beq _0805554C
	ldrh r0, [r5, #0xc]
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r0, #1
	b _0805554E
	.align 2, 0
_08055548: .4byte gUnknown_02029B7C
_0805554C:
	movs r0, #0
_0805554E:
	strh r0, [r5, #0xc]
	mov r1, r8
	ldr r5, [r1]
	ldrh r0, [r5, #0x1c]
	cmp r0, #0
	beq _08055566
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r0, #1
	b _08055568
_08055566:
	movs r0, #0
_08055568:
	strh r0, [r5, #0x1c]
	mov r0, r8
	ldr r6, [r0]
	ldrh r0, [r6, #0xa]
	ldrh r1, [r6, #0xc]
	movs r2, #0
	bl sub_08057164
	ldrh r0, [r6, #0x1a]
	ldrh r1, [r6, #0x1c]
	movs r2, #1
	bl sub_08057164
	ldr r5, _080555E8 @ =gUnknown_0300450C
	ldrh r1, [r5]
	movs r0, #0
	bl sub_080555F0
	ldrh r1, [r5]
	movs r0, #1
	bl sub_080555F0
	ldr r4, [r4]
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	bl sub_08055654
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	bl sub_08055940
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	bl sub_08055D4C
	ldrh r1, [r5]
	movs r0, #1
	adds r2, r0, #0
	eors r2, r1
	lsls r1, r2, #4
	adds r0, r6, #2
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, #0x15
	bne _080555DC
	adds r0, r6, #4
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, #1
	bne _080555DC
	ldr r0, _080555EC @ =gUnknown_020296B0
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x1e]
	adds r0, #0x20
	strh r0, [r1, #0x1e]
_080555DC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080555E8: .4byte gUnknown_0300450C
_080555EC: .4byte gUnknown_020296B0

