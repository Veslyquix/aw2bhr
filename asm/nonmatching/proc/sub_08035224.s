	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035224
sub_08035224: @ 0x08035224
	push {r4, r5, r6, r7, lr}
	ldr r0, _080352A4 @ =gUnknown_0809169C
	ldr r1, _080352A8 @ =0x06012E00
	movs r2, #0x60
	bl sub_08011C68
	movs r4, #0
	ldr r7, _080352AC @ =gUnknown_02027C68
	ldr r6, _080352B0 @ =gUnknown_08090E40
_08035236:
	bl sub_080129E0
	lsls r1, r4, #0x10
	asrs r4, r1, #0x10
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r5, r1, r7
	movs r1, #0xff
	bl __umodsi3
	lsls r0, r0, #8
	strh r0, [r5]
	bl sub_080129E0
	movs r1, #0xff
	bl __umodsi3
	lsls r0, r0, #8
	strh r0, [r5, #2]
	adds r0, r4, #0
	cmp r4, #0
	bge _08035266
	adds r0, #0xf
_08035266:
	asrs r0, r0, #4
	lsls r0, r0, #4
	subs r0, r4, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r5, #4]
	adds r0, r1, #1
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r5, #6]
	adds r1, #2
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r0, [r1]
	strh r0, [r5, #8]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _08035236
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080352A4: .4byte gUnknown_0809169C
_080352A8: .4byte 0x06012E00
_080352AC: .4byte gUnknown_02027C68
_080352B0: .4byte gUnknown_08090E40

