	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043AFC
sub_08043AFC: @ 0x08043AFC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08043BC8
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08043BF8
	pop {r4, r5}
	pop {r0}
	bx r0

