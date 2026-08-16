	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071F94
sub_08071F94: @ 0x08071F94
	push {lr}
	movs r0, #4
	bl sub_08011550
	pop {r0}
	bx r0

