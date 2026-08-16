	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08076C8C
sub_08076C8C: @ 0x08076C8C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	adds r1, r4, #0
	bl sub_08074ED0
	movs r0, #0
	movs r1, #0
	movs r2, #0
	adds r3, r4, #0
	bl sub_0807548C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

