	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071F88
sub_08071F88: @ 0x08071F88
	push {lr}
	movs r0, #0x10
	bl sub_08011550
	pop {r0}
	bx r0

