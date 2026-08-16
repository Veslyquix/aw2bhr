	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080268F4
sub_080268F4: @ 0x080268F4
	push {lr}
	bl sub_080267AC
	pop {r0}
	bx r0
	.align 2, 0

