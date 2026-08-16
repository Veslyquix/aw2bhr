	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B890
sub_0803B890: @ 0x0803B890
	push {lr}
	bl sub_0803BCA0
	movs r0, #3
	bl sub_08034308
	pop {r0}
	bx r0

