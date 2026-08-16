	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080350E4
sub_080350E4: @ 0x080350E4
	push {r4, r5, r6, lr}
	movs r4, #1
	ldr r6, _08035118 @ =gUnknown_03004493
	movs r5, #0
_080350EC:
	adds r0, r4, #0
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080350FC
	ldr r0, _0803511C @ =gUnknown_030033EC
	ldrh r0, [r0]
_080350FC:
	adds r0, r4, r6
	strb r5, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _080350EC
	ldr r1, _08035120 @ =gUnknown_03004490
	movs r0, #0x1e
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08035118: .4byte gUnknown_03004493
_0803511C: .4byte gUnknown_030033EC
_08035120: .4byte gUnknown_03004490

