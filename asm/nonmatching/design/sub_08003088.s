	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08003088
sub_08003088: @ 0x08003088
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_080030BC
	movs r0, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_080030BC
	movs r0, #2
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_080030BC
	movs r0, #3
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_080030BC
	pop {r4, r5}
	pop {r0}
	bx r0

