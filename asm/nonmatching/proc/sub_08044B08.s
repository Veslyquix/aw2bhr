	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044B08
sub_08044B08: @ 0x08044B08
	push {lr}
	adds r3, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r2, _08044B24 @ =0x000051CA
	bl sub_08039ACC
	pop {r0}
	bx r0
	.align 2, 0
_08044B24: .4byte 0x000051CA

