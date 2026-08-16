	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08038474
sub_08038474: @ 0x08038474
	push {lr}
	bl sub_08038434
	bl sub_08037DA4
	pop {r1}
	bx r1
	.align 2, 0

