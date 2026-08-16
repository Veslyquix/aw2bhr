	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803753C
sub_0803753C: @ 0x0803753C
	movs r1, #0
	ldr r3, _08037568 @ =gUnknown_02027F78
_08037540:
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
	ble _08037540
	ldr r0, _0803756C @ =gUnknown_02027F74
	adds r2, r0, #0
	adds r2, #0x36
	movs r1, #0
	strb r1, [r2]
	adds r0, #0x37
	movs r1, #0x6a
	strb r1, [r0]
	bx lr
	.align 2, 0
_08037568: .4byte gUnknown_02027F78
_0803756C: .4byte gUnknown_02027F74

