	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08017B50
sub_08017B50: @ 0x08017B50
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_080192EC
	movs r0, #0
	pop {r1}
	bx r1

