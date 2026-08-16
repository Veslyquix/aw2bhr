	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08041DE8
sub_08041DE8: @ 0x08041DE8
	push {lr}
	bl sub_080258CC
	bl sub_08034F48
	pop {r0}
	bx r0
	.align 2, 0

