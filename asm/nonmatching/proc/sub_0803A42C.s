	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803A42C
sub_0803A42C: @ 0x0803A42C
	push {lr}
	bl sub_08013B0C
	movs r0, #0
	bl sub_08013AD4
	bl sub_0802465C
	pop {r0}
	bx r0

