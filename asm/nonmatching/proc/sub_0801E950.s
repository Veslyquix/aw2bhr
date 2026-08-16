	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801E950
sub_0801E950: @ 0x0801E950
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl sub_0801E334
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_0801E0C8
	pop {r4}
	pop {r0}
	bx r0

