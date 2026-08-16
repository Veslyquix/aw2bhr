	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D99C
sub_0802D99C: @ 0x0802D99C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl sub_0802D76C
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	bl sub_0802D7B4
	pop {r4}
	pop {r0}
	bx r0

