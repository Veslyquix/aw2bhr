	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08076F14
sub_08076F14: @ 0x08076F14
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r2, r0, #0
	muls r2, r0, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r1, #0
	muls r0, r1, r0
	adds r2, r2, r0
	cmp r2, #0xff
	ble _08076F2E
	movs r0, #0
	b _08076F30
_08076F2E:
	movs r0, #1
_08076F30:
	bx lr
	.align 2, 0

