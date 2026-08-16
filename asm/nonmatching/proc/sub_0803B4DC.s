	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B4DC
sub_0803B4DC: @ 0x0803B4DC
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0803B48C
	pop {r0}
	bx r0
	.align 2, 0

