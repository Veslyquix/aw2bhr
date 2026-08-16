	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08021598
sub_08021598: @ 0x08021598
	push {lr}
	bl sub_08026BAC
	bl sub_08026924
	bl sub_08026768
	bl sub_08035490
	bl sub_0803E3D8
	bl sub_080455CC
	pop {r0}
	bx r0
	.align 2, 0

