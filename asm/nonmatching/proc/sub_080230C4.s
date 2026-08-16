	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080230C4
sub_080230C4: @ 0x080230C4
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl sub_08022DD4
	pop {r0}
	bx r0
	.align 2, 0

