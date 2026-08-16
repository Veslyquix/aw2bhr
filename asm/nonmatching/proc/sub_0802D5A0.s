	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D5A0
sub_0802D5A0: @ 0x0802D5A0
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	bl sub_0802D5B8
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0802D5CC
	pop {r4, r5}
	pop {r0}
	bx r0

