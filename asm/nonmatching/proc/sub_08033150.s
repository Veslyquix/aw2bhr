	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08033150
sub_08033150: @ 0x08033150
	push {lr}
	bl sub_08031430
	bl sub_08011B18
	bl sub_08031CE4
	bl sub_08031E6C
	bl sub_08032D60
	bl sub_08032468
	bl sub_0803BD60
	pop {r0}
	bx r0
	.align 2, 0

