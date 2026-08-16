	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071FB8
sub_08071FB8: @ 0x08071FB8
	push {lr}
	movs r0, #4
	bl sub_0801156C
	pop {r0}
	bx r0

