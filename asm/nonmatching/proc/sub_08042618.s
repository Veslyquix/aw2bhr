	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08042618
sub_08042618: @ 0x08042618
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_080425B8
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl sub_08041820
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

