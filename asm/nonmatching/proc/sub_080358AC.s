	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080358AC
sub_080358AC: @ 0x080358AC
	push {lr}
	bl sub_08035F68
	pop {r0}
	bx r0
	.align 2, 0

