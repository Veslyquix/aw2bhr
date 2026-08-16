	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803C58C
sub_0803C58C: @ 0x0803C58C
	push {lr}
	movs r1, #5
	bl sub_0803C52C
	pop {r1}
	bx r1

