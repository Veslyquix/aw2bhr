	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015CE4
sub_08015CE4: @ 0x08015CE4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08015328
	movs r0, #0
	pop {r1}
	bx r1

