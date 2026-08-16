	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08016CEC
sub_08016CEC: @ 0x08016CEC
	push {r4, lr}
	adds r4, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_08016C9C
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0

