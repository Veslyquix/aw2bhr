	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078800
sub_08078800: @ 0x08078800
	push {r4, lr}
	bl sub_080785FC
	movs r0, #0
	bl sub_080786A4
	adds r4, r0, #0
	bl sub_08078608
	adds r4, r0, #0
	movs r0, #0x6a
	bl sub_0803CBD8
	cmp r0, #0
	beq _0807882A
	adds r0, r4, #0
	bl sub_08078658
	bl sub_08078770
	b _0807882E
_0807882A:
	bl sub_08078740
_0807882E:
	pop {r4}
	pop {r0}
	bx r0

