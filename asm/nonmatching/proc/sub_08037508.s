	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037508
sub_08037508: @ 0x08037508
	movs r1, #0
	ldr r3, _08037534 @ =gUnknown_02027F78
_0803750C:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r2, r0, r3
	adds r1, #0x6c
	strb r1, [r2]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x29
	ble _0803750C
	ldr r0, _08037538 @ =gUnknown_02027F74
	adds r2, r0, #0
	adds r2, #0x36
	movs r1, #0
	strb r1, [r2]
	adds r0, #0x37
	movs r1, #0xff
	strb r1, [r0]
	bx lr
	.align 2, 0
_08037534: .4byte gUnknown_02027F78
_08037538: .4byte gUnknown_02027F74

