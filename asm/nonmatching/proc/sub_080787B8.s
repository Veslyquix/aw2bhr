	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080787B8
sub_080787B8: @ 0x080787B8
	push {r4, lr}
	bl sub_080785FC
	movs r0, #0
	bl sub_08078658
	adds r4, r0, #0
	bl sub_08078608
	adds r4, r0, #0
	movs r0, #0x6b
	bl sub_0803CBD8
	cmp r0, #0
	beq _080787E2
	adds r0, r4, #0
	bl sub_080786A4
	bl sub_08078770
	b _080787E6
_080787E2:
	bl sub_08078740
_080787E6:
	pop {r4}
	pop {r0}
	bx r0

