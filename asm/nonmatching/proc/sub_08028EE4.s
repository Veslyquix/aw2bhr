	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08028EE4
sub_08028EE4: @ 0x08028EE4
	push {lr}
	bl sub_08022A08
	pop {r0}
	bx r0
	.align 2, 0

