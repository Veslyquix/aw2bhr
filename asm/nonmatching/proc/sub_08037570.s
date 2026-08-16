	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037570
sub_08037570: @ 0x08037570
	movs r1, #0
	ldr r3, _0803759C @ =gUnknown_02027F78
_08037574:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r2, r0, r3
	adds r1, #1
	strb r1, [r2]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x6a
	ble _08037574
	ldr r0, _080375A0 @ =gUnknown_02027F74
	adds r2, r0, #0
	adds r2, #0x36
	movs r1, #0
	strb r1, [r2]
	adds r0, #0x37
	movs r1, #0x6a
	strb r1, [r0]
	bx lr
	.align 2, 0
_0803759C: .4byte gUnknown_02027F78
_080375A0: .4byte gUnknown_02027F74

