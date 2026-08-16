	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074484
sub_08074484: @ 0x08074484
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	movs r5, #0
	b _08074560
_08074490:
	ldrb r0, [r4]
	cmp r0, #7
	bhi _0807455E
	lsls r0, r0, #2
	ldr r1, _080744A0 @ =_080744A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080744A0: .4byte _080744A4
_080744A4: @ jump table
	.4byte _080744C4 @ case 0
	.4byte _0807452E @ case 1
	.4byte _08074540 @ case 2
	.4byte _0807454C @ case 3
	.4byte _08074538 @ case 4
	.4byte _08074514 @ case 5
	.4byte _08074524 @ case 6
	.4byte _080744EC @ case 7
_080744C4:
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _080744D2
	ldr r1, _080744E4 @ =gUnknown_030033EC
	ldrh r1, [r1]
	cmp r0, r1
	bne _08074556
_080744D2:
	ldrh r1, [r4, #2]
	cmp r1, #0
	beq _0807455E
	ldr r0, _080744E8 @ =gUnknown_03004080
	ldrh r0, [r0]
	cmp r1, r0
	beq _0807455E
	b _08074556
	.align 2, 0
_080744E4: .4byte gUnknown_030033EC
_080744E8: .4byte gUnknown_03004080
_080744EC:
	ldrb r0, [r4, #1]
	cmp r0, #0xff
	beq _080744FA
	bl sub_0803CBD8
	cmp r0, #0
	bne _08074556
_080744FA:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _08074506
	bl sub_08019348
	movs r5, #1
_08074506:
	ldrb r0, [r4, #1]
	cmp r0, #0xff
	beq _0807455E
	movs r1, #1
	bl sub_0803CBA0
	b _0807455E
_08074514:
	ldr r0, [r4, #4]
	bl _call_via_r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0807455E
	b _08074556
_08074524:
	ldr r0, [r4, #4]
	bl _call_via_r0
	lsls r0, r0, #0x18
	b _08074552
_0807452E:
	ldrb r0, [r7]
	ldrb r1, [r4, #1]
	cmp r0, r1
	beq _0807455E
	b _08074556
_08074538:
	ldrb r0, [r4, #1]
	cmp r0, r6
	beq _0807455E
	b _08074556
_08074540:
	ldrb r0, [r4, #1]
	bl sub_0803CBD8
	cmp r0, #0
	bne _0807455E
	b _08074556
_0807454C:
	ldrb r0, [r4, #1]
	bl sub_0803CBD8
_08074552:
	cmp r0, #0
	beq _0807455E
_08074556:
	adds r0, r4, #0
	bl sub_08074570
	adds r4, r0, #0
_0807455E:
	adds r4, #8
_08074560:
	ldrb r0, [r4]
	cmp r0, #8
	bne _08074490
	adds r0, r5, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

