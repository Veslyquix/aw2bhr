	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034938
sub_08034938: @ 0x08034938
	push {r4, r5, lr}
	ldr r0, _08034960 @ =gUnknown_03003FC0
	adds r4, r0, #0
	adds r4, #0x30
	ldrb r0, [r4]
	cmp r0, #0
	beq _0803495A
	bl sub_0802672C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803495A
	ldr r1, _08034964 @ =gUnknown_03004080
	ldrb r0, [r4]
	ldrh r1, [r1]
	cmp r0, r1
	beq _0803496C
_0803495A:
	ldr r1, _08034968 @ =gUnknown_030032D8
	movs r0, #2
	b _080349D4
	.align 2, 0
_08034960: .4byte gUnknown_03003FC0
_08034964: .4byte gUnknown_03004080
_08034968: .4byte gUnknown_030032D8
_0803496C:
	movs r5, #0
	movs r4, #1
_08034970:
	adds r0, r4, #0
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08034990
	ldr r0, _080349DC @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0x11]
	cmp r5, r0
	bhs _08034990
	adds r5, r0, #0
_08034990:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _08034970
	movs r4, #1
_0803499C:
	adds r0, r4, #0
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080349C2
	ldr r0, _080349DC @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0x11]
	cmp r5, r0
	bls _080349C2
	adds r0, r4, #0
	movs r1, #0x20
	bl sub_08028874
_080349C2:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _0803499C
	bl sub_08028568
	ldr r1, _080349E0 @ =gUnknown_030032D8
	movs r0, #0x12
_080349D4:
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080349DC: .4byte gUnknown_08499598
_080349E0: .4byte gUnknown_030032D8

