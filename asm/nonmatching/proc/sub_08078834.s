	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078834
sub_08078834: @ 0x08078834
	push {lr}
	bl sub_080785FC
	movs r0, #0
	bl sub_080786F0
	bl sub_08078740
	pop {r0}
	bx r0

