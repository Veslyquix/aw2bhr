	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804C498
sub_0804C498: @ 0x0804C498
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_0804C400
	pop {r0}
	bx r0
	.align 2, 0

