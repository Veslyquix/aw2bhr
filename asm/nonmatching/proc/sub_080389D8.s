	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080389D8
sub_080389D8: @ 0x080389D8
	push {r4, r5, lr}
	movs r4, #0
	ldr r5, _08038A04 @ =gUnknown_08090F0C
_080389DE:
	ldr r2, [r5]
	adds r1, r4, #0
	lsls r0, r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #0x11
	adds r0, r0, r3
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xa
	bhi _080389DE
	lsls r0, r0, #2
	ldr r1, _08038A08 @ =_08038A0C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08038A04: .4byte gUnknown_08090F0C
_08038A08: .4byte _08038A0C
_08038A0C: @ jump table
	.4byte _08038AD0 @ case 0
	.4byte _08038A38 @ case 1
	.4byte _08038A54 @ case 2
	.4byte _08038AA4 @ case 3
	.4byte _08038A80 @ case 4
	.4byte _08038AD0 @ case 5
	.4byte _080389DE @ case 6
	.4byte _080389DE @ case 7
	.4byte _080389DE @ case 8
	.4byte _080389DE @ case 9
	.4byte _080389DE @ case 10
_08038A38:
	ldr r0, _08038A50 @ =gUnknown_0849D5F8
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x45
	movs r2, #0
	ldrsb r2, [r0, r2]
	subs r0, #0x25
	adds r0, r0, r2
	ldrb r0, [r0]
	subs r0, #1
	b _08038A68
	.align 2, 0
_08038A50: .4byte gUnknown_0849D5F8
_08038A54:
	ldr r0, _08038A7C @ =gUnknown_0849D5F8
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x45
	movs r2, #0
	ldrsb r2, [r0, r2]
	subs r0, #0x25
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r0, #1
_08038A68:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0x2c
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_08038848
	b _080389DE
	.align 2, 0
_08038A7C: .4byte gUnknown_0849D5F8
_08038A80:
	ldr r0, _08038AA0 @ =gUnknown_0849D5F8
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x45
	movs r2, #0
	ldrsb r2, [r0, r2]
	subs r0, #0x25
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0x2c
	adds r1, r1, r2
	ldrb r1, [r1]
	subs r1, #1
	b _08038AC2
	.align 2, 0
_08038AA0: .4byte gUnknown_0849D5F8
_08038AA4:
	ldr r0, _08038ACC @ =gUnknown_0849D5F8
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x45
	movs r2, #0
	ldrsb r2, [r0, r2]
	subs r0, #0x25
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0x2c
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r1, #1
_08038AC2:
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_08038848
	b _080389DE
	.align 2, 0
_08038ACC: .4byte gUnknown_0849D5F8
_08038AD0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

