	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035490
sub_08035490: @ 0x08035490
	push {r4, r5, r6, r7, lr}
	ldr r1, _080354F4 @ =gUnknown_03004490
	movs r0, #6
	strb r0, [r1, #2]
	strb r0, [r1, #1]
	movs r5, #1
	ldr r7, _080354F8 @ =gUnknown_08090EA0
	adds r4, r1, #0
	adds r6, r4, #3
_080354A2:
	ldr r0, [r7]
	ldr r1, [r0]
	lsls r0, r5, #4
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0x1b]
	cmp r0, #0
	beq _080354D8
	ldrb r0, [r4, #1]
	subs r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4, #2]
	subs r0, #1
	strb r0, [r4, #2]
	adds r0, r5, #0
	bl sub_08042F5C
	ldrb r1, [r4, #1]
	adds r1, r1, r0
	strb r1, [r4, #1]
	adds r0, r5, #0
	bl sub_08042FA4
	ldrb r1, [r4, #2]
	adds r1, r1, r0
	strb r1, [r4, #2]
_080354D8:
	adds r1, r5, r6
	movs r0, #0
	strb r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _080354A2
	bl sub_080354FC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080354F4: .4byte gUnknown_03004490
_080354F8: .4byte gUnknown_08090EA0

