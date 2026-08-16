	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080358B8
sub_080358B8: @ 0x080358B8
	push {lr}
	bl sub_08035FA8
	pop {r0}
	bx r0
	.align 2, 0

