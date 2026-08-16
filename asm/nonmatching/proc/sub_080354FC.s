	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080354FC
sub_080354FC: @ 0x080354FC
	push {lr}
	bl sub_08035224
	bl sub_08035354
	pop {r0}
	bx r0
	.align 2, 0

