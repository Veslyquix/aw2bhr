	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805772C
sub_0805772C: @ 0x0805772C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r3, r1, #0
	adds r5, r2, #0
	movs r4, #1
	ands r4, r3
	ldr r0, _0805774C @ =gUnknown_02029B78
	lsls r1, r4, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	lsls r1, r0, #0x10
	cmp r0, #1
	bne _08057754
	ldr r6, _08057750 @ =gUnknown_085538B9
	b _0805775E
	.align 2, 0
_0805774C: .4byte gUnknown_02029B78
_08057750: .4byte gUnknown_085538B9
_08057754:
	ldr r2, _080577B0 @ =gUnknown_085538B2
	lsrs r1, r1, #0x11
	lsls r0, r1, #3
	subs r0, r0, r1
	adds r6, r0, r2
_0805775E:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #2
	ldr r1, _080577B4 @ =gUnknown_08553A20
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrh r2, [r5]
	adds r1, r1, r2
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r5, [r5, #2]
	adds r0, r0, r5
	lsls r0, r0, #5
	adds r1, r1, r0
	cmp r4, #0
	beq _080577BC
	movs r3, #6
	lsls r0, r4, #1
	lsls r2, r1, #1
	ldr r1, _080577B8 @ =gUnknown_08562124
	adds r4, r0, r1
	adds r0, r7, r2
	adds r2, r0, #0
	subs r2, #0xc
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r0, #0
_08057798:
	adds r0, r6, r3
	ldrb r1, [r0]
	ldrh r0, [r4]
	lsls r0, r0, #0xc
	adds r1, r1, r0
	adds r1, r1, r5
	strh r1, [r2]
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _08057798
	b _080577D8
	.align 2, 0
_080577B0: .4byte gUnknown_085538B2
_080577B4: .4byte gUnknown_08553A20
_080577B8: .4byte gUnknown_08562124
_080577BC:
	movs r3, #0
	lsls r2, r1, #1
	ldr r4, _080577E0 @ =gUnknown_08562124
	adds r2, r2, r7
_080577C4:
	adds r0, r6, r3
	ldrb r1, [r0]
	ldrh r0, [r4]
	lsls r0, r0, #0xc
	adds r1, r1, r0
	strh r1, [r2]
	adds r2, #2
	adds r3, #1
	cmp r3, #6
	ble _080577C4
_080577D8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080577E0: .4byte gUnknown_08562124

