	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078848
sub_08078848: @ 0x08078848
	push {lr}
	bl sub_080785FC
	movs r0, #0
	bl sub_080786F0
	bl sub_08078608
	bl sub_080786A4
	bl sub_08078740
	pop {r0}
	bx r0

