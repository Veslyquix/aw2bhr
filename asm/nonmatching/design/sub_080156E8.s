	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080156E8
sub_080156E8: @ 0x080156E8
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_080156FC
	pop {r0}
	bx r0
	.align 2, 0

