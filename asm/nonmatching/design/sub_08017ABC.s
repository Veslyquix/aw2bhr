	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08017ABC
sub_08017ABC: @ 0x08017ABC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080281A0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _08017ACE
	str r0, [r4, #8]
_08017ACE:
	pop {r4}
	pop {r0}
	bx r0

