	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D5B8
sub_0802D5B8: @ 0x0802D5B8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08037250
	adds r1, r4, #0
	bl Decompress
	pop {r4}
	pop {r0}
	bx r0

