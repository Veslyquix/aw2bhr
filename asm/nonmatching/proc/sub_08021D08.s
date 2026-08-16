	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08021D08
sub_08021D08: @ 0x08021D08
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0

