	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08038484
sub_08038484: @ 0x08038484
	push {r4, r5, r6, lr}
	movs r4, #0
	bl sub_0803861C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080384E8
	ldr r5, _080384D8 @ =gUnknown_03003FC0
	ldrb r4, [r5, #2]
	subs r4, #0x8a
	ldr r0, _080384DC @ =gUnknown_03004080
	ldrh r6, [r0]
	bl sub_0807A908
	ldr r1, _080384E0 @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r2, [r1, #0x38]
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08038368
	ldrb r0, [r5, #2]
	subs r0, #0x8a
	bl sub_0807823C
	ldr r1, _080384E4 @ =gUnknown_0202FDFC
	ldrb r0, [r5, #2]
	subs r0, #0x8a
	str r0, [r1, #0xc]
	movs r0, #1
	strb r0, [r1, #0x11]
	ldrb r0, [r5, #2]
	subs r0, #0x8a
	bl sub_0807821C
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	b _080384F4
	.align 2, 0
_080384D8: .4byte gUnknown_03003FC0
_080384DC: .4byte gUnknown_03004080
_080384E0: .4byte gUnknown_08499598
_080384E4: .4byte gUnknown_0202FDFC
_080384E8:
	ldr r1, _0803852C @ =gUnknown_0202FDFC
	ldr r0, _08038530 @ =gUnknown_03003FC0
	ldrb r0, [r0, #2]
	subs r0, #0x8a
	str r0, [r1, #0xc]
	strb r4, [r1, #0x11]
_080384F4:
	bl sub_080346FC
	cmp r4, #0
	beq _08038538
	ldr r4, _08038534 @ =gUnknown_0200C420
	bl sub_0803866C
	lsls r0, r0, #1
	adds r5, r4, #0
	adds r5, #0x10
	adds r0, r0, r5
	ldrh r4, [r0]
	bl sub_08038434
	cmp r4, r0
	bge _08038524
	bl sub_0803866C
	adds r4, r0, #0
	bl sub_08038434
	lsls r4, r4, #1
	adds r4, r4, r5
	strh r0, [r4]
_08038524:
	bl sub_08045790
	b _0803853C
	.align 2, 0
_0803852C: .4byte gUnknown_0202FDFC
_08038530: .4byte gUnknown_03003FC0
_08038534: .4byte gUnknown_0200C420
_08038538:
	bl sub_0803BADC
_0803853C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

