	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080787A4
sub_080787A4: @ 0x080787A4
	push {lr}
	bl sub_080785FC
	movs r0, #0
	bl sub_08078658
	bl sub_08078740
	pop {r0}
	bx r0

