	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805315C
sub_0805315C: @ 0x0805315C
	push {lr}
	bl sub_080553C8
	bl sub_08054C04
	pop {r0}
	bx r0
	.align 2, 0

