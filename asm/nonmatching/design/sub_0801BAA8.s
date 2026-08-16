	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801BAA8
sub_0801BAA8: @ 0x0801BAA8
	push {lr}
	adds r0, #0x5a
	bl sub_0801BA4C
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r1}
	bx r1

