	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08029D1C
sub_08029D1C: @ 0x08029D1C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0
	bl sub_08029978
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl sub_08029A48
	adds r4, r4, r0
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

