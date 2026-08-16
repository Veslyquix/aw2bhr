	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08050B60
sub_08050B60: @ 0x08050B60
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr

