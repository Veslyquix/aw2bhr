	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071FAC
sub_08071FAC: @ 0x08071FAC
	push {lr}
	movs r0, #0x10
	bl sub_0801156C
	pop {r0}
	bx r0

