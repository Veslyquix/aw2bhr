	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080787EC
sub_080787EC: @ 0x080787EC
	push {lr}
	bl sub_080785FC
	movs r0, #0
	bl sub_080786A4
	bl sub_08078740
	pop {r0}
	bx r0

