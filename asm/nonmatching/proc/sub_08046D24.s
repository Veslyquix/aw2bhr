	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08046D24
sub_08046D24: @ 0x08046D24
	push {lr}
	movs r0, #2
	bl sub_08023274
	pop {r0}
	bx r0

