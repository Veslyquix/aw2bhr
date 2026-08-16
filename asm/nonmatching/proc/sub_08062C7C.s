	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08062C7C
sub_08062C7C: @ 0x08062C7C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl sub_08062AE4
	adds r0, r4, #0
	bl sub_080627F4
	pop {r4}
	pop {r0}
	bx r0

