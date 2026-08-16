	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08070610
sub_08070610: @ 0x08070610
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_080703D4
	pop {r0}
	bx r0
	.align 2, 0

