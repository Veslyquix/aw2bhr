	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08016CD8
sub_08016CD8: @ 0x08016CD8
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_08016C9C
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

