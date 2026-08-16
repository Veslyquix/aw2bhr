	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08023908
sub_08023908: @ 0x08023908
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r1, _08023A44 @ =gUnknown_08090A18
	ldr r2, [r1]
	ldr r3, [r2]
	ldrh r4, [r3, #0x10]
	movs r0, #3
	ands r0, r4
	adds r7, r1, #0
	cmp r0, #0
	bne _08023948
	ldr r0, _08023A48 @ =gUnknown_030033E4
	ldrh r1, [r3, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	ldrh r0, [r0]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r0, #0
	cmp r1, #1
	bhi _0802393A
	movs r0, #2
	orrs r0, r4
	strh r0, [r3, #0x10]
_0802393A:
	cmp r1, #0xc
	bls _08023948
	ldr r2, [r2]
	ldrh r1, [r2, #0x10]
	movs r0, #1
	orrs r0, r1
	strh r0, [r2, #0x10]
_08023948:
	ldr r2, [r7]
	ldr r3, [r2]
	ldrh r4, [r3, #0x10]
	movs r0, #0xc
	ands r0, r4
	cmp r0, #0
	bne _08023980
	ldr r0, _08023A48 @ =gUnknown_030033E4
	ldrh r1, [r3, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	ldrh r0, [r0, #2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r0, #0
	cmp r1, #1
	bhi _08023972
	movs r0, #4
	orrs r0, r4
	strh r0, [r3, #0x10]
_08023972:
	cmp r1, #7
	bls _08023980
	ldr r2, [r2]
	ldrh r1, [r2, #0x10]
	movs r0, #8
	orrs r0, r1
	strh r0, [r2, #0x10]
_08023980:
	ldr r0, [r7]
	ldr r2, [r0]
	ldrh r4, [r2, #0x10]
	movs r5, #1
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _080239B0
	ldrh r1, [r2]
	ldrh r3, [r2, #4]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x14
	subs r1, r1, r0
	cmp r1, #0xf
	beq _080239AA
	adds r0, r3, r6
	strh r0, [r2, #4]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _080239B0
_080239AA:
	adds r0, r4, #0
	eors r0, r5
	strh r0, [r2, #0x10]
_080239B0:
	ldr r0, [r7]
	ldr r2, [r0]
	ldrh r3, [r2, #0x10]
	movs r4, #2
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _080239DC
	ldrh r1, [r2, #4]
	movs r5, #4
	ldrsh r0, [r2, r5]
	cmp r0, #0
	beq _080239D6
	subs r0, r1, r6
	strh r0, [r2, #4]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _080239DC
_080239D6:
	adds r0, r3, #0
	eors r0, r4
	strh r0, [r2, #0x10]
_080239DC:
	ldr r0, [r7]
	ldr r2, [r0]
	ldrh r3, [r2, #0x10]
	movs r4, #4
	movs r0, #4
	ands r0, r3
	cmp r0, #0
	beq _08023A08
	ldrh r1, [r2, #6]
	movs r5, #6
	ldrsh r0, [r2, r5]
	cmp r0, #0
	beq _08023A02
	subs r0, r1, r6
	strh r0, [r2, #6]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08023A08
_08023A02:
	adds r0, r3, #0
	eors r0, r4
	strh r0, [r2, #0x10]
_08023A08:
	ldr r0, [r7]
	ldr r2, [r0]
	ldrh r4, [r2, #0x10]
	movs r5, #8
	movs r0, #8
	ands r0, r4
	cmp r0, #0
	beq _08023A38
	ldrh r1, [r2, #2]
	ldrh r3, [r2, #6]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x14
	subs r1, r1, r0
	cmp r1, #0xa
	beq _08023A32
	adds r0, r3, r6
	strh r0, [r2, #6]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08023A38
_08023A32:
	adds r0, r4, #0
	eors r0, r5
	strh r0, [r2, #0x10]
_08023A38:
	bl sub_08023860
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08023A44: .4byte gUnknown_08090A18
_08023A48: .4byte gUnknown_030033E4

