	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08038240
sub_08038240: @ 0x08038240
	push {r4, r5, r6, r7, lr}
	bl sub_0803BD54
	ldr r0, _080382A4 @ =sub_08036884
	bl sub_080366D0
	ldr r0, _080382A8 @ =sub_080368E8
	bl sub_080366C4
	bl sub_08011B18
	ldr r6, _080382AC @ =gUnknown_08090F00
	ldr r7, _080382B0 @ =gUnknown_08090F04
	movs r1, #0
	ldr r0, [r6]
	movs r4, #3
_08038260:
	strb r1, [r0]
	strb r1, [r0, #4]
	adds r0, #1
	subs r4, #1
	cmp r4, #0
	bge _08038260
	ldr r1, [r6]
	movs r0, #0
	strb r0, [r1, #8]
	strb r0, [r1, #9]
	movs r4, #1
	movs r5, #0x3c
_08038278:
	ldr r0, [r7]
	ldr r0, [r0]
	adds r0, r5, r0
	ldrb r0, [r0, #0x1b]
	cmp r0, #0
	beq _080382C8
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080382B4
	ldr r2, [r6]
	ldrb r0, [r2, #8]
	adds r1, r0, #0
	cmp r1, #3
	bhi _080382D0
	adds r0, #1
	strb r0, [r2, #8]
	adds r0, r1, r2
	b _080382C6
	.align 2, 0
_080382A4: .4byte sub_08036884
_080382A8: .4byte sub_080368E8
_080382AC: .4byte gUnknown_08090F00
_080382B0: .4byte gUnknown_08090F04
_080382B4:
	ldr r2, [r6]
	ldrb r0, [r2, #9]
	adds r1, r0, #0
	cmp r1, #3
	bhi _080382D0
	adds r0, #1
	strb r0, [r2, #9]
	adds r0, r2, #4
	adds r0, r1, r0
_080382C6:
	strb r4, [r0]
_080382C8:
	adds r5, #0x3c
	adds r4, #1
	cmp r4, #4
	ble _08038278
_080382D0:
	ldr r4, [r6]
	ldr r0, _080382E4 @ =gUnknown_0200C420
	ldr r0, [r0]
	strh r0, [r4, #0xc]
	ldr r0, _080382E8 @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #3
	bne _080382EC
	movs r0, #0
	b _0803830C
	.align 2, 0
_080382E4: .4byte gUnknown_0200C420
_080382E8: .4byte gUnknown_03003FC0
_080382EC:
	bl sub_0807A908
	ldr r1, [r7]
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r0, [r1, #0x38]
	strh r0, [r4, #0xa]
	bl sub_0803866C
	cmp r0, #0
	beq _0803830E
	ldrh r0, [r4, #0xa]
	lsls r0, r0, #1
_0803830C:
	strh r0, [r4, #0xa]
_0803830E:
	bl sub_080381C0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803831E
	bl sub_0803BD60
	b _08038326
_0803831E:
	ldr r0, [r6]
	ldrh r0, [r0, #0xa]
	bl sub_080176C0
_08038326:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

