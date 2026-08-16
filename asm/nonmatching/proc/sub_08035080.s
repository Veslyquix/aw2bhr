	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035080
sub_08035080: @ 0x08035080
	push {r4, r5, r6, r7, lr}
	ldr r3, _080350A4 @ =gUnknown_08090E34
	ldr r1, [r3]
	ldr r2, _080350A8 @ =gUnknown_08090E38
	ldr r0, [r2]
	adds r1, #3
	ldrh r0, [r0]
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r4, #1
	adds r6, r3, #0
	adds r5, r2, #0
	b _080350B2
	.align 2, 0
_080350A4: .4byte gUnknown_08090E34
_080350A8: .4byte gUnknown_08090E38
_080350AC:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080350B2:
	cmp r4, #4
	bhi _080350DA
	ldr r0, [r5]
	ldrh r0, [r0]
	cmp r4, r0
	beq _080350AC
	adds r0, r4, #0
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080350AC
	ldr r0, [r6]
	adds r0, #3
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r7, r0
	beq _080350AC
	movs r0, #0
	b _080350DC
_080350DA:
	movs r0, #1
_080350DC:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

