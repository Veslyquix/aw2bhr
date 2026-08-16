	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08053660
sub_08053660: @ 0x08053660
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_08053670
	pop {r0}
	bx r0
	.align 2, 0

