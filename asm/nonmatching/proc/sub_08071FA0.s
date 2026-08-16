	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071FA0
sub_08071FA0: @ 0x08071FA0
	push {lr}
	movs r0, #0x40
	bl sub_08011550
	pop {r0}
	bx r0

