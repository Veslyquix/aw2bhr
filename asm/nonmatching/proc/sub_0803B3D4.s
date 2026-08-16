	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B3D4
sub_0803B3D4: @ 0x0803B3D4
	push {lr}
	lsls r0, r0, #8
	bl sub_08070990
	pop {r0}
	bx r0

